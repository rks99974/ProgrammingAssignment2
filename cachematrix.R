## Put comments here that give an overall description of what your
## functions do
## Write a short comment describing this function
## makeCacheMatrix will take matrix as an arguments and returns a list of get, set, 
##getinverse, setinverse function. It will not return inverse of matrix 
makeCacheMatrix<- function(x=matrix()){  
    i<-NULL                           #i= inverse of matrix  intitalize as NULL
    set<-function(y){
        x<<-y # <<- is a super assignment which store argument of set function y in x inside environment of function set only
        i<-NULL 
    }
    get<-function() 
        x
# get function will return the matrix which is entered as argument in makeCacheMatrix
    setinverse<-function(inverse){
        i<<-inverse 
##this will store the inverse of matrix in variable i this function is called in 
##cacheSolve function to store the inveres of matrix in i
    }
    getinverse<-function(){ # it will return the inverse of matrix stored in i
        i  
    }
    list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}
## Write a short comment describing this function
cacheSolve <- function(x, ...) { # x argument is a list returned by makeCachematrix
    ## Return a matrix that is the inverse of 'x'
    i<-x$getinverse()  #it will fetch the inverse of matrix stored in list returned by makeCacheMatrix
    if (!is.null(i)){  # if matrix is not called previously i=NULL,and skip the if statement 
        message("GETTING CACHED DATA")
        return(i) # return the inverse of matrix cached 
    }
    data<-x$get() # if input matrix is new it will fetch the matrix and calculate inverse 
    i<-solve(data,...)
    x$setinverse(i)
    i
}
# Great learning 