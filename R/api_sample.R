#' Gets rhyming words for a given word.
#' @param word String. A word to retrieve rhymes for - e.g. 'mellow'
#' @param lang String (optional). The language the word is written in ('en', 'de', 'es', 'fr', 'ru')
#' @param maxResults Integer (optional). The maximum amount of results to retrieve (if left null, Rhymebrain will impose it's own limit depending on how many "good sounding rhymes" exist for the word)
#' @return Dataframe of rhyming words, their RhymeRank score (300 = perfect), flags, syllables and word commonality frequency. More information can be found at the API site: <https://rhymebrain.com/api.html#rhyme>
#' @examples
#' \dontrun{
#' getRhymes('mellow','en',10)
#' }

getRhymes <- function(word = NULL, lang = NULL, maxResults = NULL){
  args <- list(`function` = "getRhymes", word = word, lang = lang, maxResults = maxResults)
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

#' Gets word info for a given word.
#' @param word String. A word to retrieve rhymes for - e.g. 'mellow'
#' @param lang String (optional). The language the word is written in ('en', 'de', 'es', 'fr', 'ru')
#' @return List of Information for the given word, given an optional language parameter. More information found here: <https://rhymebrain.com/api.html#pron>
#' @examples
#' \dontrun{
#' getWordInfo('mellow','en')
#' }

getWordInfo <- function(word = NULL, lang = NULL){
  args <- list(`function` = "getWordInfo", word = word, lang = lang)
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

#' Gets portmanteaus for a given word (all known information).
#' @param word String. A word to retrieve rhymes for - e.g. 'mellow'
#' @param lang String (optional). The language the word is written in ('en, 'de', 'es', 'fr', 'ru')
#' @param maxResults Integer (optional). The maximum amount of results to retrieve (if left null, Rhymebrain will impose it's own limit depending on how many "good sounding rhymes" exist for the word)
#' @return Dataframe of word information, source word, alternative spelling. More information can be found here: <https://rhymebrain.com/api.html#portmanteau>
#' @examples
#' \dontrun{
#' getPortmanteaus('mellow','en',10)
#' }

getPortmanteaus <- function(word = NULL, lang = NULL, maxResults = NULL){
  args <- list(`function` = "getPortmanteaus", word = word, lang = lang, maxResults = maxResults)
  # Check that at least one argument is not null
  stop_if_all(args, is.null, "You need to specify at least one argument")
  # Chek for internet
  check_internet()
  # Create the
  res <- GET(rhyme_brain, query = compact(args))
  
  Portmanteaus <- fromJSON(res$url)
  return(Portmanteaus)
  
}

#' @export
#' @rdname rhyme_api