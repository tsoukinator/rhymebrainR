#' Search the BAN
#'
#' @param q text search
#' @param limit maximum number of results to return
#' @param autocomplete autocompletion
#' @param lat latitude
#' @param lon longitude
#' @param type type of elements to return (housenumber, street,place, municipality)
#' @param postcode Postal code
#' @param citycode INSEE code
#'
#' @importFrom attempt stop_if_all
#' @importFrom purrr compact
#' @importFrom jsonlite fromJSON
#' @importFrom httr GET
#' @export
#' @rdname searchban
#'
#' @return the results from the search
#' @examples
#' \dontrun{
#' search_ban("Rennes")
#' reverse_search_ban("48.11", "-1.68")
#' }

search_ban <- function(q = NULL, limit = NULL, autocomplete = NULL, lat = NULL, lon = NULL, type = NULL, postcode = NULL, citycode = NULL){
  args <- list(q = q, limit = limit, autocomplete = autocomplete, lat = lat,
               lon = lon, type = type, postcode = postcode, citycode = citycode)
  # Check that at least one argument is not null
  stop_if_all(args, is.null, "You need to specify at least one argument")
  # Chek for internet
  check_internet()
  # Create the
  res <- GET(base_url, query = compact(args))
  # Check the result
  check_status(res)
  # Get the content and return it as a data.frame
  fromJSON(rawToChar(res$content))$features
}

#' @export
#' @rdname searchban
reverse_search_ban <- function(lat = NULL, lon = NULL){
  args <- list(lat = lat, lon = lon)
  # Check that at least one argument is not null
  stop_if_all(args, is.null, "You need to specify at least one argument")
  # Chek for internet
  check_internet()
  # Create the
  res <- GET(reverse_url, query = compact(args))
  # Check the result
  check_status(res)
  # Get the content and return it as a data.frame
  fromJSON(rawToChar(res$content))$features
}
