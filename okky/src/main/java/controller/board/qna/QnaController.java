package controller.board.qna;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import board.QnADAO;
import board.QnADTO;
import board.TagDAO;
import board.TagDTO;
import common.BbsPage;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class QnaController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int total_count = 0;
		int total_page = 1;
		int page_no = 1;
		int page_size = 10;
		int page_skip_cnt = 5;
		int page_block_size = 5;
		int page_block_start = 1;
		int page_block_end = 1;


		//JSP 페이지에 전달할 맵 객체 설정
		Map<String, Object> params = new HashMap<>();

		String search_category = request.getParameter("search_category");
		String search_word = request.getParameter("search_word");
		String sort = request.getParameter("sort") != null ? request.getParameter("sort") : "";

		String category_1 = request.getParameter("category_1");
		String category_2 = request.getParameter("category_2");
		String category_3 = request.getParameter("category_3");
//		String category = request.getParameter("category");

		page_no = (request.getParameter("page_no") != null ? Integer.parseInt(request.getParameter("page_no")) : 1);
		page_skip_cnt = (page_no-1)*page_size;

		//검색 파라미터 설정
		if (search_word != null && !search_word.isEmpty()) {
			if (search_word.trim() != null && !search_word.trim().isEmpty()) {
				params.put("search_word", search_word.trim());

			}
		}
		//sort
		params.put("sort", sort);

		//페이징 파라미터 설정
		params.put("page_no", page_no);
		params.put("page_size", page_size);
		params.put("page_skip_cnt", page_skip_cnt);
		params.put("category_1", category_1);
		params.put("category_2", category_2);
		params.put("category_3", category_3);
//		params.put("category", category);

//		System.out.println(category);

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

		String link = "";

		if (category_1 != null) {
			link = "category_1=" + category_1;
		}
		if (category_2 != null) {
			link = "category_2=" + category_2;
		}
		if (category_3 != null) {
			link = "category_3=" + category_3;
		}


//		String link = "category_1=" + category_1 + "&category_2=" + category_2 + "&category_3=" + category_3 + "&sort=" + sort + "&";
//		String link = "category=" + category + "&sort=" + sort + "&";

		String pagingArea = BbsPage.pagingArea(total_page, page_no, page_block_start, page_block_end, "qna.do?" + link + "&sort=" + sort + "&");


//		System.out.println("paging : " + pagingArea);
		params.put("paging", pagingArea);

		request.setAttribute("qnaList", qnaList);
		request.setAttribute("params", params);


		Map<String, Object> tagParams = new HashMap<>();

		TagDAO tag = new TagDAO();
		List<TagDTO> tagList = tag.tagList(tagParams);
		tag.close();

		request.setAttribute("tagList", tagList);

		request.getRequestDispatcher("/board/qna/qna.jsp").forward(request,  response);
	}


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
