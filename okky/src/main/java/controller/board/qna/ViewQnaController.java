package controller.board.qna;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import board.QnADAO;
import board.QnADTO;

/**
 * Servlet implementation class ViewQnaController
 */
public class ViewQnaController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qnaIdx = Integer.parseInt(request.getParameter("qnaIdx"));
		System.out.println(qnaIdx);
		QnADTO qnaView = new QnADTO();


		if (qnaIdx > 0) {
			QnADAO dao = new QnADAO();
			qnaView = dao.qnaView(qnaIdx);
			dao.close(); //여기서 안닫으면 BbsDAO에서 커넥션 맺은 후 거기에 일일히 다 쳐서 닫아야해. if(rs != null) rs.close() 이런거
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
		
		if (qnaView != null) {
			memberIdx = qnaView.getMemberIdx();
			readCnt = qnaView.getReadCnt();
			nickName = qnaView.getNickName();
			regDate = (qnaView.getRegDate() != null ? qnaView.getRegDate().toString() : "");
			title = qnaView.getTitle();
			content = qnaView.getContent();
			pageLike = qnaView.getPageLike();
			pageDislike = qnaView.getPageDislike();
			content = (content != null ? content.replace("\r\n", "<br>") : "");
			content = (content != null ? content.replace(" ", "&nbsp;") : "");
		}
		
		Map<String, Object> params = new HashMap<String, Object>();
		
		params.put("memberIdx", memberIdx);
		params.put("qnaIdx", qnaIdx);
		params.put("readCnt", readCnt);
		params.put("nickName", nickName);
		params.put("regDate", regDate);
		params.put("title", title);
		params.put("content", content);
		params.put("pageLike", pageLike);
		params.put("pageDislike", pageDislike);
		params.put("qnaIdx", qnaIdx);
		
		
		request.setAttribute("params", params);
		
		request.getRequestDispatcher("/board/qna/viewQnA.jsp").forward(request,  response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
