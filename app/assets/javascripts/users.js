$(document).on("keypress","#tweet_text",function(event){
	// event.preventDefault();
	 
	 if($(this).val().length >5) {        
         $("#post_tweet").attr("disable", "disable");
    } else {
         $("#post_tweet").attr("disable", false);
    }
});
