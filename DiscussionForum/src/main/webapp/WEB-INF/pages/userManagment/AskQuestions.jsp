<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../common/Header.jsp" />
<link href="${pageContext.request.contextPath}/resources/css/home.css"
	rel="stylesheet">
</head>
<body>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

	<script src="${pageContext.request.contextPath}/resources/js/editor.js"></script>
	
	<script src="${pageContext.request.contextPath}/resources/js/createQuestion.js"></script>
	<script>
				function tagDelete(val){
					var valueToRemove = val.id;
					$("#"+valueToRemove).remove();
					var oriValue = $("#tag-values").val();
					oriValue = oriValue.replace(valueToRemove+",","");
					$("#tag-values").val(oriValue);
					var width = $("#clearBtn1").width();
					$("#tags").css("margin-left",width+"px");
				}
				function tagDeleteDb(val){
					var valueToRemove = val;
					$("#"+valueToRemove).remove();
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
				$(window).on('load',function(){
				    //load description for editing if exsists
					var div = '${questionDetails.questionDescription}';
					$("#questionDescription").Editor("setText",div);
					var tags = $("#tag-values").val();
					var tagArray = tags.split(',');
					for(var i=0;i<tagArray.length;i++){
						var tag = tagArray[i];
						if(tag != ""){
							var tagView ="<a href='' onClick='return false' id="+tag+" class='post-tag' title='Show questions relating to usability' rel='tag'>"+tag+"<span class='close-tag' id='close-tag' onClick='tagDeleteDb(\""+tag.trim()+"\");return false'>X</span></a>"
				    		$('#clearBtn1').prepend($(tagView));
				    		$("#tags").val("");
				    		var width = $("#clearBtn1").width();
				    		$("#tags").css("margin-left",width+"px");
						}
					}
				});
				
				// process the form
			    $('form').submit(function(event) {

			    	var questionId = $("#question_id").text();
			    	if(questionId ==""){
			    		questionId =0;
			    	}
			    	if($('input[name=questionTitle]').val() ==""){
			    		 message.messageHandling(" Please enter Question Title","error","alert_placeholder");
			    		  return false;
			    	 }
			    	if($("#questionDescription").Editor("getText") ==""){
			    		 message.messageHandling(" Please enter discription about question","error","alert_placeholder");
			    		  return false;
			    	 }
			    	 if($('#tag-values').val() == ""){
			    		 message.messageHandling(" Please enter atleast one tag","error","alert_placeholder");
			    		  return false;
			    		  
			    	 }
			    	 var array = $('#tag-values').val().split(',');
		    		  if(array.length > 5){
		    			  message.messageHandling(" Please enter less than 5 tags per question","error","alert_placeholder"); 
		    			  return false;
		    		  }
			    			 
			        // get the form data
			        // there are many ways to get this data using jQuery (you can use the class or id also)
			        var formData = {
			        	'questionId' :questionId,
			            'questionTitle': $('input[name=questionTitle]').val(),
			            'questionDescription': $("#questionDescription").Editor("getText"),
			            'tag':$('#tag-values').val()
			        };
			        $(".loader").fadeIn();
			        // process the form
			        $.ajax({
			            type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
			            url         : '../question/createQue', // the url where we want to POST
			            data        : formData, // our data object
			            //dataType    : 'json', // what type of data do we expect back from the server
			            encode          : true,
			            success: function (data) {
			            	//console.log("demo");
			            	$(".loader").fadeOut("slow");
			            	if(data == "login_Failed"){
			            		$("#loginModel").modal();
			            		 return false;
			            	}
			            	if(data == "email_failed"){
			            		message.messageHandling("sending mail Failed","error","alert_placeholder");
			            	}
			                window.location.href ="../home/view";
			            },
			            error: function () {
			            	 $(".loader").fadeOut("slow");
			            	 message.messageHandling("Something went wrong while submitting question","error","alert_placeholder");
			            }
			        });
			        
			            

			        // stop the form from submitting the normal way and refreshing the page
			        event.preventDefault();
			    });
			});
		</script>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/editor.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/question.css">
	<div class="container">
		<form autocomplete="off">
			<div class="headerTitle">Ask Questions</div>
			<div class="row">
				<div class="col-sm-8">
					<div id="question_id" style="display: none">${questionDetails.questionId}</div>
					<div id = "alert_placeholder"></div>
					<div class="form-group">
						<label for="questionTitle">Title</label> <input
							type="text" class="form-control" id="questionTitle"
							name="questionTitle" placeholder="Whats your user experiance Question? Be specific"
							value="${questionDetails.questionTitle}">
					</div>
					<div class="form-group" id="demo_text">
						<label for="questionDescription">Body</label>
						<textarea name="content" id="questionDescription"></textarea>
					</div>
					<div class="form-group">
						<label for="tags">Tags</label>
						<div class="autocomplete" style="width:100%;">
						<div class="text-container form-control">
							<span class="clearBtn">
								<div id="clearBtn1" class="explore-tags"></div>
							</span> 
							
							<input type="text" class="tags-textfield" id="tags" name="tags"
								placeholder="Enter Max 5 tags">
					    </div>	

						</div>
					</div>
					<input type="text" style="display: none;" id="tag-values"
						value="${questionDetails.tag}">
					<button type="submit" class="btn btn-kenna">Submit</button>

				</div>
				<div class="col-sm-4">
						<div id="toolTip" class="toolTip">
								<div class="toolTipHeader"></div>
								<div class="toolTipBody">
								
								</div>
						</div>
				
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>

</html>