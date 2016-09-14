## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## This function will create a matrix and its inverse and will save it in the work environment

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    ## Step 1: Set a new matrix & store it in the work environment
    set <- function(y) {
    x <<- y
    m <<- NULL
    }
    ## Step 2: Get the new matrix just created as imput for step 3
    get <- function() x
    ## Step 3: Set the inverse of the matrix and store it in the work environment 
    setinverse <- function(solve) m <<- solve
    ## Step 4: Get the inverse just created 
    getinverse <- function() m
    ## Step 5: List the results of stpes 1 to 4  
    list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## Write a short comment describing this function
## This function will look for the inverse of a matrix in the work environment, if existing it will pull the result from there otherwise process the inverse of the matrix

cacheSolve <- function(x, ...) {
    ## Step 1: Look for the inverse of a specific matrix within the work environment
    m <- x$getinverse()
    ## Step 2: If existing get the data and show the inverse of the original matrix
    if(!is.null(m)) {
      message("getting cached data")
      return(m)
    }
    ## Step 3: If the inverse is not existing then process the inverse of the matrix
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m
    }



