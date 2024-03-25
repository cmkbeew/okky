package controller.jobs;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jobs.JobDAO;
import jobs.JobDTO;

public class JobModifyController extends HttpServlet {
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
				dao.close();

				req.setAttribute("jobView", jobView);

				req.getRequestDispatcher("/jobs/jobModify.jsp?recruitIdx=" + recruitIdx).forward(req, resp);
			} else {
				resp.sendRedirect("../jobs/jobMain.do");
			}
		} else {
			resp.sendRedirect("../jobs/jobMain.do");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		int recruitIdx = req.getParameter("recruitIdx") != null ? Integer.parseInt(req.getParameter("recruitIdx")) : 0;
		String recruitTitle = req.getParameter("recruitTitle");
		String salary = req.getParameter("salary");
		String position = req.getParameter("position");
		String contractType = req.getParameter("contractType");
		String career = req.getParameter("career");
		String recruitContent = req.getParameter("recruitContent");
		String dueDate = req.getParameter("dueDate");

		if (session.getAttribute("memberIdx") != null) {
			String strMemberIdx = session.getAttribute("memberIdx").toString();
			int memberIdx = strMemberIdx != null ? Integer.parseInt(strMemberIdx) : 0;

			JobDTO dto = new JobDTO();
			dto.setRecruitIdx(recruitIdx);
			dto.setRecruitTitle(recruitTitle);
			dto.setSalary(salary);
			dto.setPosition(position);
			dto.setContractType(contractType);
			dto.setCareer(career);
			dto.setRecruitContent(recruitContent);
			dto.setDueDate(dueDate);
			dto.setMemberIdx(memberIdx);

			if(recruitIdx > 0) {
				JobDAO dao = new JobDAO();
				dto = dao.modifyRecruit(dto);
				dao.close();

				req.setAttribute("jobView", dto);

//				req.getRequestDispatcher("/jobs/jobDetail.jsp?recruitIdx=" + recruitIdx).forward(req, resp);
				resp.sendRedirect("../jobs/jobDetail.do?recruitIdx=" + recruitIdx);
			} else {
				resp.sendRedirect("../jobs/jobMain.do");
			}
		} else {
			resp.sendRedirect("../jobs/jobMain.do");
		}
	}



}
