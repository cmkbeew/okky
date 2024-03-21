package controller.member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import member.MemberDAO;
import member.MemberDTO;

import java.io.IOException;


public class MypageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String nickname = req.getParameter("nickname");
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getMemberInfo(name, nickname);
		
		dao.close();
		
		name = dto.getName();
		nickname = dto.getNickname();
			
		req.setAttribute("nickname", nickname);
		req.setAttribute("name", name);
		req.getRequestDispatcher("./mypage.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
		
		
	}

}
