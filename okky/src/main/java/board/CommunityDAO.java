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
	
	public List<CommunityDTO> mainList(Map<String, Object> map) {
		List<CommunityDTO> list = new Vector<CommunityDTO>();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT c.title, c.content, c.regDate, m.memberId, c.communityIdx, c.memberIdx");
		sb.append(", c.modifyDate, c.skill1, c.skill2, c.skill3, c.pageLike, c.pageDislike, c.answerIdx, c.category, c.readCnt");
		sb.append(" FROM community c inner join member m");
		sb.append(" ON c.memberIdx = m.memberIdx");
		sb.append(" ORDER BY c.communityIdx DESC");
		sb.append(" LIMIT 5");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				CommunityDTO dto = new CommunityDTO();
				dto.setCommunityIdx(rs.getInt("c.communityIdx"));
				dto.setTitle(rs.getString("c.title"));
				dto.setContent(rs.getString("c.content").substring(0,10).concat(" ..."));
				dto.setRegDate(rs.getDate("c.regDate"));
				dto.setModifyDate(rs.getDate("c.modifyDate"));
				dto.setPageLike(rs.getInt("c.pageLike"));
				dto.setPageDislike(rs.getInt("c.pageDislike"));
				dto.setAnswerIdx(rs.getInt("c.answerIdx"));
				dto.setCategory(rs.getString("c.category"));
				dto.setReadCnt(rs.getInt("c.readCnt"));
				dto.setMemberIdx(rs.getInt("c.memberIdx"));
				dto.setMemberId(rs.getString("m.memberId"));

				dto.setSkill1(rs.getString("c.skill1"));
				dto.setSkill2(rs.getString("c.skill2"));
				dto.setSkill3(rs.getString("c.skill3"));
				
				list.add(dto);
			}
			
		} catch (Exception e) {
			System.out.println("메인 community 게시글 조회 실패!");
			
		}
		
		
		return list;
	}
	
	public List<CommunityDTO> mainNoticeList(Map<String, Object> map) {
		List<CommunityDTO> list = new Vector<CommunityDTO>();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT c.title, c.content, c.regDate, m.memberId, c.communityIdx, c.memberIdx");
		sb.append(", c.modifyDate, c.skill1, c.skill2, c.skill3, c.pageLike, c.pageDislike, c.answerIdx, c.category, c.readCnt");
		sb.append(" FROM community c inner join member m");
		sb.append(" ON c.memberIdx = m.memberIdx");
		sb.append(" WHERE category = '공지사항'");
		sb.append(" ORDER BY c.communityIdx DESC");
		sb.append(" LIMIT 5");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				CommunityDTO dto = new CommunityDTO();
				dto.setCommunityIdx(rs.getInt("c.communityIdx"));
				dto.setTitle(rs.getString("c.title"));
				dto.setContent(rs.getString("c.content").substring(0,10).concat(" ..."));
				dto.setRegDate(rs.getDate("c.regDate"));
				dto.setModifyDate(rs.getDate("c.modifyDate"));
				dto.setPageLike(rs.getInt("c.pageLike"));
				dto.setPageDislike(rs.getInt("c.pageDislike"));
				dto.setAnswerIdx(rs.getInt("c.answerIdx"));
				dto.setCategory(rs.getString("c.category"));
				dto.setReadCnt(rs.getInt("c.readCnt"));
				dto.setMemberIdx(rs.getInt("c.memberIdx"));
				dto.setMemberId(rs.getString("m.memberId"));

				dto.setSkill1(rs.getString("c.skill1"));
				dto.setSkill2(rs.getString("c.skill2"));
				dto.setSkill3(rs.getString("c.skill3"));
				
				list.add(dto);
			}
			
		} catch (Exception e) {
			System.out.println("메인 community 게시글 조회 실패!");
			
		}
		
		
		return list;
	}
	
	public List<CommunityDTO> communityList(Map<String, Object> map) {
		List<CommunityDTO> list = new Vector<CommunityDTO>();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT c.title, c.content, c.regDate, m.memberId, c.communityIdx, c.memberIdx");
		sb.append(", c.modifyDate, c.skill1, c.skill2, c.skill3, c.pageLike, c.pageDislike, c.answerIdx, c.category, c.readCnt");
		sb.append(" FROM community c inner join member m");
		sb.append(" ON c.memberIdx = m.memberIdx");
		
		if (map.get("category_1") != null) {
			sb.append(" WHERE category LIKE '일상'");
		}
		if (map.get("category_2") != null) {
			sb.append(" WHERE category LIKE '공부'");
		}
		if (map.get("category_3") != null) {
			sb.append(" WHERE category LIKE '공지사항'");
		}
		if (map.get("search_category") != null && map.get("search_word") != null) {
			sb.append(" WHERE c.title");
			sb.append(" LIKE '%" + map.get("search_word") + "%'");
			sb.append(" ORDER BY " + map.get("search_category") + " DESC");
		}
		if (map.get("search_category") == null && map.get("search_word") == null) {
			sb.append(" ORDER BY communityIdx DESC");
		}	
		
//		sb.append(" ORDER BY communityIdx DESC");
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
				dto.setPageLike(rs.getInt("c.pageLike"));
				dto.setPageDislike(rs.getInt("c.pageDislike"));
				dto.setAnswerIdx(rs.getInt("c.answerIdx"));
				dto.setCategory(rs.getString("c.category"));
				dto.setReadCnt(rs.getInt("c.readCnt"));
				dto.setMemberIdx(rs.getInt("c.memberIdx"));
				dto.setMemberId(rs.getString("m.memberId"));
				
				dto.setSkill1(rs.getString("c.skill1"));
				dto.setSkill2(rs.getString("c.skill2"));
				dto.setSkill3(rs.getString("c.skill3"));
				
				list.add(dto);
			}
			
		} catch (Exception e) {
			System.out.println("게시글 조회 실패!");
			
		}
		
		
		return list;
	}

	
	public List<CommunityDTO> likeList(Map<String, Object> map) {
		List<CommunityDTO> list = new Vector<CommunityDTO>();
		
		String sql = "select title, pageLike from"
				+ " ("
				+ " select m.memberId, q.title, q.regDate, q.pageLike, q.readCnt"
				+ " from qna q"
				+ " inner join member m on m.memberIdx = q.memberIdx"
				+ " union all"
				+ " select m.memberId, c.title, c.regDate, c.pageLike, c.readCnt"
				+ " from community c"
				+ " inner join member m on m.memberIdx = c.memberIdx"
				+ " ) as total"
				+ " order by pageLike desc"
				+ " limit 5";
		
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				CommunityDTO dto = new CommunityDTO();
				dto.setTitle(rs.getString("title"));
				dto.setPageLike(rs.getInt("pageLike"));
				
				list.add(dto);
			}
		
			
		} catch(Exception e) {
			System.out.println("community 추천글 조회 실패!");
		}
		return list;
	}
	
	
	public CommunityDTO communityView (int communityIdx) {
		CommunityDTO dto = new CommunityDTO();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT c.title, c.content, c.regDate, m.memberId, c.communityIdx, c.memberIdx");
		sb.append(", c.modifyDate, c.skill1, c.skill2, c.skill3, c.pageLike, c.pageDislike, c.answerIdx, c.category, c.readCnt, m.nickName");
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
				dto.setPageLike(rs.getInt("c.pageLike"));
				dto.setPageDislike(rs.getInt("c.pageDislike"));
				dto.setAnswerIdx(rs.getInt("c.answerIdx"));
				dto.setCategory(rs.getString("c.category"));
				dto.setReadCnt(rs.getInt("c.readCnt"));
				dto.setMemberIdx(rs.getInt("c.memberIdx"));
				dto.setMemberId(rs.getString("m.memberId"));
				dto.setNickName(rs.getString("m.nickName"));

				dto.setSkill1(rs.getString("c.skill1"));
				dto.setSkill2(rs.getString("c.skill2"));
				dto.setSkill3(rs.getString("c.skill3"));
			}
		} catch (Exception e) {
			System.out.println("Community 게시판 데이터 조회 오류!");
			e.printStackTrace();
		}
		
		return dto;
		
		
	}
	public int communityRegist(CommunityDTO dto) {
		int result = 0;
		
		StringBuilder sb = new StringBuilder();
		sb.append("INSERT INTO community (title, content, category, skill1, skill2, skill3, memberIdx) VALUES(?, ?, ?, ?, ?, ?, ?)");
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getCategory());
			psmt.setString(4, dto.getSkill1());
			psmt.setString(5, dto.getSkill2());
			psmt.setString(6, dto.getSkill3());
			psmt.setInt(7, dto.getMemberIdx());
			
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
		sb.append("UPDATE community SET title = ?, content = ?, category = ?, skill1 = ?, skill2 = ?, skill3 = ?, modifyDate = now()");
		sb.append(" WHERE communityIdx = ?");
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getCategory());
			psmt.setString(4, dto.getSkill1());
			psmt.setString(5, dto.getSkill2());
			psmt.setString(6, dto.getSkill3());
			psmt.setInt(4, dto.getCommunityIdx());
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시글 수정 중 오류 발생!" + e.getMessage());
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	public void updateReadCnt(int communityIdx) {
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("UPDATE community SET");
		sb.append(" readCnt = readCnt + 1");
		sb.append(" WHERE communityIdx = ?");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setInt(1, communityIdx);
			psmt.executeQuery();
			
		} catch (Exception e) {
			System.out.println("조회 갯수 증가 오류!");
			e.printStackTrace();
		}
	}
	
	public void updatePageLike(int communityIdx) {
	
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("UPDATE community SET");
		sb.append(" pageLike = pageLike + 1");
		sb.append(" WHERE communityIdx = ?");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setInt(1, communityIdx);
			psmt.executeQuery();
			
		} catch (Exception e) {
			System.out.println("좋아요 갯수 증가 오류!");
			e.printStackTrace();
		}
	}
	
	public void updatePageDislike(int communityIdx) {
	
		StringBuilder sb = new StringBuilder();
		
		sb.append("UPDATE community SET");
		sb.append(" pageDislike = pageDislike + 1");
		sb.append(" WHERE communityIdx = ?");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setInt(1, communityIdx);
			psmt.executeQuery();
			
		} catch (Exception e) {
			System.out.println("싫어요 갯수 증가 오류!");
			e.printStackTrace();
		}
	}
	
	
}
