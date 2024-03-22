package controller.board.community;

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
 * Servlet implementation class ModifyQnaController
 */
public class ModifyCommunityController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, Object> params = new HashMap<String, Object>();
		
		CommunityDAO dao = new CommunityDAO();
		int communityIdx = request.getParameter("communityIdx") != null ? Integer.parseInt(request.getParameter("communityIdx")) : 0;
		CommunityDTO qnaView = dao.communityView(communityIdx);
		dao.close();
		
		int readCnt = 0;
		String memberId = "";
		String nickName = "";
		String regDate = "";
		String title = "";
		String content = "";
		int pageLike = 0;
		int pageDislike = 0;
		if (qnaView != null) {
			memberId = qnaView.getMemberId();
			readCnt = qnaView.getReadCnt();
			nickName = qnaView.getNickName();
			regDate = (qnaView.getRegDate() != null ? qnaView.getRegDate().toString() : "");
			title = qnaView.getTitle();
			content = qnaView.getContent();
			content = (content != null ? content.replace("<br>", "\r\n") : "");
			content = (content != null ? content.replace("&nbsp;", " ") : "");
		}
		
		params.put("memberId", memberId);
		params.put("communityIdx", communityIdx);
		params.put("readCnt", readCnt);
		params.put("nickName", nickName);
		params.put("regDate", regDate);
		params.put("title", title);
		params.put("content", content);
		params.put("pageLike", pageLike);
		params.put("pageDislike", pageDislike);
		
		request.setAttribute("params", params);
		
		request.getRequestDispatcher("/board/qna/modifyQnA.do").forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qnaIdx = Integer.parseInt(request.getParameter("qnaIdx").trim());
	
		
		
		//idx = Integer.parseInt(request.getParameter("idx"));

		String user_id = request.getParameter("user_id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String category = request.getParameter("category");

		
		
		CommunityDTO dto = new CommunityDTO();
		dto.setCommunityIdx(qnaIdx);
		dto.setCategory(category);
		dto.setTitle(title);
		dto.setContent(content);

		CommunityDAO dao = new CommunityDAO();
		int result = dao.communityModify(dto);
		dao.close();

		System.out.println(result);
		if (result > 0) {
			response.sendRedirect("/board/community/viewCommunity.do");

		} else {
			PrintWriter writer = response.getWriter();
			writer.println("<script>");
			writer.println("alert('글 수정 시 에러가 발생하였습니다.')");
			writer.println("window.location.replace('list.do')");
			writer.println("</script>");
		}
	}

}
