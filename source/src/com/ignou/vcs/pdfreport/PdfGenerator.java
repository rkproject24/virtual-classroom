package com.ignou.vcs.pdfreport;

import java.util.ArrayList;

import com.ignou.vcs.commons.*;
import com.ignou.vcs.commons.beans.*;
import com.ignou.vcs.commons.database.*;
import com.ignou.vcs.pdfreport.ITextBasedPdfGenerator;
import com.ignou.vcs.report.database.*;



public class PdfGenerator {
	
	
		public boolean createOutputFile(String userId) {
			// TODO Auto-generated method stub
			
			//custom table Data
			
			com.ignou.vcs.commons.Utilities obj = new com.ignou.vcs.commons.Utilities();
			String currentDate = obj.getCurrentDateInDB2Format();
			com.ignou.vcs.commons.database.CommonsDatabaseActivities dbObj = new com.ignou.vcs.commons.database.CommonsDatabaseActivities();
			com.ignou.vcs.commons.beans.StudentBean bean = (com.ignou.vcs.commons.beans.StudentBean)dbObj.getStudentDetails(userId);
			String studentName = bean.getName();
			String fatherName = bean.getFatherName();
			String Email = bean.getEmailP();
			String StartDate = bean.getStartDate();
			String date = StartDate + "\t to\t" + currentDate;
			String courseId = bean.getCourseId();	
			System.out.println("courseId"+ courseId);
			String courseName = (String)dbObj.getCourseName(courseId);
			System.out.println("courseName at pdfgenerator.java"+courseName);
			java.util.ArrayList list = (java.util.ArrayList)dbObj.getReport(courseId,userId);

						ITextBasedPdfGenerator writerObject = new ITextBasedPdfGenerator();
						String fileName = studentName + "-" + userId + ".pdf";
						String filePath = Utilities.STUDENT_REPORT_UPLOAD_PATH + "//" + fileName;
						
						//CREATING FILE
						writerObject.createFile(filePath);
						
						//INSERTING LOGO
						writerObject.insertPicture("http://localhost:9080/VCS//theme/images/vcs.jpg");
						//writerObject.insertText("");
						
						ArrayList workTableHeadings = new ArrayList();
						ArrayList workTableData = new ArrayList();
					//	ArrayList workTableData1 = new ArrayList();
						
						workTableHeadings.add("SUBJECT NAME");
						workTableHeadings.add("MAXIMUM MARKS");
						workTableHeadings.add("HIGHEST IN CLASS");
						workTableHeadings.add("MARKS SCORED");
						workTableHeadings.add("GRADE");
						
						int rowsInTable = list.size()+1;
						int columnsInTable = workTableHeadings.size();
						int totalMax = 0;
						float totalScored = 0;
						float perci = 0;
						String percentage = "";
						String totalScore = "";
						int tempPercent = 0;
						//String grade = "";
					//Entering Data
						
							for(int i=0;i<list.size();i++)
							{
								com.ignou.vcs.commons.beans.generateReport report = (com.ignou.vcs.commons.beans.generateReport)list.get(i);
								String temp = report.getTotalMarks();
								if(temp.equals(""))
								{
									temp = "0";
								}
								totalMax = totalMax + report.getMaxMarks();
								totalScored = totalScored + (Integer.parseInt(temp));
								tempPercent = (((Integer.parseInt(temp))*100)/report.getMaxMarks());
								workTableData.add(report.getSubjectName());
								workTableData.add(Integer.toString(report.getMaxMarks()));
								workTableData.add(Integer.toString(report.getHighestMarks()));
								workTableData.add(report.getTotalMarks());
								System.out.println("tempPercent"+tempPercent);
								if(tempPercent>=90){
								String grade = "A";
								System.out.println(grade);
								workTableData.add(grade);
								}
								else if(tempPercent>=80 && tempPercent<90){
								String grade = "B";	
								System.out.println(grade);
								workTableData.add(grade);
								}
								else if(tempPercent>=70 && tempPercent<80){
									String grade = "C";
									System.out.println(grade);
									workTableData.add(grade);
								}
								else if(tempPercent>=60 && tempPercent<70){
									String grade = "D";
									System.out.println(grade);
									workTableData.add(grade);
								}
								else if(tempPercent>=50 && tempPercent<60){
									String grade = "E";		
									System.out.println(grade);
									workTableData.add(grade);
								}
								else if(tempPercent<50){
									String grade = "F";	
									System.out.println(grade);
									workTableData.add(grade);
								}
//								
							}
							perci = ((totalScored*100)/totalMax);
							percentage = perci+"";
							totalScore = totalScored+"";
						
						//INSERTING DATA TABLE
						writerObject.customTable(studentName, courseName, fatherName, Email, date);
						writerObject.inserTable(columnsInTable, rowsInTable, workTableHeadings, workTableData);
						writerObject.insertSpecialTable(5, totalScore,percentage);
						//writerObject.insertText("Total Hours:" + hours);
						
						//FINALIZING FILE
						writerObject.closeFile();
			
			return false;
		}
}

	



