/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Gobal;


import java.util.Calendar;
import java.util.List;
import java.util.Random;
import model.dao.SanPhamDAO;
import model.pojo.SanPham;


/**
 *
 * @author THANHTUNG
 */
public class test {
      public static void main(String[] args) throws InterruptedException {
          SanPhamDAO dao = new SanPhamDAO();
          List<SanPham> l = dao.getList();
          for (int i = 0; i < l.size(); i++) {
              SanPham sp = l.get(i);
              sp.setTenSanPham(sp.getTenSanPham().replaceAll("_", " "));
              dao.saveOrUpdateObject(sp);
          }
       
         // long start = Calendar.getInstance().getTime().getTime();
          //System.out.println(dao.getAffinityBetweenUserAndTag("knstung","video" ));
          //long end = Calendar.getInstance().getTime().getTime();
          //System.out.println(end-start);
          
   }
}
