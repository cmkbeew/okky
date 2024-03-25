package controller.jobs;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jobs.JobDAO;
import jobs.JobDTO;

import java.io.IOException;

/**
 * Servlet implementation class JobApplyController
 */
public class JobApplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int result = 0;
		
		HttpSession session = req.getSession();
		String memberId = session.getAttribute("memberId") == null ? "" : session.getAttribute("memberId").toString();
		int memberIdx = session.getAttribute("memberIdx") == null ? 0 : (int)session.getAttribute("memberIdx");
		int recruitIdx = Integer.parseInt(req.getParameter("recruitIdx"));
		JobDAO dao = new JobDAO();
		JobDTO dto = new JobDTO();
		
		try {
			dto.setMemberId(memberId);
			dto.setMemberIdx(memberIdx);
			dto.setRecruitIdx(recruitIdx);
			result = dao.applyJob(dto);
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("이력서 지원 중 오류 발생");
		}
		dao.close();
		
		if(result > 0) {
			resp.sendRedirect("../member/applyList.do");
		} else {
			req.getRequestDispatcher("../member/applyList.jsp").forward(req, resp);
		}
		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
