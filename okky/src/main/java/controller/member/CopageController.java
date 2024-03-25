package controller.member;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import member.MemberDAO;
import member.MemberDTO;

public class CopageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String memberId = session.getAttribute("memberId") == null ? "" : session.getAttribute("memberId").toString();
		String name = session.getAttribute("name") == null ? "" : session.getAttribute("name").toString();
		String managerName = req.getParameter("managerName");
		String companyName = req.getParameter("companyName");
		String companyNo = req.getParameter("companyNo");
		String managerPhone = req.getParameter("managerPhone");
		String type = req.getParameter("type");

		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getCompanyInfo(memberId, name);

		dao.close();

		memberId = dto.getMemberId();
		managerName = dto.getManagerName();
		companyName = dto.getCompanyName();
		companyNo = dto.getCompanyNumber();
		managerPhone = dto.getManagerPhone();
		type = dto.getType();

		req.setAttribute("memberId", memberId);
		req.setAttribute("managerName", managerName);
		req.setAttribute("companyName", companyName);
		req.setAttribute("companyNo", companyNo);
		req.setAttribute("managerPhone", managerPhone);
		req.setAttribute("type", type);

		req.getRequestDispatcher("./mypage_co.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String managerName = req.getParameter("managerName");
		String managerPhone = req.getParameter("managerPhone");
		String memberId = session.getAttribute("memberId") == null ? "" : session.getAttribute("memberId").toString();
		MemberDTO dto = new MemberDTO();
		MemberDAO dao = new MemberDAO();
		dto.setManagerName(managerName);
		dto.setManagerPhone(managerPhone);
		dto.setMemberId(memberId);
		int result = dao.modifyCompany(dto);
		dao.close();
		if(result > 0) {
			resp.sendRedirect("./mypage_co.do");
		} else {
			req.getRequestDispatcher("./mypage_co.jsp").forward(req, resp);
		}

	}

}
