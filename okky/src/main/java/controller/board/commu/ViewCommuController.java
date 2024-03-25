package controller.board.commu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import board.CommunityDAO;
import board.CommunityDTO;


/**
 * Servlet implementation class ViewCommuController
 */
public class ViewCommuController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int communityIdx = request.getParameter("communityIdx") != null ? Integer.parseInt(request.getParameter("communityIdx")) : 0;
//		
//		int pageLikeCnt = request.getParameter("pageLikeCnt") != null ? Integer.parseInt(request.getParameter("pageLikeCnt")) : 0;
//		int pageDislikeCnt = request.getParameter("pageDislikeCnt") != null ? Integer.parseInt(request.getParameter("pageDislikeCnt")) : 0;
		
		
		CommunityDTO communityView = new CommunityDTO();


		
		if (communityIdx > 0) {
			CommunityDAO dao = new CommunityDAO();
			communityView = dao.communityView(communityIdx);
//			dao.updatePageLike(communityIdx);
//			dao.updatePageDislike(communityIdx);
			dao.updateReadCnt(communityIdx); 
			dao.close(); 
			
		}  else {
			PrintWriter writer = response.getWriter();
			writer.println("<script>");
			writer.println("alert('접근 정보가 올바르지 않습니다.')");
			writer.println("window.location.replace('main.do')"); 
			writer.println("</script>");
		}
		
		int readCnt = 0;
		int memberIdx = 0;
		String nickName = "";
		String regDate = "";
		String title = "";
		String content = "";
		int pageLike = 0;
		int pageDislike = 0;
		String category = "";
		String memberId = "";
		String skill1 = "";
		String skill2 = "";
		String skill3 = "";
		
		if (communityView != null) {
			memberId = communityView.getMemberId();
			memberIdx = communityView.getMemberIdx();
			readCnt = communityView.getReadCnt();
			nickName = communityView.getNickName();
			regDate = (communityView.getRegDate() != null ? communityView.getRegDate().toString() : "");
			title = communityView.getTitle();
			content = communityView.getContent();
			pageLike = communityView.getPageLike();
			pageDislike = communityView.getPageDislike();
			skill1 = communityView.getSkill1();
			skill2 = communityView.getSkill2();
			skill3 = communityView.getSkill3();
			content = (content != null ? content.replace("<br>", "\r\n") : "");
			content = (content != null ? content.replace("&nbsp;", " ") : "");
			category = communityView.getCategory();
		}
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("memberId", memberId);
		params.put("memberIdx", memberIdx);
		params.put("communityIdx", communityIdx);
		params.put("readCnt", readCnt);
		params.put("nickName", nickName);
		params.put("regDate", regDate);
		params.put("title", title);
		params.put("content", content);
		params.put("pageLike", pageLike);
		params.put("pageDislike", pageDislike);
		params.put("category", category);
		params.put("skill1", skill1);
		params.put("skill2", skill2);
		params.put("skill3", skill3);
		
		
		
		request.setAttribute("params", params);
		
		request.getRequestDispatcher("/board/commu/viewCommunity.jsp").forward(request,  response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
