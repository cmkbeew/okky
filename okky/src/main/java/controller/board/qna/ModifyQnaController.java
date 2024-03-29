package controller.board.qna;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import board.QnADAO;
import board.QnADTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ModifyQnaController
 */
public class ModifyQnaController extends HttpServlet {
	private static final long serialVersionUID = 1L;



	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, Object> params = new HashMap<>();

		QnADAO dao = new QnADAO();
		int qnaIdx = request.getParameter("qnaIdx") != null ? Integer.parseInt(request.getParameter("qnaIdx")) : 0;
		QnADTO qnaView = dao.qnaView(qnaIdx);
		dao.close();

		int readCnt = 0;
		String memberId = "";
		String nickName = "";
		String regDate = "";
		String title = "";
		String content = "";
		String category = "";
		String skill1 = "";
		String skill2 = "";
		String skill3 = "";
		int pageLike = 0;
		int pageDislike = 0;
		if (qnaView != null) {
			memberId = qnaView.getMemberId();
			readCnt = qnaView.getReadCnt();
			nickName = qnaView.getNickName();
			regDate = (qnaView.getRegDate() != null ? qnaView.getRegDate().toString() : "");
			title = qnaView.getTitle();
			content = qnaView.getContent();
			category = qnaView.getCategory();
			skill1 = qnaView.getSkill1();
			skill2 = qnaView.getSkill2();
			skill3 = qnaView.getSkill3();
			content = (content != null ? content.replace("<br>", "\r\n") : "");
			content = (content != null ? content.replace("&nbsp;", " ") : "");
		}

		params.put("memberId", memberId);
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

		request.getRequestDispatcher("/board/qna/modifyQnA.jsp").forward(request, response);

	}


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qnaIdx = Integer.parseInt(request.getParameter("qnaIdx").trim());



		//idx = Integer.parseInt(request.getParameter("idx"));

		String memberId = request.getParameter("memberId");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String category = request.getParameter("category");
		String skill1 = request.getParameter("skill1");
		String skill2 = request.getParameter("skill2");
		String skill3 = request.getParameter("skill3");




		QnADTO dto = new QnADTO();
		dto.setQnaIdx(qnaIdx);
		dto.setCategory(category);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setSkill1(skill1);
		dto.setSkill2(skill2);
		dto.setSkill3(skill3);

		QnADAO dao = new QnADAO();
		int result = dao.qnaModify(dto);
		dao.close();

		System.out.println(result);
		if (result > 0) {
			response.sendRedirect("/okky/board/qna/viewQnA.do?qnaIdx=" + qnaIdx);

		} else {
			PrintWriter writer = response.getWriter();
			writer.println("<script>");
			writer.println("alert('글 수정 시 에러가 발생하였습니다.')");
			writer.println("window.location.replace('/okky/main.do')");
			writer.println("</script>");
		}
	}

}
