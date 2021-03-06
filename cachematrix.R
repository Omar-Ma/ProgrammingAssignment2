## These two functions can cache the inverse of a matrix.

## The first function, makeCacheMatrix creates a special "vector", which is really a list containing a function to

##1. set the value of the matrix
##2. get the value of the matrix
##3. set the value of the inverse of the matrix
##4. get the value of the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  i<-NULL
  set<-function(y){
    x<<-y
    i<<-NULL
  }
  get<-function() x
  setinverse<-function(inverse) i<<-inverse
  getinverse<-function() i
  list(set=set,get=get,
       setinverse=setinverse,
       getinverse=getinverse)
}


## The following function calculates the inverse of the matrix
## However, it first checks to see if the inverse has already been calculated.

cacheSolve <- function(x, ...) {
        i<-x$getinverse()
        if(!is.null(i)){
          message("getting caches data")
          return (i)
        }
          data<-x$get()
          i<-solve(data,...)
          x$setinverse(i)
          i
}
