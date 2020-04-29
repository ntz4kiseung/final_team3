$(document).ready(function(){
	
	
})

function cleanModal(){
	$(".btn-check-cate1").text("시·도");
	$(".btn-check-cate2").text("구·군");
	$(".btn-check-cate3").text("대분류");
	$(".btn-check-cate4").text("소분류");
	
	$("input[name='']").val();
	
	$("input[name='addrGuId1']").val();
	$("input[name='addrGuId2']").val();
	$("input[name='addrGuId3']").val();
	$("input[name='addrGuName1']").val();
	$("input[name='addrGuName2']").val();
	$("input[name='addrGuName3']").val();
	
	$("input[name='interSubId1']").val();
	$("input[name='interSubId2']").val();
	$("input[name='interSubId3']").val();
	$("input[name='interSubName1']").val();
	$("input[name='interSubName2']").val();
	$("input[name='interSubName3']").val();
	
	$("input[name='minNum']").val("2");
	$("input[name='maxNum']").val("20");
	$("#filter-minNum").text("2");
	$("#filter-maxNum").text("20");
	
	$($("#slider-range .ui-slider-handle")[0]).css("left", "0%");
	$($("#slider-range .ui-slider-handle")[1]).css("left", "100%");
	$("#slider-range .ui-slider-range").css("width","100%");
	$("#slider-range .ui-slider-range").css("left","0%");
	
	$("input[name='minMeetDate']").val(defaultMinMeetDate());
	$("input[name='maxMeetDate']").val(defaultMaxMeetDate());
	$("#filter-minMeetDate").text(defaultMinMeetDate());
	$("#filter-maxMeetDate").text(defaultMaxMeetDate());
	
	$($("#slider-range2 .ui-slider-handle")[0]).css("left", "0%");
	$($("#slider-range2 .ui-slider-handle")[1]).css("left", "100%");
	$("#slider-range2 .ui-slider-range").css("width","100%");
	$("#slider-range2 .ui-slider-range").css("left","0%");
	
	$(".filter-attribute img").addClass("grayscale");
	$($(".filter-attribute img")[0]).removeClass("grayscale");
	$("input[name='limitGrade']").val("1");
	
	$(".filter-plus").removeClass("hidden");
};