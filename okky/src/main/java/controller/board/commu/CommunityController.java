package controller.board.commu;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import board.CommunityDAO;
import board.CommunityDTO;
import common.BbsPage;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class CommunityController extends HttpServlet {
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

		Map<String, Object> params = new HashMap<>();
		String search_category = request.getParameter("search_category");
		String search_word = request.getParameter("search_word");
		String sort = request.getParameter("sort") != null ? request.getParameter("sort") : "";

		String category_1 = request.getParameter("category_1");
		String category_2 = request.getParameter("category_2");
		String category_3 = request.getParameter("category_3");

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
		//sort
		params.put("sort", sort);

		//페이징 파라미터 설정
		params.put("page_no", page_no);
		params.put("page_size", page_size);
		params.put("page_skip_cnt", page_skip_cnt);
		params.put("category_1", category_1);
		params.put("category_2", category_2);
		params.put("category_3", category_3);

		//게시판 테이블 조회
		CommunityDAO dao = new CommunityDAO();
		total_count = dao.communityTotalCount(params);
		
		//댓글 갯수 조회
	
		
		
	
		
		List<CommunityDTO> communityList = dao.communityList(params);
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

		String pagingArea = BbsPage.pagingArea(total_page, page_no, page_block_start, page_block_end, "commu.do?" + link + "&sort=" + sort + "&");
//		System.out.println("paging : " + pagingArea);
		params.put("paging", pagingArea);

		request.setAttribute("communityList", communityList);
		request.setAttribute("params", params);

		Map<String, Object> mainLikeParams = new HashMap<>();
		CommunityDAO like = new CommunityDAO();
		List<CommunityDTO> likeList = like.likeList(mainLikeParams);
		like.close();

		request.setAttribute("likeList", likeList);

		request.getRequestDispatcher("/board/commu/community.jsp").forward(request,  response);
	}


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
