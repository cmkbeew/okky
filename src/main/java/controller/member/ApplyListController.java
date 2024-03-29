package controller.member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import member.ApplyTableDTO;
import member.MemberDAO;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Servlet implementation class ApplyListController
 */
public class ApplyListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//jsp 페이지에 전달할 맵 객체 설정
		Map<String, Object> params = new HashMap<String, Object>();
		HttpSession session = req.getSession();
		String id = session.getAttribute("memberId")== null ? "" :  session.getAttribute("memberId").toString();
		
		params.put("memberId",id);

		//게시판 테이블 조회
		MemberDAO dao = new MemberDAO();
		
		List<ApplyTableDTO> applyList = dao.applyList(params);
		dao.close();
		
		
		req.setAttribute("applyList", applyList);

		req.getRequestDispatcher("./applyList.jsp").forward(req,resp);
		/* resp.sendRedirect("./jobdetail.jsp"); */
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req, resp);
	}


}
