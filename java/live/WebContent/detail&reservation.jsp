<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<style>
body {
	margin: 0 5%;
}

#top {
	border: 1px solid black;
	width: 100%;
}

#img {
	margin-bottom: 2%;
	width: 100%;
	height: 50%;
	overflow: hidden;
	border: none;
}

#detail {
	border: 1px solid black;
	width: 95%;
	height: 250px;
	display: flex;
	margin: 10px auto;
}

.info {
	width: 400px;
	height: 250px;
	display: inline-block;
	margin: 0px 0px 0px 20px
}

.mainpic {
	width: 250px;
	height: 250px;
	display: inline-block;
}

#mainimg {
	
}

#imgs_wrap {
	margin: 0 auto;
	display: inline-block;
}
/*  #sldimg{margin-bottom:2%;width:70%;height:800px;overflow:hidden;border:none;} */
#subimg {
	border: 1px solid black;
	width: 100%;
	height: 40%;
	margin-bottom: 10px;
}

#middle {
	display: flex;;
	margin: 10px 0px 10px 0px;
	width: 100%;
	height: 50%;
	border: 1px solid black
}

#review {
	margin: 5px 5px 5px 5px;
	border: 1px solid black;
	width: 50%;
	height: 50%;
}

#rightpart {
	margin: 5px 5px 5px 5px;
	border: 1px solid black;
	width: 50%;
	height: 50%;
}

#reservation {
	margin: 5px 5px 5px 5px;
	width: 97%;
	height: 200px;
	border: 1px solid black;
	text-align: center;
}

#reple {
	margin: 5px 5px 5px 5px;
	width: 97%;
	height: 50%;
	border: 1px solid black;
}

#bottom {
	width: 100%;
	height: 50%;
	overflow: hidden;
	border: 1px solid black;
}

.inner {
	display: inline-flex;
}

#imgdetail {
	text-align: center;
}

.mySlides {
	margin: 0px 20px
}

.nextbtn {
	display: inline-block;
}
</style>

</head>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css" />
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>


<body>

	<h1>예약 디테일 페이지</h1>

	<div>
		<div id="top">

			<div id="img">
				<div id="mainimg"></div>

				<div id="imgdetail">
					<div class="nextbtn">
						<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
					</div>
					<div id=imgs_wrap></div>
					<div class="nextbtn">
						<a class="next" onclick="plusSlides(1)">&#10095; </a>
					</div>
				</div>
			</div>


		</div>



	</div>




	<div id="middle">


		<div id="review">
			<h1>후기</h1>
		</div>


		<div id="rightpart">
			<div id="reservation">

				<h1>예약</h1>
				<form action="reservation">
					<input type="text" name="sdate" id="datepicker1"> ~~ <input
						type="text" name="edate" id="datepicker2">
					<button type="button" id="dtcommit">날짜확정</button>
					<br> 총액 : <input name="tprice" type="text" id="totalprice"
						placeholder="">원<br> 인원 : <input name="tperson"
						type="number" id="person" value="">명 <input type="hidden"
						name="hostid" id="hostid" value=${findhostid}> <input
						type="hidden" name="guestid" id="guestid" value=${id}> <input
						type="hidden" name="regnum" id="regnum" value=${rgnum}><br>
					<button>예약하기</button>
				</form>
			</div>

			<div id="reple">
				<h1>문의사항</h1>
				<hr>
				<div id="showreple"></div>
				<br>
				<div id="rreple">aa</div>
				<div id="inputreple">
					<input type="text" id="input"
						placeholder="주제와 무관한 댓글, 악플은 삭제될 수 있습니다.">
					<button type="button" id="replepush">등록</button>
					<input id="chc" type="checkbox" name="비밀" value="비밀글">비밀글
				</div>
			</div>
		</div>

	</div>



	<div id="bottom">
		<h1>주의사항</h1>
	</div>




	<script>


	
////////////페이지 부를때 바로 부르는 댓글
	for(i in ${reple}){
	
	   
	   var a = $('<div class="printreple"></div>');
	   
	   var b = $('<div class="reple">'+'댓글번호 :  '+${reple}[i][0]["RP_NUM"]+'아이디 :  '+${reple}[i][0]["RP_ID"]+${reple}[i][0]["RP_TIME"]+'<br>'
	   				+${reple}[i][0]["RP_CONTENT"]+'<br>'
	   				+'<button id="'+${reple}[i][0]["RP_NUM"]+'" class="rreplebtn">'+'답글'+'</button>'+'<br>'+'</div>');
	   				
	   var c = $('<div class="rreple" id="rreple'+${reple}[i][0]["RP_NUM"]+'"></div>');
	   var d = 	$('<div class="rreplecnt" id="rreplecnt'+${reple}[i][0]["RP_NUM"]+'"></div>');
	  
	   
	   c.append(d);			
	   
	   
//  	   				+'<div class="rreple" id="rreple'+${reple}[i][0]["RP_NUM"]+'"><div><input type="text" id="rreplecontent'+${reple}[i][0]["RP_NUM"]'">'
//  	   				+'<button class="rrepleput" id="'+${reple}[i][0]["RP_NUM"]+'">'+'등록'+'</button></div></div>'); 
	   				
	   				
	   		
	   console.log("--")
	   console.log(b);
	   
	   a.append(b);
		a.append(c);	
	   $("#showreple").append(a);
	

	   
	}
	
	
	//대댓창 보여주는 펑션	AJAX	
	 $(".rreplebtn").on("click",function(){  //답글창 누르면 나옴   --> ajax로 바꿔줄것. 댓글 나오도록 하는 것 !!
		 
			var temp = $(this).attr('id');  // 해당 댓글 번호 
			console.log($(this).attr('id'));
			$('#rreple'+$(this).attr('id')).css("display", "block");   	
			
			$.ajax({
				type : 'get',
				url : "showrreple",
				data : {replenum : temp},
				datatype:"json",
				
				//서블릿 성공시 돌아오는곳  $test[0][0]["H_RGNUM"];
				
				success:function(rreple){
				
					
				var obj=JSON.parse(rreple);
					
					console.log(typeof obj);
					console.log(obj);
					console.dir(obj);
					console.log("나와줘제발22");
					
					for(i in obj){
						
					   
					   
					   var a = $('<div class="replee">'+'댓글번호 :  '+obj[i][0]["RRP_NUM"]+'아이디 :  '+obj[i][0]["RRP_ID"]+'<br>'
							   +'     '+obj[i][0]["RRP_TIME"]+'<br>'
					   				+'<div class=innerreple>'+obj[i][0]["RRP_CONTENT"]+'<br>'+obj[i][0]["RRP_RP_NUM"]+'</div>'+'</div>')
							   
					   $("#rreplecnt"+temp).append(a);
					   
					   
					}
					
					var d= $('<input type="text" id="rreplecontent'+temp+'" ><button class="rrepleput" id="'+temp+'">'+'등록'+'</button>');
					$("#rreplecnt"+temp).after(d);
					
					//대댓글 디비에 보내기 성공했음	(ajax)
					$(".rreple").on('click','.rrepleput',function() {
						
						
						$("#rreplecnt").empty();   // rreplecnt <- 대댓글이 쌓이는 곳 // 댓글 쓰면 타 댓글 다 사라지고 보여짐 일단 몰라
						var temp =$(this).attr('id');
						var a=$("#rreplecontent"+temp).val();
						console.log(a);
						
						var rrepledata=[];
						
						
						rrepledata.push(a);
						rrepledata.push(temp);
						
						var result=JSON.stringify(rrepledata);
						
						$.ajax({
							type : 'get',
							url : "inputrreple",
							data : {rreple : result},
							datatype:"json",
							
							//서블릿 성공시 돌아오는곳  $test[0][0]["H_RGNUM"];
							
							success:function(rreple){
							
								$("#rreplecnt"+temp).empty();
							var obj=JSON.parse(rreple);
								
								console.log(typeof obj);
								console.log(obj);
								console.dir(obj);
								for(i in obj){
									console.log("나와줘제발");
									console.log(obj[i][0]["RRP_CONTENT"]);
								   
								   
								   var a = $('<div class="replee">'+'댓글번호 :  '+obj[i][0]["RRP_NUM"]+'아이디 :  '+obj[i][0]["RRP_ID"]+'<br>'
										   +'     '+obj[i][0]["RRP_TIME"]+'<br>'
								   				+'<div class=innerreple>'+obj[i][0]["RRP_CONTENT"]+'<br>'+obj[i][0]["RRP_RP_NUM"]+'</div>'+'</div>')
										   
								   $("#rreplecnt"+temp).append(a);
								   
								   console.log("test======temp : " + temp);
								   console.dir($("#rreplecnt"+temp));
								
								}
							}	,
							error:function(error){
								console.log(error);
							}
							
							
						});
						
					}) 
					
				}	,
				error:function(error){
					console.log(error);
				}
				
				
			});
			 
			 
			 
	 });
	
	

	
 

	
	
///에이작스로 추가된 댓글 추가하는 곳

$("#replepush").click(function() {

	var $test=${result};
	  $("#showreple").empty();
	var type;
	if($("#chc").prop('checked')){
	 type=1;
	}else{
	 type=0;	
	}
	
	console.log($("#chc").prop('checked'));
	console.log("동작");
	var repledata = [];
	var id1 = '${id}';
	var temp = $("#input").val();
	var rep = $test[0][0]["H_RGNUM"];
	
	console.log("=====================ajax")
	console.log($test)
	console.log(rep);
	console.log(id1);
	console.log(temp);
	

	repledata.push(type);
	repledata.push(rep);
	repledata.push(id1);
	repledata.push(temp);

	

	
	console.log(repledata);
 	var result=JSON.stringify(repledata);
	
 	$.ajax({
		type : 'get',
		url : "inputreple",
		data : {reple : result},
		datatype:"json",
		
		//서블릿 성공시 돌아오는곳  $test[0][0]["H_RGNUM"];
		
		success:function(reple){
			var result = JSON.parse(reple);
			
			
			console.log(typeof result);
			console.log(result);
			console.dir(result);
			for(i in result){
				console.log(result[i]);
			   
			   var a = $('<div class="printreple"></div>');
			   
			   var b = $('<div class="reple">'+'댓글번호 :  '+result[i][0]["RP_NUM"]+'아이디 :  '+result[i][0]["RP_ID"]+'<br>'
					   +'     '+result[i][0]["RP_TIME"]+'<br>'
			   				+'<div class innerreple>'+result[i][0]["RP_CONTENT"]+'<br>'+result[i][0]["RP_TYPE"]+'</div>'+'</div>')
					   
			   a.append(b);
			   
			   $("#showreple").append(a);
			
			}
		}	,
		error:function(error){
			console.log(error);
		}
		
		
	});
 })



   
   
   
   
   
   /////////////////////////////디테일 방정보 보여주기
   var $test=${result};
   
   var a = $('<div id="detail"></div>');
   
   //console.log($test[0][0]["H_MAINPIC"]);
   var b = $('<div class="mainpic"><img width="250" height="250" alt=사진없음 src="'+$test[0][0]["H_MAINPIC"]+'"></div>');
   var c = $('<div class="info">'+'주소:  '+$test[0][0]["H_ADDRESS"]+'  '+$test[0][0]["H_DETAILADD"]+'<br>'
         +'숙박가능 날짜:  '+$test[0][0]["H_CHECKIN"]+'~'+$test[0][0]["H_CHECKOUT"]+'<br>'
         +'수용가능인원:  '+$test[0][0]["H_ATTENDANCE"]+'<br>'
         +'1박가격:  '+$test[0][0]["H_ONEPRICE"]+'<br>'
         +'방갯수:  '+$test[0][0]["H_ROOMS"]+'<br>'
         +'침대수:  '+$test[0][0]["H_BEDROOMS"]+'<br>'
         +'화장실:  '+$test[0][0]["H_TOLILET"]+'<br>'
         +'주차가능:  '+$test[0][0]["H_PARKABLE"]+'<br>'
         +'욕실:  '+$test[0][0]["H_BATHROOMS"]+'<br>'+
         '</div>')
         
         
   $("#totalprice").attr('placeholder', 'PRICE PER night : '+$test[0][0]["H_ONEPRICE"] +"원"  ); 
   $("#person").attr('placeholder', '최대인원 : '+$test[0][0]["H_ATTENDANCE"] +"명"  ); // 넘길때 이벤트 줘야함.
   
   
   
   a.append(b);
   a.append(c);
   $("#mainimg").append(a);
   
   console.log($test);
   console.dir($test);
   console.log($test[0]);

   
   
   //인원 버튼 
   $("#person").keyup(function(){
	   console.log(typeof $test[0][0]["H_ATTENDANCE"])
	   if($(this).val()>Number($test[0][0]["H_ATTENDANCE"])){
		   alert("수용인원을 초과하였습니다. 최대인원 : "+$test[0][0]["H_ATTENDANCE"]);   
		   $(this).val("")	;
		   $(this).focus()	;
	   }else{
		      
	   }
	    
   })
  
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   

	
	//하동원 detail 사진!
	
	
	var a = $test[0][0]["H_DETAILPICS"];
	var jbSplit = a.split(',');
	console.log(jbSplit);	
	var result = jbSplit.slice(0, jbSplit.length-1 )
	console.log(result);	

	let indexpic = [0,1,2];
	
	
	for(let i in result){
		if(i<=2){  // 3 이상일때
			$("#imgs_wrap").append( $('<div class="mySlides" style="display:inline-block"> <img width="200px" height="200px" src="'+result[i] +'" ></div>') );
				
		}else{
			$("#imgs_wrap").append( $('<div class="mySlides" style="display:none"> <img width="200px" height="200px" src="'+result[i] +'" ></div>')  );
			
		}
		
	}
	
	

	function readListURL(indexpic) {
		
		console.log("사진 변경 띠 " )
		
		let files1 = $(".mySlides");
		let total = files1.length;
		let filesArr = Array.prototype.slice.call(files1);  // 객체 -> 배열
		console.log(files1);
		
		console.log("========");
		
		
		filesArr.forEach((e,i)=>{
			
			if(i<3){
				console.log("존재 : " + i);
				$(e).css('display','inline-block');
				
			}else{
				console.log("존재x : " + i);
				$(e).css('display','none');
				
			}
		
		});
		
		
	}

	
	let plusSlides = (e)=>{
		console.log("화살표 눌렀습니다 : " + e)
		let files2 = $(".mySlides");   // myslides 모으기
		
		//console.log("list : " + list);

		console.log("files : " + files2);
		
		if(e === -1){
			console.log("처음 : " + indexpic);
			indexpic = indexpic.map((v)=>{
				
					
					$(files2[files2.length-1]).insertBefore(files2[0]);
				
			});
			console.log("변경 : " + indexpic);
			
			readListURL(indexpic);
			
		}else if(e === 1){
			console.log("tset");
			console.log($(files2[0]));
			console.log("처음 : " + indexpic);
			indexpic = indexpic.map((v)=>{
				
					$(files2[0]).insertAfter(files2[files2.length-1]);
				
			});
			console.log("변경 : " + indexpic);
			readListURL(indexpic);
		}
		
		console.log(e);
	}
	
	
	var disabledDays = [];  //"2020-01-15"
		
	$(document).ready(function(){
		$("#datepicker1").datepicker({
			
		 	dateFormat: 'yy-mm-dd',
		    prevText: '이전 달',
		    nextText: '다음 달',
		    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		    showMonthAfterYear: true,
		  
		    minDate:new Date($test[0][0]["H_CHECKIN"].substr(0,10)),
		    maxDate: new Date($test[0][0]["H_CHECKOUT"].substr(0,10)),
			beforeShowDay:function(date){
		        var string = jQuery.datepicker.formatDate('yy-mm-dd', date);
		        return [ disabledDays.indexOf(string) == -1 ]
		    },
 		    onSelect: function(dateText) {  
		    	console.log(typeof dateText)
		    	console.log(dateText)  // 2020-01-21
		    	var select = new Date(dateText);
		    	
		    	if(a=="Invalid Date"){
		    		
		    	}else{
		    		$("#datepicker1").datepicker('option', 'minDate', new Date(dateText));
		    		$("#datepicker2").datepicker('option', 'minDate', new Date(dateText));
	    			
		    		
		    		for(i in disabledDays){
		    			var ss = new Date(disabledDays[i])
		    			console.log(select.getDate());
		    			console.log(ss.getDate());
		    			console.log(ss.getDate()-select.getDate())
		    			if(ss.getDate()-select.getDate()>0){ //양수일때  // 1일차이일때 이벤트도 줘야함.
		    				$("#datepicker1").datepicker('option', 'maxDate', new Date(disabledDays[i]));
		    				$("#datepicker2").datepicker('option', 'maxDate', new Date(disabledDays[i]));
		    				break;
		    			}else{ //음수일때
		    				
		    			}
		    			
		    		}
		    		
		    	}
		    	
 		    }



			});
		
		
	$("#datepicker2").datepicker({
			
		 	dateFormat: 'yy-mm-dd',
		    prevText: '이전 달',
		    nextText: '다음 달',
		    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		    showMonthAfterYear: true,
		  
		    minDate:new Date($test[0][0]["H_CHECKIN"].substr(0,10)),
		    maxDate: new Date($test[0][0]["H_CHECKOUT"].substr(0,10)),
			beforeShowDay:function(date){
		        var string = jQuery.datepicker.formatDate('yy-mm-dd', date);
		        return [ disabledDays.indexOf(string) == -1 ]
		    },
 		    onSelect: function(dateText) {  
		    	console.log(dateText)
		    	var a = new Date(disabledDays[0]);
		    	
 		    }



			});
			
			
		
	});
	
	$('#dtcommit').on('click',function(){
		console.log("testtest");
		
		var sdate = $('#datepicker1').val();  
		var ddate = $('#datepicker2').val();  
		  
		var ar1 = sdate.split('-');
	    var ar2 = ddate.split('-');  
	    
	    var da1 = new Date(ar1[0], ar1[1], ar1[2]);
	    var da2 = new Date(ar2[0], ar2[1], ar2[2]);
		  
	    var dif = da2 - da1;
	    var cDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
	    var cMonth = cDay * 30;// 월 만듬
	    var cYear = cMonth * 12; // 년 만듬
		
	    if(sdate && ddate){
			console.log(parseInt(dif/cDay))
			$("#totalprice").val(parseInt(dif/cDay)*$test[0][0]["H_ONEPRICE"]);
		 } 

	})
	
	
var listDate = [];
var checkeddate = ${findhostid};
for(i in checkeddate){
	
	var st = new Date(checkeddate[i][0]);

	var smonth = st.getUTCMonth() + 1; //months from 1-12
	var sday = st.getUTCDate();
	var syear = st.getUTCFullYear();
	if(smonth<10){
		st = syear + "-0" + smonth + "-" + sday;
			
	}else{
		st = syear + "-" + smonth + "-" + sday;
		
	}
	console.log("st : " +st)
	//
	var ed = new Date(checkeddate[i][1]);

	var emonth = ed.getUTCMonth() + 1; //months from 1-12
	var eday = ed.getUTCDate();
	var eyear = ed.getUTCFullYear();

	if(emonth<10){
		ed = eyear + "-0" + emonth + "-" + eday;
			
	}else{
		ed = eyear + "-" + emonth + "-" + eday;
		
	}
	
	console.log("ed : " +ed)
	//
	getDateRange(st,ed,disabledDays)	
}


	function getDateRange(startDate, endDate, listDate){

        var dateMove = new Date(startDate);
        var strDate = startDate;

        if (startDate == endDate){

            var strDate = dateMove.toISOString().slice(0,10);

            listDate.push(strDate);

        }else{

            while (strDate < endDate){

                var strDate = dateMove.toISOString().slice(0, 10);

                listDate.push(strDate);

                dateMove.setDate(dateMove.getDate() + 1);

            }

        }

        return listDate;

    };
   
	
	console.log(disabledDays);


	console.log("????");
	console.log(${findhostid})
</script>



</body>
</html>




