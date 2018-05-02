package com.ewaste.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {

	public static Date getDateToDateObject(String inputstr) {
		// error here, please solve it
		SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		return new Date(df.format(inputstr));
	}
	public static void main(String arg[])throws Exception {
		
		
		System.out.println(DateUtils.getDateToDateObject("12/01/2015"));
	}
}
