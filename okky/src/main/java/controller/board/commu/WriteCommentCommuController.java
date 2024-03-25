package controller.board.commu;

import java.io.IOException;

import board.CommentDAO;
import board.CommentDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class WriteCommentCommuController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int memberIdx = req.getParameter("memberIdx") != "" ? Integer.parseInt(req.getParameter("memberIdx")) : 0;
		int communityIdx = req.getParameter("communityIdx") != "" ? Integer.parseInt(req.getParameter("communityIdx")) : 0;
		String CommentContent = req.getParameter("commentContent");
		
		CommentDTO dto = new CommentDTO();
		dto.setMemberIdx(memberIdx);
		dto.setCommunityIdx(communityIdx);
		dto.setCommentContent(CommentContent);
		
		if(memberIdx != 0) {
			if(communityIdx != 0) {
				CommentDAO dao = new CommentDAO();
				int result = dao.writeCommunityComment(dto);
				dao.close();
				
				if(result > 0) {
					resp.sendRedirect("./viewCommu.do?communityIdx=" + communityIdx);
				} else {
					resp.sendRedirect("./viewCommu.do?communityIdx=" + communityIdx);
				}
			} else {
				resp.sendRedirect("./commu.do");
			}
		} else {
			resp.sendRedirect("../../member/login.do");
		}
		
	}
}
