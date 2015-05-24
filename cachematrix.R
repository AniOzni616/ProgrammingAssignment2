#Programming Assignment 2:  
#
# 1. Building the function that caches a given matrix
#
makeCacheMatrix <- function(x = matrix()) {
#
# initialize "m", the value of the cache, as NULL
# 
  m <- NULL
#
# "set" sets the value of "x" and clears the cache, "m"
#
set <- function(y) {
# sets the value of "x"
    x <<- y
# empties the cache
    m <<- NULL
  }
#  
# "get" displays the contents of "x"
#
  get <- function() {
    x
  }
#  
# "setinv" sets the value stored as the inverse of the matrix
#
  setinv <- function(solve){
    m <<- solve
  } 
#  
# "getinv" gets the value stored as the inverse of the matrix # 
#
  getinv <- function() {
    m
  }
#
# List functions that makeCacheMatrix returns
#
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}

# - - - - - #

# 2.  Building the function that caches the inverse of a given matrix in memory,  
#     and determine whether or not the cache is currently full

cacheSolve <- function(x, ...) {
#
# Value of "m" is set to the inverse of the matrix "x"
#
  m <- x$getinv()
#
# Loop checks the cache.  If it is already in use, loop tells user it is 
# using the cached value, returns that value, and exits.
#
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
#
# Function calls the value of the matrix from makeCacheMatrix, here.
#
  data <- x$get()
#
# Function stores the inverse of the matrix in "m"
#
  m <- solve(data, ...)
#
# Function remembers the value of "m", and places this value in makeCacheMatrix
#
  x$setinv(m)
#
# Function returns the value of the inverse of the matrix
#
  m
}

# - - - - - #
