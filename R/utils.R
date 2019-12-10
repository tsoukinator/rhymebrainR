#' @import attempt
#' @import curl
#' @import httr
#' @import jsonlite
#' @import purrr
check_internet <- function(){
  stop_if_not(.x = has_internet(), msg = "Please check your internet connexion")
}

#' @importFrom httr status_code
check_status <- function(res){
  stop_if_not(.x = status_code(res),
              .p = ~ .x == 200,
              msg = "The API returned an error")
}

rhyme_brain <- "https://rhymebrain.com/talk"
####