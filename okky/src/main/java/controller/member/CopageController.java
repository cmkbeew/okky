package controller.member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import member.MemberDAO;
import member.MemberDTO;

import java.io.IOException;

public class CopageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memberId = req.getParameter("memberId");
		String managerName = req.getParameter("managerName");
		String companyName = req.getParameter("companyName");
		String companyNo = req.getParameter("companyNo");
		String managerPhone = req.getParameter("managerPhone");
		String type = req.getParameter("type");
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getMemberInfo(companyNo, managerPhone);
		
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
		
		req.getRequestDispatcher("./mypage.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
