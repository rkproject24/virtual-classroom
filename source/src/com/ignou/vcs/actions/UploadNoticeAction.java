package com.ignou.vcs.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.ignou.vcs.commons.beans.UserBean;
import com.ignou.vcs.commons.database.CommonsDatabaseActivities;
import com.ignou.vcs.forms.NoticeForm;
/**
 * @version 	1.0
 * @author Pradeepthi S
 */
public class UploadNoticeAction extends Action
{
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        ActionErrors errors = new ActionErrors();
        ActionForward forward = new ActionForward(); // return value
        
        String userID = (String)request.getSession().getAttribute("userId");
        NoticeForm noticeForm = (NoticeForm)form;
        
        String postedTo = request.getParameter("postedToValues");
        String courseID = request.getParameter("courseIDValues");
        
        postedTo = postedTo.substring(0, (postedTo.length()-1));
        if(!courseID.equals("null")) {
        	courseID = courseID.substring(0, (courseID.length()-1));
        }
        
        
        System.out.println("Posted To: " + request.getParameter("postedToValues"));
        System.out.println("Course ID: " + request.getParameter("courseIDValues"));
        
        
        CommonsDatabaseActivities dbObject = new CommonsDatabaseActivities();
        UserBean userBean = dbObject.getUserInfo(userID);
        String subjectID = userBean.getSubjectID();
        
        com.ignou.vcs.notices.database.NoticesDatabaseActivities database = new com.ignou.vcs.notices.database.NoticesDatabaseActivities();
        
        try {
        	
            database.insertNotice(noticeForm.getKeyword(), noticeForm.getDescription(), postedTo, userID, noticeForm.getExpiryDate(), noticeForm.getTitle(), courseID, subjectID);

        } catch (Exception e) {

            // Report the error using the appropriate name and ID.
            errors.add("name", new ActionError("id"));

        }

        // If a message is required, save the specified key(s)
        // into the request for use by the <struts:errors> tag.

        if (!errors.isEmpty()) {
            saveErrors(request, errors);

            // Forward control to the appropriate 'failure' URI (change name as desired)
            //	forward = mapping.findForward(failure");

        } else {

            // Forward control to the appropriate 'success' URI (change name as desired)
            forward = mapping.findForward("success");

        }

        // Finish with
        return (forward);

    }
}
