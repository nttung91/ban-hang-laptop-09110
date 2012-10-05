/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.io.Serializable;
import model.dao.util.HibernateUtil;
import model.pojo.KhachHangTrucTuyen;
import org.hibernate.Query;
import org.hibernate.classic.Session;

/**
 *
 * @author THANHTUNG
 */
public class KhachHangTrucTuyenDAO extends ObjectDAO<KhachHangTrucTuyen, String> {

    @Override
    protected Class getPOJOClass() {
        return KhachHangTrucTuyen.class;
    }
    public boolean isUsernameTonTai(String val){
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql = "select count(kh.username) from  KhachHangTrucTuyen kh where kh.username = :val";
        Query query = session.createQuery(hql);
        query.setParameter("val", val);
        Object kq = query.uniqueResult();
        if (Integer.parseInt(kq.toString())>0) {
            session.close();
            return true;
        }
        session.close();
        return false;
    }
    public boolean isEmailTonTai(String val){
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql = "select count(kh.email) from  KhachHangTrucTuyen kh where kh.email = :val";
        Query query = session.createQuery(hql);
        query.setParameter("val", val);
        Object kq = query.uniqueResult();
        if (Integer.parseInt(kq.toString())>0) {
            session.close();
            return true;
        }
        session.close();
        return false;
    }
    public  boolean isDangNhapThanhCong(String username,String password){
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql = "select count(*) from KhachHangTrucTuyen kh where kh.username =:val1 and kh.matKhau=:val2";
        Query query = session.createQuery(hql);
        query.setParameter("val1", username);
        query.setParameter("val2", password);
        Object kq = query.uniqueResult();
        if (Integer.parseInt(kq.toString())>0) {
            session.close();
            return true;
        }
        session.close();
        return false;
    }
    
    
}
