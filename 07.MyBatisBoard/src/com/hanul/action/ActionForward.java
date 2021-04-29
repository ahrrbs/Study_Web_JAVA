package com.hanul.action;

public class ActionForward {
	//View Page(*.jsp)의 경로와 파일명
	private String path;
	
	//페이지 전환방식 => true : sendRedirect(), false : forward()
	private boolean isRedirect;

	public ActionForward() {}
	
	public ActionForward(String path, boolean isRedirect) {
		super();
		this.path = path;
		this.isRedirect = isRedirect;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public boolean isRedirect() {
		return isRedirect;
	}

	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	
	
}
