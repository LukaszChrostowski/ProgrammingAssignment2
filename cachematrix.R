## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# Goal of function is to make an object that stores a matrix and cache's its inverse using `solve` function.
# Notice that function sets and gets matrix and inverse values.

makeCacheMatrix <- function(x = matrix()) {

  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)


}


## Write a short comment describing this function
# following function actually calculates matrix inverse, but it first checks if the inverse has already been calculated

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m

}


#test
x <- matrix(c(1,2, 2.4, 4.2), nrow = 2)
A <- makeCacheMatrix(x)
cacheSolve(A)
