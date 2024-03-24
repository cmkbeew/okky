package controller.member;

import java.io.IOException;

import common.FileUtil2;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.jsp.PageContext;


@WebServlet("/member/resumeDown.do")
public class ResumeDownController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String memberId = session.getAttribute("memberId")== null ? "" :  session.getAttribute("memberId").toString();
		String orgCompanyFile = req.getParameter("orgCompanyFile");
		String saveCompanyFile = req.getParameter("saveCompanyFile");
		FileUtil2.download(req, resp,orgCompanyFile,saveCompanyFile);

	}
	


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}

}
