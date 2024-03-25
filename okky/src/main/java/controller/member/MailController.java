package controller.member;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import member.MemberDAO;
import member.MemberDTO;

/**
 * Servlet implementation class MailController
 */

public class MailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String memberId = session.getAttribute("memberId") == null ? "" : session.getAttribute("memberId").toString();
		String name = session.getAttribute("name") == null ? "" : session.getAttribute("name").toString();
		String email =session.getAttribute("email") == null ? "" : session.getAttribute("email").toString();
		String emailN = req.getParameter("email");
		MemberDTO dto = new MemberDTO();
		MemberDAO dao = new MemberDAO();
		
		if(!email.equals(emailN)) {
			dto.setEmail(emailN);
			dto.setMemberId(memberId);
		}
		int result = dao.changeMail(dto);
		dao.close();
		session.setAttribute("email", emailN);
		if(result > 0) {
			resp.sendRedirect("./account.do");
		} else {
			req.getRequestDispatcher("./account.jsp").forward(req, resp);
		}

	}

}
