package edu.mum.damor.util;

public class Debug {

	public static void log(Object... args) {
		for (Object o : args)
			System.out.println(o);
	}
}
