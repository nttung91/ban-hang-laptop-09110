/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.io.Serializable;
import java.util.List;
import model.dao.util.HibernateUtil;
import model.pojo.LinhKien;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author THANHTUNG
 */
public class LinhKienDAO  extends ObjectDAO<LinhKien, String> {
     @Override
    protected Class getPOJOClass() {
        return LinhKien.class;
    }
    public List<LinhKien> searchPhanTrang(String timkiem,int sosptrang,int trang){
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<LinhKien> list =null;
        String[] str = timkiem.split(",");
        String hql = String.format(
                "select obj from LinhKien obj where (upper(obj.sanPham.tenSanPham) like upper(:tensp) and upper(obj.sanPham.hangSanXuat.maHang) like upper(:hangsx))"
                );
        
        Query query = session.createQuery(hql);
        if (str.length==0){
            query.setParameter("tensp", "%%");
        
        query.setParameter("hangsx", "%%");
        }
        else if (str.length==1){
        query.setParameter("tensp", "%"+str[0]+"%");
        
        query.setParameter("hangsx", "%%");
        }
        else{
        query.setParameter("tensp", "%"+str[0]+"%");
        
        query.setParameter("hangsx", "%"+str[1]+"%");
        }
        
        query.setMaxResults(sosptrang);
        query.setFirstResult((trang-1)*sosptrang);
        list = query.list();
        
        session.close();
        
        return list;
    }
     public List<LinhKien> searchPhanTrang(String timkiem, int sosptrang, int trang,double giatu , double giaden) {

        org.hibernate.classic.Session session = HibernateUtil.getSessionFactory().openSession();
        List<LinhKien> list = null;
        String[] str = timkiem.split(",");
        String hql = String.format(
                "select obj from LinhKien obj where (upper(obj.sanPham.tenSanPham) like upper(:tensp) and upper(obj.sanPham.hangSanXuat.maHang) like upper(:hangsx) and (obj.sanPham.gia) >= :giatu and obj.sanPham.gia <= :giaden )");
       if (giatu == 0 && giaden ==0)
       { hql = String.format(
                "select obj from LinhKien obj where (upper(obj.sanPham.tenSanPham) like upper(:tensp) and upper(obj.sanPham.hangSanXuat.maHang) like upper(:hangsx) )");

           
       }
        Query query = session.createQuery(hql);
         if (giatu != 0 || giaden !=0){
        query.setParameter("giatu", giatu);
        query.setParameter("giaden", giaden);
         }
        if (str.length == 0) {
            query.setParameter("tensp", "%%");

            query.setParameter("hangsx", "%%");
        } else if (str.length == 1) {
            query.setParameter("tensp", "%" + str[0] + "%");

            query.setParameter("hangsx", "%%");
        } else {
            query.setParameter("tensp", "%" + str[0] + "%");

            query.setParameter("hangsx", "%" + str[1] + "%");
        }

        query.setMaxResults(sosptrang);
        query.setFirstResult((trang - 1) * sosptrang);
        list = query.list();

        session.close();

        return list;
    }
}
