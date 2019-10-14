function reviewAddFunction(n){//리뷰등록
	
	var C1 = document.getElementById("clean")
	
	C1.innerHTML='<br><form id="commentForm" name="commentForm" method="post"><div id = "hi" >' +
	"<table width='95%' align=center><tr><td><textarea id='contents' name='contents' cols='45' rows='8' onFocus='edit()' align=center>" +
	"댓글을 작성해주세요</textarea></td></tr><tr><td align=right>" +
	"<input type=button onclick=addComment("+n+"); value=등록 id = but style=font-family: Hanna;>" +
	"<input type='hidden' value='kdid'>"+
	"</td></tr></table></div></form>"

}

function addComment(n){
	if(${authInfo eq null}){
		alert("로그인이 필요한 기능입니다.");	
	}
	else{
		var contents = $('#contents').val();
		var kdid = IDList[n];
		
		
	$.ajax({
		url:"addCommnet.do",
		method:"GET",
		async:false,
		traditional : true,
		data:{
			'kdid':kdid,
			'contents':contents
		},
		success:function(data){
			
			reviewFunction(n);
			},
		 	error:function(request,status,error){
		        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
		    }
	});
	
	}
}
function reviewFunction(n){	//리뷰
	SearchID(IDList[n],n)
}

function scoreFunction(n){	//점수
	var C1 = document.getElementById("clean")
	C1.innerHTML=NameList[n]
}

function SearchID (n,count){//리뷰보기를 누르면 목록을 받아오는 부분
	var C1 = document.getElementById("clean")
	C1.innerHTML= "<br>"
	
	$.ajax({
			url:"commentList.do",
			method:"GET",
			async:false,
			traditional : true,
			data:{
				'kdid':n
			},
			success:function(data){
				var obj = JSON.parse(data);
				for(var i = 0;i<Object.keys(obj.result).length;i++){
		 		var $div = $('<span> '+ obj.result[i][1]["Writer"]+' ('+obj.result[i][2]["Score"]+'점):'+obj.result[i][0]["Contents"]+'</span><hr>');
		 		$('#clean').append($div);
				};
				},
			 	error:function(request,status,error){
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			    }
		});
	var $div = $("<input type='button' value='등 록' id = but style='font-family: Hanna;' onclick='reviewAddFunction(" + count + ");' >");
		$('#clean').append($div);
}