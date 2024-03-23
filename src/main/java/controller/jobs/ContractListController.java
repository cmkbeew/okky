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

public class ContractListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		JobDAO jDao = new JobDAO();
		
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
			List<JobDTO> list = jDao.getContractList();
			int total_count = jDao.getContractCount();
			jDao.close();
			
			if(list != null) {
				req.setAttribute("list", list);
				req.setAttribute("total_count", total_count);
				
				req.getRequestDispatcher("./contract.jsp").forward(req, resp);
			} else {
				req.setAttribute("jobListSelectErr", "등록된 공고가 없습니다.");
				
				req.getRequestDispatcher("../main.jsp");
			}
		} else {
			jDao.close();
			
			resp.sendRedirect("../member/login.do");
		}
	}

	
}
