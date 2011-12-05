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
function jah(url,target) {
    // native XMLHttpRequest object
    	
        // document.getElementById(target).innerHTML = '<span class="ajah_waiting"><a href="java script:jah(\''+url+'\',\''+target+'\');">Loading.. Please Wait</a></span>';
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
	if (req.readyState==3) {
     		document.getElementById(target).innerHTML="<img src='http://localhost:8080/VCS/theme/images/ajax-loader.gif' alt ='Loading please wait' align='center'/>";
     	}
    // only if req is "loaded"
    if (req.readyState == 4) {
        // only if "OK"
        if (req.status == 200) {
            results = req.responseText;
            document.getElementById(target).innerHTML = results;
        } else {
            document.getElementById(target).innerHTML="Error Encountered:\n" +
                req.statusText + " \n Please contact System Administrator";
        }
    }
}

function fetchData(urlPattern,j,id) {
	var elementName = urlPattern + j;			
	var links = document.getElementById(elementName).value;
	jah(links,id);
}