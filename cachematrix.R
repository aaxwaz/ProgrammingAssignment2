## The functions below will store values of a matrix, calculate its inverse and cache the inverse in order to speed up the 

# this function creates a list containing set, get, setInverse and getInverse functions
makeCacheMatrix <- function(x = matrix()){
  i <- NULL           # variable used to store the inverse of this matrix 
  get <- function() x # function that shows the contents of this matrix
  set <- function(y){ # function that sets the contents for this matrix 
    x <<- y
    i <<- NULL
  }
  setInverse <- function(inv) i <<- inv  # function that sets the inverse for this matrix
  getInverse <- function() i             # function that returns the inverse for this matrix
  list(set=set, get=get, getInverse = getInverse,
       setInverse=setInverse)
}

## This function calculates the inverse and store it using setInverse from above
cacheSolve <- function(x, ...){
  
  i <- x$getInverse()        # get the inverse of the matrix if available, or gets the NULL value
  if(!is.null(i)){           # check if the inverse is available
    message("Getting cache data")
    return(i)
  }
  matrixData = x$get()       # get the data of this matrix 
  i <- solve(matrixData,...) # calculate the inverse of this matrix 
  x$setInverse(i)            # set the calculated inverse to "cache" it
  i
}





