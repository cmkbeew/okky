package controller.member;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import member.MemberDAO;
import member.MemberDTO;

public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("./login.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memberId = req.getParameter("memberId");
		memberId = memberId != null ? memberId : "";
		String pwd = req.getParameter("pwd");
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getMemberInfo(memberId, pwd);
		
		dao.close();
		
		if(dto.getMemberId() != null) {
			HttpSession session = req.getSession();
			session.setAttribute("memberIdx", dto.getMemberIdx());
			session.setAttribute("memberId", dto.getMemberId());
			session.setAttribute("pwd", dto.getPwd());
			session.setAttribute("name", dto.getName());
			session.setAttribute("email", dto.getEmail());
			session.setAttribute("nickname", dto.getNickname());
			session.setAttribute("type", dto.getType());
			session.setAttribute("companyName", dto.getCompanyName());
			session.setAttribute("companyNumber", dto.getCompanyNumber());
			session.setAttribute("companyAddr", dto.getCompanyAddr());
			session.setAttribute("managerName", dto.getManagerName());
			session.setAttribute("managerPhone", dto.getManagerPhone());
			
			resp.sendRedirect("../main.jsp");
		} else {
			req.setAttribute("loginErrMsg", "로그인 오류");
			
			req.getRequestDispatcher("./login.jsp").forward(req, resp);
		}
		
		
		
	}
}
