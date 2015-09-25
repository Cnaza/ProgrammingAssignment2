## Put comments here that give an overall description of what your
## functions do

##calling exemple:
## > source("cachematrix.R")            load R program
## > m <- makeCacheMatrix()             create functions
## > m$set(matrix(c(1,2,3,4), 2, 2))    set any square invertible matrix
## > cacheSolve(m)                      get inverse (new matrix)
## > cacheSolve(m)                      get in cash (inverse exists)

## set and get cache matrix
makeCacheMatrix <- function(x = matrix()) {
    mtxCache <- NULL
    set <- function(y) {
        x <<- y
        mtxCache <<- NULL
    }
    get <- function() x
    setmatrix <- function(m) mtxCache <<- m
    getmatrix <- function() mtxCache
    
    list(set = set, get = get,
         setmatrix = setmatrix,
         getmatrix = getmatrix)
}

## Return Inverse matrix
cacheSolve <- function(x, ...) {
    mt <- x$getmatrix()
    ##get in cash
    if(!is.null(mt)) {
        return(mt)
    }else{
    #new
        data <- x$get()
        mt <- solve(data)
        #set matrix to inverse
         #cash inverse
        x$setmatrix(mt)
        return(mt)
}
}
