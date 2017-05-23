package carseller.properties;

public class Printer {

	public static void printDebugMsg(String where, Object obj){
		printMsg("debug", where, obj);
	}
	
	public static void printErrorMsg(String where, Object obj){
		printMsg("error", where, obj);
	}
	
	public static void printDebugMsg(String where){
		printMsg("debug", where, null);
	}
	
	public static void printErrorMsg(String where){
		printMsg("error", where, null);
	}
	
	private static void printMsg(String type, String where, Object obj){
		where = "[@" + where + "]";
		if(obj == null)
			System.out.println("[" + type + "]" + where);
		else
			System.out.println("[" + type + "]" + where + ": " + obj);
	}
}
