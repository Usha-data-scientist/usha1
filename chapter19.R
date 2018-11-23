# 19.character function
# Convert object into character type
Y = as.character(25)
class(Y)
# Check the character type
x = "I love R Programming"
is.character(x)
# Concatenate Strings
x = "anil"
y ="usha"
paste(x, y)
paste(x, y, sep = ",") 
# To create column names from x1 through x10
paste("x", seq(1,10), sep = "")
# use of collapse keyword
paste("x", seq(1,10), sep="", collapse=",")
# String Formatting
x = 0.25
sprintf("%.0f%%",x*100)
a = seq(1, 5)
sprintf("x%03d", a)
sprintf("%s has %d rupees", "Ram", 500)
# Extract or replace substrings
x = "abcdef"
substr(x, 1, 3)
substr(x, 1, 2) = "11"
# String Length
x = "I love R Programming"
nchar(x)
# Replace the first match of the string
sub("okay", "fine", "She is okay.")
cols = c("x1", "x2", "x3")
sub("x", "Year", cols)
# Extract Word from a String
x = "I love R Programming"
library(stringr)
word(x, 1,sep = " ")
x = "I love R Programming"
library(stringr)
word(x, -1,sep = " ")
# Convert Character to Uppercase / Lowercase /Propercase
x = "I love R Programming"
tolower(x)
toupper(x)
library(stringr)
str_to_title(x)
# Remove Leading and Trailing Spaces
a = " anilusha "
trimws(a)
x= " anilusha "
library(stringr)
str_trim(x)
# Converting Multiple Spaces to a Single Space
x= "anil usha"
install.packages("qdap")
library(qdap)
Trim(clean(x))  
install.packages("Trim")
library(Trim)
strrep("x",3)
# String in a Character Variable
x = c("Aon Hewitt", "Aon Risk", "Hewitt", "Google")
library(stringr)
str_detect(x,"Aon")
# Splitting a Character Vector
x = c("I love R Programming")
strsplit(x, " ")
# Selecting Multiple Values
x = sample(LETTERS,100, replace = TRUE)
x[x %in% c("A","B","C")]
# Pattern Matching
x = c("Devesh", "Dad", "Sandy", "drahim", "Jades")
x[grepl("^D",x)]
x[grepl("(?i)^d",x)]
x[!grepl("(?i)^d",x)]
x[grepl("s$",x)]
x[grepl("(?i)*s",x)]

