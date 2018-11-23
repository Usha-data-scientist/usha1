# 44.WEB SCRAPING WEBSITE WITH R

install.packages("rvest")
library(rvest)
install.packages("dplyr")
library(dplyr)
# Scrape Information from Matrimonial Website
Main_URL = Static_URL + Mother_Tongue + Brides_Grooms
# Extract Profile IDs
text = read_html(html) %>% html_nodes(".profileContent .color11 a") %>% html_text()
profileIDs = data.frame(ID = text)
# Download Profile Pic of a particular Profile
  ID = "XXXXXXX"
text3 = read_html(html) %>% html_nodes(".vtop") %>% html_attr('src')
pic = data.frame(cbind(profileIDs, URL = text3[!is.na(text3)]))
download.file(as.character(pic$URL[match(ID, pic$ID)]), "match.jpg", mode = "wb")
# File saved as match.jpg  
library(rvest)
url       = "http://www.google.com"
pgsession = html_session(url)            
pgform    = html_form(pgsession)[[1]]

# Set search term
filled_form = set_values(pgform, q="Datascience")
session = submit_form(pgsession,filled_form)

# look for headings of first page
session %>% html_nodes(".g .r a") %>% html_text()