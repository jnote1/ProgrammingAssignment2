## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## return list of matrix function
## and this function need to be assignment to other variables

makeCacheMatrix <- function(x = matrix()) {
  solve <- NULL

  set <- function(new_matrix) {
    x <<- new_matrix
    solve <<- NULL
  }
  get <- function() {
    x
  }
  set_solve <- function(new_solve) {
    solve <<- new_solve
  }
  get_solve <- function() {
    solve
  }

  list(
    set = set,
    get = get,
    set_solve = set_solve,
    get_solve = get_solve
  )
}


## Write a short comment describing this function
## return inverse matrix & saving to x variable

cacheSolve <- function(x, ...) {
  if (!is.null(x$get_solve())) {
    message("get cached solve matrix")
    return(x$get_solve())
  } else {
    solve <- solve(x$get(), ...)
    x$set_solve(solve)
    solve
  }
}

# function test
rnd_nine_mtrx <- matrix(round(rnorm(9, 10, 10)), nrow = 3)

cm_1 <- makeCacheMatrix(rnd_nine_mtrx)

cm_1$get()
cm_1$get_solve() # return null

cacheSolve(cm_1) # return inverse matrix
cm_1$get_solve() # return inverse matrix

round(rnd_nine_mtrx %*% cacheSolve(cm_1))
round(rnd_nine_mtrx %*% cm_1$get_solve())
