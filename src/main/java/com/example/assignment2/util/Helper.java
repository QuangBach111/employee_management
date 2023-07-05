package com.example.assignment2.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Helper {
    /*
        dateString: year-month-date
     */
    public static Date convertDate(String htmlDateString){
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
            date = format.parse(htmlDateString);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }
    public static String convertName(String name) {
        StringBuilder sb = new StringBuilder();
        boolean capitalizeNext = true;

        for (char c : name.toCharArray()) {
            if (Character.isWhitespace(c)) {
                capitalizeNext = true;
            } else if (capitalizeNext) {
                c = Character.toTitleCase(c);
                capitalizeNext = false;
            }

            sb.append(c);
        }
        return sb.toString();
    }

}