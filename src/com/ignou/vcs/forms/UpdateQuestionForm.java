package com.ignou.vcs.forms;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 * Form bean for a Struts application.
 * Users may access 2 fields on this form:
 * <ul>
 * <li>username - [your comment here]
 * <li>password - [your comment here]
 * </ul>
 * @version 	1.0
 * @author
 */
public class UpdateQuestionForm extends ActionForm
{
	String question;
	String options;
	String correctAnswer;
	
	public String getCorrectAnswer() 
	{
		return correctAnswer;
	}
	public void setCorrectAnswer(String correctAnswer) 
	{
		this.correctAnswer = correctAnswer;
	}
	
	public String getQuestion() 
	{
		return question;
	}
	public void setQuestion(String question) 
	{
		this.question = question;
	}
	
	public String getOptions() 
	{
		return options;
	}
	public void setOptions(String options) 
	{
		this.options = options;
	}
	

    public void reset(ActionMapping mapping, HttpServletRequest request) 
    {
	// Reset values are provided as samples only. Change as appropriate.
    	question = null;
    	options = null;
    	correctAnswer = null;
    }

    public ActionErrors validate(ActionMapping mapping,
	    HttpServletRequest request) {

	ActionErrors errors = new ActionErrors();
	// Validate the fields in your form, adding
	// adding each error to this.errors as found, e.g.

	 if ((getQuestion() == null) || (getQuestion().length() == 0)) 
	 {
	   errors.add("question", new ActionError("error.questions.question"));
	 }else if ((getOptions() == null) || (getOptions().length() == 0)) 
	 {
		   errors.add("options", new ActionError("error.questions.options"));
	 }else if ((getCorrectAnswer() == null) || (getCorrectAnswer().length() == 0)) 
	 {
		   errors.add("correctAnswer", new ActionError("error.questions.correctAnswer"));
	 }	 
	 
	return errors;

    }
    
}
