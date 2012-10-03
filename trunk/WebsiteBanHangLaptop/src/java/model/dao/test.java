/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import model.pojo.SanPham;
import myLib.RegexChecking;

/**
 *
 * @author THANHTUNG
 */
public class test {
        
       public static void main(String[] args) {
          boolean email = RegexChecking.CheckEmail("tung@yahoo.com");
          if (email) System.out.println("jhgjhgh");
       }
}
