package controller.member;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import member.MemberDAO;
import member.MemberDTO;


public class MypageController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String memberId = session.getAttribute("memberId") == null ? "" : session.getAttribute("memberId").toString();
		String name = session.getAttribute("name") == null ? "" : session.getAttribute("name").toString();
		String pwd = session.getAttribute("pwd") == null ? "" : session.getAttribute("pwd").toString();
<<<<<<< HEAD
		String nicknameP = req.getParameter("nickname");
		String nickname = session.getAttribute("nickname") == null ? "" : session.getAttribute("nickname").toString();
		String skill1 = session.getAttribute("skill1") == null ? "" : session.getAttribute("skill1").toString();
		String skill2 = session.getAttribute("skill2") == null ? "" : session.getAttribute("skill2").toString();
		String skill3 = session.getAttribute("skill3") == null ? "" : session.getAttribute("skill3").toString();
		
=======
		String nickname = req.getParameter("nickname");

>>>>>>> rim
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getMemberInfo(memberId, pwd);

		dao.close();

		memberId = dto.getMemberId();
		pwd = dto.getPwd();
		name = dto.getName();
		nickname = dto.getNickname();
<<<<<<< HEAD
		skill1 = dto.getSkill1();
		skill2 = dto.getSkill2();
		skill3 = dto.getSkill3();
			
=======

>>>>>>> rim
		req.setAttribute("nickname", nickname);
		req.setAttribute("name", name);
		req.setAttribute("skill1", skill1);
		req.setAttribute("skill2", skill2);
		req.setAttribute("skill3", skill3);
		req.getRequestDispatcher("./mypage.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int result = 0;
		HttpSession session = req.getSession();
		String memberId = session.getAttribute("memberId") == null ? "" : session.getAttribute("memberId").toString();
		String name = session.getAttribute("name") == null ? "" : session.getAttribute("name").toString();
		String nickname= session.getAttribute("nickname") == null ? "" : session.getAttribute("nickname").toString();
		String pwd = session.getAttribute("pwd") == null ? "" : session.getAttribute("pwd").toString();
		String nicknameN = req.getParameter("nickname") == null? nickname : req.getParameter("nickname");
		String skill1 = req.getParameter("skill1") == "" ? null : req.getParameter("skill1");
		String skill2 = req.getParameter("skill2") == "" ? null : req.getParameter("skill2");
		String skill3 = req.getParameter("skill3") == "" ? null : req.getParameter("skill3");
<<<<<<< HEAD
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		
		
		
		dto.setNickname(nicknameN);
		dto.setMemberId(memberId);
		dto.setSkill1(skill1);
		dto.setSkill2(skill2);
		dto.setSkill3(skill3);
		dto.setMemberId(memberId);
		req.setAttribute("skill1", skill1);
		req.setAttribute("skill2", skill2);
		req.setAttribute("skill3", skill3);
		result = dao.modifyMyInfo(dto);
		
=======
		System.out.println(skill1);
		System.out.println(skill2);
		System.out.println(skill3);

		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();

		if(!nicknameN.equals(nickname)) {
			dto.setNickname(nicknameN);
			dto.setMemberId(memberId);
		}
		if(!(skill1 == null && skill2 == null && skill3 == null)) {
			dto.setSkill1(skill1);
			dto.setSkill2(skill2);
			dto.setSkill3(skill3);
			dto.setMemberId(memberId);
		}
		result1 = dao.modifyMyInfo(dto);
		result2 = dao.inputSkill(dto);
>>>>>>> rim
		dao.close();
		if(result > 0 ) {
			resp.sendRedirect("./mypage.do");
//					req.getRequestDispatcher("./mypage.jsp").forward(req, resp);
		} else {
			req.getRequestDispatcher("./mypage.jsp").forward(req, resp);
		}
<<<<<<< HEAD
=======


>>>>>>> rim
	}
		
	

}
