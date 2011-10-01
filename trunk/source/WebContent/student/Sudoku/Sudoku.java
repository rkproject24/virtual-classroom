//
//  S u d o k u . j a v a
//
//  Written by Tommy Sundström, f99-tsu@nada.kth.se
//
//  Solves general sudoku problems (the usual 9*9 square system).
//
//  The program uses three methods: 
//  1: Counting the number of possible values in every square, if only
//     one value is possible, this value is set
//  2: Checking for every value: if this is possible in only one square
//     in a specific row, column or 3*3 square system, that value is set
//     to that square.
//  3: Decreasing the number of possibilites by following method: Consider
//     one row or column. This goes through three 3*3 square systems (of 
//     course). If a specific value is impossible in two of these three
//     3*3 square systems (in the row/column), it has to appear in the third.
//     Then this value is impossible in the rest of the 6 squares of the third
//     3*3 system.
//
//  However, this is not enough when solving very difficult sudoku problems.
//  If neccesary, the program will search for a square were only two values 
//  is possible, and then try to set one of the values (by creating a new 
//  sudoku object), and continue solving. If the sudoku criterion is violated
//  the solving is interrupted, and we can be sure the second value belongs 
//  to this square.
//  
//
//  
//
//  Last update: Tue Oct 24 19:27:26 MEST 2006
//


import java.awt.*;
import java.io.*;
//import java.applet.*;
public class Sudoku {// extends Applet{
    
    Node[][] nodes;
    boolean[][] appForII, appForJJ, appInSqu;
    //TextField[][] txtf;
    View v;      //will in the constructors become a pointer to mainView 
    View mainView;
    int nrLeft;  
    
    public static void main(String args[]) {	
	//public static void main(String args[]) {
//	throws IOException {  
    //	System.out.println("Starting Proj..." );		
//		Proj mainFrame = new Proj();
//		mainFrame.setSize(400, 400);
//		mainFrame.setTitle("Proj");
//		mainFrame.setVisible(true);
		
    //	setBackground(Color.black);		
    //	Sudoku s = new Sudoku();
			View mainView = new View();
		//from hence, everything is controlled from the graphical
		//interface by puching buttons, therefore the method 
		//actionPerformed in View.java represents an outline
		//of the program.
		//Here also the sudoku object(:s) are created.
		//	

	}


    public Sudoku() {
	//	main("");
	mainView = new View();
    }

	// - - - - - - - - - - - - - - - - - - - - - - - - -
	// CONSTRUCTOR
	// Object Sudoku is created in proj, eventually there will be several 
	// Sudoku objects created, but then the other constructor is called
	// - - - - - - - - - - - - - - - - - - - - - - - - -
	public Sudoku( String inStr, View v_ )
	//throws IOException {
		{
			//txtf = txtf_;		
			v=v_;
			pr("Default CONSTRUCYTOR");
		nodes = new Node[9][9];
		appForII = new boolean[9][10];
		appForJJ = new boolean[9][10];
		appInSqu = new boolean[9][10];
		System.out.println("Sudoku, löser sudokuproblem, objekt skapat");
//		String inStr = "050004000642000079080000000005003000430102097000900600000000040190000362000700050";
	//	String inStr = "054008700000030800906000004048002000000107000000300280700000906005020000009600570";//en annan svår
	//	String inStr = "300400000004090200091200005105000007030806020700000604500001390003020400000004006";//medel
	//String inStr = "701000908080000060006201500020608010400000009030105080003904200070000090904000805";//lätt
	//  String inStr = "080600007000000069000700584001090006008000200600020800894007000170000000300005040";//svår
//	String inStr = "005800004800000006946070000080760003300102005700094010000010459500000007600009300";
//	String inStr = "12345678912345678912345678912345678912345678912345678912345678912345678912345678912345678912345678912345678912345678912345678912345678912345678912345678912345678912345678912345120010520210503214552432432432432432432565567567576567120010520210503214552432432432432432432565567567576567120010520210503214552432432432432432432565567567576567";
//	String inStr = "168342795532796148794158263471635829823974516956281374687423951319567482245819637";
Integer i;
Character c;
boolean creation;
		int value;	
		for( int ii=0; ii<9; ii++ ){
			for( int jj=0; jj<9; jj++ ){
				nodes[ii][jj]=new Node();
				v.sa[ii][jj].setText("");
			}
		}
		nrLeft=9*9;
		
		for( int ii=0; ii<9; ii++ ){
			for( int jj=0; jj<9; jj++ ){
//				System.out.print("row:" + ii + "and line:" + jj + "\n");
					value = inStr.charAt(ii*9+jj)-48;
					if( value <10 && 0 < value ){
					
						creation=occasion(ii,jj,value);
						if( !creation ){ v.txt.append("Varning!! violation of the" +
							" sudoku criteria. Red marked value ignored.");
							v.sp[ii][jj].setBackground( Color.red );			
						}		
					}
//					
//					if( value <10 && 0 < value ){
//						appForII[ii][value]=true;
//						appForJJ[jj][value]=true;
//						appInSqu[(int)((jj)/3)*3+(int)((ii)/3)][value] = true;
//						nodes[ii][jj].allPosToFalse();
//					} else {
//						//appForII[ii][value]=false;//absolut inte
//						//appForJJ[jj][value]=false;
//						//appInSqu[(int)((jj)/3)*3+(int)((ii)/3)][value] = false;
//					}
	//			nodes[ii][jj]=new Node(System.in.read());
				//nodes[ii][jj].showVal();
			}
		}
		
		
		
		
	}

	public Sudoku( Node[][] nodes_, boolean[][] appForII_,
			 boolean[][] appForJJ_, boolean[][] appInSqu_, 
			 int nrLeft_, View v_ )
//			 throws CloneNotSupportedException{
	//throws IOException {//
	{
		nodes = new Node[9][9];   //verkar< inte 
		appForII = new boolean[9][10]; 
		appForJJ = new boolean[9][10];
		appInSqu = new boolean[9][10];
		nrLeft=nrLeft_;
		v = v_; //the pointer to the view object
		//txtf=txtf_;
		for( int i=0; i<9; i++ ){
			for( int j=0; j<9; j++ ){
				//pr( "  " + i + j);
				nodes[i][j] = nodes_[i][j].publicClone();   //verkar inte fungera
		
			}
		}
		
		for( int i=0; i<9; i++ ){
			for( int j=0; j<10; j++ ){
				appForII[i][j] = appForII_[i][j];
				appForJJ[i][j] = appForJJ_[i][j];
				appInSqu[i][j] = appInSqu_[i][j];
				
			}
		}
						
		
//		nodes = (Node[][])nodes_.clone();  //clone fungerar inte
//		appForII = (boolean[][])appForII_.clone();
//		appForJJ = (boolean[][])appForJJ_.clone();
//		appInSqu = (boolean[][])appInSqu_.clone();		
	}

	// - - - - - - - - - - - - - - - - - - - - - - - - -
	// METHOD: 
	// - - - - - - - - - - - - - - - - - - - - - - - - -	
	public void printArray(){
		for( int ii=0; ii<9; ii++ ){
			for( int jj=0; jj<9; jj++ ){
				System.out.print("    ");					
				nodes[ii][jj].showVal();
			}
			System.out.print("\n");					
		}			
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - -
	// METHOD: 
	// - - - - - - - - - - - - - - - - - - - - - - - - -	
	public void updateAllPos()
	throws IOException {
		for( int ii=0; ii<9; ii++ ){
			for( int jj=0; jj<9; jj++ ){
//				updateNode( ii, jj );
pr(" nu sker det... i update all pos  ");
				occasion( ii, jj, nodes[ii][jj].getVal() );
			}			
		}		
		updAllNrOfPos();
		}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - -
	// METHOD: Old, replaced by occasion( , , )
	// - - - - - - - - - - - - - - - - - - - - - - - - -	
	public void updateNode( int ii, int jj )   
		//throws IOException {
			{
		//ii-indices
		for( int kk=ii+1; kk<9; kk++ ){				
			nodes[ii][jj].setRowOcc( nodes[kk][jj].getVal() );
		}
		for( int kk=ii-1; -1<kk; kk-- ){			
			nodes[ii][jj].setRowOcc( nodes[kk][jj].getVal() );
		}
		//jj-indices
		for( int ll=jj+1; ll<9; ll++ ){				
			nodes[ii][jj].setColOcc( nodes[ii][ll].getVal() );
		}
		for( int ll=jj-1; -1<ll; ll-- ){			
			nodes[ii][jj].setColOcc( nodes[ii][ll].getVal() );
		}
	
	//and the act. square:
		int lowi = 3*(int)((ii)/3);
		int lowj = 3*(int)((jj)/3);
		//System.out.println( " ii jj  " + ii + "  " + jj + "   lowerd " + lowi + " " + lowj);
			for( int mm=lowi; mm<lowi+3; mm++ ){
				for( int nn=lowj; nn<lowj+3; nn++ ){
					if( !(mm==ii && nn==jj)){
						nodes[ii][jj].setSquOcc( nodes[mm][nn].getVal() );
					}
				}
			}
		
	//finally, comp the value of nrOfPos;
	//nodes[ii][jj].compNrOfPos()
	//System.out.println( "nr oPOS    ii,jj" + ii + " " +  jj + " antal ar " + nodes[ii][jj].compNrOfPos());
	}
	//================================================================
	//================================================================
	// - - - - - - - - - - - - - - - - - - - - - - - - -
	// METHOD: when an occasion appears on ii, jj with the value val
	// - - - - - - - - - - - - - - - - - - - - - - - - -	
	public boolean occasion( int ii, int jj, int val ) {
		//throws IOException {
		int lowi = 3*(int)((ii)/3);
		int lowj = 3*(int)((jj)/3);
		int sIndex = (int)((jj)/3)*3+(int)((ii)/3);
		if( appForII[ii][val] || appForJJ[jj][val] || appInSqu[sIndex][val] ){ 
			return false;          //violation of the criterion
		}
		
		//System.out.print( ii + " hjkhjklIIII " + jj);
		v.sa[ii][jj].setText( Integer.toString(val) );
		
		
			nodes[ii][jj].setVal( val );
			nodes[ii][jj].allPosToFalse();
			nrLeft--;
	//System.out.println(" ii jj ss " + ii + " " + jj + " " + val );
		//ii-indices
		appForJJ[jj][val] = true;    
		for( int kk=ii+1; kk<9; kk++ ){	
			nodes[kk][jj].remPos( val );   //a better way of doing this??
		}
		for( int kk=ii-1; -1<kk; kk-- ){			
			nodes[kk][jj].remPos( val );
		}
		//jj-indices
		appForII[ii][val] = true;		
		//if( ii==2 && val==9 ){pr("NUUUUUUUUUUUUU!!!!" + ii + jj);for(int jk=0;jk<100000000;jk++){};}
		for( int ll=jj+1; ll<9; ll++ ){				
			nodes[ii][ll].remPos( val );
		}
		for( int ll=jj-1; -1<ll; ll-- ){
			nodes[ii][ll].remPos( val );			
		}
	
	//and the act. square:
//	int si = (int)((ii)/3);
//	int sj = (int)((jj)/3);
//	int ss = si+sj*3;	
		
	//int lowi = 3*(int)((ii)/3);
	//int lowj = 3*(int)((jj)/3);
	appInSqu[sIndex][val] = true;
	
	if( (int)((jj)/3)*3+(int)((ii)/3) == 8 && val==7 ){
		pr("           konst        ");

			//pr(" i j " + ii + "  " +  jj + "   refers to  sq  " + ((int)((jj)/3)*3+(int)((ii)/3)));
		//for(int jk=0;jk<1000000000;jk++){}	
	}
		
	pr(" i j " + ii + "  " +  jj + "   refers to  sq  " + ((int)((jj)/3)*3+(int)((ii)/3)));
		
		for( int mm=lowi; mm<lowi+3; mm++ ){
			for( int nn=lowj; nn<lowj+3; nn++ ){
				if( !(mm==ii && nn==jj)){   //a lot of eq.controlls, not very good
					nodes[mm][nn].remPos( val );//OBS by this it may be ...no				
				}
			}
		}
		
	//finally, comp the value of nrOfPos;
	//nodes[ii][jj].compNrOfPos();//fungerar inte i det här fallet
	//System.out.println( "nr oPOS    ii,jj" + ii + " " +  jj + " antal ar " + nodes[ii][jj].compNrOfPos());
			
			updAllNrOfPos();
			pr("åker tillv");
			return true;	
	}
	
	public void updAllNrOfPos(){
	
	
			for( int ii=0; ii<9; ii++ ){
				for( int jj=0; jj<9; jj++ ){
					nodes[ii][jj].compNrOfPos();
					
				}			
			}	
	
		}
	//================================================================
	//================================================================
	//  returns the solved matrix or null, if the sudoku criterion is
	//  violated.
	public Node[][] solve()
	//throws CloneNotSupportedException
	{
//-------------------------------------------------------------
//PART ONE:
//-------------------------------------------------------------
	
	pr("innen i solve");
	int nrOfCor, nrLeftOld;
//for(int skkl=0;skkl<10;skkl++){//hur många gånger?

do {
	nrLeftOld=nrLeft;
	do{		
		nrOfCor=0;		
//		updAllNrOfPos();
		pr("entering one of the main...");
		for( int ii=0; ii<9; ii++ ){
			for( int jj=0; jj<9; jj++ ){
				if( nodes[ii][jj].retNrOfPos() == 1 ){
					//nodes[ii][jj].setPosVal();  moved to occassion, with creation of getposval
					pr(" nu sker det...inne i solve, vid räkning av ant ");
					pr(" vi har kommit fram till att " + ii + "  " + jj + " har en enda möjlig");
					pr(" kand " + nodes[ii][jj].getPosVal() );					
					if( !occasion(ii,jj,nodes[ii][jj].getPosVal()) ){ return null; }
					nrOfCor++;
//					updAllNrOfPos();//???
				}
			}
		}
		//updAllNrOfPos();
	} while ( nrOfCor>0 );	
	
	
	pr( "Will now search for values appearing only once in line/column/square" );
	if( !remSingOcc() ){ return null; }
//	updAllNrOfPos();

	remInLocSqu();
//	updAllNrOfPos();
	
//	System.out.println("        skkklklklklklklk " + skkl);
} while( nrLeft < nrLeftOld );
pr("nu är vi ute, nr left" + nrLeft);
//
//two situations possible: 1: We're ready 2: We need to take a chance
if( nrLeft < 1 ){ return nodes; }
//otherwise we will search for a node for whitch there is only
//two possible values, if there is no (not probable) we search
//for a node with three possible values etc.(or???)
//-------------------------------------------------------------
//PART TWO:
//-------------------------------------------------------------
Sudoku sNew;
Node[][] posSol;
for( int two=2; two<3; two++ ){
int i2=-1;
int j2=0;
int val2;

do{
 		i2++;
	j2=0;
	do {
	 j2++;
		pr( i2 + "   " +  j2 + "    " + nodes[i2][j2].retNrOfPos());	 	
	}while( j2<8 && !(nodes[i2][j2].retNrOfPos()==two));
} while( i2<8 && !(nodes[i2][j2].retNrOfPos()==two));

//for( ;  i2<9; i2++ ){
//	for( ; j2<9; j2++ ){
//		if( nodes[i2][j2].retNrOfPos()==2 ){
//			pr( i2 + "   " + j2 );
//			break;
//		}
//	}
//}
//


//OBS om detta aldrig uppfylldes? blir i2 j2 = 9
pr(" OJOJOJOJOJOJ, vi måste testa oss fram");
//for(int jk=0;jk<100000000;jk++){}
pr(" i j " + i2 + "  " + j2 + "   " + nodes[i2][j2].retNrOfPos());
//for(int i=0;i!=2.1;i++){}
val2=1;
System.out.println( " jkljklö 2=" + two );
for( int att=1; att<=two; att++ ){
	System.out.println( "ok this is attempt  " + att );
	for( ; !(nodes[i2][j2].isPossible(val2));// && val2<10; 
	){ val2++; }
//val2 becomes the first possible value 

	sNew = new Sudoku( nodes, appForII, appForJJ, appInSqu, nrLeft, v );
	sNew.occasion( i2, j2, val2 );
	posSol=sNew.solve();
		if( posSol != null ){
			System.out.println("SUCCESSFUL!!!!");
			return posSol;//our solution
		} else {
			val2++;	//for next attempt
		}

//for( val2++; !(nodes[i2][j2].isPossible(val2)); val2++ ){


//sNew.appForJJ[0][0]=false;
pr("nytt  " + val2 + " sätter vi på ij:" + i2 + j2 + nodes[i2][j2].isPossible(val2));
	//pr("   " + sNew.occasion( i2, j2, val2 ));//should really be true
//pr("  hjkh " + appForJJ[0][0]);
//sNew.nodes[i2][j2].nrOfPos = 789789;
pr(" innan är i j " + i2 + "  " + j2 + "   " + nodes[i2][j2].retNrOfPos());	

//for(int i=0;i!=2.1;i++){}


	pr("   -----------  då börjar vi");
	


pr( " appIN f" + appForII[2][9] );
//for(int jk=0;jk<100000000;jk++){}
pr(" vi hade occ " + val2 );
pr(" hoppsan måste försöka igen med " + "i j " + i2 + "  " + j2 + "   " + nodes[i2][j2].retNrOfPos());	
//	for( val2++; !(nodes[i2][j2].isPossible(val2)); val2++ ){
//		pr("jkjk" + val2 + (nodes[i2][j2].isPossible(val2)));
//		
//		}
	//val2--;
	
	pr( " vi forts " + nodes[i2][j2].isPossible(val2) + "  " + val2 );
	//Sudoku sNewNew = new Sudoku( nodes, appForII, appForJJ, appInSqu, nrLeft, txtf );
		pr( " appIN f" + sNew.appForII[2][9] );
//	pr( " jkl " + sNewNew.solve());
	//return sNew.solve();
		}
	}//for the two variable	
	return null; //something strange has happened.
	
	//vad händer när man sätter en som redan finns? man har redan tagit  
	//bort sannolikheten för det gamla...men när man ersätter med samma?
	//sNew.solve(); //the solution or null should be returned
					//leder nu till oändlig slinga.
	}
			
	//================================================================
	//================================================================
	public void remInLocSqu(){
		
		for( int jj=0;jj<9;jj++ ){             //for each row
			for( int ii=0; ii<9; ii=ii+3 ){	   //the local square		
				for( int testVal=1; testVal<10; testVal++ ){ //testing all values
					if( !appForJJ[jj][testVal] ){
						if( haveToAppInRowSeg( testVal, ii, jj )){
							setRowsSqu( testVal, ii, jj );
							}						
						}						
					}
				}						
			}						
		for( int ii=0;ii<9;ii++ ){             //for each column
			for( int jj=0; jj<9; jj=jj+3 ){	   //the local square		
				for( int testVal=1; testVal<10; testVal++ ){ //testing all values
					if( !appForII[ii][testVal] ){
						if( haveToAppInColSeg( testVal, ii, jj )){
							setColsSqu( testVal, ii, jj );
							}						
						}						
					}
				}						
			}						

			updAllNrOfPos();
		}
	//================================================================
	//================================================================
	//Tests whatever all possibilities outside the segment is not possible
	public boolean haveToAppInRowSeg( int testVal, int start, int jj ){
//		pr(  "go up to  " + start  );
			for( int mm=0; mm<start; mm++ ){          //left of the square
//			pr( mm + " was mm " + nodes[mm][jj].isPossible(testVal));
				if( nodes[mm][jj].isPossible(testVal) ){ return false; }
			}
//			pr( "and from start + 3" + (start+3));
			for( int mm=start+3; mm<9; mm++){
//				pr( mm + " was mm here " + nodes[mm][jj].isPossible(testVal));
				if( nodes[mm][jj].isPossible(testVal) ){ return false; }				
			}
//if every one  before and after not is possible, it has to be
//in the actual segment

	
//	pr(testVal + " has to app on  " + start + " on row nr "+ jj);
	return true;
	}
	//================================================================
	//================================================================
	//start should be 0, 3 or 6, i.e. the start of the segment
	public void setRowsSqu( int actVal, int start, int jj ){
//System.out.println("REMOVINGGGGGGGG!!!!!!!!!!!!!!!!avoid row jj" + jj );
	int lowj = 3*(int)((jj)/3);//the lowest value in this segment

		for( int kk=start; kk<start+3;kk++ ){			
			for( int ll=lowj; ll<jj; ll++ ){
//				pr("kk ll   i   slingf  lowj" + kk + "   " + ll + "   " + lowj);
				nodes[kk][ll].remPos( actVal );
			} for( int ll=jj+1; ll<lowj+3; ll++ ){	
//				pr("kk ll   i   " + kk + "   " + ll + "   !! " );			
				nodes[kk][ll].remPos( actVal );
			}
		}
			
	}

	
	//================================================================
	//================================================================
	//Tests whatever all possibilities outside the segment is not possible
	public boolean haveToAppInColSeg( int testVal, int ii, int start ){
			for( int nn=0; nn<start; nn++ ){          			
				if( nodes[ii][nn].isPossible(testVal) ){ return false; }
			}
//			pr( "and from start + 3" + (start+3));
			for( int nn=start+3; nn<9; nn++){				
				if( nodes[ii][nn].isPossible(testVal) ){ return false; }				
			}
//if every one  before and after not is possible, it has to be
//in the actual segment
			
	return true;
	}
	//================================================================
	//================================================================
	//start should be 0, 3 or 6, i.e. the start of the segment
	public void setColsSqu( int actVal, int ii, int start ){

	int lowi = 3*(int)((ii)/3);//the lowest value in this segment

		for( int ll=start; ll<start+3;ll++ ){			
			for( int kk=lowi; kk<ii; kk++ ){				
				nodes[kk][ll].remPos( actVal );
			} for( int kk=ii+1; kk<lowi+3; kk++ ){					
				nodes[kk][ll].remPos( actVal );//OBS here the possibility in ii/jj 
				                               //can disappear!!!!
			}
		}
			
	}


	//================================================================
	//================================================================


	public boolean remSingOcc(){
			for( int ii=0;ii<9;ii++ ){
				pr( " II " + ii );
				if( !remSingPosII(ii)){ return false; }	
			}
			for( int jj=0;jj<9;jj++ ){
				pr( " JJ " + jj );
				if( !remSingPosJJ(jj)){ return false; }						
			}
			
			for( int ss=0; ss<9; ss++ ){
				pr( " SS " + ss );
				if( !remSingPosSq(ss)){ return false; }	
			}
			return true;		
		}

	//================================================================
	//================================================================
	//searching if the row/column with constant ii (in parameter) and 
	//every value only is possible in only one position, if so, an 
	//occasion appears
	public boolean remSingPosII( int ii ){
			
			for( int val=1; val<10; val++ ){
		//		pr( !appForII[ii][val] + " var möjligheten");
				if( !appForII[ii][val] ){
					//pr(" vi vet att val " + val + " ska finnas på ii=" + ii);
					int fApJJ=0;   //the j index of the first apperence
					int nrApp = 0;
					for( int jj=0; jj<9; jj++ ){
						pr(" value is " + nodes[ii][jj].getVal() + " compared with " + val + "should app?:"+appForII[ii][val]);
						if( nodes[ii][jj].isPossible(val) ){
							fApJJ=jj;
							nrApp++;							
						}
					}
					if( nrApp==1 ){ 
						pr(" nu sker det...II ");
						if( !occasion( ii, fApJJ,  val )){ return false; }	
					} else if( nrApp==0 ){ pr("inga alls");return false; }//???
					
//					while( !nodes[ii][fApJJ].isPossible(val)){ 
//					pr(" räknare " + fApJJ + "   val " + val  + " in ii " + ii + " jj " + nodes[ii][fApJJ].isPossible(val)); 
//					pr("THe value" + nodes[ii][fApJJ].getVal());
//					fApJJ++; //obs dangerous, but works if there is no logical errors
//					}
//					
//					if( restOfIIfree( val, ii, fApJJ+1 ) ){
//						pr(" nu sker det...II ");
//						if( !occasion( ii, fApJJ, val )){ pr("ret falsk");return false; }	
//						//obs, could be a little bit more eff. variant						
//					}
					
					
					}
					
					
				}
				return true;
			}
			
		
	//================================================================
	//testing if for a constant ii and jj from jst to the end (=8) is
	//free from val
	public boolean restOfIIfree( int val, int ii, int jst){
		for( int jj=jst; jj<9; jj++ ){ //vad händer om fApJJ=8???bör vara ok
			if( nodes[ii][jj].isPossible(val) ){ return false; }		
		}				
		return true;  	//if we passed the for loop, then the row/col ii
						//is free from val
	}
	//================================================================
	//================================================================
	public boolean remSingPosJJ( int jj ){
			
			for( int val=1; val<10; val++ ){
				pr("val" + val);
				if( !appForJJ[jj][val] ){
					int fApII=0;   //the j index of the first apperence
					int nrApp = 0;
					for( int ii=0; ii<9; ii++ ){
						if( nodes[ii][jj].isPossible(val) ){
							fApII=ii;
							nrApp++;
						}
					}
					if( nrApp==1 ){ 
						pr(" nu sker det...JJ ");
						if( !occasion( fApII, jj,  val )){ 
						pr("ret fals");
						return false; }	
					} else if( nrApp==0 ){ 
					pr("ret falsk rft  inga nmöjl");
					return false; }
//					while( !nodes[fApII][jj].isPossible(val) ){ fApII++; }
//					
//					if( restOfJJfree( val, fApII+1, jj ) ){
//						pr(" nu sker det...JJ ");
//						if( !occasion( fApII, jj,  val )){ return false; }	
//						//obs, could be a little bit more eff. variant
//					}
					
					
					}
					
					
				}
				pr("åker ti");
				return true;
			}
			
		
	//================================================================
	//testing if for a constant ii and jj from jst to the end (=8) is
	//free from val
	public boolean restOfJJfree( int val, int ist, int jj){
		for( int ii=ist; ii<9; ii++ ){ //vad händer om fApJJ=8???bör vara ok
			if( nodes[ii][jj].isPossible(val) ){ return false; }		
		}				
		return true;  	//if we passed the for loop, then the row/col ii
						//is free from val
	}
	//================================================================

	public boolean remSingPosSq( int ss ){
			
			int lowj = 3*(int)((ss)/3);
			int lowi = 3*(ss-3*(int)((ss)/3));
			

	
//			pr( " when ss we get lowi lowj " + ss + "  " + lowi + "  " + lowj);
//				pr( ss + " is " + ((int)((lowj)/3)*3+(int)((lowi)/3)));
			
			for( int val=1; val<10; val++ ){
				//pr( "in sq " + ss + " val " + val + " is " +  appInSqu[ss][val]);
				if( !appInSqu[ss][val] ){
														
					int nrOcc = 0;
					int iocc = -1; 
					int jocc = -1;
					for( int ii=lowi; ii<lowi+3; ii++ ){
						for( int jj=lowj; jj<lowj+3; jj++ ){
							if( nodes[ii][jj].isPossible( val )){
								nrOcc++;
								iocc=ii;
								jocc=jj;
							}							
						}													
					}
					if( nrOcc == 1 ){
						pr( " occ i sq i j m med val " + iocc + "  " + jocc + " val " + val);
					//	for(int jk=0;jk<1000000000;jk++){}
						pr(" nu sker det...SQ  ");
						if( !occasion( iocc, jocc, val )){ return false; }	
					}
					if( nrOcc == 0){ return false; }
					
			}
		}
		return true;
	}
	//appInSqu[(int)((jj)/3)*3+(int)((ii)/3)][val] = true;	

	//================================================================
	public String getMatrix( ){
		String ret="";
		
		for( int i=0; i<9; i++ ){
			for( int j=0; j<9; j++ ){
				ret=ret+(char)(nodes[i][j].getVal()+48);
			}		
		}	
		return ret;
	}
	public void pr( String s ){ 
	//System.out.println(s); 
	}
}


