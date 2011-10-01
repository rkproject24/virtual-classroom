package com.ignou.vcs.xml;

import java.io.*;
import java.lang.String;
import java.util.ArrayList;

public class addXML {
	static int count = 0;
	public static String substitute(String string, String replacement,
			String pattern) {
		int start = string.indexOf(pattern);
		while (start != -1) {
			StringBuffer buffer = new StringBuffer(string);
			buffer.delete(start, start + pattern.length());
			buffer.insert(start, replacement);
			string = new String(buffer);
			start = string.indexOf(pattern, start + replacement.length());
		}
		
		return string;
	}

	public static String unescapeForXML(String string) {
		string = addXML.substitute(string, "&amp;", "&");
		string = addXML.substitute(string, "&quot;", "\"");
		string = addXML.substitute(string, "&lt;", "<");
		string = addXML.substitute(string, "&gt;", ">");
		string = addXML.substitute(string, "&#10;", "\n");
		string = addXML.substitute(string, "|", " ");

		return string;
	}
	public static String unescapeForXML1(String string) {
		string = addXML.substitute(string, "&", "&amp;");
		string = addXML.substitute(string, "\"", "&quot;");
		string = addXML.substitute(string, "<", "&lt;");
		string = addXML.substitute(string, ">", "&gt;");
		string = addXML.substitute(string, "\n", "&#10;");
		string = addXML.substitute(string, " ", "|");
		return string;
	}
	public void generateXML(ArrayList list, String filename) {

		
		try {
			OutputStream fout = new FileOutputStream(filename);
			OutputStream bout = new BufferedOutputStream(fout);
			OutputStreamWriter out = new OutputStreamWriter(bout, "8859_1");

			out.write("<?xml version=\"1.0\" ");
			out.write("encoding=\"ISO-8859-1\"?>\r\n");
			out.write("<questionpaper>");
			
			//System.out.println("count" + count);
			for (int i = 0 ; i < (list.size()); i++) {
				com.ignou.vcs.forms.Test_paper temp_obj = (com.ignou.vcs.forms.Test_paper) list
						.get(i);
				int quesno = temp_obj.getQuesno();
				String ques = temp_obj.getQues();
				String marks = temp_obj.getQuesmarks();
				System.out.println(quesno + " " + ques); 
				out.write("<quesno>" + quesno + "</quesno>");
				out.write("<ques>" + ques + "</ques>");
				out.write("<marks>" + marks + "</marks>");
			}
			
			out.write("</questionpaper>");
			out.flush(); // Don't forget to flush!
			out.close();

		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

	}
public void solutionXML(ArrayList list, String filename) {

		
		try {
			OutputStream fout = new FileOutputStream(filename);
			OutputStream bout = new BufferedOutputStream(fout);
			OutputStreamWriter out = new OutputStreamWriter(bout, "8859_1");

			out.write("<?xml version=\"1.0\" ");
			out.write("encoding=\"ISO-8859-1\"?>\r\n");
			out.write("<solution>");
			
			//System.out.println("count" + count);
			for (int i = 0 ; i < (list.size()); i++) {
				com.ignou.vcs.beans.AnswerBean temp_obj = (com.ignou.vcs.beans.AnswerBean) list
						.get(i);
				int quesno = temp_obj.getQuesno();
				String ques = temp_obj.getAnswer();
				System.out.println(quesno + " " + ques); 
				out.write("<quesno>" + quesno + "</quesno>");
				out.write("<ans>" + ques + "</ans>");
				
			}
			
			out.write("</solution>");
			out.flush(); // Don't forget to flush!
			out.close();

		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

	}
	public String readXML(String filename) {

		FileInputStream fis = null;
		BufferedInputStream bis = null;
		DataInputStream dis = null;
		String xmlDoc = "";
		try {
			fis = new FileInputStream(filename);

			// Here BufferedInputStream is added for fast reading.
			bis = new BufferedInputStream(fis);
			dis = new DataInputStream(bis);

			// dis.available() returns 0 if the file does not have more lines.
			while (dis.available() != 0) {

				// this statement reads the line from the file and print it to
				// the console.
				xmlDoc = xmlDoc + dis.readLine();
			}

			// dispose all the resources after using them.
			fis.close();
			bis.close();
			dis.close();

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return xmlDoc;
	}
	
public void syllabusXML(ArrayList list, String filename) {

		
		try {
			OutputStream fout = new FileOutputStream(filename);
			OutputStream bout = new BufferedOutputStream(fout);
			OutputStreamWriter out = new OutputStreamWriter(bout, "8859_1");

			out.write("<?xml version=\"1.0\" ");
			out.write("encoding=\"ISO-8859-1\"?>\r\n");
			out.write("<syllabus>");
			
			//System.out.println("count" + count);
			for (int i = 0 ; i < (list.size()); i++) {
				com.ignou.vcs.beans.Syllabus temp_obj = (com.ignou.vcs.beans.Syllabus) list
						.get(i);
				int unitno = temp_obj.getUnitno();
				String unitname = temp_obj.getUnitname();
				String topics = temp_obj.getTopics();
				 
				out.write("<unitno>" + unitno + "</unitno>");
				out.write("<unitname>" + unitname + "</unitname>");
				out.write("<topics>" + topics + "</topics>");
			}
			
			out.write("</syllabus>");
			out.flush(); // Don't forget to flush!
			out.close();

		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

	}
public void AnswersheetXML(ArrayList list, String filename) {

	
	try {
		OutputStream fout = new FileOutputStream(filename);
		OutputStream bout = new BufferedOutputStream(fout);
		OutputStreamWriter out = new OutputStreamWriter(bout, "8859_1");

		out.write("<?xml version=\"1.0\" ");
		out.write("encoding=\"ISO-8859-1\"?>\r\n");
		out.write("<answersheet>");
		
		//System.out.println("count" + count);
		for (int i = 0 ; i < (list.size()); i++) {
			com.ignou.vcs.beans.Answersheet temp_obj = (com.ignou.vcs.beans.Answersheet) list
					.get(i);
			String quesno = temp_obj.getQuesno();
			String ques = temp_obj.getQues();
			String marks = temp_obj.getMarks();
			String answer = temp_obj.getAnswer();
			System.out.println(quesno + " " + ques); 
			out.write("<quesno>" + quesno + "</quesno>");
			out.write("<ques>" + ques + "</ques>");
			out.write("<answer>" + answer + "</answer>");
			out.write("<marks>" + marks + "</marks>");
		}
		
		out.write("</answersheet>");
		out.flush(); // Don't forget to flush!
		out.close();

	} catch (FileNotFoundException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	} catch (UnsupportedEncodingException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	} catch (IOException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}

}
}
