<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="./stylefolder/indexstyle.css">
<script>
var img=new Array(
		"1.jpg",
		"2.jpg",
		"3.jpg",
		"4.jpg",
		"5.jpg",
		"6.jpg"
		);
	var imgPath="images/";
	var imgNum=0;
	var imgLength=img.length-1;
	var delay=3000;
	var lock=false;
	var run;
	function changeImage(direction){
		if(document.images){
			imgNum=imgNum+direction;
			if(imgNum>imgLength){
				imgNum=0;
			}
			if(imgNum<0){
				imgNum=imgLenth;
			}
			document.slideshow.src=imgPath+img[imgNum];
		}
	}
	function auto(){
		if(lock==true){
			lock=false;
			window.clearInterval(run);
		}
		else if(lock==false){
			lock=true;
			run=setInterval("changeImage(1)",delay);
		}
	}
	
</script>

<title>kw</title>
</head>
<body onLoad="auto();" background="http://info.kw.ac.kr/include/images/backdround_01.jpg">
	<div id="top">
		<a href="index.jsp"><img src="./images/kw_logo.jpg"></a>
		<a href="index_view.jsp" style="text-decoration:none"><font size="6" color="black"><b>UCAMPUS</b></font></a>
		<a href="list.jsp" style="text-decoration:none"><font size="6" color="black"><b>KW-LIFE</b></font></a>
	</div>
	<center>
	<div id="img">
		<img src="./images/1.jpg" name="slideshow" style="width:85%; background-color: #DCDCDC">
	</div>
	<div id="hotissue"><a href="https://www.kw.ac.kr/ko/life/newsletter.do"><img src="./images/hot_issue.jpg" style="width:80%"></a></div>
	<div id="notice"><a href="https://www.kw.ac.kr/ko/life/notice.do"><img src="./images/notice.jpg" style="width:90%"></a></div>
	<div id="end"><a href="https://www.kw.ac.kr/ko/life/notice.do"><img src="./images/end.jpg" style="width:100%"></a></div>
	</center>
	
	
</body>
</html>