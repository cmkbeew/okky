package board;

import java.sql.Date;

public class MainDTO {
	private String title;
	private Date regDate;
	private String memberId;
	private int pageLike;
	private int readCnt;
	private int writeCnt;
	private String types;
	private int idx;

	public MainDTO() {}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getPageLike() {
		return pageLike;
	}

	public void setPageLike(int pageLike) {
		this.pageLike = pageLike;
	}

	public int getReadCnt() {
		return readCnt;
	}

	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}

	public int getWriteCnt() {
		return writeCnt;
	}

	public void setWriteCnt(int writeCnt) {
		this.writeCnt = writeCnt;
	}

	public String getTypes() {
		return types;
	}

	public void setTypes(String types) {
		this.types = types;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}


}
