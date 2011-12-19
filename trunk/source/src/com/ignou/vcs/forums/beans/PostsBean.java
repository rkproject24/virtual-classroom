package com.ignou.vcs.forums.beans;

import java.util.Date;

public class PostsBean 
{
	int postId;
	int subjectId;
	String postTitle;
	String postDescription;
	String postedBy;
	Date postedDate;
	int noOfComments;
	
	public int getPostId() 
	{
		return postId;
	}
	public void setPostId(int postId) 
	{
		this.postId = postId;
	}
	
	public int getSubjectId() 
	{
		return subjectId;
	}
	public void setSubjectId(int subjectId) 
	{
		this.subjectId = subjectId;
	}
	
	public int getNoOfComments() 
	{
		return noOfComments;
	}
	public void setNoOfComments(int noOfComments) 
	{
		this.noOfComments = noOfComments;
	}
	
	public String getPostTitle() 
	{
		return postTitle;
	}
	public void setPostTitle(String postTitle) 
	{
		this.postTitle = postTitle;
	}
	
	public String getPostDescription() 
	{
		return postDescription;
	}
	public void setPostDescription(String postDescription) 
	{
		this.postDescription = postDescription;
	}
	
	public String getPostBy() 
	{
		return postedBy;
	}
	public void setPostBy(String postedBy) 
	{
		this.postedBy = postedBy;
	}
	
	public Date getPostedDate() 
	{
		return postedDate;
	}
	public void setPostedDate(Date postedDate) 
	{
		this.postedDate = postedDate;
	}
	
	
}
