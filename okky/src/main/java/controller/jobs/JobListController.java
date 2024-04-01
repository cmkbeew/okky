package controller.jobs;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import common.BbsPage;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jobs.JobDAO;
import jobs.JobDTO;

public class JobListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();

		// 페이징 정보 초기화
		int total_count = 0;
		int total_page = 1;
		int page_no = 1;
		int page_size = 8;
		int page_skip_cnt = 8;
		int page_block_size = 5;
		int page_block_start = 1;
		int page_block_end = 1;

		Map<String, Object> maps  = new HashMap<>();

		String search_word = req.getParameter("search_word");
		String pc = "";
		String ac = "";
		String cc = "";

		if(search_word != null && !search_word.isEmpty()) {
			search_word = search_word.trim();

			maps.put("search_word", search_word);
		}

		if(req.getParameterValues("position_category") != null) {
			String[] position_category = req.getParameterValues("position_category");

			for(int i=0; i<position_category.length; i++) {
				if(i == position_category.length-1) {
					pc += "'" + position_category[i] + "'";
				} else {
					pc += "'" + position_category[i] + "', ";
				}
			}
		}
		if(req.getParameter("addr_category") != null) {
			ac  = req.getParameter("addr_category");
		}
		if(req.getParameterValues("career_category") != null) {
			String[] career_category = req.getParameterValues("career_category");

			for(int i=0; i<career_category.length; i++) {
				if(i == career_category.length-1) {
					cc += "'" + career_category[i] + "'";
				} else {
					cc += "'" + career_category[i]+ "', ";
				}
			}
		}

		maps.put("position_category", pc);
		maps.put("addr_category", ac);
		maps.put("career_category", cc);

		// 계약종류 + 정렬
		String contractType = req.getParameter("contractType");
		maps.put("contractType", contractType);

		String sort = req.getParameter("sort");
		maps.put("sort", sort);
		String memberId = "";
		String pwd = "";

		if(session.getAttribute("memberId") != null) {
			memberId = session.getAttribute("memberId").toString();
		}
		if(session.getAttribute("pwd") != null) {
			pwd = session.getAttribute("pwd").toString();
		}

		// 페이징 정보 설정
		page_no = req.getParameter("page_no") != null ? Integer.parseInt(req.getParameter("page_no")) : 1;
		page_skip_cnt = (page_no - 1) * page_size;

		maps.put("page_size", page_size);
		maps.put("page_skip_cnt", page_skip_cnt);


		if(memberId != "" && pwd != "") {
			// 회원 정보 찾아오기
			JobDAO jDao = new JobDAO();
			List<JobDTO> list = jDao.getJobList(maps);
			total_count = jDao.getRecruitCount(maps);
			jDao.close();

			total_page = (int)Math.ceil(total_count / (double)page_size);
			page_block_start = (int)(Math.ceil(page_no / (double)page_block_size) -1 ) * page_size + 1;
			page_block_end = (int)Math.ceil(page_no / (double)page_block_size) * page_size;
			page_block_end = page_block_end > total_page ? total_page : page_block_end;

			maps.put("total_count", total_count);
			maps.put("total_page", total_page);
			maps.put("page_no", page_no);
			maps.put("page_block_size", page_block_size);
			maps.put("page_block_start", page_block_start);
			maps.put("page_block_end", page_block_end);

			String pagingArea = BbsPage.pagingArea(total_page, page_no, page_block_start, page_block_end, "./jobList.do?contractType="+contractType+"&sort="+sort+"&");
			maps.put("paging", pagingArea);

			if(list != null) {
				req.setAttribute("list", list);
				req.setAttribute("maps", maps);

				if (contractType.equals("fulltime")) {
					req.getRequestDispatcher("/jobs/jobList.jsp").forward(req, resp);
				} else if (contractType.equals("contract")){
					req.getRequestDispatcher("/jobs/jobList.jsp").forward(req, resp);
				} else {
					resp.sendRedirect("./jobMain.do");
				}
			} else {
				req.setAttribute("jobListSelectErr", "등록된 공고가 없습니다.");

				req.getRequestDispatcher("../main.jsp");
			}
		} else {
			resp.sendRedirect("../member/login.do");
		}
	}


}
