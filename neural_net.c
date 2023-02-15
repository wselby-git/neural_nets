// Author: William Selby
// Simple neural network in c

#include <stdio.h>

#define NUM_INPUTS 3
#define NUM_OUTPUTS 4
#define NUM_HIDDEN 5

// Define the neural network structure
typedef struct
{
	float inputs[NUM_INPUTS];
	float hidden[NUM_HIDDEN];
	float outputs[NUM_OUTPUTS];
	float weights_ih[NUM_INPUTS][NUM_HIDDEN];
	float weights_ho[NUM_HIDDEN][NUM_OUTPUTS];
	float bias_h[NUM_HIDDEN];
	float bias_o[NUM_OUTPUTS];
	float learning_rate;
} NeuralNetwork;

// Initialize the neural network with random weights
void init(NeuralNetwork *nn)
{
	int i, j;
	
	// Initialize input weights
	for (i = 0; i < NUM_INPUTS; i++)
	{
		for (j = 0; j < NUM_HIDDEN; j++)
		{
			nn->weights_ih[i][j] = (float)rand() / (float)RAND_MAX;
		}
	}
	
	// Initialize output weights
	for (i = 0; i < NUM_HIDDEN; i++)
	{
		for (j = 0; j < NUM_OUTPUTS; j++)
		{
			nn->weights_ho[i][j] = (float)rand() / (float)RAND_MAX;
		}
	}
	
	// Initialize bias weights
	for (i = 0; i < NUM_HIDDEN; i++)
	{
		nn->bias_h[i] = (float)rand() / (float)RAND_MAX;
	}
	
	for (i = 0; i < NUM_OUTPUTS; i++)
	{
		nn->bias_o[i] = (float)rand() / (float)RAND_MAX;
	}
	
	// Set learning rate
	nn->learning_rate = 0.1;
}
