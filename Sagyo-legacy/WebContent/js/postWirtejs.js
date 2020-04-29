$(document).ready(function() {
	var modalLayer = $("#modalLayer");
	var modalLink = $("#post-write-end");
	var modalCont = $(".modalContent");
	var marginLeft = modalCont.outerWidth() / 2;
	var marginTop = modalCont.outerHeight() / 2;
	modalLink.click(function() {
		modalLayer.fadeIn("slow");
		modalCont.css({
			"margin-top" : -marginTop,
			"margin-left" : -marginLeft
		});
	});
	$(".modalContent > .sub-modalcontent > .exit").click(function() {
		modalLayer.fadeOut("slow");
	});
	$( function() {
	    $( "#slider-range" ).slider({
	      range: true,
	      min: 2,
	      max: 20,
	      values: [ 2, 20 ],
	      slide: function( event, ui ) {
	        $( ".price-slider-one" ).val(ui.values[ 0 ]);
	        $( ".price-slider-two" ).val(ui.values[ 1 ] );
	        $( ".post-people-range" ).val(ui.values[ 0 ] + " ~ " + ui.values[ 1 ]+"명");
	      }
	    });
	    $( ".price-slider-one" ).val($( "#slider-range" ).slider( "values", 0 ));
	    $( ".price-slider-two" ).val($( "#slider-range" ).slider( "values", 1 ));
	    $( ".post-people-range" ).val($( "#slider-range" ).slider( "values", 0 ) +
	    	      " ~ " + $( "#slider-range" ).slider( "values", 1 )+"명" );
	  } );
});