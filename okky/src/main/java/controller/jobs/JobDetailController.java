package controller.jobs;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jobs.JobDAO;
import jobs.JobDTO;

public class JobDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		int recruitIdx = req.getParameter("recruitIdx") != null ? Integer.parseInt(req.getParameter("recruitIdx")) : 0;
		
		if (session.getAttribute("memberIdx") != null) {
			String strMemberIdx = session.getAttribute("memberIdx").toString();
			int memberIdx = strMemberIdx != null ? Integer.parseInt(strMemberIdx) : 0;
			
			if(recruitIdx > 0) {
				JobDAO dao = new JobDAO();
				JobDTO jobView = dao.getJobDetail(recruitIdx);
				dao.updateJobView(recruitIdx);
				dao.close();
				
				jobView.setRecruitContent(jobView.getRecruitContent().replace("\r\n", "<br>"));
				jobView.setRecruitContent(jobView.getRecruitContent().replace(" ", "&nbsp;"));
				
				req.setAttribute("jobView", jobView);
				
				req.getRequestDispatcher("/jobs/jobDetail.jsp?recruitIdx=" + recruitIdx).forward(req, resp);
			} else {
				resp.sendRedirect("./jobMain.do");
			}
		} else {
			resp.sendRedirect("./jobMain.do");
		}
	}
}
