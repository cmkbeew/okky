package controller.member;

import java.io.IOException;

import common.FileUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import member.MemberDAO;
import member.MemberDTO;

@MultipartConfig(
		maxFileSize = 1024 * 1024 * 1,
		maxRequestSize = 1024 * 1024 * 10
)
public class RegistController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("./regist.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int result = 0;
		
		String memberId = req.getParameter("memberId");
		String pwd = req.getParameter("pwd");
		String email = req.getParameter("email");
		String name = req.getParameter("name");
		String nickname = req.getParameter("nickname");
		String type = req.getParameter("type");
		String companyName = req.getParameter("companyName");
		String addr1 = req.getParameter("addr1");
		String addr2 = req.getParameter("addr2");
		String companyAddr = addr1 + " " + addr2;
		String companyNumber = req.getParameter("companyNumber");
		String managerName = req.getParameter("managerName");
		String managerPhone = req.getParameter("managerPhone");
		
		// 중복 회원 검증
		MemberDTO dto = new MemberDTO();
		MemberDAO dao = new MemberDAO();
		int id_check = dao.getMemberCount(memberId);
		
		if(id_check >= 1) {
			req.setAttribute("registErrMsg", "아이디 중복 오류");
			dao.close();
			req.getRequestDispatcher("./regist.jsp").forward(req, resp);
		} else {
			dto.setMemberId(memberId);
			dto.setPwd(pwd);
			dto.setName(name);
			dto.setEmail(email);
			dto.setNickname(nickname);
			dto.setType(type);
			dto.setCompanyName(companyName);
			dto.setCompanyAddr(companyAddr);
			dto.setCompanyNumber(companyNumber);
			dto.setManagerName(managerName);
			dto.setManagerPhone(managerPhone);
			
			if(type.equals("1")) {
				result = dao.registMember(dto);
			} else {
				// 파일 업로드 처리
				String saveDir = req.getServletContext().getRealPath("companyFiles");
				String orgFileName = "";
				
				try {
					orgFileName = FileUtil.uploadFile(req, saveDir);
				} catch(Exception e) {
					e.printStackTrace();
					req.setAttribute("uploadFileError", "회원가입 중 파일 업로드 에러 발생");
					req.getRequestDispatcher("./regist.jsp").forward(req, resp);
				}
				
				if(orgFileName != "") {
					String saveFileName = FileUtil.renameFile(saveDir, orgFileName);
					
					dto.setOrgCompanyFile(orgFileName);
					dto.setSaveCompanyFile(saveFileName);			
				}
				result = dao.registMember(dto);
			}
			dao.close();
			
			if(result > 0) {
				resp.sendRedirect("./login.jsp");
			} else {
				req.setAttribute("registErrMsg", "회원가입 실패");
				
				req.getRequestDispatcher("./regist.jsp").forward(req, resp);
			}
		}
	}
}
