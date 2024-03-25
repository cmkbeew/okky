package controller.jobs;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jobs.JobDAO;

public class JobMainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int total_member = 0;
		int total_company = 0;
		int total_position = 0;

		JobDAO dao = new JobDAO();
		total_member = dao.getMemberCount();
		total_company = dao.getCompanyCount();
		total_position = dao.getDayRecruitCount();

		dao.close();

		req.setAttribute("total_member", total_member);
		req.setAttribute("total_company", total_company);
		req.setAttribute("total_position", total_position);

		req.getRequestDispatcher("./jobMain.jsp").forward(req, resp);
	}
}
