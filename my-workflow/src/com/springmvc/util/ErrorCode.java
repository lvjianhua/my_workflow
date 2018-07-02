package com.springmvc.util;

public enum ErrorCode {

	SUCCESS(0, "Success"),

	OBJECT_EXITS(1, "Object exits!"),

	OBJECT_NOT_EXITS(2, "Object not exits!"),

	USER_PASSWORD_INVALID(3, "Password invalid!"),

	USER_NAME_INVALID(4, "Username invalid!"),

	USER_NOT_EXITS(5, "User not exits!"),

	PARAMETER_INVALID(6, "Parameter invalid"),

	EMAIL_INVALID(7, "Email invalid!"),

	USER_NAME_EXITS(8, "Username exits!"),

	USER_PASSWORD_EXITS(9, "Password exits!"),

	USER_EMAIL_EXITS(10, "Email exits!"),

	USER_PASSWORD_NOT_EQUALS(11, "The user password for the input is different!"),

	USER_NAME_NOT_EQUALS_PASSWORD(12, "Username and password can not be the equals!"),

	USER_AGREEMENT(13, "You don't agree with the user agreement!"),

	FORM_REPEAT_SUBMIT(14, "Repeat the form!"),

	CSRF_TOKEN_INVALID(15, "Data connection errors!"),

	DB_CONNECTION_ERROR(16, "Data connection errors!"),

	USER_NOT_LOGINED(17, "The user is not logined！"),

	NOT_APP_CLIENT(18, "The is not app client request！"),

	NOT_ADMIN_CLIENT(19, "The is not admin client request！"),

	INTERNAL_ERROR(20, "Internal error!"),

	FILE_NOT_FOUNT(21, "File not fount！"),

	FILE_SIZE_LIMIT_EXCEEDED(22, "File Size Limit Exceeded！"),

	INVALID_EXTENSION(23, "Invalid Extension！"),

	FILE_NAME_LENGTH_LIMIT_EXCEEDED(24, "fileName Length Limit Exceeded！"),

	USER_NOT_PERMISSION(25, "User is not permission！"),

	ID_CARD_ILLEAGAL(26, "ID card is illegal！"),

	OPREATION_BEYOND_RANFE(27, "Operation beyond range！"),

	NOT_CASCADE_DELETE(28, "Can not cascade delete！"),

	INVALID_REQUEST(29, "Invalid request！"),

	UNKNOWN(2000, "Unknown error!"),

	INVALID_ACCESS(10000, "I'm sorry, you don't have the access");

	private int code;
	private String message;

	private ErrorCode(int code, String message) {
		this.message = message;
		this.code = code;
	}

	public int getCode() {
		return code;
	}

	public String getMessage() {
		return message;
	}

}
