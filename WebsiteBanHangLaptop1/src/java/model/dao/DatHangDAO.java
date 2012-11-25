/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import model.dao.util.HibernateUtil;
import model.pojo.ChiTietDonHang;
import model.pojo.DatHang;
import model.pojo.SanPham;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author THANHTUNG
 */
public class DatHangDAO extends ObjectDAO<DatHang, String> {

    @Override
    protected Class getPOJOClass() {
        return DatHang.class;
    }
    public ArrayList<SanPham> getChiTietDonHangs(String maDonHang){
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql =" from ChiTietDonHang ct where ct.datHang.maDonHang =:maDonHang";
        Query query = session.createQuery(hql);
        query.setParameter("maDonHang", maDonHang);
        List<ChiTietDonHang> ctDonHangs = query.list();
        ArrayList<SanPham> sanphams= new ArrayList<SanPham>();
        for (int i = 0; i < ctDonHangs.size(); i++) {
            SanPham sp = new SanPham();
            ChiTietDonHang ct = ctDonHangs.get(i);
            sp.setTenSanPham(ct.getSanPham().getTenSanPham());
            sp.setHinhAnh(ct.getSanPham().getHinhAnh());
            sp.setSoLuongTon(ct.getSoLuong());
            sp.setGia(ct.getDonGia());
            sp.setMaSanPham(ct.getSanPham().getMaSanPham());
            sanphams.add(sp);
        }
        session.close();
        return sanphams;
    }
    
}
