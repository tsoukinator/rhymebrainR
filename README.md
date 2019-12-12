# Welcome to the rhymebrainR package for R.

The purpose of this package is to retrieve rhyming words for a given word in R.
This package utilises the API on the RhymeBrain.com site, built by Steve Hanov, and allows data to be called directly into R.

For more information on the API itself, please navigate to the following page:
https://rhymebrain.com/api.html

# Installling this package
Currently, this package is being awaited approval through CRAN, in the meantime, you can use the following command to install this package:
```
library(devtools)
install_github("tsoukinator/rhymebrainR")
```

# Functions within package

## getRhymes()
Gets rhyming words for a given word.

### Usage
getRhymes(word = NULL, lang = NULL, maxResults = NULL)

### Examples
```
getRhymes(word = "test", lang = 'en', maxResults = 10)
getRhymes("excellent")
```

### Arguments:
```
word	String. A word to retrieve rhymes for - e.g. 'mellow'
lang	String (optional). The language the word is written in ('en', 'de', 'es', 'fr', 'ru')
maxResults	Integer (optional). The maximum amount of results to retrieve (if left null, Rhymebrain will impose it's own limit depending on how many "good sounding rhymes" exist for the word)
```

### Returns
Dataframe of rhyming words, their RhymeRank score (300 = perfect), flags, syllables and word commonality frequency. More information can be found at the API site: <https://rhymebrain.com/api.html#rhyme>

## getWordInfo()
Gets word info for a given word.

## Usage
getWordInfo(word = NULL, lang = NULL)

## Examples
```
getWordInfo(word = "test, lang = "en")
getWordInfo("excellent")
```

### Arguments:
```
word	String. A word to retrieve rhymes for - e.g. 'mellow'
lang	String (optional). The language the word is written in ('en', 'de', 'es', 'fr', 'ru')
```

### Returns
List of Information for the given word, given an optional language parameter. More information found here: <https://rhymebrain.com/api.html#pron>

## getPortmanteaus()
Gets portmanteaus for a given word (all known information).

## Usage
getPortmanteaus(word = NULL, lang = NULL, maxResults = NULL)

## Examples
```
getPortmanteaus("test", lang = "en", maxResults = 10)
getPortmanteaus("excellent")
```

### Arguments:
```
word	String. A word to retrieve rhymes for - e.g. 'mellow'
lang	String (optional). The language the word is written in ('en, 'de', 'es', 'fr', 'ru')
maxResults	Integer (optional). The maximum amount of results to retrieve (if left null, Rhymebrain will impose it's own limit depending on how many "good sounding rhymes" exist for the word)
```

### Returns
Dataframe of word information, source word, alternative spelling. More information can be found here: <https://rhymebrain.com/api.html#portmanteau>


# Questions
Any queries you need to raise, log a new issue in GitHub, or send an email to: anthony.tsoukas@gmail.com
