package controller.jobs;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jobs.JobDAO;
import jobs.JobDTO;

public class JobListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String contractType = req.getParameter("contractType");
		String memberId = "";
		String pwd = "";
		
		if(session.getAttribute("memberId") != null) {
			memberId = session.getAttribute("memberId").toString();
		}
		if(session.getAttribute("pwd") != null) {
			pwd = session.getAttribute("pwd").toString();
		}
		
		if(memberId != "" && pwd != "") {
			// 회원 정보 찾아오기
			JobDAO jDao = new JobDAO();
			List<JobDTO> list = jDao.getJobList(contractType);
			int total_count = jDao.getRecruitCount(contractType);
			jDao.close();
			
			if(list != null) {
				req.setAttribute("list", list);
				req.setAttribute("total_count", total_count);
				req.setAttribute("contractType", contractType);
				
				if (contractType.equals("정규직")) {
					req.getRequestDispatcher("/jobs/jobList.jsp").forward(req, resp);
				} else if (contractType.equals("계약직")){
					req.getRequestDispatcher("/jobs/jobList.jsp").forward(req, resp);
				} else {
					resp.sendRedirect("./jobMain.jsp");
				}
			} else {
				req.setAttribute("jobListSelectErr", "등록된 공고가 없습니다.");
				
				req.getRequestDispatcher("../main.jsp");
			}
		} else {
			resp.sendRedirect("../member/login.do");
		}
	}

	
}
