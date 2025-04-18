selection_sort <- function(arr) {
  n<-length(arr)
  
  for (i in (1:(n-1))) {
    
    min_index<-i
    
      for (j in (i+1):n){
        
        if (arr[j] < arr[min_index]) {
          min_index <- j
          }
       }
    
    if (min_index!=i) {  
    temp<-arr[i]
    arr[i]<-arr[min_index]
    arr[min_index]<-temp
    }
  }
  
return(arr)
  
}

sorted_vector <- selection_sort(sample(letters, 26))























selection_sort <- function(arr) {
  n <- length(arr)
  
  for (i in 1:(n - 1)) {
    # Find the index of the minimum element in the unsorted portion
    min_index <- i
    for (j in (i + 1):n) {
      if (arr[j] < arr[min_index]) {
        min_index <- j
      }
    }
    
    # Swap the found minimum element with the first element
    if (min_index != i) {
      temp <- arr[i]
      arr[i] <- arr[min_index]
      arr[min_index] <- temp
    }
  }
  
  return(arr)
}

# Example usage:
my_array <- c(sample(letters))
sorted_array <- selection_sort(my_array)
cat("Sorted array:", sorted_array, "\n")
