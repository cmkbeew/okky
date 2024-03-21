package controller.board.qna;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import board.QnADAO;
import board.QnADTO;
import common.BbsPage;


public class QnaController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int total_count = 0;
		int total_page = 1;
		int page_no = 1;
		int page_size = 10;
		int page_skip_cnt = 10;
		int page_block_size = 5;
		int page_block_start = 1;
		int page_block_end = 1;

	
		//JSP 페이지에 전달할 맵 객체 설정
		Map<String, Object> params = new HashMap<String, Object>();
		String search_category = request.getParameter("search_category");
		String search_word = request.getParameter("search_word");
		page_no = (request.getParameter("page_no") != null ? Integer.parseInt(request.getParameter("page_no")) : 1);
		page_skip_cnt = (page_no-1)*page_size;
		
		//검색 파라미터 설정
		if (search_word != null && !search_word.isEmpty() 
				&& search_category != null && !search_category.isEmpty()) {
			if (search_word.trim() != null && !search_word.trim().isEmpty()
					&& search_category.trim() != null && !search_category.isEmpty()) {
				params.put("search_category", search_category.trim());
				params.put("search_word", search_word.trim());
			}
		}
		
		//페이징 파라미터 설정
		params.put("page_no", page_no);
		params.put("page_size", page_size);
		params.put("page_skip_cnt", page_skip_cnt);
		
		//게시판 테이블 조회
		QnADAO dao = new QnADAO();
		total_count = dao.qnaTotalCount(params);	
		List<QnADTO> qnaList = dao.qnaList(params);
		dao.close();

		//페이징 파라미터 설정
		total_page = (int)Math.ceil(total_count/(double)page_size);
		page_block_size = 10;
		page_block_start = (int)Math.floor((page_no-1)/(double)page_size)*page_size + 1;
		page_block_end = (int)Math.ceil((page_no/(double)page_size))*page_size;
		page_block_end = (page_block_end > total_page ? total_page : page_block_end);
		
		params.put("total_count", total_count);
		params.put("total_page", total_page);
		params.put("page_block_size", page_block_size);
		params.put("page_block_start", page_block_start);
		params.put("page_block_end", page_block_end);
		
		String pagingArea = BbsPage.pagingArea(total_page, page_no, page_block_start, page_block_end, "qna.do?");
//		System.out.println("paging : " + pagingArea);
		params.put("paging", pagingArea);
		
		request.setAttribute("qnaList", qnaList);
		request.setAttribute("params", params);
		
		request.getRequestDispatcher("/board/qna/qna.jsp").forward(request,  response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
