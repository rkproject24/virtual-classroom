import java.applet.*;
import java.awt.*;
import java.io.*;

public  class AppletSudoku extends Applet {


    public void init(){
// 	AppletSudoku a = new AppletSudoku();
// 		a.writeData();
	Sudoku s=new Sudoku();	
	setLayout( new GridLayout(1,1) );
	add(s.mainView);
	s.mainView.setSize(900, 400);
	setVisible( true );
	
	//	System.out.println("jkljkljkljkljkljkljkljkljkljklöjklöjklöjklöjklö");
    }

    public void AppletSudoku(){   }

    public void writeData(){
// 	System.out.println("jkljklöjklöjklöjklöjklö");
     
// 	try{
// // 	FileWriter fid = new FileWriter("/afs/nada.kth.se/home/f99/f99-tsu/public_html/sudoukuFile");
// // 	fid.write("testing");
// // 	fid.close();
// 	    BufferedWriter out = new BufferedWriter(new FileWriter("/afs/nada.kth.se/home/f99/f99-tsu/public_html/sudoukuFile"));
//         out.write("aString");
//         out.close();

// 	}    catch( IOException e ){}

    }
    


}
