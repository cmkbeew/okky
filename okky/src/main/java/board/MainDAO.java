package board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.ConnectPool;

public class MainDAO extends ConnectPool {
	public MainDAO() {}

	// weekly best
	public List<MainDTO> likeList(Map<String, Object> map) {
		List<MainDTO> list = new Vector<>();

		String sql = "select title, regDate, memberId, pageLike, readCnt, types, idx"
				+ " from"
				+ " ("
				+ " select m.memberId, q.title, q.regDate, q.pageLike, q.readCnt, 'QnA' as types, qnaIdx as idx "
				+ " from qna q"
				+ " inner join member m on m.memberIdx = q.memberIdx"
				+ " union all"
				+ " select m.memberId, c.title, c.regDate, c.pageLike, c.readCnt, 'Community' as types, communityIdx as idx"
				+ " from community c"
				+ " inner join member m on m.memberIdx = c.memberIdx"
				+ " ) as total "
				+ " order by pageLike desc, readCnt desc"
				+ " LIMIT 5";

		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				MainDTO dto = new MainDTO();
				dto.setTitle(rs.getString("title"));
				dto.setRegDate(rs.getDate("regDate"));
				dto.setMemberId(rs.getString("memberId"));
				dto.setPageLike(rs.getInt("pageLike"));
				dto.setReadCnt(rs.getInt("readCnt"));
				dto.setTypes(rs.getString("types"));
				dto.setIdx(rs.getInt("idx"));

				list.add(dto);
			}


		} catch(Exception e) {
			System.out.println("메인 top writer 게시글 조회 실패!");
		}
		return list;
	}

	public List<MainDTO> writeList(Map<String, Object> map) {
		List<MainDTO> list = new Vector<>();

		String sql = "select total.memberId, count(*) as writeCnt from"
				+ " ("
				+ " select q.qnaIdx, m.memberId"
				+ " from member m"
				+ " inner join qna q on m.memberIdx = q.memberIdx"
				+ " union all"
				+ " select c.communityIdx, m.memberId"
				+ " from member m"
				+ " inner join community c on m.memberIdx = c.memberIdx"
				+ " ) as total"
				+ " group by total.memberId"
				+ " order by writeCnt desc"
				+ " limit 5";

		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				MainDTO dto = new MainDTO();
				dto.setMemberId(rs.getString("memberId"));
				dto.setWriteCnt(rs.getInt("writeCnt"));

				list.add(dto);
			}


		} catch(Exception e) {
			System.out.println("메인 작성자 좋아요 수 조회 실패!");
			e.printStackTrace();
		}
		return list;
	}
}
