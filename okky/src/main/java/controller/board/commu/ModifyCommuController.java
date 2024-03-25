package controller.board.commu;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import board.CommunityDAO;
import board.CommunityDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



public class ModifyCommuController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, Object> params = new HashMap<>();

		CommunityDAO dao = new CommunityDAO();
		int communityIdx = request.getParameter("communityIdx") != null ? Integer.parseInt(request.getParameter("communityIdx")) : 0;
		CommunityDTO communityView = dao.communityView(communityIdx);
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
		if (communityView != null) {
			memberId = communityView.getMemberId();
			readCnt = communityView.getReadCnt();
			nickName = communityView.getNickName();
			regDate = (communityView.getRegDate() != null ? communityView.getRegDate().toString() : "");
			title = communityView.getTitle();
			content = communityView.getContent();
			category = communityView.getCategory();
			skill1 = communityView.getSkill1();
			skill2 = communityView.getSkill2();
			skill3 = communityView.getSkill3();
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
		params.put("category", category);
		params.put("skill1", skill1);
		params.put("skill2", skill2);
		params.put("skill3", skill3);



		request.setAttribute("params", params);

		request.getRequestDispatcher("/board/commu/modifyCommunity.jsp").forward(request, response);
	}


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int communityIdx = Integer.parseInt(request.getParameter("communityIdx").trim());



		//idx = Integer.parseInt(request.getParameter("idx"));

		String memberId = request.getParameter("memberId");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String category = request.getParameter("category");

		String skill1 = request.getParameter("skill1");
		String skill2 = request.getParameter("skill2");
		String skill3 = request.getParameter("skill3");


		CommunityDTO dto = new CommunityDTO();
		dto.setCommunityIdx(communityIdx);
		dto.setCategory(category);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setSkill1(skill1);
		dto.setSkill2(skill2);
		dto.setSkill3(skill3);

		CommunityDAO dao = new CommunityDAO();
		int result = dao.communityModify(dto);
		dao.close();

		System.out.println(result);
		if (result > 0) {
			response.sendRedirect("/okky/board/commu/viewCommu.do?communityIdx=" + communityIdx);

		} else {
			PrintWriter writer = response.getWriter();
			writer.println("<script>");
			writer.println("alert('글 수정 시 에러가 발생하였습니다.')");
			writer.println("window.location.replace('/okky/main.do')");
			writer.println("</script>");
		}
	}

}
