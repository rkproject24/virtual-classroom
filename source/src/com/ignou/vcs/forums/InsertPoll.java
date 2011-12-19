package com.ignou.vcs.forums;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ignou.vcs.forums.beans.PollBean;

/**
 * Servlet implementation class InsertPoll
 */
public class InsertPoll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertPoll() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pollQuestion = request.getParameter("pollQuestion");
		String options = request.getParameter("pollOptions");
		String pollCreatedBy = request.getParameter("userName");
		ArrayList<String> pollOptions = new ArrayList<String>();
		StringTokenizer st = new StringTokenizer(options,"|");
		while(st.hasMoreTokens())
		{
			String str = st.nextToken();
			pollOptions.add(str);
		}
		PollBean pb = new PollBean();
		pb.setPollQuestion(pollQuestion);
		pb.setPollOptions(pollOptions);
		pb.setPollCreatedBy(pollCreatedBy);
		PrintWriter pw = response.getWriter();
		Boolean isSuccess = ForumDatabaseOperations.insertPoll(pb);
		if(isSuccess)
		{
			pw.println("DONE");
		}else
		{
			pw.println("ERROR");
		}
	}
	

}
