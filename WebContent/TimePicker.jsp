<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <!-- 부트스트랩 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <!-- 폰트 (Noto Snas KR + Handlee) -->
    <link href="https://fonts.googleapis.com/css?family=Handlee|Noto+Sans+KR&display=swap" rel="stylesheet">
    <!-- sagyo.css -->
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <link href="css/sagyo.css" rel="stylesheet">
    
    
<link rel = "stylesheet"href = "https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.css">
<link rel = "stylesheet"href = "https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.js">   
<link rel = "stylesheet"href = "https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">   
<link rel = "stylesheet"href = "https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css.map">   
<link rel = "stylesheet"href = "https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js">
<link rel = "stylesheet"href = "https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js.map">
<style type="text/css">
$('.timepicker').timepicker({
    timeFormat: 'h:mm p'',
    interval: 60,
    minTime: '10',
    maxTime: '6:00pm',
    defaultTime: '11',
    startTime: '10:00',
    dynamic: false,
    dropdown: true,
    scrollbar: true
});

</style>
<script type="text/javascript">
$(document).ready(function(){
    $('input.timepicker').timepicker({});
});

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    
<input class="timepicker text-center" jt-timepicker="" time="model.time" time-string="model.timeString" default-time="model.options.defaultTime" time-format="model.options.timeFormat" start-time="model.options.startTime" min-time="model.options.minTime" max-time="model.options.maxTime" interval="model.options.interval" dynamic="model.options.dynamic" scrollbar="model.options.scrollbar" dropdown="model.options.dropdown">

<script src = "//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js">

</script>    

</body>
</html>