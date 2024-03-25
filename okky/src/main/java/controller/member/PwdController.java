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
 * Servlet implementation class PwdController
 */
public class PwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String memberId = session.getAttribute("memberId") == null ? "" : session.getAttribute("memberId").toString();
		String pwd1 = req.getParameter("pwd");
		String pwd2 = req.getParameter("newPwd");
		String pwd2Ck = req.getParameter("newPwdCk");

		MemberDTO dto = new MemberDTO();
		MemberDAO dao = new MemberDAO();
		if(pwd2.equals(pwd2Ck)) {
			dto.setPwd(pwd2);
			dto.setMemberId(memberId);
		}
		int result = dao.changePwd(dto);
		dao.close();
		if(result > 0) {
			resp.sendRedirect("./account.do");
		} else {
			req.getRequestDispatcher("./account.jsp").forward(req, resp);
		}

	}


}
