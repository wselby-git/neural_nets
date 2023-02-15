! Author: William Selby
! Simple neural network in fortran

! Neural network in Fortran

program neural_network
   implicit none

   ! Declare variables
   integer, parameter :: n_inputs = 10    ! number of inputs
   integer, parameter :: n_hidden = 5     ! number of hidden neurons
   integer, parameter :: n_outputs = 3    ! number of outputs

   ! Create arrays for input, hidden weights and outputs
   real, dimension(n_inputs) :: inputs
   real, dimension(n_inputs, n_hidden) :: weights_ih
   real, dimension(n_hidden) :: hidden
   real, dimension(n_hidden, n_outputs) :: weights_ho
   real, dimension(n_outputs) :: outputs

   ! Create arrays to store the biases
   real, dimension(n_hidden) :: biases_h
   real, dimension(n_outputs) :: biases_o

   ! Set the input, weights and biases
   inputs = (/1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0/)
   weights_ih = (/1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 
                  1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0,
                  1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0,
                  1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0,
                  1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0/)
   weights_ho = (/1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 
                  1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0,
                  1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0/)
   biases_h = (/1.0, 2.0, 3.0, 4.0, 5.0/)
   biases_o = (/1.0, 2.0, 3.0/)

   ! Calculate the hidden layer outputs
   do i = 1, n_hidden
      hidden(i) = 0.0
      do j = 1, n_inputs
         hidden(i) = hidden(i) + inputs(j)*weights_ih(j,i)
      end do
      hidden(i) = hidden(i) + biases_h(i)
      hidden(i) = 1.0/(1.0 + exp(-hidden(i)))  ! Sigmoid activation
   end do

   ! Calculate the output layer outputs
   do i = 1, n_outputs
      outputs(i) = 0.0
      do j = 1, n_hidden
         outputs(i) = outputs(i) + hidden(j)*weights_ho(j,i)
      end do
      outputs(i) = outputs(i) + biases_o(i)
      outputs(i) = 1.0/(1.0 + exp(-outputs(i)))  ! Sigmoid activation
   end do

   ! Print the outputs
   write (*,*) 'Outputs:'
   do i = 1, n_outputs
      write (*,*) outputs(i)
   end do

end program neural_network
