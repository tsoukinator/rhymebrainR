library(devtools)
library(usethis)
library(desc)
## https://stackoverflow.com/questions/39435240/rstudio-changing-origin-for-git-version-control-of-project

# Remove default DESC
unlink("DESCRIPTION")
# Create and clean desc
my_desc <- description$new("API Wrapper for Rhymebrain getRhymes, getWordInfo and getPortmanteaus API Commands.")
# https://rhymebrain.com/api.html

# Set your package name
my_desc$set("Package", "rhymebrainR")

#Set your name
my_desc$set("Authors@R", "person('Anthony', 'Tsoukas', email = 'anthony.tsoukas@gmail.com', role = c('cre', 'aut'))")

# Remove some author fields
my_desc$del("Maintainer")

# Set the version
my_desc$set_version("0.0.0.1000")

# The title of your package
my_desc$set(Title = "API Wrapper for Rhymebrain.com.")
# The description of your package
my_desc$set(Description = "API Wrapper to allow R to perform API calls to the rhymebrain.com API.")
# The urls
my_desc$set("URL", "http://this")
my_desc$set("BugReports", "http://that")
# Save everyting
my_desc$write(file = "DESCRIPTION")

# If you want to use the MIT licence, code of conduct, and lifecycle badge
use_mit_license(name = "Anthony TSOUKAS")
use_code_of_conduct()
use_lifecycle_badge("Experimental")
use_news_md()

# Get the dependencies
use_package("httr")
use_package("jsonlite")
use_package("curl")
use_package("attempt")
use_package("purrr")

# Clean your description
use_tidy_description()

# Final Tests
use_testthat()
use_vignette("{rhymebrainR}")
use_readme_rmd()
