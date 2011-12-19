package com.ignou.vcs.forums.beans;

import java.util.Date;

public class PollStatusBean 
{
 private int pollId;
 private String pollOption="";
 private String selectedBy;
 private Date selectionDate;
 
 public void setPollId(int pollId)
 {
	 this.pollId = pollId;
 }
 public int getPollId()
 {
	 return pollId;
 }
 
 public void setPollOption(String pollOption)
 {
	 this.pollOption = pollOption;
 }
 public String getPollOption()
 {
	 return pollOption;
 }
 
 public void setSelectedBy(String selectedBy)
 {
	 this.selectedBy = selectedBy;
 }
 public String getSelectedBy()
 {
	 return selectedBy;
 }
 
 public void setSelectionDate(Date selectionDate)
 {
	 this.selectionDate = selectionDate;
 }
 public Date getSelectionDate()
 {
	 return selectionDate;
 }
 
}
