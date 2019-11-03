<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script type="test/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://d3js.org/d3.v3.min.js"></script>
<script src="https://rawgit.com/jasondavies/d3-cloud/master/build/d3.layout.cloud.js" type="text/JavaScript"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>가능한가??</h1>    
    
    
    <script>
        var width = 960,
            height = 500

        var svg = d3.select("body").append("svg")
            .attr("width", width)
            .attr("height", height);
      
    	  wordScale = d3.scale.linear().domain([0, 100]).range([0, 150]).clamp(true);
          var keywords = ["자리야", "트레이서", "한조"]
          var svg = d3.select("svg")
                      .append("g")
                      .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");
	
	setTimeout(()=>{
		d3.csv("resources/images/worddata2.csv",function (data) {
        	console.log(typeof(data))
        	console.log(data)
        	
            showCloud(data)
            setInterval(function(){
                 showCloud(data)
            },2000) 
        }
        );
	}, 3000);      
      

        function showCloud(data) {
            d3.layout.cloud().size([width, height])
                //클라우드 레이아웃에 데이터 전달
                .words(data)
                .rotate(function (d) {
                    return d.text.length > 3 ? 0 : 90;
                })
                //스케일로 각 단어의 크기를 설정
                .fontSize(function (d) {
                    return wordScale(d.frequency);
                })
                //클라우드 레이아웃을 초기화 > end이벤트 발생 > 연결된 함수 작동  
                .on("end", draw)
                .start();

            function draw(words) { 
                var cloud = svg.selectAll("text").data(words)
                //Entering words
                cloud.enter()
                    .append("text")
                    .style("font-family", "overwatch")
                    .style("fill", function (d) {
                        return (keywords.indexOf(d.text) > -1 ? "#fbc280" : "#405275");
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
    </script>
</body>
</html>