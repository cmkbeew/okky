package controller.jobs;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jobs.JobDAO;
import jobs.JobDTO;

public class RecruitController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int result = 0;
//		String companyName = req.getParameter("companyName");
//		String managerName = req.getParameter("managerName");
//		String managerPhone = req.getParameter("managerPhone");
		
		HttpSession session = req.getSession();
		int memberIdx = 0;
		String companyAddr = req.getParameter("companyAddr");
		String salary = req.getParameter("salary");
		String position = req.getParameter("contractType");
		String contractType = req.getParameter("contractType");
		String career = req.getParameter("career");
		String recruitContent = req.getParameter("recruitContent");
		
		
		
		if (session.getAttribute("memberIdx") != null) {
			String strMemberIdx = session.getAttribute("memberIdx").toString();
			memberIdx = strMemberIdx != null ? Integer.parseInt(strMemberIdx) : 0;
			
			JobDTO dto = new JobDTO();
			JobDAO dao = new JobDAO();
			
			dto.setCompanyAddr(companyAddr);
			dto.setSalary(salary);
			dto.setPosition(position);
			dto.setContractType(contractType);
			dto.setCareer(career);
			dto.setRecruitContent(recruitContent);
			dto.setMemberIdx(memberIdx);
			
			result = dao.insertRecruit(dto);
			
			if (result > 0) {
				resp.sendRedirect("./jobMain.jsp");
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
