/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.List;
import model.dao.util.HibernateUtil;
import model.pojo.SanPham;
import org.hibernate.Query;
import org.hibernate.classic.Session;

/**
 *
 * @author THANHTUNG
 */
public class SanPhamDAO extends ObjectDAO<SanPham, String> {

    @Override
    protected Class getPOJOClass() {
        return SanPham.class;
    }
    public List<SanPham> search(String timkiem){
        List<SanPham> list =null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        String[] str = timkiem.split(",");
        String hql = String.format(
                "select obj from SanPham obj where (obj.tenSanPham like :tensp and obj.hangSanXuat.maHang like :hangsx)"
                );
        
        Query query = session.createQuery(hql);
        query.setParameter("tensp", "%"+str[0]+"%");
        
        query.setParameter("hangsx", "%"+str[1]+"%");
        list = query.list();
        session.close();
        
        return list;
    }
}
