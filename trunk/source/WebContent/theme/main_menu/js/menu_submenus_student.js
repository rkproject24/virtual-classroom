if (TransMenu.isSupported()) {
		var ms = new TransMenuSet(TransMenu.direction.down, 0,0, TransMenu.reference.bottomLeft);
		/*
		var menu1 = ms.addMenu(document.getElementById("menu1"));
		
		menu1.addItem("","#", "0");
		menu1.addItem("Sudoku", "#", "0");
		menu1.addItem("Writing", "#", "0");
		
		
		var serverAddress = document.getElementById("serverAddress").value;
		var string =  "http://localhost:8080/VCS/files/view_files.jsp";
		var string1 = string + "?fileType=0";
		var string2 = string + "?fileType=2";
		var string3 = string + "?fileType=1";
		var menu2 = ms.addMenu(document.getElementById("menu2"));
		menu2.addItem("Lectures",string3, "0");
		menu2.addItem("Assignments", string2 , "0");
		menu2.addItem("General Files", string1, "0");
		*/
		
		/*
		var menu3 = ms.addMenu(document.getElementById("menu3"));
		menu3.addItem("Subject 1", "#", "0");
		menu3.addItem("Subject 2", "#", "0");
		menu3.addItem("Subject 3", "#", "0");
		menu3.addItem("Subject 4", "#", "0");
		*/
		
		/*
		var menu4 = ms.addMenu(document.getElementById("menu4"));
		menu4.addItem("Minor Test", "#", "0");
		menu4.addItem("Major Test", "#", "0");
		
		
		var menu5 = ms.addMenu(document.getElementById("menu5"));
		menu5.addItem("Minor Tests", "#", "0");
		menu5.addItem("Major Tests", "#", "0");
		 */
		var menu6 = ms.addMenu(document.getElementById("menu5"));
		menu6.addItem("Minor Test Reports", "http://localhost:8080/VCS/reports/student_minorReport.jsp", "0");
		menu6.addItem("Major Test Reports", "http://localhost:8080/VCS/reports/student_majorReport.jsp", "0");
		
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