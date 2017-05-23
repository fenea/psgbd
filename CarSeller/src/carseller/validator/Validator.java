package carseller.validator;

public class Validator {

	public static boolean isValid(String str){
		return !(str == null) && !(str.equals(""));
	}
}
