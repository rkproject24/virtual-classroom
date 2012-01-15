package com.ignou.vcs.forums;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.sql.Date;
import java.util.StringTokenizer;
import com.ignou.vcs.forums.beans.SubjectBean;
import com.ignou.vcs.datasource.DataSourceFactory;
import com.ignou.vcs.forums.beans.CommentBean;
import com.ignou.vcs.forums.beans.PollBean;
import com.ignou.vcs.forums.beans.PollStatusBean;
import com.ignou.vcs.forums.beans.PostsBean;

public class ForumDatabaseOperations 
{
	private static Connection conn = null;
	
	public static PollBean getPollQuestion()
	{
		PollBean pb = null;
		if(conn==null)
		{
			conn = DataSourceFactory.getConnection();
		}
		
		try
		{
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("Select * from Polls where status=0");
			if(rs.next())
			{
				pb = new PollBean();
				pb.setPollId(rs.getInt(1));
				pb.setPollQuestion(rs.getString(2));
				StringTokenizer st = new StringTokenizer(rs.getString(3),"|");
				ArrayList<String> pollOptions = new ArrayList<String>();
				while(st.hasMoreTokens())
				{
					String option = st.nextToken();
					pollOptions.add(option);
				}
				pb.setPollOptions(pollOptions);
				pb.setPollCreatedBy(rs.getString(4));
				pb.setPollCreatedDate(rs.getDate(5));
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return pb;
	}
	
	public static ArrayList<PollBean> getAllPolls()
	{
		ArrayList<PollBean> allPolls = new ArrayList<PollBean>();
		
		if(conn==null)
		{
			conn = DataSourceFactory.getConnection();
		}
		
		try
		{
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("Select * from Polls");
			while(rs.next())
			{
				PollBean pb = null;
				pb = new PollBean();
				pb.setPollId(rs.getInt(1));
				pb.setPollQuestion(rs.getString(2));
				StringTokenizer st = new StringTokenizer(rs.getString(3),"|");
				ArrayList<String> pollOptions = new ArrayList<String>();
				while(st.hasMoreTokens())
				{
					String option = st.nextToken();
					pollOptions.add(option);
				}
				pb.setPollOptions(pollOptions);
				pb.setPollCreatedBy(rs.getString(4));
				pb.setPollCreatedDate(rs.getDate(5));
				pb.setPollStatus(rs.getInt(6));
				allPolls.add(pb);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return allPolls;
	}
	
	public static Boolean isPolled(int pollId,String userName)
	{
		Boolean isPoll = false;
		if(conn==null)
		{
			conn = DataSourceFactory.getConnection();
		}
		
		try
		{
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("Select * from Pollstatus where pollid="+pollId+" AND SelectionBy='"+userName+"'");
			if(rs.next())
			{
				isPoll = true;
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return isPoll;
	}
	
	public static Boolean updatePoll(PollStatusBean psb)
	{
		Boolean isSubmitted = false;
		
		if(conn==null)
		{
			conn = DataSourceFactory.getConnection();
		}
		Calendar cal = Calendar.getInstance();
		Date dd = new Date(cal.getTimeInMillis());
		try
		{
			String query = "insert into pollstatus (pollId,selectedOption,selectionBy," +
					"selectionDate) values (?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, psb.getPollId());
			pstmt.setString(2, psb.getPollOption());
			pstmt.setString(3, psb.getSelectedBy());
			pstmt.setDate(4, dd);
			
			int i = pstmt.executeUpdate();
			if(i==1)
			{
				isSubmitted = true;
			}
			else
			{
				isSubmitted = false;
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return isSubmitted;
	}
	
	public static Boolean updatePollStatus(int pollId)
	{
		Boolean isSubmitted = false;
		
		if(conn==null)
		{
			conn = DataSourceFactory.getConnection();
		}
		
		try
		{
			String query = "update polls set status=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, 1);
			int i = pstmt.executeUpdate();
			if(i>0)
			{
				query = "update polls set status=? where pollid=?";
				PreparedStatement pstmt1 = conn.prepareStatement(query);
				pstmt1.setInt(1, 0);
				pstmt1.setInt(2, pollId);
				
				int ii = pstmt1.executeUpdate();
				if(ii==1)
				{
					isSubmitted = true;
				}else
				{
					isSubmitted = false;
				}
				
			}
			else
			{
				isSubmitted = false;
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return isSubmitted;
	}
	
	public static Boolean insertPoll(PollBean pb)
	{
		Boolean isSubmitted = false;
		
		if(conn==null)
		{
			conn = DataSourceFactory.getConnection();
		}
		Calendar cal = Calendar.getInstance();
		Date dd = new Date(cal.getTimeInMillis());
		try
		{
			String query = "insert into polls (pollQuestion,pollOptions,createdBy," +
					"creationDate,status) values (?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, pb.getPollQuestion());
			String options = "";
			for(int i=0;i<pb.getPollOptions().size();i++)
			{
				if(i==pb.getPollOptions().size()-1)
				{
					options += pb.getPollOptions().get(i);
				}else
				{
					options += pb.getPollOptions().get(i) +"|";
				}
			}
			pstmt.setString(2, options);
			pstmt.setString(3, pb.getPollCreatedBy());
			pstmt.setDate(4, dd);
			pstmt.setInt(5, 1);
			
			int i = pstmt.executeUpdate();
			if(i==1)
			{
				isSubmitted = true;
			}
			else
			{
				isSubmitted = false;
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return isSubmitted;
	}
	
	public static ArrayList<SubjectBean> getAllSubjects()
	{
		ArrayList<SubjectBean> allSubjects = new ArrayList<SubjectBean>();
		
		if(conn==null)
		{
			conn = DataSourceFactory.getConnection();
		}
		
		try
		{
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("Select * from subjects");
			while(rs.next())
			{
				SubjectBean sb = new SubjectBean();
				Statement stmt1 = conn.createStatement();
				int noOfPosts=0;
				int postId=0;
				String lastPost="";
				String lastPostBy = "";
				Date lastPostDate=null;
				//ResultSet rs1 = stmt1.executeQuery("select count(*) from posts where subjectId="+rs.getInt(1));
				ResultSet rs1 = stmt1.executeQuery("select max(postedDate) as lastPost,count(*) as posts from posts where subjectId="+rs.getInt(1));
				if(rs1.next())
				{
					lastPostDate = rs1.getDate(1);
					noOfPosts = rs1.getInt(2);
				}
				rs1 = stmt1.executeQuery("select postID,posttitle,postedBy from posts where posteddate='"+lastPostDate+"'");
				if(rs1.next())
				{
					postId = rs1.getInt(1);
					lastPost = rs1.getString(2);
					lastPostBy = rs1.getString(3);
				}
				sb.setPostId(postId);
				sb.setSubjectId(rs.getInt(1));
				sb.setSubjectName(rs.getString(2));
				sb.setNoOfPosts(noOfPosts);
				sb.setLastPost(lastPost);
				sb.setLastPostedBy(lastPostBy);
				sb.setLastPostedDate(lastPostDate);
				allSubjects.add(sb);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return allSubjects;
	}
	
	public static ArrayList<PostsBean> getPosts(int subjectId)
	{
		ArrayList<PostsBean> allPosts = new ArrayList<PostsBean>();
		
		if(conn==null)
		{
			conn = DataSourceFactory.getConnection();
		}
		
		try
		{
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("Select * from posts where subjectId="+subjectId+" AND poststatus='active'");
			while(rs.next())
			{
				PostsBean post = new PostsBean();
				post.setPostId(rs.getInt(1));
				Statement stmt1 = conn.createStatement();
				ResultSet rs1 = stmt1.executeQuery("select count(*) from comments where postID="+post.getPostId());
				int noofComments = 0;
				if(rs1.next())
				{
					noofComments = rs1.getInt(1);
				}
				post.setNoOfComments(noofComments);
				post.setPostTitle(rs.getString(2));
				post.setPostDescription(rs.getString(3));
				post.setSubjectId(rs.getInt(4));
				post.setPostBy(rs.getString(5));
				post.setPostedDate(rs.getDate(6));
				allPosts.add(post);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return allPosts;
	}
	
	public static PostsBean getPost(int postId)
	{
		PostsBean post = new PostsBean();
		
		if(conn==null)
		{
			conn = DataSourceFactory.getConnection();
		}
		
		try
		{
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("Select * from posts where postId="+postId+" AND poststatus='active'");
			while(rs.next())
			{
				post.setPostId(rs.getInt(1));
				post.setPostTitle(rs.getString(2));
				post.setPostDescription(rs.getString(3));
				post.setSubjectId(rs.getInt(4));
				post.setPostBy(rs.getString(5));
				post.setPostedDate(rs.getDate(6));
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return post;
	}
	
	public static ArrayList<PostsBean> getPostByUser(String userName)
	{
		ArrayList<PostsBean> posts = new ArrayList<PostsBean>();
		
		if(conn==null)
		{
			conn = DataSourceFactory.getConnection();
		}
		
		try
		{
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("Select * from posts where postedBy='"+userName+"' AND poststatus='active'");
			while(rs.next())
			{
				PostsBean post = new PostsBean();
				post.setPostId(rs.getInt(1));
				post.setPostTitle(rs.getString(2));
				post.setPostDescription(rs.getString(3));
				post.setSubjectId(rs.getInt(4));
				post.setPostBy(rs.getString(5));
				post.setPostedDate(rs.getDate(6));
				posts.add(post);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return posts;
	}
	
	
	public static ArrayList<CommentBean> getComments(int postId)
	{
		ArrayList<CommentBean> allComments = new ArrayList<CommentBean>();
		
		if(conn==null)
		{
			conn = DataSourceFactory.getConnection();
		}
		
		try
		{
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("Select * from comments where postId="+postId+" AND commentstatus='active'");
			while(rs.next())
			{
				CommentBean cb = new CommentBean();
				cb.setCommentId(rs.getInt(1));
				cb.setCommentDescription(rs.getString(2));
				cb.setPostId(rs.getInt(3));
				cb.setCommentedBy(rs.getString(4));
				cb.setCommentDate(rs.getDate(5));
				allComments.add(cb);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return allComments;
	}

	public static Boolean insertPost(PostsBean pb)
	{
		Boolean isSubmitted = false;
		
		if(conn==null)
		{
			conn = DataSourceFactory.getConnection();
		}
		Calendar cal = Calendar.getInstance();
		Date dd = new Date(cal.getTimeInMillis());
		try
		{
			String query = "insert into posts (posttitle,postdescription,subjectId," +
					"postedBy,postedDate,poststatus) values (?,?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, pb.getPostTitle());
			pstmt.setString(2, pb.getPostDescription());
			pstmt.setInt(3, pb.getSubjectId());
			pstmt.setString(4, pb.getPostBy());
			pstmt.setDate(5, dd);
			pstmt.setString(6, "active");
			
			int i = pstmt.executeUpdate();
			if(i==1)
			{
				isSubmitted = true;
			}
			else
			{
				isSubmitted = false;
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return isSubmitted;
	}

	public static Boolean insertComment(CommentBean pb)
	{
		Boolean isSubmitted = false;
		
		if(conn==null)
		{
			conn = DataSourceFactory.getConnection();
		}
		Calendar cal = Calendar.getInstance();
		Date dd = new Date(cal.getTimeInMillis());
		try
		{
			String query = "insert into comments (commentdescription,postId," +
					"commentedBy,commentedDate,commentstatus) values (?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, pb.getCommentDescription());
			pstmt.setInt(2, pb.getPostId());
			pstmt.setString(3, pb.getCommentedBy());
			pstmt.setDate(4, dd);
			pstmt.setString(5, "active");
			
			int i = pstmt.executeUpdate();
			if(i==1)
			{
				isSubmitted = true;
			}
			else
			{
				isSubmitted = false;
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return isSubmitted;
	}


}
