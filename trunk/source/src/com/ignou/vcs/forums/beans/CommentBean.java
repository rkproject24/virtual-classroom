package com.ignou.vcs.forums.beans;

import java.util.Date;

public class CommentBean 
{
	int postId;
	int commentId;
	String commentDescription;
	String commentedBy;
	Date commentDate;
	
	public int getPostId() 
	{
		return postId;
	}
	public void setPostId(int postId) 
	{
		this.postId = postId;
	}
	
	public int getCommentId() 
	{
		return commentId;
	}
	public void setCommentId(int commentId) 
	{
		this.commentId = commentId;
	}
	
	public String getCommentDescription() 
	{
		return commentDescription;
	}
	public void setCommentDescription(String commentDescription) 
	{
		this.commentDescription = commentDescription;
	}
	
	public String getCommentedBy() 
	{
		return commentedBy;
	}
	public void setCommentedBy(String commentedBy) 
	{
		this.commentedBy = commentedBy;
	}
	
	public Date getCommentDate() 
	{
		return commentDate;
	}
	public void setCommentDate(Date commentDate) 
	{
		this.commentDate = commentDate;
	}
	
	
}
