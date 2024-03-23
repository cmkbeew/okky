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
import board.CommunityDTO;



public class WriteCommuController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("writeCommunity.jsp").forward(request,  response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		int memberIdx = Integer.parseInt(request.getParameter("memberIdx"));
		String title = request.getParameter("title");
		String category = request.getParameter("category");
		String content = request.getParameter("content");
		
		CommunityDTO dto = new CommunityDTO();
		
		dto.setMemberId(memberId);
		dto.setTitle(title);
		dto.setCategory(category);
		dto.setContent(content);
		dto.setMemberIdx(memberIdx);
		
		CommunityDAO dao = new CommunityDAO();
		int result = dao.communityRegist(dto);
		System.out.println("write 결과" +result);
		dao.close();
		
		Map<String, Object> params = new HashMap<>();
		
		params.put("memberId", memberId);
		params.put("title", title);
		params.put("category", category);
		params.put("result", result);
		params.put("memberIdx", memberIdx);
		
		request.setAttribute("params", params);
		response.sendRedirect("/okky/board/commu/commu.do");
	}

}