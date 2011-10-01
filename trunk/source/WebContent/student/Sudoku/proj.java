/*
 * @(#)Proj.java 1.0 06/08/16
 *
 * You can modify the template of this file in the
 * directory ..\JCreator\Templates\Template_1\Project_Name.java
 *
 * You can also create your own project template by making a new
 * folder in the directory ..\JCreator\Template\. Use the other
 * templates as examples.
 *
 */
//package myprojects.proj;

import java.awt.*;
import java.awt.event.*;
import java.io.*;

class Proj extends Frame {
	

	public Proj() {
	
		addWindowListener(new WindowAdapter() {
			public void windowClosing(WindowEvent e) {
				dispose();
				System.exit(0);
			}
		});
	}

	public static void main(String args[]) 
	throws IOException {  
		System.out.println("Starting Proj..." );		
//		Proj mainFrame = new Proj();
//		mainFrame.setSize(400, 400);
//		mainFrame.setTitle("Proj");
//		mainFrame.setVisible(true);
		
		
		
		//Sudoku s = new Sudoku();
		View v = new View();
		
	
//		s.occasion(0,0,1);
//		s.occasion(1,0,1);
//		s.occasion(2,3,1);
//		s.occasion(5,8,1);
//		s.occasion(6,8,1);
//		s.occasion(7,8,1);
//		s.occasion(8,8,1);
	}
}
