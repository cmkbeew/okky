package controller.board.qna;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import board.QnADAO;
import board.QnADTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class WriteQnaController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("writeQnA.jsp").forward(request,  response);
	}


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String memberId = request.getParameter("memberId");
		int memberIdx = Integer.parseInt(request.getParameter("memberIdx"));
		String title = request.getParameter("title");
		String category = request.getParameter("category");
		String content = request.getParameter("content");
		String skill1 = request.getParameter("skill1");
		String skill2 = request.getParameter("skill2");
		String skill3 = request.getParameter("skill3");


		QnADTO dto = new QnADTO();

		dto.setMemberId(memberId);
		dto.setTitle(title);
		dto.setCategory(category);
		dto.setContent(content);
		dto.setMemberIdx(memberIdx);
		dto.setSkill1(skill1);
		dto.setSkill2(skill2);
		dto.setSkill3(skill3);


		QnADAO dao = new QnADAO();
		int result = dao.qnaRegist(dto);
		System.out.println("write 결과" +result);
		dao.close();

		Map<String, Object> params = new HashMap<>();

		params.put("memberId", memberId);
		params.put("title", title);
		params.put("category", category);
		params.put("result", result);
		params.put("memberIdx", memberIdx);
		params.put("skill1", skill1);
		params.put("skill2", skill2);
		params.put("skill3", skill3);

		request.setAttribute("params", params);
		response.sendRedirect("/okky/board/qna/qna.do");
	}

}
