package jobs;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.ConnectPool;

public class JobDAO extends ConnectPool {
	public JobDAO() {}

	// 일반 회원 count
	public int getMemberCount() {
		int result = 0;

		String sql = "SELECT COUNT(memberIdx) FROM member WHERE TYPE='1'";

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			rs.next();

			result = rs.getInt(1);
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("하루 게시된 공고 갯수 확인 시 에러 발생");
		}

		return result;
	}

	// 기업 회원 count
		public int getCompanyCount() {
			int result = 0;

			String sql = "SELECT COUNT(memberIdx) FROM member WHERE TYPE='2'";

			try {
				psmt = conn.prepareStatement(sql);

				rs = psmt.executeQuery();
				rs.next();

				result = rs.getInt(1);
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println("하루 게시된 공고 갯수 확인 시 에러 발생");
			}

			return result;
		}

	// 하루 게시된 공고 갯수
	public int getDayRecruitCount() {
		int result = 0;

		String sql = "SELECT COUNT(recruitIdx) FROM recruit WHERE regDate = DATE(NOW())";

		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();

			result = rs.getInt(1);
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("하루 게시된 공고 갯수 확인 시 에러 발생");
		}

		return result;
	}

	// 계약별 전체 공고 갯수
	public int getRecruitCount(Map<String, Object> maps) {
		int result = 0;

		StringBuilder sb = new StringBuilder();
		sb.append("SELECT COUNT(r.recruitIdx) FROM recruit AS r INNER JOIN member AS m ON m.memberIdx = r.memberIdx ");
		sb.append("WHERE companyName IS NOT NULL AND contractType='" + maps.get("contractType") + "' ");
		if(maps.get("search_word") != null) {
			sb.append("AND m.companyName LIKE '%" + maps.get("search_word") + "%'");
		}
		if(maps.get("position_category") != "") {
			sb.append("AND r.position IN (" + maps.get("position_category") + ") ");
		}
		if(maps.get("addr_category") != "") {
			sb.append("AND m.companyAddr LIKE '" + maps.get("addr_category") + "%' ");
		}
		if(maps.get("career_category") != "") {
			sb.append("AND r.career IN (" + maps.get("career_category") + ") ");
		}

		try {
			psmt = conn.prepareStatement(sb.toString());
			rs = psmt.executeQuery();

			rs.next();

			result = rs.getInt(1);
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("공고 total_count 에러 발생");
		}

		return result;
	}

	// (정규직, 계약직) 공고 리스트 조회
	public List<JobDTO> getJobList(Map<String, Object> maps){
		List<JobDTO> list = new Vector<>();

		StringBuilder sb = new StringBuilder();
		sb.append("SELECT m.companyName, m.type, m.companyAddr, r.recruitIdx, r.position, r.career, r.contractType ");
		sb.append("FROM recruit AS r INNER JOIN member AS m ON m.memberIdx=r.memberIdx ");
		sb.append("WHERE companyName IS NOT NULL AND contractType = '" + maps.get("contractType") + "' ");
		// 검색어
		if(maps.get("search_word") != null) {
			sb.append("AND m.companyName LIKE '%" + maps.get("search_word") + "%' ");
		}
		// 필터 검색
		if(maps.get("position_category") != "") {
			sb.append("AND r.position IN (" + maps.get("position_category") + ") ");
		}
		if(maps.get("addr_category") != "") {
			sb.append("AND m.companyAddr LIKE '" + maps.get("addr_category") + "%' ");
		}
		if(maps.get("career_category") != "") {
			sb.append("AND r.career IN (" + maps.get("career_category") + ") ");
		}
		// 정렬 방법(최신순 기본)
		if(maps.get("sort").equals("old")) {
			sb.append(" ORDER BY regDate ");
		} else {
			sb.append(" ORDER BY regDate DESC ");
		}
		// 페이징
		if(maps.get("page_size") != null && maps.get("page_skip_cnt") != null) {
			sb.append(" LIMIT " + maps.get("page_skip_cnt") + ", " + maps.get("page_size"));
		}

		try {
			psmt = conn.prepareStatement(sb.toString());
			rs = psmt.executeQuery();

			while(rs.next()) {
				JobDTO dto = new JobDTO();

				dto.setCompanyName(rs.getString("companyName"));
				dto.setType(rs.getString("type"));
				dto.setCompanyAddr(rs.getString("companyAddr"));
				dto.setRecruitIdx(rs.getInt("recruitIdx"));
				dto.setPosition(rs.getString("position"));
				dto.setCareer(rs.getString("career"));
				dto.setContractType(rs.getString("contractType"));

				list.add(dto);
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("공고 리스트 조회 시 에러 발생");
		}

		return list;
	}


	// 공고 글 조회
	public JobDTO getJobDetail(int recruitIdx){
		JobDTO dto = new JobDTO();

		StringBuilder sb = new StringBuilder();
		sb.append("SELECT m.memberIdx, m.companyName, m.companyAddr, m.managerName, m.managerPhone, ");
		sb.append("r.recruitIdx, r.recruitTitle, r.dueDate, r.readCnt, r.salary, r.position, r.contractType, r.career, r.recruitContent ");
		sb.append("FROM recruit AS r INNER JOIN member AS m ON m.memberIdx = r.memberIdx ");
		sb.append("WHERE r.recruitIdx=?");

		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setInt(1, recruitIdx);
			rs = psmt.executeQuery();

			if(rs.next()) {
				dto.setMemberIdx(rs.getInt("memberIdx"));
				dto.setCompanyName(rs.getString("companyName"));
				dto.setCompanyAddr(rs.getString("companyAddr"));
				dto.setManagerName(rs.getString("managerName"));
				dto.setManagerPhone(rs.getString("managerPhone"));
				dto.setRecruitIdx(rs.getInt("recruitIdx"));
				dto.setRecruitTitle(rs.getString("recruitTitle"));
				dto.setDueDate(rs.getString("dueDate"));
				dto.setReadCnt(rs.getInt("readCnt"));
				dto.setSalary(rs.getString("salary"));
				dto.setPosition(rs.getString("position"));
				dto.setContractType(rs.getString("contractType"));
				dto.setCareer(rs.getString("career"));
				dto.setRecruitContent(rs.getString("recruitContent"));
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("공고 글 조회 시 에러 발생");
		}

		return dto;
	}

	// 공고 글 작성
	public int insertRecruit(JobDTO dto) {
		int result = 0;

		StringBuilder sb = new StringBuilder();
		sb.append("INSERT INTO recruit(recruitTitle, salary, position, contractType, career, ");
		sb.append("recruitContent, regDate, dueDate, memberIdx) ");
		sb.append("VALUES (?, ?, ?, ?, ?, ?, now(), ?, ?)");

		if(dto.getMemberIdx() != 0) {
			try {
				psmt = conn.prepareStatement(sb.toString());
				psmt.setString(1, dto.getRecruitTitle());
				psmt.setString(2, dto.getSalary());
				psmt.setString(3, dto.getPosition());
				psmt.setString(4, dto.getContractType());
				psmt.setString(5, dto.getCareer());
				psmt.setString(6, dto.getRecruitContent());
				psmt.setString(7, dto.getDueDate());
				psmt.setInt(8, dto.getMemberIdx());

				result = psmt.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println("공고 글 작성 시 에러 발생");
			}
		} else {
			result = 0;
		}

		return result;
	}

	// 공고 글 수정
	public JobDTO modifyRecruit(JobDTO dto) {

		StringBuilder sb = new StringBuilder();
		sb.append("UPDATE recruit SET recruitTitle=?, salary=?, position=?, contractType=?, career=?, ");
		sb.append("recruitContent=?, dueDate=?, memberIdx=? ");
		sb.append("WHERE recruitIdx=?");

		try {
			psmt = conn.prepareStatement(sb.toString());

			psmt.setString(1, dto.getRecruitTitle());
			psmt.setString(2, dto.getSalary());
			psmt.setString(3, dto.getPosition());
			psmt.setString(4, dto.getContractType());
			psmt.setString(5, dto.getCareer());
			psmt.setString(6, dto.getRecruitContent());
			psmt.setString(7, dto.getDueDate());
			psmt.setInt(8, dto.getMemberIdx());
			psmt.setInt(9, dto.getRecruitIdx());

			psmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("공고 글 작성 시 에러 발생");
		}

		return dto;
	}

	public int getJobDelete(int recruitIdx) {
		int result = 0;

		String sql = "DELETE FROM recruit WHERE recruitIdx = ?";

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, recruitIdx);

			result = psmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("공고 글 작성 시 에러 발생");
		}

		return result;
	}

//	public void sortJob(String contractType, String sort) {
//		StringBuilder sb = new StringBuilder();
//
//		sb.append("SELECT m.companyName, m.type, m.companyAddr, r.recruitIdx, r.position, r.career, r.contractType ");
//		sb.append("FROM recruit AS r INNER JOIN member AS m ON m.memberIdx=r.memberIdx ");
//		sb.append("WHERE companyName IS NOT NULL AND contractType = ?");
//		if(sort.equals("recent")) {
//			sb.append(" ORDER BY regDate DESC");
//		} else {
//			sb.append(" ORDER BY regDate");
//		}
//
//		try {
//			psmt = conn.prepareStatement(sb.toString());
//			psmt.setString(1, contractType);
//			psmt.executeQuery();
//		} catch(Exception e) {
//			e.printStackTrace();
//			System.out.println("공고 글 작성 시 에러 발생");
//		}
//	}
}
