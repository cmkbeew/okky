package controller.board.commu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import board.CommunityDAO;


public class LikeCommuController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int communityIdx = request.getParameter("communityIdx") != null ? Integer.parseInt(request.getParameter("communityIdx")) : 0;
		String likeParam = request.getParameter("likeParam") != null ? String.valueOf(request.getParameter("likeParam")) : "";
		
		CommunityDAO commuDao = new CommunityDAO();
		
		if (communityIdx > 0) {
			if (likeParam.equals("like")) {
				commuDao.updatePageLike(communityIdx);
				commuDao.close();
			} 
			if (likeParam.equals("disLike")) {
				commuDao.updatePageDislike(communityIdx);
				commuDao.close();
			}
		}
		
		response.sendRedirect("/okky/board/commu/viewCommu.do?communityIdx="+communityIdx);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
