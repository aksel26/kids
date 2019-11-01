# install.packages("devtools")
# # install_github("SukjaeChoi/easySenti")
# install.packages("webshot")
# install.packages("htmlwidgets")
# install.packages("Rserve");
# install.packages("wordcloud")
# install.packages("KoNLP")
# webshot::install_phantomjs()

require(htmlwidgets)
require(htmltools)
require(jsonlite)
require(yaml)
require(base64enc)
# 
# 

# require(easySenti)

require(KoNLP)
require(rJava)
require(devtools)
require(wordcloud)

require(webshot)
library(htmlwidgets)

Rserve(args="--no-save")


wordcloudp <-function(sentence){

  word_data<-sentence
  word_data

  word_data2 <- sapply(word_data,extractNoun,USE.NAMES = F)
  word_data2

  undata <-unlist(word_data2)
  undata

  word_table <-table(undata)
  word_table

  undata2 <-Filter(function(x) {nchar(x)>=2},undata)

  word_table2 <- table(undata2)
  word_table2 <- sort(word_table2,decreasing = T)
  undata2<-names(word_table2)#필수

  #각 단어별 벡터 생성
  last_positive_Word<-c();#긍정단어 벡터
  last_negative_Wrod<-c();#부정단어 벡터
  last_natural_Word<-c();#중립단어 벡터
  Colors <- c();

  posword <- match(undata2,positive)
  negaword <- match(undata2,negative)

  for(i in 1:length(undata2)){
    if(!is.na(positive[posword][i])){
      last_positive_Word<-c(last_positive_Word,positive[posword][i]);
      Colors<-c(Colors,"green");
    }
    else if(!is.na(negative[negaword][i])){
      last_negative_Wrod<-c(last_negative_Wrod,negative[negaword][i]);
      Colors<-c(Colors,"red");
    }
    else{
      last_natural_Word<-c(last_natural_Word,undata2[i]);
      Colors<-c(Colors,"black");
    }
  }
  # return(wordcloud2(word_table2,color = Colors,size = 1.6));
  return(wordcloud(words = names(word_table2),freq = word_table2,color = Colors,ordered.colors=TRUE, family="AppleGothic"));
}

# 
# useNIADic()
#  
# 
positive <- readLines("./data/positive.txt")
negative <- readLines("./data/negative.txt")
# 
# 
rs_comment_pra <- read.csv("./data/comment.csv",header = T,fileEncoding="CP949", encoding="UTF-8")
rs_comment_pra <- subset(x = rs_comment_pra,subset = rs_comment_pra[,"KDID"]==kdid);
# 
# 
sentence <- ""
for(i in 1:length(rs_comment_pra[,1])){
  sentence <- paste(sentence , rs_comment_pra[i,"CONTENTS"]);
}
#wordcloudp(sentence)
