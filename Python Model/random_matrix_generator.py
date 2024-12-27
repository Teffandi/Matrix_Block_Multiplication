import numpy as np
from conversion import *

#matrix parameter (note : B will be tranversed)
size_row = 512
size_coloumn = 64

array_A = np.random.randint(1,20,size=(size_row,size_coloumn)) #random array A with size 512 and 64
array_B = np.random.randint(1,20,size=(size_coloumn,size_row)) #random array B with size 64 and 512

#converting input array into Q8.8 format
for row in range(0,size_row):
    for col in range(0,size_coloumn):
        array_A[row,col] = to_q8_8(array_A[row,col])




for row in range(0,size_coloumn):
    for col in range(0,size_row):
        array_B[row,col] = to_q8_8(array_B[row,col])



array_D = np.zeros((size_row,size_row)) #normal multiplication method result
array_D = np.matmul(array_A,array_B)

#converting expected result into Q8.8 format
for row in range(0,size_row):
    for col in range(0,size_row):
        array_D[row,col] = to_q8_8(array_D[row,col])
