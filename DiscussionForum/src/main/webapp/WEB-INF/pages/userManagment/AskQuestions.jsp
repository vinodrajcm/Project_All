	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<jsp:include page="../common/Header.jsp" />  
	<link href="${pageContext.request.contextPath}/resources/css/home.css" rel=stylesheet>
</head>
<body>


		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		
		<script src="${pageContext.request.contextPath}/resources/js/editor.js"></script>
		<script>
		
		function tagDelete(val){
			var valueToRemove = val.id;
			val.remove();
			var oriValue = $("#tag-values").val();
			oriValue = oriValue.replace(valueToRemove+",","");
			$("#tag-values").val(oriValue);
			var width = $("#clearBtn1").width();
    		$("#tags").css("margin-left",width+"px");
		}
		</script>
		<script>
			$(document).ready(function() {
				$("#questionDescription").Editor();
				
				
				
				$("#tags").keyup(function(){
			    	var value = $("#tags").val();
			    	var oriValue = $("#tag-values").val();
			    	console.log(value);
			    	var regx = /^[A-Za-z0-9-_.-]+$/;
			    	if(value != ""){
			    		if (!regx.test(value)){
			    			value = value.replace(/[^a-zA-Z 0-9 -]+/g,"");
				    		if(!oriValue.trim().match(value.trim())){
				    			var tagView ="<a href='#'  id="+value+" class='post-tag' title='Show questions relating to usability' rel='tag'>"+value+"<span class='close-tag' id='close-tag' onClick='tagDelete("+value.trim()+");return false'>X</span></a>"
					    		
					    		$('#clearBtn1').prepend($(tagView));
					    		$("#tags").val("");
					    		var width = $("#clearBtn1").width();
					    		$("#tags").css("margin-left",width+"px");
					    		oriValue=value.trim()+","+oriValue.trim();
					    		$("#tag-values").val(oriValue);
				    		}else{
				    			$("#tags").val("");
				    		}
				    		        event.preventDefault();
				    	}
			    	}
			    	
			    });
			});
		</script>
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/editor.css">
		<style>
			.btn-group a{
					color:#ffd200;
			}
			.btn-group a:HOVER{
					color:white;
			}
			
			.text-container {
			  //display: inline-block;
			  position: relative;
			  //overflow: hidden;
			}
			.clearBtn {
			  position: absolute;
			  top: 0;
			  margin-top: 1%;
			  transition: right 0.2s;
			}
			.show {
			  right: 5px;
			}
			.close-tag{
			  font-size: 8px;
              margin-left: 5px;
			}
			.tags-textfield{
				    border: none !important;
				    box-shadow: none !important;
				    outline: 0 !important;
				    padding: 0 !important;
				    margin: 5px 3px 0;
				    background-color: transparent !important;
				    height: 25px;
				    width: 100%;
			}
		</style>
<div class="container">
<form autocomplete="off">
<div class="headerTitle">Ask Questions</div>
<div class="row">

<div class="col-sm-1"></div>
<div class="col-sm-10">
  
	<div class="form-group">
    <label for="questionTitle">Login ID</label>
    <input type="text" class="form-control" id="questionTitle" name="questionTitle" placeholder="Enter Question title">
  	</div>
  	<div class="form-group">
    <label for="questionDescription">Body</label>
    <textarea name="content" id="questionDescription"></textarea> 
  	</div>
    <div class="form-group">
    <label for="tags">Tags</label>
    <div class="text-container form-control">
    <span  class="clearBtn">
				<div id="clearBtn1" class="explore-tags"></div>
  		</span>
    	<input type="text" class="tags-textfield" id="tags" name="tags" placeholder="at least one tag such as (login interaction-design terminology), max 5 tags">
  		
	</div>
  	</div>
  	<input type="text" style="display: none;" id="tag-values">	
    <button type="submit" class="btn btn-kenna">Submit</button>
    
</div>
<div class="col-sm-1"></div>
</div>
</form>
</div>
<jsp:include page="../common/footer.jsp" />  
</body>
<script>
$(document).ready(function() {

    // process the form
    $('form').submit(function(event) {

        // get the form data
        // there are many ways to get this data using jQuery (you can use the class or id also)
        var formData = {
            'questionTitle'              : $('input[name=questionTitle]').val(),
            'questionDescription'             : $("#questionDescription").Editor("getText"),
            'tag':$('#tag-values').val()
        };

        // process the form
        $.ajax({
            type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
            url         : '../askQuestion/createQue', // the url where we want to POST
            data        : formData, // our data object
            //dataType    : 'json', // what type of data do we expect back from the server
            encode          : true,
            success: function (data) {
            	console.log("demo");
                window.location.href ="../home/view";
            },
            error: function () {
                alert('error happened');
            }
        });
        
            

        // stop the form from submitting the normal way and refreshing the page
        event.preventDefault();
    });
    


});

</script>
</html>