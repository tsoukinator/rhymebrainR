# https://colinfay.me/build-api-wrapper-package-r/
# https://rhymebrain.com/talk?function=getRhymes&word=hello
####

get_datamuse_rhyme <- function(rel_rhy = NULL) {
  args <- list(rel_rhy = rel_rhy)
  # Check that at least one argument is not null
  stop_if_all(args, is.null, "You need to specify at least one argument")
  # Chek for internet
  check_internet()
  # Create the
  res <- GET(rhyme_url, query = compact(args))
  query = fromJSON(res)

  print(query)
  # Check the result
  #check_status(res)
  # Get the content and return it as a data.frame
  #fromJSON(res)
}

getRhymes <- function(word = NULL, lang = NULL, maxResults = NULL){
  args <- list(`function` = "getWordInfo", word = word, lang = lang, maxResults = maxResults)
  # Check that at least one argument is not null
  stop_if_all(args, is.null, "You need to specify at least one argument")
  # Chek for internet
  check_internet()
  # Create the
  res <- GET(rhyme_brain, query = compact(args))
  #query = fromJSON(res)
  #print(query)

  rhymes <- fromJSON(res$url)
  return(rhymes)


}

getWordInfo <- function(word = NULL, lang = NULL){
  args <- list(`function` = "getPortmanteaus", word = word, lang = lang)
  # Check that at least one argument is not null
  stop_if_all(args, is.null, "You need to specify at least one argument")
  # Chek for internet
  check_internet()
  # Create the
  res <- GET(rhyme_brain, query = compact(args))
  #query = fromJSON(res)
  #print(query)

  WordInfo <- fromJSON(res$url)
  return(WordInfo)

}

getPortmanteaus <- function(word = NULL, lang = NULL, maxResults = NULL){
  args <- list(`function` = "getRhymes", word = word, lang = lang, maxResults = maxResults)
  # Check that at least one argument is not null
  stop_if_all(args, is.null, "You need to specify at least one argument")
  # Chek for internet
  check_internet()
  # Create the
  res <- GET(rhyme_brain, query = compact(args))

  Portmanteaus <- fromJSON(res$url)
  return(Portmanteaus)

}
