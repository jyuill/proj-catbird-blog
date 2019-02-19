## Upload Blog Post and R Markdown to Wordpress Blog

library(RWordPress)
library(knitr)

options(WordpressLogin= c(johnyuill='Radius301!'),
       WordpressURL='https://catbirdanalytics.wordpress.com/xmlrpc.php')

# Upload plots: set knitr options
## this works but:
## - saves files in a folder in WordPress
## http://catbirdanalytics.files.wordpress.com/YYYY/MM/<name of code chunk>-1.png
## throws Warnings about deprecated functions :(
#opts_knit$set(upload.fun = function(file){library(RWordPress);uploadFile(file)$url;})

knit2wp('test-r-markdown-wordpress.Rmd', 
        title = 'testing-r-markdown-wordpress', 
        publish = FALSE) # your filename and blog post title

## alternative approach to figures: [DOESN'T WORK!]
## 1. use ggsave to save charts with desired name/location locally (at least for ggplot2)
## 2. use googledrive to upload file to GDrive
## 3. embed link to GDrive location
