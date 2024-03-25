package controller.member;

import java.io.IOException;

import common.FileUtil2;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import member.MemberDAO;
import member.MemberDTO;

@MultipartConfig(
		maxFileSize = 1024 * 1024 * 1,
		maxRequestSize = 1024 * 1024 * 10
)

public class RegiResumeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("./applyList.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int result = 0;
		HttpSession session = req.getSession();
		String memberId = session.getAttribute("memberId")== null ? "" :  session.getAttribute("memberId").toString();
		MemberDTO dto = new MemberDTO();
		MemberDAO dao = new MemberDAO();

		/* String saveDir = req.getServletContext().getRealPath("resumeFiles"); */
		String saveDir = "D:\\java4\\jsp\\okkyFIle";
		String orgFileName = "";

		try {
			orgFileName = FileUtil2.uploadFile(req, saveDir);
		} catch(Exception e) {
			e.printStackTrace();
			req.setAttribute("uploadResumeError", "파일 업로드 에러 발생");
			req.getRequestDispatcher("./applyList.jsp").forward(req, resp);
		}

		if(orgFileName != "") {
			String saveFileName = FileUtil2.renameFile(req, saveDir, orgFileName);
			dto.setOrgCompanyFile(orgFileName);
			dto.setSaveCompanyFile(saveFileName);
			dto.setMemberId(memberId);
			req.setAttribute("orgFileName", orgFileName);
			System.out.println(orgFileName);
			}
		result = dao.registerResume(dto);
		dao.close();
		if(result > 0) {
			session.setAttribute("orgCompanyFile", orgFileName);
			resp.sendRedirect("./applyList.do");
		} else {
			req.getRequestDispatcher("./applyList.jsp").forward(req, resp);
		}
	}
}
