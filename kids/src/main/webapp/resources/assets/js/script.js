var w = 600,
	h = 600;

var colorscale = d3.scale.category10();

//Legend titles


var LegendOptions = ['평균',lo];



//Data
var d = [
		  [
			{axis:"안전",value:0.73},
			{axis:"시설",value:0.69},
			{axis:"위생",value:0.77}
		  ]
		  ,
		  [
			{axis:"안전",value:score1/100},
			{axis:"시설",value:score2/100},
			{axis:"위생",value:score3/100}
		  ]
		];

//Options for the Radar chart, other than default
var mycfg = {
  w: w,
  h: h,
  maxValue: 1.0,
  levels: 10,
  ExtraWidthX: 300
}

//Call function to draw the Radar chart
//Will expect that data is in %'s
RadarChart.draw("#chart", d, mycfg);

////////////////////////////////////////////
/////////// Initiate legend ////////////////
////////////////////////////////////////////

var svg = d3.select('#body')
	.selectAll('svg')
	.append('svg')
	.attr("width", w+300)
	.attr("height", h)

//Create the title for the legend
//var text = svg.append("text")
//	.attr("class", "title")
//	.attr('transform', 'translate(90,0)') 
//	.attr("x", w - 70)
//	.attr("y", 10)
//	.attr("font-size", "12px")
//	.attr("fill", "#404040")
//	.text("What % of owners use a specific service in a week");
		
//Initiate Legend	
var legend = svg.append("g")
	.attr("class", "legend")
	.attr("height", 100)
	.attr("width", 200)
	.attr('transform', 'translate(90,20)') 
	;
	//Create colour squares
	legend.selectAll('rect')
	  .data(LegendOptions)
	  .enter()
	  .append("rect")
	  .attr("x", w-110)
	  .attr("y", function(d, i){ return i * 20;})
	  .attr("width", 10)
	  .attr("height", 10)
	  .style("fill", function(d, i){ return colorscale(i);})
	  ;
	//Create text next to squares
	legend.selectAll('text')
	  .data(LegendOptions)
	  .enter()
	  .append("text")
	  .attr("x", w - 96)
	  .attr("y", function(d, i){ return i * 20 +11;})
	  .attr("font-size", "15px") //평균-유치원값 글자 폰
	  .style("font-family", "Hanna")
	  .attr("fill", "#737373")
	  .text(function(d) { return d; })
	  ;	