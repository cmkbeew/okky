package board;

import java.sql.Date;

public class CommunityDTO {
	private int communityIdx;
	private String title;
	private String content;
	private Date regDate;
	private Date modifyDate;
	private int pageLike;
	private int pageDislike;
	private int answerIdx;
	private String category;
	private int readCnt;
	private int memberIdx;
	private String memberId;
	private String nickName;
	private String skill1;
	private String skill2;
	private String skill3;



	public CommunityDTO() {}


	public int getCommunityIdx() {
		return communityIdx;
	}


	public void setCommunityIdx(int qnaIdx) {
		this.communityIdx = qnaIdx;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String titie) {
		this.title = titie;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public Date getRegDate() {
		return regDate;
	}


	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}


	public Date getModifyDate() {
		return modifyDate;
	}


	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}




	public int getPageLike() {
		return pageLike;
	}


	public void setPageLike(int pageLike) {
		this.pageLike = pageLike;
	}


	public int getPageDislike() {
		return pageDislike;
	}


	public void setPageDislike(int pageDislike) {
		this.pageDislike = pageDislike;
	}


	public int getAnswerIdx() {
		return answerIdx;
	}


	public void setAnswerIdx(int answerIdx) {
		this.answerIdx = answerIdx;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public int getReadCnt() {
		return readCnt;
	}


	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}


	public int getMemberIdx() {
		return memberIdx;
	}


	public void setMemberIdx(int memberIdx) {
		this.memberIdx = memberIdx;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public String getNickName() {
		return nickName;
	}


	public void setNickName(String nickName) {
		this.nickName = nickName;
	}


	public String getSkill1() {
		return skill1;
	}


	public void setSkill1(String skill1) {
		this.skill1 = skill1;
	}


	public String getSkill2() {
		return skill2;
	}


	public void setSkill2(String skill2) {
		this.skill2 = skill2;
	}


	public String getSkill3() {
		return skill3;
	}


	public void setSkill3(String skill3) {
		this.skill3 = skill3;
	}

}
