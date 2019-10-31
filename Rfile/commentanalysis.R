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


require(easySenti)

require("Rserve")
require(KoNLP)
require(rJava)
require(devtools)
require(wordcloud)

require(webshot)
library(htmlwidgets)

# Rserve(args = "--save");

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


useNIADic()
 

positive <- readLines("./Downloads/positive.txt")
negative <- readLines("./Downloads/negative.txt")

#DB연결하는 부분
# drv <- JDBC("oracle.jdbc.OracleDriver",classPath="C:/ojdbc6.jar")
# con <- dbConnect(drv, "jdbc:oracle:thin:@localhost:1521:orcl", "local_momsmap", "1234");


# rs_kinderinfo <- dbGetQuery(con,"select * from kinderinfo");
# rs_comment <- dbGetQuery(con,"select * from kd_comment");#모든 댓글 받아오기
rs_comment_pra <- read.csv("./Downloads/comment.csv",header = T,fileEncoding="CP949", encoding="UTF-8")



# args[1]

kdid<-'KN033';
rs_comment_pra <- subset(x = rs_comment_pra,subset = rs_comment_pra[,"KDID"]==kdid);
rs_comment_pra
#kinderinfoid로 comment가져오기
#여기를 넘겨줘야 함
# rs_kinderinfo[12,"KINDERINFOID"];
# sql <- paste("select * from kd_comment where kdid = '",rs_kinderinfo[12,"KINDERINFOID"],"'",sep = "");
# rs_comment <- dbGetQuery(con,sql);

sentence <- ""
#하나의 유치원에 대한 모든 댓글 읽기
for(i in 1:length(rs_comment_pra[,1])){
  sentence <- paste(sentence , rs_comment_pra[i,"CONTENTS"]);
}
# wordcloud(words = names(word_table2),freq = word_table2,color = Colors,ordered.colors=TRUE)
sentence
wordcloudp(sentence)
