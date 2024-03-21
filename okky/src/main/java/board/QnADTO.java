package board;

import java.sql.Date;
import java.time.LocalDateTime;

public class QnADTO {
	private int qnaIdx;
	private String title;
	private String content;
	private Date regDate;
	private Date modifyDate;
	private String tags;
	private int pageLike;
	private int pageDislike;
	private int answerIdx;
	private String category;
	private int readCnt;
	private int memberIdx;
	private String memberId;
	private String nickName;
	
	
	public QnADTO() {}


	public int getQnaIdx() {
		return qnaIdx;
	}


	public void setQnaIdx(int qnaIdx) {
		this.qnaIdx = qnaIdx;
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


	public String getTags() {
		return tags;
	}


	public void setTags(String tags) {
		this.tags = tags;
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
	
}
