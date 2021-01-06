// checks input xml

function f() {    
  	var val = theform.doc.value;   
	var test = new ActiveXObject("Microsoft.XMLDOM");  
	test.async = false;   
	test.loadXML(val);     
	err = test.parseError;  
    if (err != 0) {    
   	ErrorMsg =  "Your XML Document is not Well Formed.\n" +                    err.srcText + "\n" + "Line " + err.line + ", Pos " +                     err.linepos + "\n" + err.reason;       	alert(ErrorMsg);    
   	test = null;     
	event.returnValue  = false;     
   }   
   else {        if (val.length > 23500)	{    
				alert("Your document is " + val.length + " bytes long. "+                "Please limit your 				posted XML document" +                " to 20K for this demonstration. Thanks!");    
      				event.returnValue = false;        
				} 
     }   
 }   


