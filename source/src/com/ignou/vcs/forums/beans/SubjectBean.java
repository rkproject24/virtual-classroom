package com.ignou.vcs.forums.beans;

import java.util.Date;

public class SubjectBean 
{
	int subjectId;
	int noOfPosts;
	String lastPost;
	String subjectName;
	Date lastPostedDate;
	String lastPostedBy;
	int postId;
	
	public int getSubjectId() 
	{
		return subjectId;
	}
	public void setSubjectId(int subjectId) 
	{
		this.subjectId = subjectId;
	}
	
	public int getPostId() 
	{
		return postId;
	}
	public void setPostId(int postId) 
	{
		this.postId = postId;
	}
	
	public String getSubjectName() 
	{
		return subjectName;
	}
	public void setSubjectName(String subjectName) 
	{
		this.subjectName = subjectName;
	}
	
	public String getLastPost() 
	{
		return lastPost;
	}
	public void setLastPost(String lastPost) 
	{
		this.lastPost = lastPost;
	}
	
	public String getLastPostedBy() 
	{
		return lastPostedBy;
	}
	public void setLastPostedBy(String lastPostedBy) 
	{
		this.lastPostedBy = lastPostedBy;
	}
	
	public int getNoOfPosts() 
	{
		return noOfPosts;
	}
	public void setNoOfPosts(int noOfPosts) 
	{
		this.noOfPosts = noOfPosts;
	}
	
	public Date getLastPostedDate() 
	{
		return lastPostedDate;
	}
	public void setLastPostedDate(Date lastPostedDate) 
	{
		this.lastPostedDate = lastPostedDate;
	}
}
