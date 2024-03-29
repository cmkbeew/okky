package controller.member;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import member.ApplyTableDTO;
import member.MemberDAO;

public class ApplicantListController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//jsp 페이지에 전달할 맵 객체 설정
		Map<String, Object> params = new HashMap<>();
		HttpSession session = req.getSession();
		String id = session.getAttribute("memberId")== null ? "" :  session.getAttribute("memberId").toString();

		params.put("memberId",id);

		//게시판 테이블 조회
		MemberDAO dao = new MemberDAO();

		List<ApplyTableDTO> applicantList = dao.applicantList(params);
		dao.close();


		req.setAttribute("applicantList", applicantList);

		req.getRequestDispatcher("./applicantList.jsp").forward(req,resp);
	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
