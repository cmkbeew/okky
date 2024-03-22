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
			sb.append(" WHERE title");
			sb.append(" LIKE '%" + map.get("search_word") + "%'");
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
	
	public List<QnADTO> mainList(Map<String, Object> map) {
		List<QnADTO> list = new Vector<QnADTO>();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT q.title, q.content, q.regDate, m.memberId, q.qnaIdx, q.memberIdx");
		sb.append(", q.modifyDate, q.tags, q.pageLike, q.pageDislike, q.answerIdx, q.category, q.readCnt");
		sb.append(" FROM qna q inner join member m");
		sb.append(" ON q.memberIdx = m.memberIdx");
		sb.append(" ORDER BY qnaIdx DESC");
		sb.append(" LIMIT 5");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				QnADTO dto = new QnADTO();
				dto.setQnaIdx(rs.getInt("q.qnaIdx"));
				dto.setTitle(rs.getString("q.title"));
				dto.setContent(rs.getString("q.content").substring(0, 10).concat(" ..."));
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
			System.out.println("메인 qna 게시글 조회 실패!");
			
		}
		
		
		return list;
	}
	
	
	public List<QnADTO> qnaList(Map<String, Object> map) {
		List<QnADTO> list = new Vector<QnADTO>();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT q.title, q.content, q.regDate, m.memberId, q.qnaIdx, q.memberIdx");
		sb.append(", q.modifyDate, q.tags, q.pageLike, q.pageDislike, q.answerIdx, q.category, q.readCnt");
		sb.append(" FROM qna q inner join member m");
		sb.append(" ON q.memberIdx = m.memberIdx");
		
//		if (map.get("search_category") != null && map.get("search_word") != null) {
//			sb.append(" WHERE " + map.get("search_category"));
//			sb.append(" LIKE '%" + map.get("search_word") + "%'");
//		}
		if (map.get("category_1") != null) {
			sb.append(" WHERE category LIKE '기술'");
		}
		if (map.get("category_2") != null) {
			sb.append(" WHERE category LIKE '커리어'");
		}
		if (map.get("category_3") != null) {
			sb.append(" WHERE category LIKE '기타'");
		}
		if (map.get("search_category") != null && map.get("search_word") != null) {
			sb.append(" WHERE q.title");
			sb.append(" LIKE '%" + map.get("search_word") + "%'");
			sb.append(" ORDER BY " + map.get("search_category") + " DESC");
		}
		if (map.get("search_category") == null && map.get("search_word") == null) {
			sb.append(" ORDER BY qnaIdx DESC");
		}	
		
//		sb.append(" ORDER BY qnaIdx DESC");
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
	
	
	
	public QnADTO qnaView (int qnaIdx) {
		QnADTO dto = new QnADTO();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT q.title, q.content, q.regDate, m.memberId, q.qnaIdx, q.memberIdx");
		sb.append(", q.modifyDate, q.tags, q.pageLike, q.pageDislike, q.answerIdx, q.category, q.readCnt, m.nickName");
		sb.append(" FROM qna q inner join member m");
		sb.append(" ON q.memberIdx = m.memberIdx");
		sb.append(" WHERE q.qnaIdx = ?");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setInt(1, qnaIdx);
			rs = psmt.executeQuery();
			if (rs.next()) {
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
				dto.setNickName(rs.getString("m.nickName"));
			}
		} catch (Exception e) {
			System.out.println("QnA 게시판 데이터 조회 오류!");
			e.printStackTrace();
		}
		
		return dto;
		
		
	}
	public int qnaRegist(QnADTO dto) {
		int result = 0;
		
		StringBuilder sb = new StringBuilder();
		sb.append("INSERT INTO qna (title, content, category, memberIdx) VALUES(?, ?, ?, ?)");
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getCategory());
			psmt.setInt(4, dto.getMemberIdx());
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시글 등록 오류!" + e.getMessage());
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int qnaDelete(int qnaIdx) {
		int result = 0;
		
		//StringBuilder sb = new StringBuilder();
		//sb.append("DELETE FROM tbl_bbs WHERE idx = ?");
		
		String sql = "DELETE FROM qna WHERE qnaIdx = ?"; //단문이니까 이거 하자
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, qnaIdx);
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시글 삭제 오류!" + e.getMessage());
			e.printStackTrace();
		}
		
		return result;
	
	}
	
	public int qnaModify (QnADTO dto) {
		int result = 0;
		
		StringBuilder sb = new StringBuilder();
		sb.append("UPDATE qna SET title = ?, content = ?, category = ?, modifyDate = now()");
		sb.append(" WHERE qnaIdx = ?");
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getCategory());
			psmt.setInt(4, dto.getQnaIdx());
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시글 수정 중 오류 발생!" + e.getMessage());
			e.printStackTrace();
		}
		
		return result;
	}
	
	public void updateReadCnt(int qnaIdx) {
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("UPDATE qna SET");
		sb.append(" readCnt = readCnt + 1");
		sb.append(" WHERE qnaIdx = ?");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setInt(1, qnaIdx);
			psmt.executeQuery();
			
		} catch (Exception e) {
			System.out.println("조회 갯수 증가 오류!");
			e.printStackTrace();
		}
	}
	
	public void updatePageLike(int qnaIdx) {
	
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("UPDATE qna SET");
		sb.append(" pageLike = pageLike + 1");
		sb.append(" WHERE qnaIdx = ?");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setInt(1, qnaIdx);
			psmt.executeQuery();
			
		} catch (Exception e) {
			System.out.println("좋아요 갯수 증가 오류!");
			e.printStackTrace();
		}
	}
	
	public void updatePageDislike(int qnaIdx) {
	
		StringBuilder sb = new StringBuilder();
		
		sb.append("UPDATE qna SET");
		sb.append(" pageDislike = pageDislike + 1");
		sb.append(" WHERE qnaIdx = ?");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setInt(1, qnaIdx);
			psmt.executeQuery();
			
		} catch (Exception e) {
			System.out.println("싫어요 갯수 증가 오류!");
			e.printStackTrace();
		}
	}
	
	
}
