## Below 2 functions work out an inverse of a given matrix and caching the same,
## so that it does not require to compute the inverse recurrently when the input is same rather getting the output from cache.

## Function name "makeCacheMatrix" creates a special matrix object while also creating 4 subfunctions in way to caching its inverse.

makeCacheMatrix <- function (x = matrix()){	## declare 'makeCacheMatrix' as function of 'x'
im <- NULL					## initialize 'im' (inverse matrix of 'x') as 'NULL'
set <- function(y){				## declare 'set' as function of 'y'
x <<- y						## declare 'x' as function of 'y' in GlobalEnv
im <<- NULL					## initialize 'im' (inverse matrix of 'x') as 'NULL' in GlobalEnv
}
get <- function() x				## declare 'get' as function getting matrix 'x'
setinv <- function (inv) im <<- inv   		## declare 'setinv' as function of 'inv' while declaring 'inv' to 'im' (inverse matrix of 'x') in GlobalEnv
getinv <- function() im  			## declare 'getinv' as function, getting inverse matrix 'im' 
  
list (set = set, get = get,			## listing of 4 elements viz. 'set', 'get', 'setinv' &
setinv = setinv,				## 'getinv' while defining their value to the respective
getinv = getinv)				## functions named as set', 'get', 'setinv' & 'getinv'
}

## Function "cacheSolve" works out the inverse of the matrix resumed by the "makeCacheMatrix" function.
## However, the result is primarily retrieved from the cache if the input matrix is same and already been worked out.

cacheSolve <- function (x, ...){		## declare 'cacheSolve' as function of 'x' that will return inverse of 'x'
im <- x$getinv()				## 'im' (inverse matrix of 'x') is retrieved from 'getinv' in GlobalEnv
if(!is.null(im)){				## check whether 'im' is 'NULL' Or already contained value
message("getting cached data")			## if 'im' is NOT 'NULL', then retrieving value already computed
return(im)					## returning the value of 'im' from cache
}
data <- x$get()					## else getting the data from the given marix 'x'
im <- solve(data)				## computing 'im' as inverse matrix of 'x'
x$setinv(im)					## declaring the value of 'im' (inverse matrix of 'x') as 'setinv' in cache
im						## returning the value of 'im'
}
