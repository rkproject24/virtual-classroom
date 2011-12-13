package com.ignou.vcs.notices.database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.sql.DataSource;

import com.ignou.vcs.commons.Utilities;
import com.ignou.vcs.commons.beans.UserBean;
import com.ignou.vcs.datasource.DataSourceFactory;
import com.ignou.vcs.notices.beans.Notice;



public class NoticesDatabaseActivities {
	
	Connection con = null;
	
	public NoticesDatabaseActivities()
	{
		if(con == null)
		{
			con = DataSourceFactory.getConnection();
		}
	}
	
	/**
	 * Function to fetch all Notices from database
	 * @param userID
	 * @param courseID
	 * @param subjectID
	 * @return
	 */
	public ArrayList<Notice> getAllNotices(String userID, String courseID, String subjectID) {
		ResultSet res=null;
		Statement state=null;
		ArrayList<Notice> allNotices = new ArrayList<Notice>();
		
		Utilities util = new Utilities();
		com.ignou.vcs.commons.database.CommonsDatabaseActivities dbObject = new com.ignou.vcs.commons.database.CommonsDatabaseActivities();
		UserBean userBean  = dbObject.getUserInfo(userID);
		String userLevel = userBean.getLevel();
		
		String sql = "SELECT noticeid, Description, Title, PostedTo, PostedBy, PostingDate, Courseid from NOTICES where subjectid=" + subjectID + " ORDER BY (postingDate) DESC"  ;
		if(courseID.equals("0") && subjectID.equals("0")) {
			sql = "SELECT noticeid, Description, Title, PostedTo, PostedBy, PostingDate, Courseid from NOTICES WHERE courseid IS NULL and subjectid IS NULL  ORDER BY (postingDate) DESC";
		} 
		if(userID.equals("admin")) {
			sql = "SELECT noticeid, Description, Title, PostedTo, PostedBy, PostingDate, Courseid from NOTICES ORDER BY (postingDate) DESC";
			
		}
		
		System.out.println("Notices Query: " + sql);
				
		try {
			state=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			res=state.executeQuery(sql);
			
			while(res.next()) {
				//SETTING DATA FOR ADMIN
				if(userID.equals("admin")) {
					String courseIdNotice = res.getString("courseid");
					System.out.println("Course ID in notice:" + courseIdNotice);
					if(courseIdNotice == null && courseID.equals("0")) {
						Notice notice = new Notice();
						notice.setNoticeID(res.getString("noticeID"));
						notice.setDescription(res.getString("description"));
						String postedBy = res.getString("postedBy");
						UserBean facBean = dbObject.getUserInfo(postedBy);
						
						notice.setPostedBy(facBean.getName());
						notice.setPostingDate(res.getString("postingDate"));
						notice.setTitle(res.getString("title"));
						
						allNotices.add(notice);
					} else if(courseIdNotice != null) {
						
						ArrayList<String> courses = util.getSeparateValue(courseIdNotice);
						System.out.println("Size:" + courses.size());
						for (int i = 0 ; i < courses.size() ; i++ ) {
							String cid = (String)courses.get(i);
							if(cid.equals(courseID)) {
								Notice notice = new Notice();
								notice.setNoticeID(res.getString("noticeID"));
								notice.setDescription(res.getString("description"));
								String postedBy = res.getString("postedBy");
								UserBean facBean = dbObject.getUserInfo(postedBy);
								
								notice.setPostedBy(facBean.getName());
								notice.setPostingDate(res.getString("postingDate"));
								notice.setTitle(res.getString("title"));
								
								allNotices.add(notice);
								break;
							}
						}
					}
					
				} else {
					String postedTo = res.getString("postedTo");
					ArrayList<String> postedTospearate = util.getSeparateValue(postedTo); 
					for(int j = 0; j < postedTospearate.size(); j++) {
						String postedToLevel = (String)postedTospearate.get(j);
						if(postedToLevel.equals(userLevel)) {
							if(courseID.equals("0")) {
								Notice notice = new Notice();
								notice.setNoticeID(res.getString("noticeID"));
								notice.setDescription(res.getString("description"));
								String postedBy = res.getString("postedBy");
								UserBean facBean = dbObject.getUserInfo(postedBy);
								System.out.println("Desc:" + notice.getDescription());
								notice.setPostedBy(facBean.getName());
								notice.setPostingDate(res.getString("postingDate"));
								notice.setTitle(res.getString("title"));
								
								allNotices.add(notice);
								break;
							}
							String courseIdNotice = res.getString("courseid");
							System.out.println("Course ID in notice:" + courseIdNotice);
							ArrayList<String> courses = util.getSeparateValue(courseIdNotice);
							System.out.println("Size:" + courses.size());
							for (int i = 0 ; i < courses.size() ; i++ ) {
								String cid = (String)courses.get(i);
								if(cid.equals(courseID) || courseID.equals("0")) {
									Notice notice = new Notice();
									notice.setNoticeID(res.getString("noticeID"));
									notice.setDescription(res.getString("description"));
									String postedBy = res.getString("postedBy");
									UserBean facBean = dbObject.getUserInfo(postedBy);
									
									notice.setPostedBy(facBean.getName());
									notice.setPostingDate(res.getString("postingDate"));
									notice.setTitle(res.getString("title"));
									
									allNotices.add(notice);
									break;
								}
							}
						}
					}
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return allNotices;
	}
	
	
	public void insertNotice(String keyword, String description, String postedTo, String postedBy, String expiryDate, String title, String courseID, String subjectID) {
		Statement state=null;
		Utilities util = new Utilities();
		String postingDate = util.getCurrentDateInDB2Format();
		String sql = "";
		if(courseID.equals("null")) {
			sql = "INSERT INTO NOTICES (keyword , description , postedTo , postedBy , postingDate , expiresOn , title , courseID , subjectID,ARCHIVED) VALUES ('"
				+ keyword
				+ "','"
				+ description
				+ "','"
				+ postedTo
				+ "','"
				+ postedBy
				+ "','"
				+ postingDate
				+ "','"
				+ expiryDate
				+ "','"
				+ title + "',NULL,NULL,0)";  
		
		} else {
			sql = "INSERT INTO NOTICES (keyword , description , postedTo , postedBy , postingDate , expiresOn , title , courseID , subjectID,ARCHIVED) VALUES ('"
				+ keyword
				+ "','"
				+ description
				+ "','"
				+ postedTo
				+ "','"
				+ postedBy
				+ "','"
				+ postingDate
				+ "','"
				+ expiryDate
				+ "','"
				+ title + "','" + courseID + "'," + subjectID + ",0)";  
		
		}
		
		System.out.println("Insertion Query:" + sql);
		try {
			state=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			int rowsAffected = state.executeUpdate(sql);
			System.out.println("Rows Afftected:" + rowsAffected);
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList<Notice> getNotices()
	{
		ArrayList<Notice> list = new ArrayList<Notice>();
		ResultSet res=null;
		Statement state=null;
		com.ignou.vcs.commons.database.CommonsDatabaseActivities dbObject = new com.ignou.vcs.commons.database.CommonsDatabaseActivities();
		String query = "SELECT * FROM NOTICES ORDER BY POSTINGDATE DESC";
		try {
			state=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			res=state.executeQuery(query);
		
			while(res.next())
			{
				Notice notice = new Notice();
				notice.setNoticeID(res.getString("noticeID"));
				notice.setDescription(res.getString("description"));
				UserBean facBean = dbObject.getUserInfo(res.getString("postedBy"));
				notice.setPostedBy(facBean.getName());
				notice.setPostingDate(res.getString("postingDate"));
				notice.setTitle(res.getString("title"));
				list.add(notice);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public void deleteNotice(String noticeid)
	{
		ResultSet res=null;
		Statement state=null;
		
		String query = "DELETE FROM NOTICES WHERE NOTICEID = " + noticeid;
		System.out.println(query);
		try {
			state=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			int rows =state.executeUpdate(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}