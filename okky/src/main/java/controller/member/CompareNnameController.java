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
 * Servlet implementation class CompareNname
 */
public class CompareNnameController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String nickname= session.getAttribute("nickname") == null ? "" : session.getAttribute("nickname").toString();
		String nicknameN = req.getParameter("nickname") == null? "" : req.getParameter("nickname");
		
		MemberDAO dao = new MemberDAO();
		
		int nickname_check = dao.getNNameCount(nicknameN);
		if(nickname_check == 0) {
			req.setAttribute("checkNickname", nicknameN);
			req.setAttribute("nNameOkayMsg","사용가능한 닉네임입니다.");
			req.getRequestDispatcher("./mypage.jsp").forward(req, resp);
		} else {
			String nicknameP = req.getParameter("nickname");
			req.setAttribute("nickname",nicknameP);
			req.setAttribute("nNameErrMsg", "중복 닉네임입니다.");
			dao.close();
			req.getRequestDispatcher("./mypage.jsp").forward(req, resp);
		}
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}

}
