$(document).ready(function() {
	
	window.onscroll = function() {myFunction()};
	
	 var header = document.getElementById("toolTip");
	 var sticky = header.offsetTop;

	 function myFunction() {
	   if (window.pageYOffset > sticky) {
	     header.classList.add("sticky");
	   } else {
	     header.classList.remove("sticky");
	   }
	 }
	
    $("#tags").keyup(function(){
    	var value = $("#tags").val();
    	var oriValue = $("#tag-values").val();
    	//console.log(value);
    	var regx = /^[A-Za-z0-9-_.-]+$/;
    	if(value != ""){
    		if (!regx.test(value)){
    			value = value.replace(/[^a-zA-Z 0-9 -]+/g,"");
	    		if(!oriValue.trim().match(value.trim())){
	    			var tagView ="<a href='' onClick='return false'   id="+value+" class='post-tag' title='Show questions relating to usability' rel='tag'>"+value+"<span class='close-tag' id='close-tag' onClick='tagDelete("+value.trim()+");return false'>X</span></a>"
		    		
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
    

    function autocomplete(inp, arr) {
 	   /*the autocomplete function takes two arguments,
 	   the text field element and an array of possible autocompleted values:*/
 	   var currentFocus;
 	   /*execute a function when someone writes in the text field:*/
 	   inp.addEventListener("input", function(e) {
 		   var cmp = this;
 	       var a, b, i, val = this.value;
 	       
 	       var formData = {
 	               'tag':val
 	           };

 	           // process the form
 	           $.ajax({
 	               type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
 	               url         : '../tags/getTags', // the url where we want to POST
 	               data        : formData, // our data object
 	               //dataType    : 'json', // what type of data do we expect back from the server
 	               encode          : true,
 	               success: function (data) {
 	               	//console.log(data);
 	               	arr = data.split(',');
 	                /*close any already open lists of autocompleted values*/
 	     	       closeAllLists();
 	     	       if (!val) { return false;}
 	     	       currentFocus = -1;
 	     	       /*create a DIV element that will contain the items (values):*/
 	     	       a = document.createElement("DIV");
 	     	       a.setAttribute("id", cmp.id + "autocomplete-list");
 	     	       a.setAttribute("class", "autocomplete-items");
 	     	       /*append the DIV element as a child of the autocomplete container:*/
 	     	       cmp.parentNode.appendChild(a);
 	     	       /*for each item in the array...*/
 	     	       for (i = 0; i < arr.length; i++) {
 	     	    	  if (!arr[i]) { return false;}
 	     	           /*create a DIV element for each matching element:*/
 	     	           b = document.createElement("DIV");
 	     	           /*make the matching letters bold:*/
 	     	           display_val = arr[i].replace(val, "<strong>"+val+"</strong>");
 	     	           b.innerHTML = display_val;
 	     	          /*  b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
 	     	           b.innerHTML += arr[i].substr(val.length); */
 	     	           /*insert a input field that will hold the current array item's value:*/
 	     	           b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
 	     	           /*execute a function when someone clicks on the item value (DIV element):*/
 	     	           b.addEventListener("click", function(e) {
 	     	               /*insert the value for the autocomplete text field:*/
 	     	               	var tag = this.getElementsByTagName("input")[0].value;
 	     	             	var tagView ="<a href='' onClick='return false' id="+tag+" class='post-tag' title='Show questions relating to usability' rel='tag'>"+tag+"<span class='close-tag' id='close-tag' onClick='tagDeleteDb(\""+tag.trim()+"\");return false'>X</span></a>"
 	  		    			$('#clearBtn1').prepend($(tagView));
 	  		    			$("#tags").val("");
 	  		    			var width = $("#clearBtn1").width();
 	  		    			$("#tags").css("margin-left",width+"px");
 	  		    			var oriValue = $("#tag-values").val();
 	  		    			oriValue=tag.trim()+","+oriValue.trim();
 				    		$("#tag-values").val(oriValue);
 	     	               /*close the list of autocompleted values,
 	     	               (or any other open lists of autocompleted values:*/
 	     	               closeAllLists();
 	     	           });
 	     	           a.appendChild(b);
 	     	      
 	     	       }
 	               },
 	               error: function () {
 	                   alert('error happened');
 	               }
 	           });
 	       
 	      
 	   });
 	   /*execute a function presses a key on the keyboard:*/
 	   inp.addEventListener("keydown", function(e) {
 	       var x = document.getElementById(this.id + "autocomplete-list");
 	       if (x) x = x.getElementsByTagName("div");
 	       if (e.keyCode == 40) {
 	         /*If the arrow DOWN key is pressed,
 	         increase the currentFocus variable:*/
 	         currentFocus++;
 	         /*and and make the current item more visible:*/
 	         addActive(x);
 	       } else if (e.keyCode == 38) { //up
 	         /*If the arrow UP key is pressed,
 	         decrease the currentFocus variable:*/
 	         currentFocus--;
 	         /*and and make the current item more visible:*/
 	         addActive(x);
 	       } else if (e.keyCode == 13) {
 	         /*If the ENTER key is pressed, prevent the form from being submitted,*/
 	         e.preventDefault();
 	         if (currentFocus > -1) {
 	           /*and simulate a click on the "active" item:*/
 	           if (x) x[currentFocus].click();
 	         }
 	       }
 	   });
 	   function addActive(x) {
 	     /*a function to classify an item as "active":*/
 	     if (!x) return false;
 	     /*start by removing the "active" class on all items:*/
 	     removeActive(x);
 	     if (currentFocus >= x.length) currentFocus = 0;
 	     if (currentFocus < 0) currentFocus = (x.length - 1);
 	     /*add class "autocomplete-active":*/
 	     x[currentFocus].classList.add("autocomplete-active");
 	   }
 	   function removeActive(x) {
 	     /*a function to remove the "active" class from all autocomplete items:*/
 	     for (var i = 0; i < x.length; i++) {
 	       x[i].classList.remove("autocomplete-active");
 	     }
 	   }
 	   function closeAllLists(elmnt) {
 	     /*close all autocomplete lists in the document,
 	     except the one passed as an argument:*/
 	     var x = document.getElementsByClassName("autocomplete-items");
 	     for (var i = 0; i < x.length; i++) {
 	       if (elmnt != x[i] && elmnt != inp) {
 	         x[i].parentNode.removeChild(x[i]);
 	       }
 	     }
 	   }
 	   /*execute a function when someone clicks in the document:*/
 	   document.addEventListener("click", function (e) {
 	       closeAllLists(e.target);
 	       });
 	 }

 	 /*An array containing all the country names in the world:*/
 	 var tags = [];
 	 /*initiate the autocomplete function on the "myInput" element, and pass along the tags array as possible autocomplete values:*/
 	 autocomplete(document.getElementById("tags"), tags);


});