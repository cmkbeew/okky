package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import board.CommunityDAO;
import board.CommunityDTO;
import board.MainDAO;
import board.MainDTO;
import board.QnADAO;
import board.QnADTO;


public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, Object> qnaParams = new HashMap<String, Object>();
		Map<String, Object> communityParams = new HashMap<String, Object>();
		Map<String, Object> mainLikeParams = new HashMap<String, Object>();
		Map<String, Object> mainWriteParams = new HashMap<String, Object>();
		
		QnADAO dao = new QnADAO();
		List<QnADTO> qnaList = dao.mainList(qnaParams);
		dao.close();
		
		request.setAttribute("qnaList", qnaList);
		
		CommunityDAO dao2 = new CommunityDAO();
		List<CommunityDTO> communityList = dao2.mainList(communityParams);
		dao2.close();
		
		request.setAttribute("communityList", communityList);
		
		CommunityDAO notice = new CommunityDAO();
		List<CommunityDTO> noticeList = notice.mainNoticeList(communityParams);
		notice.close();

		request.setAttribute("noticeList", noticeList);
		
		
		MainDAO like = new MainDAO();
		List<MainDTO> likeList = like.likeList(mainLikeParams);
		like.close();
		
		request.setAttribute("likeList", likeList);
		
		MainDAO write = new MainDAO();
		List<MainDTO> writeList = write.writeList(mainWriteParams);
		write.close();
		
		request.setAttribute("writeList", writeList);
		
		
		request.getRequestDispatcher("./main.jsp").forward(request, response);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
