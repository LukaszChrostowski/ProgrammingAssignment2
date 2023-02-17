## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# Goal of function is to make an object that stores a matrix and cache's its inverse using `solve` function.
# Notice that function sets and gets matrix and inverse values.

makeCacheMatrix <- function(x = matrix()) {

  inverse_matrix <- NULL
  set <- function(y) {
    x <<- y
    inverse_matrix <<- NULL
  }

  get <- function() x

  SetInverse <- function(solve) inverse_matrix <<- solve
  GetInverse <- function() inverse_matrix


  list(set = set, get = get,
       SetInverse = SetInverse,
       GetInverse = GetInverse)


}


## Write a short comment describing this function
# following function actually calculates matrix inverse, but it first checks if the inverse has already been calculated

cacheSolve <- function(x, ...) {

  ## Return a matrix that is the inverse of 'x'

  inverse_matrix <- x$GetInverse()
  if(!is.null(inverse_matrix)) {

    message("getting cached data")

    inverse_matrix
  }

  data <- x$get()
  inverse_matrix <- solve(data, ...)
  x$SetInverse(inverse_matrix)

  inverse_matrix

}


#test
x <- matrix(c(1,2, 2.4, 4.2), nrow = 2)
A <- makeCacheMatrix(x)
cacheSolve(A)
