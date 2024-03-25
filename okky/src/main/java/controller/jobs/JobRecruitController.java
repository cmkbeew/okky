package controller.jobs;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jobs.JobDAO;
import jobs.JobDTO;

public class JobRecruitController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();

		if (session.getAttribute("memberIdx") != null) {
			req.getRequestDispatcher("/jobs/jobRecruit.jsp").forward(req, resp);
		} else {
			resp.sendRedirect("../member/login.do");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		int result = 0;
		int memberIdx = 0;
		String recruitTitle = req.getParameter("recruitTitle");
		String dueDate = req.getParameter("dueDate");
		String salary = req.getParameter("salary");
		String position = req.getParameter("position");
		String contractType = req.getParameter("contractType");
		contractType = contractType.equals("정규직") ? "fulltime" : "contract";
		String career = req.getParameter("career");
		String recruitContent = req.getParameter("recruitContent");

		if (session.getAttribute("memberIdx") != null) {
			String strMemberIdx = session.getAttribute("memberIdx").toString();
			memberIdx = strMemberIdx != null ? Integer.parseInt(strMemberIdx) : 0;

			JobDTO dto = new JobDTO();
			JobDAO dao = new JobDAO();

			dto.setRecruitTitle(recruitTitle);
			dto.setDueDate(dueDate);
			dto.setSalary(salary);
			dto.setPosition(position);
			dto.setContractType(contractType);
			dto.setCareer(career);
			dto.setRecruitContent(recruitContent);
			dto.setMemberIdx(memberIdx);

			result = dao.insertRecruit(dto);

			if (result > 0) {
				resp.sendRedirect("./jobMain.do");
			} else {
				req.setAttribute("recruitErrMsg", "공고 글 작성 시 문제가 발생하였습니다.");

				req.getRequestDispatcher("./jobRecruit.jsp").forward(req, resp);
			}
			dao.close();
		} else {
			resp.sendRedirect("../member/login.do");
		}
	}
}
