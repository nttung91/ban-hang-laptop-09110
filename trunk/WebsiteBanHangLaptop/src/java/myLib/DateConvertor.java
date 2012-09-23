/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package myLib;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author THANHTUNG
 */
public class DateConvertor {

    public static java.util.Date Timestamp2UtilDateConvertor(Timestamp sd) {
        String val = sd.toString();
        java.util.Date sdate = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            sdate = sdf.parse(val);
        } catch (ParseException ex) {
            Logger.getLogger(DateConvertor.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sdate;
    }

    public static java.util.Date Sql2UtilDateConvertor(java.sql.Date d) {
        String val = d.toString();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date ud = null;
        try {
            ud = sdf.parse(val);
        } catch (ParseException ex) {
            Logger.getLogger(DateConvertor.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ud;
    }

    public static java.sql.Date Util2SqlDateConvertor(java.util.Date d) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
         java.util.Calendar cal = Calendar.getInstance();
        cal.setTime(d);
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        java.sql.Date sqlDate = new java.sql.Date(cal.getTime().getTime()); // your sql date
        return sqlDate;
    }
     public static java.sql.Date Util2SqlDateConvertor(String d) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
         java.util.Calendar cal = Calendar.getInstance();
         java.util.Date dd=null;
        try {
            dd = sdf.parse(d);
        } catch (ParseException ex) {
            Logger.getLogger(DateConvertor.class.getName()).log(Level.SEVERE, null, ex);
        }
        cal.setTime(dd);
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        java.sql.Date sqlDate = new java.sql.Date(cal.getTime().getTime()); // your sql date
        return sqlDate;
    }
    public static java.util.Date getCurrentDate(){
         java.util.Calendar cal = Calendar.getInstance();
         java.util.Date d = new Date(cal.getTime().getTime());
         return d;
    }
    public static String getCurrentDateString(String fomat){
         java.util.Calendar cal = Calendar.getInstance();
         java.util.Date d = new Date(cal.getTime().getTime());
         SimpleDateFormat sdf = new SimpleDateFormat(fomat);
         return  sdf.format(d);
    }
}
