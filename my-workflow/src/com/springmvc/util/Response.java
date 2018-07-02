package com.springmvc.util;

public class Response {

	private int code;
	private String message;
	private Object data;

	public Response() {
		this.code = ErrorCode.SUCCESS.getCode();
		this.message = ErrorCode.SUCCESS.getMessage();
	}

	public Response(Object data) {
		this(data, null);
	}

	public Response(Object data, ErrorCode errorCode) {
		this.data = data;
		if (errorCode == null) {
			this.code = ErrorCode.SUCCESS.getCode();
		} else {
			this.code = errorCode.getCode();
			this.message = errorCode.getMessage();
		}
	}

	public void setErrorCode(ErrorCode errorCode) {
		if (errorCode == null) {
			this.code = ErrorCode.SUCCESS.getCode();
			this.message = ErrorCode.SUCCESS.getMessage();
		} else {
			this.code = errorCode.getCode();
			this.message = errorCode.getMessage();
		}
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

}
