class Node{
	
	//Node west, north, east, south;
	boolean[] possible, occInRow, occInCol, occInSqu;
	int nrOfPos;	
	int val;
	public Node(){		
		val = 0;			
		init();
	}
	public Node( int v ){
		val = v;
	//	init();
	}
	public Node publicClone(){
//	throws CloneNotSupportedException{ 
	Node n = new Node(this.val);
//	n.val=this.val;
		n.possible = new boolean[10];
		n.occInRow = new boolean[10];
		n.occInCol = new boolean[10];
		n.occInSqu = new boolean[10];
	for( int kk=0; kk<10; kk++ ){
			n.possible[kk]=this.possible[kk];//varför inte new...?
			n.occInRow[kk]=this.occInRow[kk];//anv inte
			n.occInCol[kk]=this.occInCol[kk];
			n.occInSqu[kk]=this.occInSqu[kk];
}	
	n.nrOfPos = this.nrOfPos;	
		return n;
	}
	public void init(){		
		possible = new boolean[10];
		occInRow = new boolean[10];
		occInCol = new boolean[10];
		occInSqu = new boolean[10];
		for( int kk=0; kk<10; kk++ ){
			possible[kk]=true;
			occInRow[kk]=false;
			occInCol[kk]=false;
			occInSqu[kk]=false;
			nrOfPos=9;
		}
	}

	public void setVal( int inVal ){
		if( inVal < 1 || inVal > 9){ 
			System.out.println("FATAL ERROR, request to set the value to " + inVal);
			System.exit(0);
		}
		val = inVal;
		allPosToFalse();
	}
		
	public void showVal(){
		System.out.print( val ); 
	}
	
	public int getVal(){ return val; }
		
	public void setPossib( int indx ){ possible[indx]=false; }//samma som remPos
	
	public void setRowOcc( int indx ){ 
		occInRow[indx]=true; 
		possible[indx]=false;
	}
	public void setColOcc( int indx ){ 
		occInCol[indx]=true; 
		possible[indx]=false;
	}
	public void setSquOcc( int indx ){ 
		occInSqu[indx]=true; 
		possible[indx]=false;
	}
	public int compNrOfPos(){
		if( val != 0 ){ return 0;}
		nrOfPos=0;	
		//System.out.println("    comp NR OFF ANTR" );
		for( int kk=1; kk<10; kk++ ){
		//	System.out.println(" byte " + possible[kk]);
			if( possible[kk] ){
				
				nrOfPos++;
			}
		}
		return nrOfPos;
	}
	
	public int retNrOfPos(){ return nrOfPos; }
	
	public int returnFirstTrue(){
		for( int indx = 1; indx<10; indx++ ){
			if( possible[indx] ){ return indx; }
		}	
		System.out.println(" VARNING, return first true returned 0!!!");
		return 0;		
	}
	
	public int getPosVal(){ return returnFirstTrue(); }
	
	public void setPosVal(){
			val = returnFirstTrue();
			//possible[val]=false;
			nrOfPos = 0;		
			
		}
	public void remPos( int indx ){
			possible[indx] = false;		
	}
	
	public void showPos(){
		
		
		for( int kk=1; kk<10; kk++ ){
			System.out.println( kk + " possibility is: " + possible[kk]);
	}
		}
	
	
	public void allPosToFalse(){
			for( int cn=0; cn<10; cn ++){possible[cn] = false; }
			nrOfPos = 0;
		}
	
	public boolean isPossible( int indx ){
		if( val != 0 ){ return false; }		
			return possible[indx];
		}
			
}