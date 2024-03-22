package board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.ConnectPool;

public class CommunityDAO extends ConnectPool {
	
	public CommunityDAO() {}
	
	public int communityTotalCount(Map<String, Object> map) {
		int total_count = 0;
		
		/* 이렇게 해줘두 돼
		String sql = "SELECT COUNT(*) FROM tbl_bbs";
		if (map != null) {
			sql += "WHERE " + map.get("search_category");
			sql += " LIKE '%" + map.get("search_word") + "%;";
		}
		*/

		StringBuilder sb = new StringBuilder(); //동적으로 생성되거나 문자열을 계속 추가해야 할 때
		sb.append("SELECT COUNT(*) FROM community");
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
	
	public List<CommunityDTO> communityList(Map<String, Object> map) {
		List<CommunityDTO> list = new Vector<CommunityDTO>();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT c.title, c.content, c.regDate, m.memberId, c.communityIdx, c.memberIdx");
		sb.append(", c.modifyDate, c.tags, c.pageLike, c.pageDislike, c.answerIdx, c.category, c.readCnt");
		sb.append(" FROM community c inner join member m");
		sb.append(" ON c.memberIdx = m.memberIdx");
		
		if (map.get("search_category") != null && map.get("search_word") != null) {
			sb.append(" WHERE " + map.get("search_category"));
			sb.append(" LIKE '%" + map.get("search_word") + "%'");
		}
		sb.append(" ORDER BY c.communityIdx DESC");
		if (map.get("page_skip_cnt") != null && map.get("page_size") != null) {
			sb.append(" LIMIT " + map.get("page_skip_cnt") + ", " + map.get("page_size")); // ?로 쓰는게 더 좋아
		}
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				CommunityDTO dto = new CommunityDTO();
				dto.setCommunityIdx(rs.getInt("c.communityIdx"));
				dto.setTitle(rs.getString("c.title"));
				dto.setContent(rs.getString("c.content"));
				dto.setRegDate(rs.getDate("c.regDate"));
				dto.setModifyDate(rs.getDate("c.modifyDate"));
				dto.setTags(rs.getString("c.tags"));
				dto.setPageLike(rs.getInt("c.pageLike"));
				dto.setPageDislike(rs.getInt("c.pageDislike"));
				dto.setAnswerIdx(rs.getInt("c.answerIdx"));
				dto.setCategory(rs.getString("c.category"));
				dto.setReadCnt(rs.getInt("c.readCnt"));
				dto.setMemberIdx(rs.getInt("c.memberIdx"));
				dto.setMemberId(rs.getString("m.memberId"));
				
				list.add(dto);
			}
			
		} catch (Exception e) {
			System.out.println("게시글 조회 실패!");
			
		}
		
		
		return list;
	}
	
	public CommunityDTO communityView (int communityIdx) {
		CommunityDTO dto = new CommunityDTO();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT c.title, c.content, c.regDate, m.memberId, c.communityIdx, m.memberIdx");
		sb.append(", c.modifyDate, c.tags, c.pageLike, c.pageDislike, c.answerIdx, c.category, c.readCnt, m.nickName");
		sb.append(" FROM community c inner join member m");
		sb.append(" ON c.memberIdx = m.memberIdx");
		sb.append(" WHERE c.communityIdx = ?");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setInt(1, communityIdx);
			rs = psmt.executeQuery();
			if (rs.next()) {
				dto.setCommunityIdx(rs.getInt("c.communityIdx"));
				dto.setTitle(rs.getString("c.title"));
				dto.setContent(rs.getString("c.content"));
				dto.setRegDate(rs.getDate("c.regDate"));
				dto.setModifyDate(rs.getDate("c.modifyDate"));
				dto.setTags(rs.getString("c.tags"));
				dto.setPageLike(rs.getInt("c.pageLike"));
				dto.setPageDislike(rs.getInt("c.pageDislike"));
				dto.setAnswerIdx(rs.getInt("c.answerIdx"));
				dto.setCategory(rs.getString("c.category"));
				dto.setReadCnt(rs.getInt("c.readCnt"));
				dto.setMemberIdx(rs.getInt("m.memberIdx"));
				dto.setMemberId(rs.getString("m.memberId"));
				dto.setNickName(rs.getString("m.nickName"));
			}
		} catch (Exception e) {
			System.out.println("QnA 게시판 데이터 조회 오류!");
			e.printStackTrace();
		}
		
		return dto;
		
		
	}
	public int communityRegist(CommunityDTO dto) {
		int result = 0;
		
		StringBuilder sb = new StringBuilder();
		sb.append("INSERT INTO community (title, content, category) VALUES(?, ?, ?)");
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getCategory());
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시글 등록 오류!" + e.getMessage());
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int communityDelete(int communityIdx) {
		int result = 0;
		
		//StringBuilder sb = new StringBuilder();
		//sb.append("DELETE FROM tbl_bbs WHERE idx = ?");
		
		String sql = "DELETE FROM community WHERE communityIdx = ?"; //단문이니까 이거 하자
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, communityIdx);
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시글 삭제 오류!" + e.getMessage());
			e.printStackTrace();
		}
		
		return result;
	
	}
	
	public int communityModify (CommunityDTO dto) {
		int result = 0;
		
		StringBuilder sb = new StringBuilder();
		sb.append("UPDATE community SET title = ?, content = ?, modify_date = now()");
		sb.append(" WHERE idx = ?");
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setInt(3, dto.getCommunityIdx());
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시글 수정 중 오류 발생!" + e.getMessage());
			e.printStackTrace();
		}
		
		return result;
	}
}
