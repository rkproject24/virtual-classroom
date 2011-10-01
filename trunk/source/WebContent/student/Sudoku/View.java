import java.awt.*;
import java.awt.event.*;
import java.text.*;
import java.applet.*;

//import java.io.*;




public class View extends Panel implements ActionListener, KeyListener{

    Sudoku s;
    Panel pl = new Panel();
    Panel pb = new Panel();
    Panel pm = new Panel();
    Panel pt = new Panel();
    Panel pr = new Panel();

    TextField[][] sp, sa;
    TextArea txt;
    Button b1, b2, b3, b4;
    int indexOfExample=0;
    int globi=0, globj=0;
    //CONSTRUCTOR

    public View(  ){
	//sudoku = sudoku_;
	//	setSize(900, 400);
	setLayout(new FlowLayout() );

	pl.setSize(400,400);
	pr.setSize(400,400);


	sp = new TextField[9][9];
	sa = new TextField[9][9];
	//sp[0][0] = new TextField(1);
	//sp[0][0].addActionListener(this);
	pl.setLayout(new GridLayout(9,9,5,5));
	pr.setLayout(new GridLayout(9,9,5,5));
	pm.setLayout(new GridLayout(2,1));
	pb.setLayout(new GridLayout(5,1));
	pt.setLayout(new GridLayout(1,1));


	b1 = new Button("solve problem");
	b2 = new Button("read example");
	b3 = new Button("clear");
	b4 = new Button("quit");
	txt= new TextArea("Write the soduko problem to the left, or press ''read example''",4,4,TextArea.SCROLLBARS_NONE);
	b1.addActionListener(this);
	b2.addActionListener(this);
	b3.addActionListener(this);
	b4.addActionListener(this);
	//b1.setSize(100,100);
	//b2.setSize(100,100);
	//b3.setSize(100,100);
	//txt.setSize(100,600);
	pb.add( b1 );
	pb.add( b2 );
	pb.add( b3 );
	pb.add( b4 );
	//pb.add(  );
	pt.add( txt);

	pm.add( pb );
	pm.add( pt );

	//pm.setSize(100,400);
	//pb.setSize(100,100);
	//pt.setSize(100,600);

	//pb.setSize(10,30);
	//pl.add(new Label("Sudoku program"));

	//pl.add( sp[0][0] );

	for( int i=0; i<9; i++ ){
	    for( int j=0; j<9; j++ ){
		sp[i][j] = new TextField(1);
		sa[i][j] = new TextField(1);
		sp[i][j].addKeyListener( this );
		//		sa[i][j].setColumns(1);
		//sp[i][j].setText("hj");
		//sa[i][j].setText("hj");
		pl.add( sp[i][j] );
		pr.add( sa[i][j] );
	    }
	}

	add(pl);
	add(pm);
	add(pr);
	//setVisible(true);

    }




    public void actionPerformed( ActionEvent e ){
	globi=0;
	globj=0;
	int nr=0;
	//-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-| 
	if( e.getSource() == b1 ){
	    //int c=0; 
	    //SOLVING THE PROBLEM: 	1: read from the left textfields
	    //                     	2: call for solve in Sudoku object
	    //						3: showing the answer to the right (done by the sudoku object(:s))
		
	    //JKLKLKL
	    //KLKLKL
	    String input = readInput();
	    s = new Sudoku( input, this );
	
	    char[] sc=input.toCharArray();
	    char[] zero = "0".toCharArray();
	    System.out.print(input);
	    for( int r=0; r<sc.length; r++ ){ if( sc[r]!=zero[0] ){nr++;} }
	
	    if( nr < 10 ){ txt.setText("To few input values"); }//?
	    else{
		s.printArray();
		//s.updateAllPos();
		s.nodes=s.solve();
	
		if( s.nodes!=null ){
		    //			System.out.println("Solution is");
		    //			s.printArray();
		    //			String output = s.getMatrix();
		    //			int c=0;
		    //			for( int i=0; i<9; i++ ){
		    //				for( int j=0; j<9; j++ ){
		    //				//	sa[i][j].setText( output.substring(c++,c) );
		    //				}
		    //			}
		    txt.append(" (one) solution to the right.");
		} else {
		    System.out.println("Problems, couldn't solve");
		    txt.setText("This problem doesn't seem to have a solution.");
		}
	    }


	}
	//-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-| 
	else if ( e.getSource() == b2 ){			
	    //Loading an example
	    int nrOfExamples = 6;
	    String[] inStr = new String[nrOfExamples];		
	    inStr[0] = " 5   4   642    79 8         5  3   43 1 2 97   9  6         4 19    362   7   5 ";
	    inStr[1] = " 54  87      3 8  9 6     4 48  2      1 7      3  28 7     9 6  5 2      96  57 ";//en annan svår
	    inStr[2] = "3  4       4 9 2   912    51 5     7 3 8 6 2 7     6 45    139   3 2 4       4  6";//medel
	    inStr[3] = "7 1   9 8 8     6   62 15   2 6 8 1 4       9 3 1 5 8   39 42   7     9 9 4   8 5";//lätt
	    inStr[4] = " 8 6    7       69   7  584  1 9   6  8   2  6   2 8  894  7   17       3    5 4 ";//svår
	    inStr[5] = "  58    48       6946 7     8 76   33  1 2  57   94 1     1 4595       76    93  ";
	
	    if ( indexOfExample == nrOfExamples){ indexOfExample= 0;}
	    int c=0;
	    for( int i=0; i<9; i++ ){
		for( int j=0; j<9; j++ ){
		    sp[i][j].setText( inStr[indexOfExample].substring(c++,c) );
		}
	    }
	    indexOfExample++;
	}
	//-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-| 
	else if ( e.getSource() == b3 ){
	    for( int i=0; i<9; i++ ){
		for( int j=0; j<9; j++ ){
		    sp[i][j].setText( "" );
		    sa[i][j].setText( "" );
		} 
	    }	
	} 		

	//-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-| 
	else if ( e.getSource() == b4 ){
	    System.exit(0);
	}
    }

    public String readInput(){
	txt.setText("");
	String input="";
	
	for( int i=0; i<9; i++ ){
	    for( int j=0; j<9; j++ ){
		sa[i][j].setColumns(0);
		sp[i][j].setBackground( Color.white );
		if( sp[i][j].getText().length()==1 ){
		    input = input+sp[i][j].getText();								
		}	else if( sp[i][j].getText().length()>1 ) {
		    sp[i][j].setBackground( Color.red );
		    input = input+"0";
		    txt.append("Igorded values (red) at most one character/space at a square");
		} else  { 
		    input = input+"0";
		}
	    }
	}
	return input;

    }
    public void keyPressed( KeyEvent e ){
	
    }

    public void keyTyped( KeyEvent e ){
		
    }

    public void keyReleased( KeyEvent e ){
	
	System.out.print("TYPED + " + e.getID());
	if( (e.getID()!=e.VK_BACK_SPACE && e.getID()!=e.VK_TAB )){
	    if( e.getSource()==sp[globi][globj] ){
		globj++;
		if( globj>8 ){
		    globj=0;
		    globi++;								
		    if( globi>8 ){ 
			globi=0;					
			b1.requestFocus();					
		    } else {
			sp[globi][globj].requestFocus();
		    }
		} else {
		    sp[globi][globj].requestFocus();		
		} 
	    } else {
		for( int i=0; i<9; i++ ){
		    for( int j=0; j<8; j++ ){
			if( e.getSource() == sp[i][j] ){ 
			    globi=i;
			    globj=j+1;
			    sp[i][j+1].requestFocus(); }
		    }
		}
		for( int i=0; i<8; i++ ){
		    if( e.getSource() == sp[i][8] ){ sp[i+1][0].requestFocus(); }
		}
	    }
	}
    }
}
