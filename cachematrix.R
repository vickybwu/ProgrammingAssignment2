## The functions will create a special matrix that caches its inverse. First, we use function makeCacheMatrix() where x is a regular matrix. 

##makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.


makeCacheMatrix <- function(x = matrix()) {
	m<-NULL
	# set values of the matrix and clear the previous cache 
	set <- function(y){
		x <<- y
		m <<- NULL
	}
	#Get the value of the matrix
	get <- function()x
	#Set the inverse when there is no cached inverse
	setinverse <- function(inverse) m <<- inverse 
	#get the inverse if there is cached inverse
	getinverse <- function() m 
	
	#Return a list with the four functions listed above
	list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)

}


## This function will calculate the inverse of the special matrix created by "makeCacheMatrix()". If the inverse has already been calculated, then this function will retrive the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## get the inverse values from tha matrix x created by the 1st function
        m <- x$getinverse()
        if(!is,null(m)){
        	message("getting cached data")
        	return(m)
        }
        #If the cache was empty, then calculate the inverse values then return it
        data <- x$get()
        m <- solve(data)
        x$setinverse(m)
        m
}
