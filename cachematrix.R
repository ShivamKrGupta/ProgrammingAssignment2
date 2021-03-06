## Let there be a matrix M1 and our objective is to get the inverse of M1 and cache
## its value. For this two functions will be used.

## The first function "makeCacheMatrix" generates a list of functions -  set, 
## get, setinverse and getinverse. The generated list is then used by the function
## cacheSolve as argument to find if the inverse of the matrix is cached. If yes, then
## the cached value is retrieved, otherwise the inverse is computed and cached.

## makeCacheMatrix takes matrix as argument and generates a special matrix "i" which
## caches the inverse matrix. The set function takes an argument y (which is the matrix
## M1 in our case) and sets it as the value of the matrix x.
## The get function retrieves the matrix x
## The setinverse function takes the argument as the inverse of matrix x and sets this
## value to the matrix x. The <<- denotes that the value of i is set not only in the
## environment of the setinverse function but in the parent environment, ie, it replaces
## the first instance of i = NULL with i = inverse matrix.
## The getinverse function returns the inverse of the matrix (as set by setinverse)
## Finally, the makeCacheMatrix function returns a list comprising each of the above
## states functions (set, get, setinverse and getinverse) as its elements.

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}



## The function "cacheSolve" takes the list generated by the function "makeCacheMatrix"
## as argument and checks if the inverse of the matrix is already cached by
## calling the "getinverse" function (defined within makeCacheMatrix). If
## it is cached then it retrieves the cached value, else it gets the value of the
## matrix (M1) by calling "get" function (defined in makeCacheMatrix). After getting the
## value of the matrix, it solves the matrix to get the inverse matrix.
## Then it calls the "setinverse" function (defined in makeCacheMatrix function)
## to cache the value of the inverse of the matrix. It further returns the value
## of the inverse matrix.

cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i                 ## Return a matrix that is the inverse of 'x'
}
