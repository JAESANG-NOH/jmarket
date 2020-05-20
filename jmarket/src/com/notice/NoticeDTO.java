package com.notice;

public class NoticeDTO {
	private int num, listnum;
	private int notice;
	private String name;
	private String id;
	private String title;
	private String content;
	private String Afilename;
	private String Bfilename;
	private long filesize;
	private int hitcount;
	private String created;

	private long gap;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getListnum() {
		return listnum;
	}

	public void setListnum(int listnum) {
		this.listnum = listnum;
	}

	public int getNotice() {
		return notice;
	}

	public void setNotice(int notice) {
		this.notice = notice;
	}
	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAfilename() {
		return Afilename;
	}

	public void setAfilename(String afilename) {
		Afilename = afilename;
	}

	public String getBfilename() {
		return Bfilename;
	}

	public void setBfilename(String bfilename) {
		Bfilename = bfilename;
	}

	public long getFilesize() {
		return filesize;
	}

	public void setFilesize(long filesize) {
		this.filesize = filesize;
	}

	public int getHitcount() {
		return hitcount;
	}

	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}

	public long getGap() {
		return gap;
	}

	public void setGap(long gap) {
		this.gap = gap;
	}

}
