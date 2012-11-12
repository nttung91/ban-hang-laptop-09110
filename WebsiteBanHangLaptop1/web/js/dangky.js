function setCheckedValue(radioObj, newValue) {
                  if(!radioObj)
                      return;
                  var radioLength = radioObj.length;
                  if(radioLength == undefined) {
                      radioObj.checked = (radioObj.value == newValue.toString());
                      return;
                  }
                  for(var i = 0; i < radioLength; i++) {
                      radioObj[i].checked = false;
                      if(radioObj[i].value == newValue.toString()) {
                          radioObj[i].checked = true;
                      }
                  }
              }   ;
function setSelectedOption(obj,newValue) {
                   
                  if (!obj) return;
                  ele.setAttribute(name, value) = newValue;
              }
              function mySubmit(form){
                //  if (ValidCaptcha()){
					//   alert("Dung");
				  	form.submit();
				  //}
				  //else alert("Sai");
				  
                  }
                function showAvancedSearchMenu()
                                                {
                                                    var table = document.getElementById("tim_kiem_nang_cao");
                                                    if (table.style.display == "none"){
                                                        table.style.display = "block";
                                                    }
                                                    else {table.style.display = "none";}
                                                }
                                      
                                      
                                                function DrawCaptcha()
                                                {
                                                    var a = Math.floor(Math.random() * 10)+ '';
                                                    var b = Math.floor(Math.random() * 10)+ '';       
                                                    var c = Math.floor(Math.random() * 10)+ '';  
                                                    var d = Math.floor(Math.random() * 10)+ '';  
                                                    //var e = Math.ceil(Math.random() * 10)+ '';  
                                                    //var f = Math.ceil(Math.random() * 10)+ '';  
                                                    //	var g = Math.ceil(Math.random() * 10)+ '';  
                                                    var code = a + ' ' + b + ' ' + ' ' + c + ' ' + d ;//+ ' ' + e + ' '+ f + ' ' + g;
                                                    document.getElementById("txtCaptcha").value = code
                                                }
									
                                                // Validate the Entered input aganist the generated security code function   
                                                function ValidCaptcha(){
                                                    var str1 = removeSpaces(document.getElementById('txtCaptcha').value);
                                                    var str2 = removeSpaces(document.getElementById('txtInput').value);
                                                    if (str1 == str2) return true;        
                                                    return false;
											
                                                }
									
                                                // Remove the spaces from the entered and generated code
                                                function removeSpaces(string)
                                                {
                                                    return string.split(' ').join('');
                                                }
										
										
                                                function clear_form(form){
                                                    var f = form.elements;
											
                                                    for(var i=0; i<f.length; i++)
                                                    {
                                                        alert("fdsf");
                                                        if (f[i].type.toLowerCase() == "text"){
														
                                                            f[i].value = "";
                                                        }
                                                    }
                                                    DrawCaptcha();
											  
                                                }