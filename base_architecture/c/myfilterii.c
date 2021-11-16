#include <stdio.h>
#include <stdlib.h>

#define N 1 	// order of the filter 
#define NB 11  	// number of bits

// RISCRIVERE I COEFFICIENTI
const int b0 = 430; 			// coefficient b0
const int b[N]={430}; 			// b array
const int a[N]={-163}; 			// a array

// Perform fixed point filtering assuming direct form II; param x is the new input sample, the return value is the new output sample
int myfilter(int x)
{
  static int sw[N]; 			// shift register
  static int first_run = 0; 	// for cleaning the shift register
  int i;						// index
  int w; 						// intermediate value (w)
  int y; 						// output sample
  int fb, ff; 					// feed-back and feed-forward results

  // Clean the buffer
  if (first_run == 0)
  {
    first_run = 1;
    for (i=0; i<N; i++)
      sw[i] = 0;
  }

  // Compute feed-back and feed-forward
  fb = 0;
  ff = 0;
  for (i=0; i<N; i++)
  {
    fb -= (sw[i]*a[i]) >> (NB-1);
    ff += (sw[i]*b[i]) >> (NB-1);
	// Saturation
    if (fb > 1023)
	{
		fb = 1023;
	}
	else if (fb < -1023)
	{
		fb = -1023;
	}
	if (ff > 1023)
	{
		ff = 1023;
	}
	else if (ff < -1023)
	{
		ff = -1023;
	} 
  }

  // Compute intermediate value (w) and output sample
  w = x + fb;
  // Saturation
  if (w > 1023)
  {
    w = 1023;
  }
  else if (w < -1023)
  {
	w = -1023;
  }
  y = (w*b0) >> (NB-1);
  y += ff;
  // Saturation
  if (y > 1023)
  {
    y = 1023;
  }
  else if (y < -1023)
  {
	y = -1023;
  }

  // Update the shift register
  for (i=N-1; i>0; i--)
    sw[i] = sw[i-1];
  sw[0] = w;
 
  return y;
}

int main(int argc, char **argv)
{
  FILE *fp_in;
  FILE *fp_out;

  int x;
  int y;

  // Check the command line
  if (argc != 3)
  {
    printf("Use: %s <input_file> <output_file>\n", argv[0]);
    exit(1);
  }

  // Open files
  fp_in = fopen(argv[1], "r");
  if (fp_in == NULL)
  {
    printf("Error: cannot open\n");
    exit(2);
  }
  fp_out = fopen(argv[2], "w");

  // Get samples and apply filter
  fscanf(fp_in, "%d", &x);
  do{
    y = myfilter(x);
    fprintf(fp_out,"%d\n", y);
    fscanf(fp_in, "%d", &x);
  } while (!feof(fp_in));

  fclose(fp_in);
  fclose(fp_out);

  return 0;
}
