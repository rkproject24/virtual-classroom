package com.ignou.vcs.files.database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.sql.DataSource;

import com.ignou.vcs.commons.Utilities;
import com.ignou.vcs.commons.beans.UserBean;
import com.ignou.vcs.datasource.DataSourceFactory;
import com.ignou.vcs.files.beans.FileBean;
import com.ignou.vcs.files.beans.SolutionBean;


public class FilesDatabaseActivities {
	
	Connection con;
	
	public FilesDatabaseActivities()
	{
		if(con == null)
		{
			con = DataSourceFactory.getConnection();
		}
	}

	public void insertFile(ArrayList columnValues) {
		String sql1	= "INSERT INTO VCS_SCHEMA.FILES(title,description,filepath,uploadedBy,topics,fileType,syllabus,solutionFile,uploadedTo,courseID,subjectID,uploadDate,Image) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
		//DebugLevel debug = DebugLevel.ON;
		Utilities util = new Utilities();
		String currDate = util.getCurrentDateInDB2Format();
		try {
			PreparedStatement state1 = con.prepareStatement(sql1);
			for(int i = 0; i < columnValues.size(); i++) {
				if(i == 5 ) {
					int value = (Integer)columnValues.get(i);
					state1.setInt(i+1, value);
				}else {
					String value = (String)columnValues.get(i);
					if(value == null) {
						if(i == 7 ||i == 9 || i == 10 ) {
							state1.setNull(i+1, java.sql.Types.VARCHAR);
						} else if(i == 4 || i == 6) {
							state1.setNull(i+1, java.sql.Types.LONGVARCHAR);
						} else if ( i == 11) {
							state1.setNull(13, java.sql.Types.VARCHAR);
						}
					} else {
						if( i == 11) {
							state1.setString(13, value);
						} else {
							state1.setString(i+1, value);
						}
					}
				}
			}
			state1.setString(12, currDate);
			state1.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public String getFileID() {
		String fileID = "";
		ResultSet res = null;
		Statement state = null;
		String sql2 = "SELECT MAX(FILEID) FROM VCS_SCHEMA.FILES";
		System.out.println("quiry:" + sql2);
		int fileIdNum = 0;
		try {
			state=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			res = state.executeQuery(sql2);
			
			while(res.next()) {
				fileID = res.getString(1);
				System.out.println("File Id Here:" + fileID);
			}
			if(fileID == null) {
				fileIdNum = 1;
			} else {
				fileIdNum = Integer.parseInt(fileID);
				fileIdNum ++;
			}
			fileID = fileIdNum + "";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return fileID;
	}
	
	public ArrayList<FileBean> getfiles(String courseID, String level, String subjectID, String fileType, String userID ) {
		ResultSet res = null;
		Statement state = null;
		String sql = "";
		if(fileType.equals("0")) {

			if(level.equals("1")) {
				sql = "SELECT FILEID,TITLE,DESCRIPTION,FILEPATH,UPLOADEDBY,SUBJECTID,UPLOADDATE FROM VCS_SCHEMA.FILES WHERE (UPLOADEDTO='" + level + "' OR UPLOADEDBY='" +userID + "') AND FILETYPE=" + fileType + " AND COURSEID='" + courseID + "' ORDER BY (UPLOADDATE) DESC";
			} else if(level.equals("0")) {
				sql = "SELECT FILEID,TITLE,DESCRIPTION,FILEPATH,UPLOADEDBY,COURSEID,UPLOADDATE FROM VCS_SCHEMA.FILES WHERE (UPLOADEDTO='" + level + "' OR UPLOADEDBY='" +userID + "') AND FILETYPE=" + fileType + " AND SUBJECTID='" + subjectID + "' ORDER BY (UPLOADDATE) DESC";
			} else if(level.equals("2")) {
				sql = "SELECT FILEID,TITLE,DESCRIPTION,FILEPATH,UPLOADEDBY,COURSEID,UPLOADDATE FROM VCS_SCHEMA.FILES WHERE (UPLOADEDTO='" + level + "' OR UPLOADEDBY='" +userID + "') AND FILETYPE=" + fileType + " ORDER BY (UPLOADDATE) DESC";
			} else if(level.equals("3")) {
				sql = "SELECT FILEID,TITLE,DESCRIPTION,FILEPATH,UPLOADEDBY,COURSEID,UPLOADDATE FROM VCS_SCHEMA.FILES WHERE FILETYPE=" + fileType + " ORDER BY (UPLOADDATE)";
			}
			
		} else if(fileType.equals("1")) {
			
			if(level.equals("1")) {
				sql = "SELECT FILEID,TITLE,DESCRIPTION,FILEPATH,UPLOADEDBY,TOPICS,SUBJECTID,UPLOADDATE,IMAGE FROM VCS_SCHEMA.FILES WHERE (UPLOADEDTO='" + level + "' OR UPLOADEDBY='" +userID + "') AND FILETYPE=" + fileType + " AND COURSEID='" + courseID + "' ORDER BY (UPLOADDATE) DESC";
			} else if(level.equals("0")) {
				sql = "SELECT FILEID,TITLE,DESCRIPTION,FILEPATH,UPLOADEDBY,TOPICS,COURSEID,UPLOADDATE,IMAGE FROM VCS_SCHEMA.FILES WHERE (UPLOADEDTO='" + level + "' OR UPLOADEDBY='" +userID + "') AND FILETYPE=" + fileType + " AND SUBJECTID='" + subjectID + "' ORDER BY (UPLOADDATE) DESC";
			} else if(level.equals("2")) {
				sql = "SELECT FILEID,TITLE,DESCRIPTION,FILEPATH,UPLOADEDBY,TOPICS,COURSEID,UPLOADDATE,IMAGE FROM VCS_SCHEMA.FILES WHERE FILETYPE=" + fileType + " ORDER BY (UPLOADDATE) DESC";
			} else if(level.equals("3")) {
				sql = "SELECT FILEID,TITLE,DESCRIPTION,FILEPATH,UPLOADEDBY,TOPICS,COURSEID,UPLOADDATE,IMAGE FROM VCS_SCHEMA.FILES WHERE FILETYPE=" + fileType + " ORDER BY (UPLOADDATE) DESC";
			}
		} else if(fileType.equals("2")) {
			
			if(level.equals("1")) {
				sql = "SELECT FILEID,TITLE,DESCRIPTION,FILEPATH,UPLOADEDBY,SYLLABUS,SOLUTIONFILE,SUBJECTID,UPLOADDATE FROM VCS_SCHEMA.FILES WHERE (UPLOADEDTO='" + level + "' OR UPLOADEDBY='" +userID + "') AND FILETYPE=" + fileType + " AND COURSEID='" + courseID + "' ORDER BY (UPLOADDATE) DESC";
			} else if(level.equals("0")) {
				sql = "SELECT FILEID,TITLE,DESCRIPTION,FILEPATH,UPLOADEDBY,SYLLABUS,SOLUTIONFILE,COURSEID,UPLOADDATE FROM VCS_SCHEMA.FILES WHERE (UPLOADEDTO='" + level + "' OR UPLOADEDBY='" +userID + "') AND FILETYPE=" + fileType + " AND SUBJECTID='" + subjectID + "' ORDER BY (UPLOADDATE) DESC";
			} else if(level.equals("2")) {
				sql = "SELECT FILEID,TITLE,DESCRIPTION,FILEPATH,UPLOADEDBY,SYLLABUS,SOLUTIONFILE,COURSEID,UPLOADDATE FROM VCS_SCHEMA.FILES WHERE FILETYPE=" + fileType + " ORDER BY (UPLOADDATE) DESC";
			} else if(level.equals("3")) {
				sql = "SELECT FILEID,TITLE,DESCRIPTION,FILEPATH,UPLOADEDBY,SYLLABUS,SOLUTIONFILE,COURSEID,UPLOADDATE FROM VCS_SCHEMA.FILES WHERE FILETYPE=" + fileType + " ORDER BY (UPLOADDATE) DESC";
			}
		}
		
		System.out.println("SQL Query in Files Selection:" + sql);
		
		ArrayList<FileBean> allFiles = new ArrayList<FileBean>();
		
		try {
			state=con.createStatement();
			res = state.executeQuery(sql);
			Utilities util = new Utilities();
			while(res.next()) {
				if(level.equals("0") || level.equals("2")) {
					String courseIDString = res.getString("courseID");
					if(courseIDString != null) {
						ArrayList<String> courseIDs = util.getSeparateValue(courseIDString);
						
						for(int i = 0; i < courseIDs.size() ; i++) {
							String cid = (String)courseIDs.get(i);
							if(cid.equals(courseID)) {
								FileBean fileBean = new FileBean();
								
								fileBean.setFileID(res.getString("FILEID"));
								fileBean.setTitle(res.getString("TITLE"));
								fileBean.setDescription(res.getString("description"));
								fileBean.setFilePath(res.getString("filePath"));
								fileBean.setUploadDate(res.getString("uploadDate"));
								
								String uploadedBy = res.getString("uploadedBy");
								com.ignou.vcs.commons.database.CommonsDatabaseActivities dbObject = new com.ignou.vcs.commons.database.CommonsDatabaseActivities();
								UserBean userBean = (UserBean)dbObject.getUserInfo(uploadedBy);
								fileBean.setUploadedBy(userBean.getName());
												
								if(fileType.equals("1")) {
									fileBean.setTopics(res.getString("topics"));
									fileBean.setImage(res.getString("image"));
								} else if(fileType.equals("2")) {
									fileBean.setSyllabus(res.getString("syllabus"));
									fileBean.setSolutionFile(res.getString("solutionFile"));
								}
								
								allFiles.add(fileBean);
							}
						}
					}
					
				} else if(level.equals("1")) {
					String subjectIDString = res.getString("subjectID");
					if(subjectIDString != null) {
						ArrayList<String> subjectIDs = util.getSeparateValue(subjectIDString);
						
						for(int i = 0; i < subjectIDs.size() ; i++) {
							String sid = (String)subjectIDs.get(i);
							if(sid.equals(subjectID)) {
								FileBean fileBean = new FileBean();
								
								fileBean.setFileID(res.getString("FILEID"));
								fileBean.setTitle(res.getString("TITLE"));
								fileBean.setDescription(res.getString("description"));
								fileBean.setFilePath(res.getString("filePath"));
								fileBean.setUploadDate(res.getString("uploadDate"));
								
								String uploadedBy = res.getString("uploadedBy");
								com.ignou.vcs.commons.database.CommonsDatabaseActivities dbObject = new com.ignou.vcs.commons.database.CommonsDatabaseActivities();
								UserBean userBean = (UserBean)dbObject.getUserInfo(uploadedBy);
								fileBean.setUploadedBy(userBean.getName());
												
								if(fileType.equals("1")) {
									fileBean.setTopics(res.getString("topics"));
									fileBean.setImage(res.getString("image"));
								} else if(fileType.equals("2")) {
									fileBean.setSyllabus(res.getString("syllabus"));
									fileBean.setSolutionFile(res.getString("solutionFile"));
								}
								
								allFiles.add(fileBean);
							}
						}
					}
					
				} else if(level.equals("3")) {
					FileBean fileBean = new FileBean();
					
					fileBean.setFileID(res.getString("FILEID"));
					fileBean.setTitle(res.getString("TITLE"));
					fileBean.setDescription(res.getString("description"));
					fileBean.setFilePath(res.getString("filePath"));
					fileBean.setUploadDate(res.getString("uploadDate"));
					System.out.println("FILEID:" + fileBean.getFileID());
					String uploadedBy = res.getString("uploadedBy");
					com.ignou.vcs.commons.database.CommonsDatabaseActivities dbObject = new com.ignou.vcs.commons.database.CommonsDatabaseActivities();
					UserBean userBean = (UserBean)dbObject.getUserInfo(uploadedBy);
					fileBean.setUploadedBy(userBean.getName());
									
					if(fileType.equals("1")) {
						fileBean.setTopics(res.getString("topics"));
					} else if(fileType.equals("2")) {
						fileBean.setSyllabus(res.getString("syllabus"));
						fileBean.setSolutionFile(res.getString("solutionFile"));
					}
					
					allFiles.add(fileBean);
					
				}
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return allFiles;
	}

	public SolutionBean solutionExists(String fileId, String userId) {
		ResultSet res = null;
		Statement state = null;
		int count = 0;

		boolean exists = false;
		String sql = "SELECT APPROVED,FEEDBACK FROM VCS_SCHEMA.STUDENT_SOLUTIONS WHERE FILEID="+ fileId + " AND USERID='" + userId +"'";
		System.out.println("query:" + sql);
		SolutionBean solutionBean = new SolutionBean();
		try {
			state=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			res = state.executeQuery(sql);
			while(res.next()) {
				exists = true;
				solutionBean.setFeedback((res.getString("FEEDBACK")));
				solutionBean.setApproved((res.getString("APPROVED")));
				count ++;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		solutionBean.setSolutionExists(exists);
		
		return solutionBean;
	}

	public void insertSolution(String fileId, String userId, String solutionFileName) {
		Statement state = null;
		Utilities util = new Utilities();
		
		String sql = "INSERT INTO VCS_SCHEMA.STUDENT_SOLUTIONS(FILEID,USERID,APPROVED,ANSWERFILE,SUBMITDATE) VALUES ("+fileId+",'"+userId+"',0,'"+solutionFileName+"','"+util.getCurrentDateInDB2Format()+"')";
		System.out.println("SOLUTION INSERTION QUERY:" + sql);
		try {
			state=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			state.execute(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public String getSolutionId() {
		String solutionID = "";
		ResultSet res = null;
		Statement state = null;
		String sql2 = "SELECT MAX(SOLUTIONID) FROM VCS_SCHEMA.STUDENT_SOLUTIONS";
		System.out.println("quiry:" + sql2);
		int solutionIdNum = 0;
		try {
			state=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			res = state.executeQuery(sql2);
			
			while(res.next()) {
				solutionID = res.getString(1);
				System.out.println("Solution Id Here:" + solutionID);
			}
			if(solutionID == null) {
				solutionIdNum = 1;
			} else {
				solutionIdNum = Integer.parseInt(solutionID);
				solutionIdNum ++;
				
			}
			solutionID = solutionIdNum + "";
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return solutionID;
		
	}

	public ArrayList<SolutionBean> getStudentSolutions (String fileId) {
		ResultSet res = null;
		Statement state = null;
		String sql2 = "SELECT solutionID,UserId,submitDate,answerFile,approved,feedback FROM VCS_SCHEMA.STUDENT_SOLUTIONS Where fileId=" +fileId +" order by (submitDate)" ;
		System.out.println("quiry:" + sql2);
		ArrayList<SolutionBean> allSolutions = new ArrayList<SolutionBean>();
		
		try {
			state=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			res = state.executeQuery(sql2);
			while(res.next()) {
				SolutionBean solutionBean = new SolutionBean();
				solutionBean.setFileId(fileId);
				solutionBean.setAnswerFile(res.getString("answerFile"));
				solutionBean.setSubmitDate(res.getString("submitDate"));
				solutionBean.setUserID(res.getString("userId"));
				solutionBean.setApproved(res.getString("approved"));
				solutionBean.setFeedback(res.getString("feedback"));
				solutionBean.setSolutionID(res.getString("solutionID"));	
				allSolutions.add(solutionBean);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return allSolutions;
			
	}

	public void insertFeedback(String solutionId, String feedback, String status) {
		Statement state = null;
		
		String sql = "Update vcs_schema.student_solutions set feedback='" + feedback + "' , approved=" + status + " where solutionid=" + solutionId ;
		System.out.println("SOLUTION INSERTION QUERY:" + sql);
		try {
			state=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			state.execute(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList<FileBean> getLectures(String courseID, String level, String subjectID, String userID ) {
		ResultSet res = null;
		Statement state = null;
		String sql = "";
		
		if(level.equals("1")) {
			sql = "SELECT FILEID,TITLE,DESCRIPTION,FILEPATH,UPLOADEDBY,TOPICS,SUBJECTID,COURSEID,UPLOADDATE FROM VCS_SCHEMA.FILES WHERE (UPLOADEDTO='" + level + "' OR UPLOADEDBY='" +userID + "') AND FILETYPE=" + 1 + " ORDER BY (UPLOADDATE) DESC";
		} else if(level.equals("0")) {
			sql = "SELECT FILEID,TITLE,DESCRIPTION,FILEPATH,UPLOADEDBY,TOPICS,COURSEID,SUBJECTID,UPLOADDATE FROM VCS_SCHEMA.FILES WHERE (UPLOADEDTO='" + level + "' OR UPLOADEDBY='" +userID + "') AND FILETYPE=" + 1 + " ORDER BY (UPLOADDATE) DESC";
		}
		
		System.out.println("SQL Query in Files Selection:" + sql);
		
		ArrayList<FileBean> allFiles = new ArrayList<FileBean>();
		
		try {
			state=con.createStatement();
			res = state.executeQuery(sql);
			Utilities util = new Utilities();
			while(res.next()) {
				FileBean fileBean = new FileBean();
				fileBean.setFileID(res.getString("FILEID"));
				fileBean.setTitle(res.getString("TITLE"));
				fileBean.setDescription(res.getString("description"));
				fileBean.setFilePath(res.getString("filePath"));
				fileBean.setUploadDate(res.getString("uploadDate"));
				//fileBean.setImage(res.getString("image"));
				String uploadedBy = res.getString("uploadedBy");
				com.ignou.vcs.commons.database.CommonsDatabaseActivities dbObject = new com.ignou.vcs.commons.database.CommonsDatabaseActivities();
				UserBean userBean = (UserBean)dbObject.getUserInfo(uploadedBy);
				fileBean.setUploadedBy(userBean.getName());
								
				fileBean.setTopics(res.getString("topics"));
				if(level.equals("1")) {
					fileBean.setCourseID(res.getString("courseID"));
				} else if(level.equals("0")) {
					fileBean.setSubjectID(res.getString("subjectID"));
				}
				allFiles.add(fileBean);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return allFiles;
	}
}