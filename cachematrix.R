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
makeCacheMatrix <- function(x = matrix()) {
  i <- NULL # i is flag for existence of inverse since no inverse at first set to NULL
  #Create function called "set" to cache matrix x using "<<-" operator
  set <- function(y) {
    x <<- y
    i <<- NULL # Cache i=NULL
  }
  get <- function() x #Create function called "get" which retrieves x from cache
  setInverse <- function(inv) i <<- inv #Create function called "setInverse" which caches inverse
  getInverse <- function() i # Create function called "getInverse" that retrieves inverse
  list(
    set = set,
    get = get,
    setinverse = setinverse,
    getinverse = getinverse
  )
}


## Define function to create and cache inverse if matrix unchanged

cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  #check if i is NULL if not then use cached data
  if(!is.null(i)) {
    message("retrieving cached matrix")
    return(i)
  }
  m <- x$get()
  i <- solve(m, ...) # solve inverse matrix of x
  x$setinverse(i) # cache inverse matrix 
  i
}

