package controller.member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import member.MemberDAO;
import member.MemberDTO;

import java.io.IOException;

/**
 * Servlet implementation class AccountController
 */
public class AccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String memberId = session.getAttribute("memberId") == null ? "" : session.getAttribute("memberId").toString();
		String name = session.getAttribute("name") == null ? "" : session.getAttribute("name").toString();
		String email =session.getAttribute("email") == null ? "" : session.getAttribute("email").toString();
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getCompanyInfo(memberId, name);
		dao.close();
		email = dto.getEmail();
		req.setAttribute("email", email);
		
		req.getRequestDispatcher("./account.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
