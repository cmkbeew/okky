package controller.board.commu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import board.CommunityDAO;



public class DeleteCommController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int communityIdx = request.getParameter("qnaIdx") != null ? Integer.parseInt(request.getParameter("qnaIdx")) : 0;
		
//		String memberId = request.getParameter("memberId") != null ? String.valueOf(request.getParameter("memberId")) : null;
//		
//		
		CommunityDAO dao = new CommunityDAO();
		int result = dao.communityDelete(communityIdx);
		
		
		System.out.println("delete 결과" + result);
		dao.close();
		
		Map<String, Object> params = new HashMap<>();
		params.put("result", result);
		
		request.setAttribute("params", params);
		
		response.sendRedirect("/okky/board/commu/commu.do");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}