/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.List;
import model.dao.util.HibernateUtil;
import model.pojo.SanPham;
import model.pojo.ThongTinLaptop;
import model.pojo.ThongTinLinhKien;
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
    //not using Lazy
    public ThongTinLaptop getLaptopInfo(String masp){
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql1 = "select new model.pojo.ThongTinLaptop( l.maSanPham,l.sanPham.hangSanXuat,l.sanPham.tinhTrangSanPham,l.sanPham.tenSanPham,l.sanPham.hinhAnh,l.sanPham.gia,l.sanPham.soLuongTon,l.sanPham.ngayCapNhat,l.chipCpu,l.ram,l.OCung,l.cardDoHoa,l.heDieuHanh,l.canNang,l.manHinh,l.pin) from  Laptop l where l.maSanPham = :masp";
         String hql = "from  Laptop l where l.maSanPham = :masp";
        Query query = session.createQuery(hql1);
        query.setParameter("masp", masp);
        ThongTinLaptop ds = (ThongTinLaptop)query.uniqueResult();
        return ds;
    }
     public ThongTinLinhKien getEquipmentInfo(String masp){
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql1 = "select new model.pojo.ThongTinLinhKien( l.maSanPham,l.sanPham.hangSanXuat,l.sanPham.tinhTrangSanPham,l.sanPham.tenSanPham,l.sanPham.hinhAnh,l.sanPham.gia,l.sanPham.soLuongTon,l.sanPham.ngayCapNhat,l.moTa) from  LinhKien l where l.maSanPham = :masp";
         String hql = "from  LinhKien l where l.maSanPham = :masp";
        Query query = session.createQuery(hql1);
        query.setParameter("masp", masp);
        ThongTinLinhKien ds = (ThongTinLinhKien)query.uniqueResult();
        return ds;
    }
}
