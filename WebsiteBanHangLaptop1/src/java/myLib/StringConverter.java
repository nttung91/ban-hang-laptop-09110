/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package myLib;

/**
 *
 * @author MRKYT
 */
public class StringConverter {
    public static String getNamefromPicture(String Pic_name){
        
        String[] s = Pic_name.split("\\.");
        if (s.length >1){
        return s[0];
        }
        return "";
    }
    public static String nextid(String last , String toEqual) {
        
        String kq = "";

        kq = last.substring(toEqual.length(), last.length());
        int i = Integer.parseInt(kq);
        i = i+1;
        kq = toEqual+i;
        return kq;
    }
}
