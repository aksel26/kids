
window.addEventListener("load",function(){
var width = 700,
height = 700

var svg = d3.select("#mycloud")
.attr("width", width)
.attr("height", height);

wordScale = d3.scale.linear().domain([0, 100]).range([0, 150]).clamp(true);

var keywords = positive.split(',');//긍정 단어 모음
var negativeWord = negative.split(',');

var svg = d3.select("#mycloud")
          .append("g")
          .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");


setTimeout(()=>{
	
d3.csv("resources/images/worddata3.csv",function (data) {
if(data.length==0){
	
	document.getElementById("imageArea").innerHTML = "<img src=resources/images/JJANGGU.png>"
}
showCloud(data)
setInterval(function(){
     showCloud(data)
},3000) 
}
);
}, 4500);      


function showCloud(data) {
d3.layout.cloud().size([width, height])
    //클라우드 레이아웃에 데이터 전달
    .words(data)
    .rotate(function (d) {
        return d.text.length > 3 ? 0 : 90;
    })
    //스케일로 각 단어의 크기를 설정
    .fontSize(function (d) {
        return wordScale(d.frequency)+20;
    })
    //클라우드 레이아웃을 초기화 > end이벤트 발생 > 연결된 함수 작동  
    .on("end", draw)
    .start();

function draw(words) { 
    var cloud = svg.selectAll("text").data(words)
    //Entering words
    cloud.enter()
        .append("text")
        .style("font-family", "Hanna")
        .style("fill", function (d) {
        	if(keywords.indexOf(d.text) > -1){
        		return "#0064CD"
        	}
        	else if(negativeWord.indexOf(d.text) > -1 ){
        		return "#CD1039"
        	}
        	else{
        		return "#dcdcdc"
        	}
        })
        .style("fill-opacity", .5)
        .attr("text-anchor", "middle") 
        .attr('font-size', 1)
        .text(function (d) {
            return d.text;
        }); 
    cloud
        .transition()
        .duration(600)
        .style("font-size", function (d) {
            return d.size + "px";
        })
        .attr("transform", function (d) {
            return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")";
        })
        .style("fill-opacity", 1); 
}
}
});

