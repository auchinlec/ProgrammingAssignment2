## Put comments here that give an overall description of what your
## functions do
#makeCaheMatrix creates a matrix object and then caches its inverse
# cacheSolve takes the matrix created by "makeCacheMatrix", with the associated inverse and caches them. 

## Write a short comment describing this function
## The makeCacheMatrix function utilises two further function "set" and "get" that are defined to operate 
## across different environments (by means of the "<<-" operator). The inverse of this matrix is then calculated and set using
## the "<<-" operator to make it available later. Then provided the matrix remains unchanged the inverse can be retrieved  using the getInverse
## command

# If the inverse is required later and the matrix has not changed, then cacheSolve will 
#retrieve the inverse from the cache

## Define makeCacheMatrix function
makeCacheMatrix <- function( m = matrix() ) {

 # Initialize the inverse property
    i <- NULL

    # Set the matrix for use across multiple environments using "<<-" operator
    set <- function( matrix ) {
            m <<- matrix
            i <<- NULL
    }

# Define function to retrieve , or "get" from the cache
    get <- function() {
    	## Return the matrix
   	m
    }

# Method to set the inverse of the matrix

  setInverse <- function(inverse) {
       i <<- inverse
   }

# Generate inverse of matrix
   getInverse <- function() {
# Return the inverse property
        i
   }

# Return list of the methods

         list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}

cacheSolve <- function(x, ...) {

# Generate inverse of x
    m <- x$getInverse()

# Return the inverse if set
    if( !is.null(m) ) {
            message("retrieving cached data")
            return(m)
    }

# Get the matrix from our object
   data <- x$get()

# Calculate the inverse using matrix multiplication
    m <- solve(data) %*% data

# Set the inverse to the object
    x$setInverse(m)

# Return the matrix
    m
