rm(list=ls(all.names=TRUE))
library(XML)
library(RCurl)
library(httr)
Sys.setlocale(category = "LC_ALL", locale = "cht")


startNo = 1
endNo   = 19
subPath <- "http://internationalnewsstation.tw/?"
alldata = data.frame()
for( pid in startNo:endNo )
{
  urlPath <- paste(subPath, pid, "event_area=africa", sep='')
  temp    <- getURL(urlPath, encoding = "UTF-8")
  xmldoc  <- htmlParse(temp)
  title   <- xpathSApply(xmldoc, "//div[@class='content']//h4", xmlValue)
  title   <- gsub("\n", "", title)
  title   <- gsub("\t", "", title)
  path    <- xpathSApply(xmldoc, "//div[@id='main']//a[@class='more']//@href")
  cite    <- xpathSApply(xmldoc, "//div[@class='story']//cite")
  article <- xpathSApply(xmldoc, "//div[@class='story']//p")
  
  Erroresult<- tryCatch({
    subdata <- data.frame(title, path)
    alldata <- rbind(alldata, subdata)
  }, warning = function(war) {
    print(paste("MY_WARNING:  ", urlPath))
  }, error = function(err) {
    print(paste("MY_ERROR:  ", urlPath))
  }, finally = {
    print(paste("End Try&Catch", urlPath))
  })
}
write.table(alldata, file = "news.csv")
suburlPath <- "https://tw.news.yahoo.com/"
for( i in 1:length(alldata[,1]) )
{
  ipath   <- paste(suburlPath, alldata$path[i], sep='')
  print(ipath)
  content <- getURL(ipath, encoding = "UTF-8")
  xmldoc  <- htmlParse(content)
  article <- xpathSApply(xmldoc, "//p", xmlValue)
  filename<- paste("./news/", i, ".csv", sep='')
  write.csv(article, filename)
}