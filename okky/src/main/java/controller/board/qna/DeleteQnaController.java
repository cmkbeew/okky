package controller.board.qna;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import board.QnADAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class DeleteQnaController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qnaIdx = request.getParameter("qnaIdx") != null ? Integer.parseInt(request.getParameter("qnaIdx")) : 0;

//		String memberId = request.getParameter("memberId") != null ? String.valueOf(request.getParameter("memberId")) : null;
//
//
		QnADAO dao = new QnADAO();
		int result = dao.qnaDelete(qnaIdx);


		System.out.println("delete 결과" + result);
		dao.close();

		Map<String, Object> params = new HashMap<>();
		params.put("result", result);

		request.setAttribute("params", params);

		response.sendRedirect("/okky/board/qna/qna.do");
	}


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
