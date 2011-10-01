function jah_switch(url,target)
{

    if (document.getElementById(target).innerHTML != '')
    {
        document.getElementById(target).innerHTML = '';
    }
    else
    {

        jah(url,target);
    }

}
function jah(url,target,str) {
    // native XMLHttpRequest object
        url = url + "?i=" + str; 
        
        document.getElementById(target).innerHTML = '<span class="ajah_waiting"><a href="java script:jah(\''+url+'\',\''+target+'\');">sending...</a></span>';
    	
    	
    if (window.XMLHttpRequest) {
        req = new XMLHttpRequest();
        req.onreadystatechange = function() {jahDone(target);};
        
        
        req.open("GET", url, true);
        req.send(null);
    // IE/Windows ActiveX version
    } else if (window.ActiveXObject) {
        req = new ActiveXObject("Microsoft.XMLHTTP");
        if (req) {
            req.onreadystatechange = function() {jahDone(target);};
             
            req.open("GET", url, true);
            req.send();
        }
    }
}

function jah1(url,target) {
    // native XMLHttpRequest object
        document.getElementById(target).innerHTML = '<span class="ajah_waiting"><a href="java script:jah1(\''+url+'\',\''+target+'\');">sending...</a></span>';
    	
    	
    if (window.XMLHttpRequest) {
        req = new XMLHttpRequest();
        req.onreadystatechange = function() {jahDone(target);};
        
        
        req.open("GET", url, true);
        req.send(null);
    // IE/Windows ActiveX version
    } else if (window.ActiveXObject) {
        req = new ActiveXObject("Microsoft.XMLHTTP");
        if (req) {
            req.onreadystatechange = function() {jahDone(target);};
            
            req.open("GET", url, true);
            req.send();
        }
    }
}
function jah7(url,target,value) {
    // native XMLHttpRequest object
        document.getElementById(target).innerHTML = '<span class="ajah_waiting"><a href="java script:jah1(\''+url+'\',\''+target+'\');">sending...</a></span>';
    	
    	
        
        url = url + "?course=" + value;
    	
    if (window.XMLHttpRequest) {
        req = new XMLHttpRequest();
        req.onreadystatechange = function() {jahDone(target);};
        
        
        req.open("GET", url, true);
        req.send(null);
    // IE/Windows ActiveX version
    } else if (window.ActiveXObject) {
        req = new ActiveXObject("Microsoft.XMLHTTP");
        if (req) {
            req.onreadystatechange = function() {jahDone(target);};
            
            req.open("GET", url, true);
            req.send();
        }
    }
}
function jah2(url,target) {
    // native XMLHttpRequest object
    	
        var marks = encodeURIComponent(document.getElementById('marks').value);
        
        var quesno = encodeURIComponent(document.getElementById('quesno').value);
     
        var ques = encodeURIComponent(document.getElementById('ques').value);
       
        var answer = encodeURIComponent(document.getElementById('answer').value);
        
        url = url + "?marks=" + marks + "&quesno=" + quesno + "&ques=" + ques + "&answer=" + answer;
      
        document.getElementById(target).innerHTML = '<span class="ajah_waiting"><a href="java script:jah1(\''+url+'\',\''+target+'\');">sending...</a></span>';
    	
    	
    if (window.XMLHttpRequest) {
        req = new XMLHttpRequest();
        req.onreadystatechange = function() {jahDone(target);};
        
        
        req.open("GET", url, true);
        req.send(null);
    // IE/Windows ActiveX version
    } else if (window.ActiveXObject) {
        req = new ActiveXObject("Microsoft.XMLHTTP");
        if (req) {
            req.onreadystatechange = function() {jahDone(target);};
            
            req.open("GET", url, true);
            req.send();
        }
    }
}

function jah3(url,target) {
    // native XMLHttpRequest object
        var quesno = encodeURIComponent(document.getElementById('quesno').value);
        var ques = encodeURIComponent(document.getElementById('ques').value);
        var marks = encodeURIComponent(document.getElementById('marks').value);
        url = url + "?quesno=" + quesno + "&ques=" + ques + "&marks=" + marks;
        document.getElementById(target).innerHTML = '<span class="ajah_waiting"><a href="java script:jah1(\''+url+'\',\''+target+'\');">sending...</a></span>';
    	
    	
    if (window.XMLHttpRequest) {
        req = new XMLHttpRequest();
        req.onreadystatechange = function() {jahDone(target);};
        
        
        req.open("GET", url, true);
        req.send(null);
    // IE/Windows ActiveX version
    } else if (window.ActiveXObject) {
        req = new ActiveXObject("Microsoft.XMLHTTP");
        if (req) {
            req.onreadystatechange = function() {jahDone(target);};
            
            req.open("GET", url, true);
            req.send();
        }
    }
}
function jah5(url,target) {
    // native XMLHttpRequest object
        var quesno = encodeURIComponent(document.getElementById('quesno').value);
        var ques = encodeURIComponent(document.getElementById('ques').value);
        var marks = encodeURIComponent(document.getElementById('marks').value);
        url = url + "?quesno=" + quesno + "&ques=" + ques + "&marks=" + marks + "&flag=1";
        document.getElementById(target).innerHTML = '<span class="ajah_waiting"><a href="java script:jah1(\''+url+'\',\''+target+'\');">sending...</a></span>';
    	
    	
    if (window.XMLHttpRequest) {
        req = new XMLHttpRequest();
        req.onreadystatechange = function() {jahDone(target);};
        
        
        req.open("GET", url, true);
        req.send(null);
    // IE/Windows ActiveX version
    } else if (window.ActiveXObject) {
        req = new ActiveXObject("Microsoft.XMLHTTP");
        if (req) {
            req.onreadystatechange = function() {jahDone(target);};
            
            req.open("GET", url, true);
            req.send();
        }
    }
}
function jah6(url,target) {
    // native XMLHttpRequest object
        var quesno = encodeURIComponent(document.getElementById('quesno').value);
        var ques = encodeURIComponent(document.getElementById('ques').value);
        var marks = encodeURIComponent(document.getElementById('marks').value);
        url = url + "?quesno=" + quesno + "&ques=" + ques + "&marks=" + marks + "&flag=0";
        document.getElementById(target).innerHTML = '<span class="ajah_waiting"><a href="java script:jah1(\''+url+'\',\''+target+'\');">sending...</a></span>';
    	
    	
    if (window.XMLHttpRequest) {
        req = new XMLHttpRequest();
        req.onreadystatechange = function() {jahDone(target);};
        
        
        req.open("GET", url, true);
        req.send(null);
    // IE/Windows ActiveX version
    } else if (window.ActiveXObject) {
        req = new ActiveXObject("Microsoft.XMLHTTP");
        if (req) {
            req.onreadystatechange = function() {jahDone(target);};
            
            req.open("GET", url, true);
            req.send();
        }
    }
}
var nocache = 0;    
function test(j) {
		
		var elementName = "link" + j;							
		var links = document.getElementById(elementName).value;
		
		
		
		jah(links,'inner_response1');
}
								
function jah4(url,target) {
    // native XMLHttpRequest object
              
        document.getElementById(target).innerHTML = '<span class="ajah_waiting"><a href="java script:jah(\''+url+'\',\''+target+'\');">sending...</a></span>';
    	
    	
    if (window.XMLHttpRequest) {
        req = new XMLHttpRequest();
        req.onreadystatechange = function() {jahDone(target);};
        
        
        req.open("GET", url, true);
        req.send(null);
    // IE/Windows ActiveX version
    } else if (window.ActiveXObject) {
        req = new ActiveXObject("Microsoft.XMLHTTP");
        if (req) {
            req.onreadystatechange = function() {jahDone(target);};
             
            req.open("GET", url, true);
            req.send();
        }
    }
}

							
function jahDone(target) {
    // only if req is "loaded"
    if (req.readyState == 4) {
        // only if "OK"
        if (req.status == 200) {
            results = req.responseText;
            document.getElementById(target).innerHTML = results;
        } else {
            document.getElementById(target).innerHTML="jah error:\n" +
                req.statusText;
        }
    }
}
