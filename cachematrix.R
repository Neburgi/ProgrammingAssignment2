## Put comments here that give an overall description of what your
## functions do

## This function creates a "special matrix" thay cache its inverse. This object doesn't calculate the inverse, it only saves inside.Saves the matrix to variable "x" and its inverse to variable "a" in scope.

makeCacheMatrix <- function(x = matrix()) {
  a <- NULL
  set <- function(y) {
    x <<- y
    a <<- NULL
  }
  ## sets matrix and resets cached inverse
  
  get <- function() {
    x
  }
  ## it returns matrix
  
  setSolve <- function(solve) {
    a <<- solve
  }
  ## it saves solve value
  
  getSolve <- function() {
    a
  }
  ## it returns cache inverse value
  list(set = set, get = get, setSolve = setSolve, getSolve = getSolve)
  
}


## This function is to get the inversed matrix from a special object created previously (makeCacheMatrix).

cacheSolve <- function(x, ...) {
  a <- x$getSolve()
  if(!is.null(a)) {
    message("getting cached data")
    return(a)
  }
  ##Takes the object of that type as an argument 'x', checks if the inverse value is already cached, and if it is returns the cached value. If not, next step is taken
  
  data <- x$get()
  a <- solve(data, ...)
  x$setSolve(a)
  a
  ##This function calculates the inverse for the matrix saved in the 'x', saves it into 'x' cache using method 'setSolve'and returns the result.
}
