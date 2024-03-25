package board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.ConnectPool;

public class TagDAO extends ConnectPool {

	public List<TagDTO> tagList(Map<String, Object> map) {
		List<TagDTO> list = new Vector<>();

		String sql = "select case when skill1='백엔드' then '백엔드' else null end as tags,count(case when skill1='백엔드' then 1 else null end) as 'count' from qna where skill1 is not null "
				+ " union "
				+ " select case when skill1='프론트엔드' then 1 else '프론트엔드' end as tags,count(case when skill1='프론트엔드' then 1 else null end) as 'count' from qna where skill1 is not null "
				+ " union "
				+ " select case when skill1='풀스택' then 1 else '풀스택' end as tags,count(case when skill1='풀스택' then 1 else null end) as 'count' from qna where skill1 is not null "
				+ " union all "
				+ " select case when skill2='c' then 'c' else null end as tags,count(case when skill2='c' then 1 else null end) as 'count' from qna where skill2 is not null "
				+ " union "
				+ " select case when skill2='java' then 1 else 'java' end as tags,count(case when skill2='java' then 1 else null end) as 'count' from qna where skill2 is not null "
				+ " union "
				+ " select case when skill2='c++' then 1 else 'c++' end as tags,count(case when skill2='c++' then 1 else null end) as 'count' from qna where skill2 is not null "
				+ " union "
				+ " select case when skill2='c#' then 1 else 'c#' end as tags,count(case when skill2='c#' then 1 else null end) as 'count' from qna where skill2 is not null "
				+ " union "
				+ " select case when skill2='db' then 1 else 'db' end as tags,count(case when skill2='db' then 1 else null end) as 'count' from qna where skill2 is not null "
				+ " union "
				+ " select case when skill2='python' then 1 else 'python' end as tags,count(case when skill2='python' then 1 else null end) as 'count' from qna where skill2 is not null "
				+ " union "
				+ " select case when skill2='javaScript' then 1 else 'javaScript' end as tags,count(case when skill2='java' then 1 else null end) as 'count' from qna where skill2 is not null "
				+ " union "
				+ " select case when skill2='html' then 1 else 'html' end as tags,count(case when skill2='html' then 1 else null end) as 'count' from qna where skill2 is not null "
				+ " union "
				+ " select case when skill2='css' then 1 else 'css' end as tags,count(case when skill2='css' then 1 else null end) as 'count' from qna where skill2 is not null "
				+ " union all "
				+ " select case when skill3='git' then 'git' else null end as tags,count(case when skill3='git' then 1 else null end) as 'count' from qna where skill3 is not null "
				+ " union "
				+ " select case when skill3='github' then 1 else 'github' end as tags,count(case when skill3='github' then 1 else null end) as 'count' from qna where skill3 is not null "
				+ " order by count desc"
				+ " limit 5";

		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while(rs.next()) {
				TagDTO dto = new TagDTO();
				dto.setTags(rs.getString("tags"));
				dto.setCount(rs.getInt("count"));

				list.add(dto);
			}

		} catch (Exception e) {
			System.out.println("커뮤니티 게시판 태그 조회 오류!");
			e.printStackTrace();
		}


		return list;
	}
}
