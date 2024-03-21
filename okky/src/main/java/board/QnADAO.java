package board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.ConnectPool;

public class QnADAO extends ConnectPool {
	
	public QnADAO() {}
	
	public int qnaTotalCount(Map<String, Object> map) {
		int total_count = 0;
		
		/* 이렇게 해줘두 돼
		String sql = "SELECT COUNT(*) FROM tbl_bbs";
		if (map != null) {
			sql += "WHERE " + map.get("search_category");
			sql += " LIKE '%" + map.get("search_word") + "%;";
		}
		*/

		StringBuilder sb = new StringBuilder(); //동적으로 생성되거나 문자열을 계속 추가해야 할 때
		sb.append("SELECT COUNT(*) FROM qna");
		if (map.get("search_category") != null && map.get("search_word") != null) {
			sb.append(" WHERE " + map.get("search_category")); //컬럼명
			sb.append(" LIKE '%" + map.get("search_word") + "%'"); //컬럼명 서치하는 키워드
		}
		
		try {
			String sql = sb.toString();//StringBuilder 타입이라서 형변환
			psmt = conn.prepareStatement(sql); 
			//psmt.setString(1, map.get("search_category"));//위에서 ? 처리 했으면 여기서 넣어주면 돼
			//psmt.setString(2, map.get("search_word"));
			rs = psmt.executeQuery();  
			rs.next(); 
			total_count = rs.getInt(1); //count(*)한 결과
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("게시물 갯수 조회 에러");
		}
		
		return total_count;
	}
	
	public List<QnADTO> qnaList(Map<String, Object> map) {
		List<QnADTO> list = new Vector<QnADTO>();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT q.title, q.content, q.regDate, m.memberId, q.qnaIdx, q.memberIdx");
		sb.append(", q.modifyDate, q.tags, q.pageLike, q.pageDislike, q.answerIdx, q.category, q.readCnt");
		sb.append(" FROM qna q inner join member m");
		sb.append(" ON q.memberIdx = m.memberIdx");
		
		if (map.get("search_category") != null && map.get("search_word") != null) {
			sb.append(" WHERE " + map.get("search_category"));
			sb.append(" LIKE '%" + map.get("search_word") + "%'");
		}
		sb.append(" ORDER BY qnaIdx DESC");
		if (map.get("page_skip_cnt") != null && map.get("page_size") != null) {
			sb.append(" LIMIT " + map.get("page_skip_cnt") + ", " + map.get("page_size")); // ?로 쓰는게 더 좋아
		}
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				QnADTO dto = new QnADTO();
				dto.setQnaIdx(rs.getInt("q.qnaIdx"));
				dto.setTitle(rs.getString("q.title"));
				dto.setContent(rs.getString("q.content"));
				dto.setRegDate(rs.getDate("q.regDate"));
				dto.setModifyDate(rs.getDate("q.modifyDate"));
				dto.setTags(rs.getString("q.tags"));
				dto.setPageLike(rs.getInt("q.pageLike"));
				dto.setPageDislike(rs.getInt("q.pageDislike"));
				dto.setAnswerIdx(rs.getInt("q.answerIdx"));
				dto.setCategory(rs.getString("q.category"));
				dto.setReadCnt(rs.getInt("q.readCnt"));
				dto.setMemberIdx(rs.getInt("q.memberIdx"));
				dto.setMemberId(rs.getString("m.memberId"));
				
				list.add(dto);
			}
			
		} catch (Exception e) {
			System.out.println("게시글 조회 실패!");
			
		}
		
		
		return list;
	}
}
