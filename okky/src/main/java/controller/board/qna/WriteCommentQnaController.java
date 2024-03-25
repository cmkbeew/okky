package controller.board.qna;

import java.io.IOException;

import board.CommentDAO;
import board.CommentDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class WriteCommentQnaController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int memberIdx = req.getParameter("memberIdx") != "" ? Integer.parseInt(req.getParameter("memberIdx")) : 0;
		int qnaIdx = req.getParameter("qnaIdx") != "" ? Integer.parseInt(req.getParameter("qnaIdx")) : 0;
		String CommentContent = req.getParameter("commentContent");
		
		CommentDTO dto = new CommentDTO();
		dto.setMemberIdx(memberIdx);
		dto.setQnaIdx(qnaIdx);
		dto.setCommentContent(CommentContent);
		
		if(memberIdx != 0) {
			if(qnaIdx != 0) {
				CommentDAO dao = new CommentDAO();
				int result = dao.writeQnaComment(dto);
				dao.close();
				
				if(result > 0) {
					resp.sendRedirect("./viewQnA.do?qnaIdx=" + qnaIdx);
				} else {
					resp.sendRedirect("./viewQnA.do?qnaIdx=" + qnaIdx);
				}
			} else {
				resp.sendRedirect("./qna.do");
			}
		} else {
			resp.sendRedirect("../../member/login.do");
		}
		
	}
}
