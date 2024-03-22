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
 * Servlet implementation class DeleteAccountController
 */
public class DeleteAccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int result = 0;
		HttpSession session = req.getSession();
		String memberId = session.getAttribute("memberId") == null ? "" : session.getAttribute("memberId").toString();
		MemberDTO dto = new MemberDTO();
		MemberDAO dao = new MemberDAO();
		if(memberId != "") {
			dto.setMemberId(memberId);
			result= dao.deleteAccount(dto);
		}
		dao.close();
		session.invalidate();
		if(result > 0) {
			resp.sendRedirect("../main.jsp");
		} else {
			req.getRequestDispatcher("../main.jsp").forward(req, resp);
		}
		
	}

}
