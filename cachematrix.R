##call
## > source("cachematrix.R")            load R program
## > a <- makeCacheMatrix()             create functions
## > a$set(matrix(c(1,2,3,4), 2, 2))    set any square invertible matrix
## > cacheSolve(a)                      get inverse (new or in cash)

makeCacheMatrix <- function(x = matrix()) {
    mtxCache <- NULL
    set <- function(y) {
        x <<- y
        mtxCache <<- NULL
    }
    get <- function() x
    setmatrix <- function(a) mtxCache <<- a
    getmatrix <- function() mtxCache
    
    list(set = set, get = get,
         setmatrix = setmatrix,
         getmatrix = getmatrix)
}

## Return Inverse matrix

cacheSolve <- function(x, ...) {
    mt <- x$getmatrix()
    ##cash
    if(!is.null(mt)) {
        return(mt)
    }else{
    #new
    data <- x$get()
    mt <- solve(data)
    #set matrix to inverse to cash
    x$setmatrix(mt)
    mt
}
}
