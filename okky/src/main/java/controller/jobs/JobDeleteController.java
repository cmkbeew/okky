package controller.jobs;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jobs.JobDAO;

public class JobDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		int recruitIdx = req.getParameter("recruitIdx") != null ? Integer.parseInt(req.getParameter("recruitIdx")) : 0;

		if (session.getAttribute("memberIdx") != null) {
			if(recruitIdx > 0) {
				JobDAO dao = new JobDAO();
				int result = dao.getJobDelete(recruitIdx);
				dao.close();

				if(result > 0) {
					resp.sendRedirect("./jobMain.do");
				}
			} else {
				resp.sendRedirect("./jobMain.do");
			}
		} else {
			resp.sendRedirect("./jobMain.do");
		}
	}


}
