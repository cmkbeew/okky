package controller.member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import member.MemberDAO;

import java.io.IOException;

/**
 * Servlet implementation class CopareEmailController
 */
public class CopareEmailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String email = session.getAttribute("email") == null ? "" : session.getAttribute("email").toString();
		String emailN = req.getParameter("email") == null ? "" : req.getParameter("email");
		
		MemberDAO dao = new MemberDAO();
		
		int Email_check = dao.getEmailCount(emailN);
		dao.close();
		
		if (Email_check == 0) {
			req.setAttribute("checkEmail", emailN);
			req.setAttribute("emailOkayMsg","사용가능한 닉네임입니다.");
			req.getRequestDispatcher("./account.jsp").forward(req,resp);
		} else {
			req.setAttribute("email",emailN);
			req.setAttribute("emailErrMsg", "중복된 이메일 주소입니다.");
			req.getRequestDispatcher("/.account.jsp").forward(req,resp);
		}
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
	}

}
