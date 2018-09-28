$(document).ready(function() {
	
	
	//the function used to approve / remove approve for answer
	function approveAns(questionId,ansId,status,points) {
		var formData = {
				'question.questionId' : questionId,
				'ansId' : ansId,
				'approve' : status,
				'points' : points
			};

			$.ajax({
				type : 'POST', // define the type of HTTP verb we want to use (POST for our form)
				url : '../answer/approveAnswer', // the url where we want to POST
				data : formData, // our data object
				//dataType    : 'json', // what type of data do we expect back from the server
				encode : true,
				success : function(data) {
					//alert("success")
					$(".loader").fadeOut("slow");
					if(data == "login_Failed"){
	            		$("#loginModel").modal();
	            		 return false;
	            	}
					
					if(data == "approved_failed"){
						 message.messageHandling("Only User who posted the Question can approve answers, Like if you think answer is useful to you","error","alert_placeholder");
	            		 return false;
						
					}
					$("#approve_"+ansId).next().text(points);
					var classes = $("#approve_"+ansId).attr('class');
					if (classes.indexOf("icon2") > -1) {
							$("#approve_"+ansId).removeClass("icon2");
						} else {
							$("#approve_"+ansId).addClass("icon2");
						}
				},
				error : function() {
					$(".loader").fadeOut("slow");
					// alert('error happened');
				}
			});

			// stop the form from submitting the normal way and refreshing the page
			event.preventDefault();             
	}


    // process the form
    $('form').submit(function(event) {
    	
    	var quesId= $("#questionId").text();
    	
    	if(quesId == 0 || $("#ansDescription").Editor("getText") == null || $("#ansDescription").Editor("getText") ==""){
    		message.messageHandling("Answer field should not be empty","error","alert_placeholder");
    		return false;
    	}
        // get the form data
        // there are many ways to get this data using jQuery (you can use the class or id also)
        var formData = {
            'question.questionId'   : quesId,
            'detailAns'             : $("#ansDescription").Editor("getText")
            
        };
        // process the form
        $(".loader").fadeIn();
        $.ajax({
            type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
            url         : '../answer/postAns', // the url where we want to POST
            data        : formData, // our data object
            //dataType    : 'json', // what type of data do we expect back from the server
            encode          : true,
            success: function (data) {
            	$(".loader").fadeOut("slow");
            	if(data == "login_Failed"){
            		$("#loginModel").modal();
            		 return false;
            	}
                window.location.href ="../question/questionDetails?questionId="+$("#questionId").text();
            },
            error: function () {
            	$(".loader").fadeOut("slow");
            	 message.messageHandling("Something went wrong while submitting question","error","alert_placeholder");
            }
        });

        // stop the form from submitting the normal way and refreshing the page
        event.preventDefault();
    });
   
    

	$(".like").click(function() {
							$(".loader").fadeIn();
							var main = this;
							var classes = $(main).attr('class');
							var divCount = main.nextElementSibling.innerText;
							var like = 0;
							if (classes.indexOf("icon") > -1) {
							} else {
								like = 1;
							}
							var ansId = 0;
							//submitting like or dislike for question
							if (main.id.indexOf("ansLike_") > -1) {
								ansId = main.id.replace(/ansLike_/g, '');

							}

							var questionId = $("#questionId").text();
							
							if (questionId == "") {
								questionId = 0;
							}
							var formData = {
								'questionId' : questionId,
								'like' : like,
								'answerId' : ansId
							};

							$.ajax({
								type : 'POST', // define the type of HTTP verb we want to use (POST for our form)
								url : '../question/updateLikeDisLike', // the url where we want to POST
								data : formData, // our data object
								//dataType    : 'json', // what type of data do we expect back from the server
								encode : true,
								success : function(data) {
									//alert("success")
									$(".loader").fadeOut("slow");
									if(data == "login_Failed"){
					            		$("#loginModel").modal();
					            		 return false;
					            	}
									
									if (classes.indexOf("icon") > -1) {
											divCount = parseInt(divCount) - 1;
											main.nextElementSibling.innerText = divCount;
											$(main).removeClass("icon");
										} else {
											$(main).addClass("icon");
											divCount = parseInt(divCount) + 1;
											main.nextElementSibling.innerText = divCount;
										}
								},
								error : function() {
									// alert('error happened');
									$(".loader").fadeOut("slow");
									 message.messageHandling("Something went wrong while submitting question","error","alert_placeholder");
								}
							});

							// stop the form from submitting the normal way and refreshing the page
							event.preventDefault();

						});
						$(".approve_button").click(function(){
							$(".loader").fadeIn();
							var questionId = $("#questionId").text();
							if (questionId == "") {
								questionId = 0;
							}
							var ansId = $("#answer_approveId").val();
							var points = $('#points').val();
							approveAns(questionId,ansId,"true",points);
							
							$("#approveModel").modal('hide');
							
							
						});
						$(".approve").click(function() {
							
							var main = this;
							var classes = $(main).attr('class');
							var status = "false";
							if (classes.indexOf("icon2") > -1) {
								status = "false";
								var questionId = $("#questionId").text();
								if (questionId == "") {
									questionId = 0;
								}
								var ansId = 0;
								
								if (main.id.indexOf("approve_") > -1) {
									ansId = main.id.replace(/approve_/g, '');

								}
								var points = 0;
								approveAns(questionId, ansId,status,points);
								
							} else {
								status = "true";
								var ansId = 0;
								
								if (main.id.indexOf("approve_") > -1) {
									ansId = main.id.replace(/approve_/g, '');

								}
								$("#answer_approveId").val(ansId);
								$("#approveModel").modal();
							}
							
						});
 
					});