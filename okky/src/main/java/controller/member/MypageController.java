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
		String nickname = req.getParameter("nickname");

		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getMemberInfo(memberId, pwd);

		dao.close();

		memberId = dto.getMemberId();
		pwd = dto.getPwd();
		name = dto.getName();
		nickname = dto.getNickname();

		req.setAttribute("nickname", nickname);
		req.setAttribute("name", name);
		req.getRequestDispatcher("./mypage.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int result1 = 0;
		int result2 = 0;
		HttpSession session = req.getSession();
		String memberId = session.getAttribute("memberId") == null ? "" : session.getAttribute("memberId").toString();
		String name = session.getAttribute("name") == null ? "" : session.getAttribute("name").toString();
		String nickname= session.getAttribute("nickname") == null ? "" : session.getAttribute("nickname").toString();
		String pwd = session.getAttribute("pwd") == null ? "" : session.getAttribute("pwd").toString();
		String nicknameN = req.getParameter("nickname");
		String skill1 = req.getParameter("skill1") == "" ? null : req.getParameter("skill1");
		String skill2 = req.getParameter("skill2") == "" ? null : req.getParameter("skill2");
		String skill3 = req.getParameter("skill3") == "" ? null : req.getParameter("skill3");
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
		dao.close();
		if(result1 > 0 || result2 > 0) {
			resp.sendRedirect("./mypage.do");
		} else {
			req.getRequestDispatcher("./mypage.jsp").forward(req, resp);
		}


	}

}
