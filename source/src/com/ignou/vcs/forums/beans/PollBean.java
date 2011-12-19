package com.ignou.vcs.forums.beans;

import java.util.ArrayList;
import java.util.Date;

public class PollBean 
{
 private int pollId;
 private String pollQuestion="";
 private ArrayList<String> pollOptions;
 private String pollCreatedBy;
 private int pollStatus;
 private Date pollCreationDate;
 
 public void setPollId(int pollId)
 {
	 this.pollId = pollId;
 }
 public int getPollId()
 {
	 return pollId;
 }
 
 public void setPollQuestion(String pollQuestion)
 {
	 this.pollQuestion = pollQuestion;
 }
 public String getPollQuestion()
 {
	 return pollQuestion;
 }
 
 public void setPollOptions(ArrayList<String> pollOptions)
 {
	 this.pollOptions = pollOptions;
 }
 public ArrayList<String> getPollOptions()
 {
	 return pollOptions;
 }
 
 public void setPollCreatedBy(String pollCreatedBy)
 {
	 this.pollCreatedBy = pollCreatedBy;
 }
 public String getPollCreatedBy()
 {
	 return pollCreatedBy;
 }
 
 public void setPollStatus(int pollStatus)
 {
	 this.pollStatus = pollStatus;
 }
 public int getPollStatus()
 {
	 return pollStatus;
 }
 
 public void setPollCreatedDate(Date pollCreatedDate)
 {
	 this.pollCreationDate = pollCreatedDate;
 }
 public Date getPollCreatedDate()
 {
	 return pollCreationDate;
 }
 
}
