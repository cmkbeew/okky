package board;

import java.util.List;
import java.util.Vector;

import common.ConnectPool;

public class CommentDAO extends ConnectPool {
	
	public CommentDAO() {}
	
	// qna 댓글 작성
	public int writeQnaComment(CommentDTO inputDTO) {
		int result = 0;
		
		StringBuilder sb = new StringBuilder();
		sb.append("INSERT INTO qna_comment(commentContent, regDate, memberIdx, qnaIdx) ");
		sb.append("VALUES (?, NOW(), ?, ?)");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, inputDTO.getCommentContent());
			psmt.setInt(2, inputDTO.getMemberIdx());
			psmt.setInt(3, inputDTO.getQnaIdx());
			
			result = psmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("댓글 작성 중 에러 발생");
		}
		
		return result;
	}
	
	// qna 댓글 리스트 조회
	public List<CommentDTO> getQnaCommentList(int qnaIdx) {
		List<CommentDTO> list = new Vector<CommentDTO>();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT c.commentContent, c.regDate, m.memberIdx, m.nickname, q.qnaIdx ");
		sb.append("FROM qna_comment AS c ");
		sb.append("INNER JOIN member AS m ON m.memberIdx = c.memberIdx ");
		sb.append("INNER JOIN qna AS q ON q.qnaIdx = c.qnaIdx ");
		sb.append("WHERE q.qnaIdx = ? ");
		sb.append("ORDER BY c.regDate desc, c.qnaCommentIdx desc");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setInt(1, qnaIdx);
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				CommentDTO dto = new CommentDTO();
				
				dto.setCommentContent(rs.getString("commentContent"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setMemberIdx(rs.getInt("memberIdx"));
				dto.setNickname(rs.getString("nickname"));
				dto.setQnaIdx(rs.getInt("qnaIdx"));
				
				list.add(dto);
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("댓글 리스트 조회 중 에러 발생");
		}
		
		return list;
	}
	
	// community 댓글 작성
		public int writeCommunityComment(CommentDTO inputDTO) {
			int result = 0;
			
			StringBuilder sb = new StringBuilder();
			sb.append("INSERT INTO community_comment(commentContent, regDate, memberIdx, communityIdx) ");
			sb.append("VALUES (?, NOW(), ?, ?)");
			
			try {
				psmt = conn.prepareStatement(sb.toString());
				psmt.setString(1, inputDTO.getCommentContent());
				psmt.setInt(2, inputDTO.getMemberIdx());
				psmt.setInt(3, inputDTO.getCommunityIdx());
				
				result = psmt.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println("댓글 작성 중 에러 발생");
			}
			
			return result;
		}
		
		// community 댓글 리스트 조회
		public List<CommentDTO> getCommunityCommentList(int communityIdx) {
			List<CommentDTO> list = new Vector<CommentDTO>();
			
			StringBuilder sb = new StringBuilder();
			sb.append("SELECT cc.commentContent, cc.regDate, m.memberIdx, m.nickname, cm.communityIdx ");
			sb.append("FROM community_comment AS cc ");
			sb.append("INNER JOIN member AS m ON m.memberIdx = cc.memberIdx ");
			sb.append("INNER JOIN community AS cm ON cm.communityIdx = cc.communityIdx ");
			sb.append("WHERE cm.communityIdx = ? ");
			sb.append("ORDER BY cc.regDate desc, cc.communityCommentIdx desc");
			
			try {
				psmt = conn.prepareStatement(sb.toString());
				psmt.setInt(1, communityIdx);
				
				rs = psmt.executeQuery();
				while(rs.next()) {
					CommentDTO dto = new CommentDTO();
					
					dto.setCommentContent(rs.getString("commentContent"));
					dto.setRegDate(rs.getString("regDate"));
					dto.setMemberIdx(rs.getInt("memberIdx"));
					dto.setNickname(rs.getString("nickname"));
					dto.setCommunityIdx(rs.getInt("communityIdx"));
					
					list.add(dto);
				}
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println("댓글 리스트 조회 중 에러 발생");
			}
			
			return list;
		}
}
