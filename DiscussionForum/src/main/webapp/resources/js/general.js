 $(function() {
	 
	 //Tool tip fuctions
           $("#questionTitle").focus(function() {
        	   $('.toolTipHeader').text(""); //emptying the previous data
        	   $('.toolTipHeader').text("How to Ask");
        	   $(".toolTipBody").empty(); //emptying the previous data
        	   var body="<ul><li>Is your question about user experience? Be Specific</li>"+
        	   "<li>We prefer questions that can be answered, not just discussed.</li>"+
               "<li>Provide details. Share your research.</li></ul>";
        	   $('.toolTipBody').append(body);
           });
           
           $("#demo_text").click(function() {
        	   $('.toolTipHeader').text(""); //emptying the previous data
        	   $('.toolTipHeader').text("How to Format");
        	   $(".toolTipBody").empty(); //emptying the previous data
        	   var body="<ul><li> put returns between paragraphs</li>"+
        	   "<li>for linebreak add 2 spaces at end</li>"+
               "<li> _italic_ or **bold**</li><li>quote by placing > at start of line</li><li>Make a link</li>"+
               "<li>You can add a image and url on clicking the icons (You can change the image height and width by left click on image after adding)</li></ul>";
        	   $('.toolTipBody').append(body);
           });
           
           $("#tags").focus(function() {
        	   $('.toolTipHeader').text(""); //emptying the previous data
        	   $('.toolTipHeader').text("How to Tag");
        	   $(".toolTipBody").empty(); //emptying the previous data
        	   var body="<ul><li>A tag is a keyword or label that categorizes your question with other, similar questions. Choose one or more (up to 5) tags that will help answerers to find and interpret your question.</li>"+
        	   "<li>>use tags that describe things or concepts that are essential, not incidental to your question</li>"+
               "<li>If your question is primarily about a topic for which you can't find a tag:</li><li>>Combine multiple words into single-words with hyphens (e.g. website-design), up to a maximum of 20 characters</li>" +
               "<li>>Create multiple Tags by comma seperation</li>"+
               "</ul>";
        	   $('.toolTipBody').append(body);
           });
           
       
            
 });
 
 
 var message ={
		 messageHandling :function(message,status,id) {
			 
			 
			   var message_danger = '<div class="alert alert-danger alert-dismissible fade show">'+
	    	    '<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>'+
	    	    '<strong>Error! </strong>'+message+
	    	    '</div>';
			    
			 var message_success= '<div class="alert alert-success alert-dismissible">'+
	    		'<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>'+
	    		'<strong>Success!</strong>'+message+
	    		'</div>';
	    		if(status == "error"){
	    			 $('#'+id+'').html(message_danger);
	    			    $(window).scrollTop(0);
	    		}else{
	    			 $('#'+id+'').html(message_success);
	    			    $(window).scrollTop(0);
	    		}
	   
	    //var el = document.getElementById('alert_placeholder');
	    //el.scrollIntoView();
	  
	 }
 };