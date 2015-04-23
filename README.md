# ProgrammingAssignment2
Repository for Programming Assignment 2 for R Programming on Coursera

##Introduction

This script generates two functions the purpose of which is to illustrate the use of  "<<-" operator
which allows the caching of data for later use.  This can be useful for processor intensive operations that are used repeatedly.

In order to use this it is neccessary to check if the objectbeing cached has changed before returning the cached result.

##makeCacheMatrix
A function is defined that defines an  object "x" to be a matrix. A parameter i is set to NULL which indicates there is no cached data at this stage in the process.  This is changed when valid cached data is available.

##cacheSolve
A function, cacheSolve is defined that generates and caches the inverse of the matrix cached by the makeCacheMatrix. The R function "solve()" is used and this only accepts square matrices. This is ensures by defining the dimensions of the matrix in the second parameter, as shown in the example.

##Example
In order to use the function type c(1,2,3,4) are the values of the elements of the matrix and  c(2,2) defines the dimension of the matrix.  This must be a square matrix.

m <- makeCacheMatrix(matrix(c(1, 2, 3, 4), c(2, 2)))
cacheSolve(m)

This should generate the response:

[,1] [,2]
[1,]  -2  1.5
[2,]  1  -0.5
