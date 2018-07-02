package com.springmvc.util;

public class ResponseUtil {

	public static Response getResponse() {
		Response response = new Response();
		return response;
	}

	public static Response ok() {
		return ok(null);
	}

	public static Response ok(Object data) {
		Response response = null;
		if (data != null) {
			response = new Response(data, ErrorCode.SUCCESS);
		} else {
			response = new Response("", ErrorCode.SUCCESS);
		}
		return response;
	}

	public static Response error() {
		return error(ErrorCode.INTERNAL_ERROR, null);
	}

	public static Response error(ErrorCode errorCode) {
		return error(errorCode, null);
	}

	public static Response error(Object data) {
		return error(ErrorCode.INTERNAL_ERROR, data);
	}

	public static Response error(ErrorCode errorCode, Object key, Object value) {
		if (key == null) {
			return error(errorCode);
		}
		if (value == null) {
			value = "";
		}
		return error(errorCode, String.format("%s:%s", key, value));
	}

	public static Response error(ErrorCode errorCode, Object data) {
		if (errorCode == null) {
			errorCode = ErrorCode.UNKNOWN;
		}
		return new Response(data, errorCode);
	}

}
