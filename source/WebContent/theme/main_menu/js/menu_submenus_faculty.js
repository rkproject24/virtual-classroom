if (TransMenu.isSupported()) {
		var ms = new TransMenuSet(TransMenu.direction.down, 0,0, TransMenu.reference.bottomLeft);
		
		
		
		var menu1 = ms.addMenu(document.getElementById("menu1"));
		menu1.addItem("Upload","http://localhost:8080/VCS/files/upload_files.jsp", "0");
		menu1.addItem("View All", "http://localhost:8080/VCS/files/view_files.jsp?fileType=1", "0");
		
		var menu2 = ms.addMenu(document.getElementById("menu2"));
		menu2.addItem("Upload","http://localhost:8080/VCS/files/upload_files.jsp", "0");
		menu2.addItem("View All", "http://localhost:8080/VCS/files/view_files.jsp?fileType=2", "0");
		
		var menu3 = ms.addMenu(document.getElementById("menu3"));
		menu3.addItem("Schedule", "http://localhost:8080/VCS/faculty/discussion/schedule.jsp", "0");
		menu3.addItem("View",  "http://localhost:8080/VCS/faculty/discussion/view_discussion.jsp", "0");
		
		
		var menu4 = ms.addMenu(document.getElementById("menu4"));
		menu4.addItem("Prepare Test Paper","http://localhost:8080/VCS/faculty/exam/test.jsp", "0");
		menu4.addItem("View/Modify Test Paper", "http://localhost:8080/VCS/faculty/exam/modifyTest.jsp", "0");
		menu4.addItem("Evaluate Test Paper","http://localhost:8080/VCS/faculty/exam/evaluate_test.jsp", "0");
		
		
		var menu6 = ms.addMenu(document.getElementById("menu6"));
		menu6.addItem("Upload", "http://localhost:8080/VCS/notices/upload_notice.jsp", "0");
		menu6.addItem("View All", "http://localhost:8080/VCS/notices/view_notices.jsp", "0");
		
		
		
		
		function init()
			{
			if (TransMenu.isSupported()) 
				{
				TransMenu.initialize();

				menu1.onactivate = function() {document.getElementById("menu1").className = "hover"; };
				menu1.ondeactivate = function() {document.getElementById("menu1").className = ""; };

				menu2.onactivate = function() {document.getElementById("menu2").className = "hover"; };

				menu2.ondeactivate = function() {document.getElementById("menu2").className = ""; };
				
				menu3.onactivate = function() {document.getElementById("menu3").className = "hover"; };
				menu3.ondeactivate = function() {document.getElementById("menu3").className = ""; };
				
				menu4.onactivate = function() {document.getElementById("menu4").className = "hover"; };
				menu4.ondeactivate = function() {document.getElementById("menu4").className = ""; };
				
				menu5.onactivate = function() {document.getElementById("menu5").className = "hover"; };
				menu5.ondeactivate = function() {document.getElementById("menu5").className = ""; };
							
				menu6.onactivate = function() {document.getElementById("menu6").className = "hover"; };
				menu6.ondeactivate = function() {document.getElementById("menu6").className = ""; };
				}
				
			}
		TransMenu.dingbatSize = 0;
		TransMenu.spacerGif = "";
		TransMenu.dingbatOn = "";
		TransMenu.dingbatOff = ""; 
		TransMenu.sub_indicator = false;
		TransMenu.menuPadding = 0;
		TransMenu.itemPadding = 0;
		TransMenu.shadowSize = 2;
		TransMenu.shadowOffset = 3;
		TransMenu.shadowColor = "#888";
		TransMenu.backgroundColor = "#EAEAEA";
		TransMenu.hideDelay = 600;
		TransMenu.slideTime = 300;
		TransMenu.selecthack = 1;
		TransMenu.renderAll();
		if ( typeof window.addEventListener != "undefined" )
			window.addEventListener( "load", init, false );
		else if ( typeof window.attachEvent != "undefined" ) 
			{
			window.attachEvent( "onload", init);
			}
			else
				{
				if ( window.onload != null ) 
					{
					var oldOnload = window.onload;
					window.onload = function ( e ) 
						{
						oldOnload( e );
						init();
						}
					}
				else
					window.onload = init();
				}
		}