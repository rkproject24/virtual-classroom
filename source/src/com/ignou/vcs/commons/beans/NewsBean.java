package com.ignou.vcs.commons.beans;

public class NewsBean {
	
	int newsId;
	String date;
	String description;
	String title;
	String externalLinks = "";
	
	public String getDate() 
	{
		return date;
	}
	public void setDate(String date) 
	{
		this.date = date;
	}
	
	public String getDescription() 
	{
		return description;
	}
	public void setDescription(String description) 
	{
		this.description = description;
	}
	
	public int getNewsId() 
	{
		return newsId;
	}
	public void setNewsId(int newsId) 
	{
		this.newsId = newsId;
	}
	
	public String getTitle() 
	{
		return title;
	}
	public void setTitle(String title) 
	{
		this.title = title;
	}
	
	public String getExternalLinks() 
	{
		return externalLinks;
	}
	public void setExternalLinks(String externalLinks) 
	{
		this.externalLinks = externalLinks;
	}

}
