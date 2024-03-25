package controller.board.qna;

import java.io.IOException;

import board.QnADAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LikeQnaController
 */
public class LikeQnaController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qnaIdx = request.getParameter("qnaIdx") != null ? Integer.parseInt(request.getParameter("qnaIdx")) : 0;
		//int communityIdx = request.getParameter("communityIdx") != null ? Integer.parseInt(request.getParameter("communityIdx")) : 0;
		String likeParam = request.getParameter("likeParam") != null ? String.valueOf(request.getParameter("likeParam")) : "";



		QnADAO qnaDao = new QnADAO();


		if (qnaIdx > 0) {
			if (likeParam.equals("like")) {
				qnaDao.updatePageLike(qnaIdx);
				qnaDao.close();
			}
			if (likeParam.equals("disLike")) {
				qnaDao.updatePageDislike(qnaIdx);
				qnaDao.close();
			}
		}


		response.sendRedirect("/okky/board/qna/viewQnA.do?qnaIdx="+qnaIdx);
		//request.getRequestDispatcher("/board/qna/viewQnA.jsp").forward(request,  response);
	}


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
