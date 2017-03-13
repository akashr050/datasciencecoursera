## This program is to create special matrix which caches its inverse.


## This function creates the list of matrix and its matrix. It also includes functions
## to set the same. 

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL ## 'i' variable is to store the inverse of a matrix
        set <- function(y = matrix()) {
                x <<- y ##here the 'y' value is assigned to the global 'x'
                i <<- NULL
        }
        get <- function() x
        setSolve <- function(solve) i <<- solve               ## this is used to set value of inverse
        getSolve <- function() i                     
        list(set = set, get = get,
             setSolve = setSolve,
             getSolve = getSolve)  ## this returns the list 
}


## This function return the inverse of the matrix. It first looks for the cached value
## of the inverse. If it doesn't exist, it generates the same and cache it. 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i <- x$getSolve()
        if(!is.null(i))   ## this is to check whether there is cached value of inverse
        {
                message("getting cached data")
                return(i)  ## Returning cached value of inverse
        }
        data <- x$get()
        i <- solve(data, ...)   ## Calculating the inverse using solve function
        x$setSolve(i)    ## Caching the value of inverse
        i                ## Returing the inverse of the matrix
}
