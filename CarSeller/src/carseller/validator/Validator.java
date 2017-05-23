package carseller.validator;

import java.util.regex.Pattern;

public class Validator {

	private static Pattern emailPattern = 
			Pattern.compile("\\b[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}\\b");
	
	private static Pattern namePattern = 
			Pattern.compile("[a-zA-Z]+");
	
	private static Pattern phonePattern = 
			Pattern.compile("\\+?[0-9]+");
	
	public static boolean isValid(String str){
		return !(str == null) && !(str.equals(""));
	}
	
	public static boolean isValidEmail(String str){
		return emailPattern.matcher(str).matches();
	}
	
	public static boolean isValidName(String str){
		return namePattern.matcher(str).matches();
	}
	
	public static boolean isValidPhone(String str){
		return phonePattern.matcher(str).matches();
	}
}
