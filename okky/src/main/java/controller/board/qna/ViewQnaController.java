package controller.board.qna;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import board.CommentDAO;
import board.CommentDTO;
import board.QnADAO;
import board.QnADTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ViewQnaController
 */
public class ViewQnaController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qnaIdx = Integer.parseInt(request.getParameter("qnaIdx"));
//		
//		int pageLikeCnt = request.getParameter("pageLikeCnt") != null ? Integer.parseInt(request.getParameter("pageLikeCnt")) : 0;
//		int pageDislikeCnt = request.getParameter("pageDislikeCnt") != null ? Integer.parseInt(request.getParameter("pageDislikeCnt")) : 0;
		
		
		QnADTO qnaView = new QnADTO();
		List<CommentDTO> cList = new Vector<CommentDTO>();

		
		if (qnaIdx > 0) {
			QnADAO dao = new QnADAO();
			qnaView = dao.qnaView(qnaIdx);
//			dao.updatePageLike(qnaIdx);
			dao.updateReadCnt(qnaIdx);
			dao.close(); //여기서 안닫으면 BbsDAO에서 커넥션 맺은 후 거기에 일일히 다 쳐서 닫아야해. if(rs != null) rs.close() 이런거
			
			CommentDAO cDao = new CommentDAO();
			cList = cDao.getQnaCommentList(qnaIdx);
			for(CommentDTO comment : cList) {
				comment.setCommentContent(comment.getCommentContent().replace("\r\n", "<br>"));
				comment.setCommentContent(comment.getCommentContent().replace(" ", "&nbsp;"));
			}
			
			cDao.close();
		}  else {
			PrintWriter writer = response.getWriter();
			writer.println("<script>");
			writer.println("alert('접근 정보가 올바르지 않습니다.')");
			writer.println("window.location.replace('list.jsp')"); //히스토리가 남지 않게 하는 방법. null이 들어간게 보이지 않게 하는 방법임
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
		
		if (qnaView != null) {
			memberId = qnaView.getMemberId();
			memberIdx = qnaView.getMemberIdx();
			readCnt = qnaView.getReadCnt();
			nickName = qnaView.getNickName();
			regDate = (qnaView.getRegDate() != null ? qnaView.getRegDate().toString() : "");
			title = qnaView.getTitle();
			content = qnaView.getContent();
			pageLike = qnaView.getPageLike();
			pageDislike = qnaView.getPageDislike();
			skill1 = qnaView.getSkill1();
			skill2 = qnaView.getSkill2();
			skill3 = qnaView.getSkill3();
			content = (content != null ? content.replace("<br>", "\r\n") : "");
			content = (content != null ? content.replace("&nbsp;", " ") : "");
			category = qnaView.getCategory();
		}
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("memberId", memberId);
		params.put("memberIdx", memberIdx);
		params.put("qnaIdx", qnaIdx);
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
		
		// 댓글
		request.setAttribute("cList", cList);
		
		request.getRequestDispatcher("/board/qna/viewQnA.jsp").forward(request,  response);
	}
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
