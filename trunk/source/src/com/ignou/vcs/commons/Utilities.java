package com.ignou.vcs.commons;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.UnknownHostException;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.digester.Digester;
import org.xml.sax.SAXException;





public class Utilities {

	public static int RECORDS_PER_PAGE = 5;	
	
	public static String GENERAL_FILES_UPLOAD_PATH = "C:\\Uploaded_files\\general";
	
	public static String LECTURE_FILES_UPLOAD_PATH = "C:\\Documents and Settings\\Anchal Agarwal\\IBM\\rationalsdp7.0\\vcs2\\VCS\\WebContent\\DATA\\lectures";
	
	public static String ASSIGNMENT_FILES_UPLOAD_PATH = "C:\\Uploaded_files\\assignments";
	
	public static String SOLUTION_FILES_UPLOAD_PATH = "C:\\Uploaded_files\\solutions";
	
	public static String STUDENT_SOLUTION_FILES_UPLOAD_PATH = "C:\\Uploaded_files\\student_solutions";
	
	public static String CHARTS_FILES_TEMP_PATH = "C:\\Charts";
	
	public static int SERVER_PORT_NUMBER = 9081;
	
	public static String RESUME_FILES_UPLOAD_PATH = "c:\\Uploaded_files\\resume";
	
	public static String LECTURE_IMAGES_PATH = "C:\\Uploaded_files\\images\\lectures";
	
	public static String STUDENT_IMAGES_PATH = "C:\\Uploaded_files\\images\\students";
	
	public static String FACULTY_IMAGES_PATH = "C:\\Uploaded_files\\images\\faculties";
	
	public static String MANAGEMENT_IMAGES_PATH = "C:\\Uploaded_files\\images\\management";
	
	public static String STUDENT_REPORT_UPLOAD_PATH = "C:\\Uploaded_files\\report";
	
	public static String getIp() {
		String ipAddress = "";
		try {
			InetAddress  inetAddress = InetAddress.getLocalHost();
			ipAddress = inetAddress.getHostAddress();
			System.out.println(ipAddress);
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ipAddress;
	}
	
	
	String userConfigFilePath = "config/UserConfig.xml";
	static ArrayList<User> allUsers = new ArrayList<User>(); 
	
	/**
	 * Method to return User Level.
	 */
	public String getLevel(String sourceUserID) {
		String userID = sourceUserID.substring(0, 3);
		String userLevel = null;
		
		Utilities util = new Utilities();
		
		util.userConfigReader(userConfigFilePath);
				
		for(int i = 0; i < allUsers.size(); i++) {
			User user = (User)allUsers.get(i);
			
			if(user.getUserID().equalsIgnoreCase(userID)) {
				userLevel = user.getUserLevel();
			}
		}
		return userLevel;
	}
	
	/**
	 * Method to Set New User. 
	 * @param userID
	 * @param userLevel
	 */
	public void setUser(String userID, String userLevel) {
		User user = new User();
		user.setUserID(userID);
		user.setUserLevel(userLevel);
		allUsers.add(user);
	}
	
	/**
	 * Method to read "User Type" Config File 
	 * @param filePath
	 */
	public void userConfigReader(String filePath) {
		try {
			
			Digester digester = new Digester();
			digester.setValidating(false);
			digester.addObjectCreate("users", Utilities.class);
			
			digester.addCallMethod("users/type", "setUser", 2);
			digester.addCallParam("users/type/id",0);
			digester.addCallParam("users/type/level",1);
			
			System.out.println("File Path:" + filePath);
			File file = new File(filePath);
			digester.parse(file);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SAXException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public String getNewDateInDB2Format(String duration){
		int new_month;
		int new_year;
		int d= Integer.parseInt(duration);
		Calendar cal= Calendar.getInstance();
		String day=String.valueOf(cal.get(Calendar.DATE));
		String month=String.valueOf(cal.get(Calendar.MONTH) +1);
		String year=String.valueOf(cal.get(Calendar.YEAR));
		System.out.println("old_month"+month);
		System.out.println("old_year"+year);
		System.out.println("new_day"+day);
		new_year=Integer.parseInt(year);
		new_month=Integer.parseInt(month);
		new_month = new_month+d;
		System.out.println(new_month);
		if(new_month>12)
		{
			int y =new_month/12;
			new_year=new_year+y;
			new_month=new_month%12;
		}
		System.out.println("new_month"+new_month);
		System.out.println("new_year"+new_year);
		String newDateInDB2 = new_year +"-"+new_month+"-"+ day;
		return newDateInDB2;
	}
	
	public ArrayList<String> getSeparateValue(String pipedString) {
		ArrayList<String> contents = new ArrayList<String>();
		int startPosition = 0;
		
		if(pipedString==null || pipedString == "")
		{
			return contents;
		}
		
		for(int i = 0 ; i < pipedString.length() ; i++) {
			if(pipedString.charAt(i) == '|') {
				String element = pipedString.substring(startPosition, i);
				startPosition = i + 1;
				contents.add(element);
			}
		}
		contents.add(pipedString.substring(startPosition, pipedString.length()));
		return contents;
	}
	
	
	public String getCurrentDateInDB2Format() {
		Date currDate = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String dateInDB2 = dateFormat.format(currDate);
		return dateInDB2;
	}
	
	public String encodeString(String rawString) {
		String encodedString = URLUTF8Encoder.encode(rawString);
		System.out.println("Encoded String:" +encodedString);
		return encodedString;
	}
	
	public String decodeString(String encodedString) {
		String decodedString = URLUTF8Decoder.decode(encodedString);
		System.out.println("Decoded String:" + decodedString);
		return decodedString;
	}
	
	public static void main(String args[]) {
		PasswordService obj = PasswordService.getInstance();
		System.out.println(obj.encrypt("vinay"));
		
//		Utilities util = new Utilities();
//		String encodedString = URLUTF8Encoder.encode("Hi this is &ankit= pahge dfvnjdvf,,vkjnfjn %$oisdcji23rekln");
//		System.out.println("Encoded String:" + URLUTF8Encoder.encode("Hi this is &ankit= pahge dfvnjdvf,,vkjnfjn %$oisdcji23rekln"));
		//System.out.println("Decoded String:" + Utilities.unescape(encodedString));
		
		//util.encodeString("Hi this is &ankit= pahge dfvnjdvf,,vkjnfjn %$oisdcji23rekln");
		//fX87DeMrbMLpYI6/eYbCa1lU0og=
		
		Utilities.getIp();
	}
	
	public static void outputImage(File thumbfile, String type, HttpServletResponse response) throws IOException {
		    response.setContentType("image/"+type);
		    OutputStream os = response.getOutputStream();
		    FileInputStream fin = new FileInputStream(thumbfile);

		    byte[] buf = new byte[4096];
		    int count = 0;
		    while(true) {
		        int n = fin.read(buf);
		        if(n == -1) {
		            break;
		        }
		        count = count + n;
		        os.write(buf,0,n);
		    }
		    os.flush();
		    os.close();
		    fin.close();
		}
	
	
	public static void outputVideo(File thumbfile, String type, HttpServletResponse response) throws IOException {
	    System.out.println("Checkpoint ");
		response.setContentType("flv-application/octet-stream");
	    OutputStream os = response.getOutputStream();
	    FileInputStream fin = new FileInputStream(thumbfile);

	    byte[] buf = new byte[4096];
	    int count = 0;
	    while(true) {
	        int n = fin.read(buf);
	        if(n == -1) {
	            break;
	        }
	        count = count + n;
	        os.write(buf,0,n);
	    }
	    os.flush();
	    os.close();
	    fin.close();
	}
}
