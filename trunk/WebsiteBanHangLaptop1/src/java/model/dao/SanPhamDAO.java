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
    public String getLoaiSanPham(String masp){
          LaptopDAO daolt = new LaptopDAO();
    
    if (daolt.getObject(masp)!=null) {
            return "laptop";
        }
    else {
            return "linhkien";
        }
    }
    public void tangSoLuotXem(SanPham sp,int count){
        sp.setSoLuotXem(sp.getSoLuotXem() + count);
        this.saveOrUpdateObject(sp);
    
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
     public List<SanPham> searchPhanTrang(String timkiem,int sosptrang,int trang){
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<SanPham> list =null;
        String[] str = timkiem.split(",");
        String hql = String.format(
                "select obj from SanPham obj where (upper(obj.tenSanPham) like upper(:tensp) and upper(obj.hangSanXuat.maHang) like upper(:hangsx)) or upper(obj.hangSanXuat.tenHang) like upper(:tensp) "
                );
        if ((str.length!=0 && str[0].equals(""))|| (str.length==2 && !str[0].equals("")&& !str[1].equals(""))){
        hql = String.format(
                "select obj from SanPham obj where (upper(obj.tenSanPham) like upper(:tensp) and upper(obj.hangSanXuat.maHang) like upper(:hangsx))"
                );
        }
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
    public List<SanPham> search(String timkiem , double giatu , double giaden){
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<SanPham> list =null;
        String[] str = timkiem.split(",");
        String hql = String.format(
                "select obj from SanPham obj where (obj.tenSanPham like :tensp and obj.hangSanXuat.maHang like :hangsx and (obj.gia) >= :giatu and obj.gia <= :giaden )"
                ); 
        if (giatu == 0 && giaden ==0)
       { hql = String.format(
                "select obj from SanPham obj where (obj.tenSanPham like :tensp and obj.hangSanXuat.maHang like :hangsx)");

           
       }
        
        Query query = session.createQuery(hql);
        if (giatu != 0 || giaden !=0){
        query.setParameter("giatu", giatu);
        query.setParameter("giaden", giaden);
        }
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
      
        list = query.list();
        
        session.close();
        
        return list;
    }
    public List<SanPham> searchPhanTrangTheoGia(String timkiem, int sosptrang, int trang, double giatu, double giaden) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        List<SanPham> list = null;
        String[] str = timkiem.split(",");
        String hql = "";
        if (giatu == 0 && giaden == 0) {
            hql = String.format(
                    "select obj from SanPham obj where (upper(obj.tenSanPham) like upper(:tensp) and upper(obj.hangSanXuat.maHang) like upper(:hangsx)) or upper(obj.hangSanXuat.tenHang) like upper(:tensp) ");
            if ((str.length != 0 && str[0].equals("")) || (str.length == 2 && !str[0].equals("") && !str[1].equals(""))) {
                hql = String.format(
                        "select obj from SanPham obj where (upper(obj.tenSanPham) like upper(:tensp) and upper(obj.hangSanXuat.maHang) like upper(:hangsx))");
            }
        } else {
            hql = String.format(
                    "select obj from SanPham obj where( (upper(obj.tenSanPham) like upper(:tensp) and upper(obj.hangSanXuat.maHang) like upper(:hangsx)) or upper(obj.hangSanXuat.tenHang) like upper(:tensp)) and (obj.gia) >= :giatu and obj.gia <= :giaden  ");
            if ((str.length != 0 && str[0].equals("")) || (str.length == 2 && !str[0].equals("") && !str[1].equals(""))) {
                hql = String.format(
                        "select obj from SanPham obj where (upper(obj.tenSanPham) like upper(:tensp) and upper(obj.hangSanXuat.maHang) like upper(:hangsx) and (obj.gia) >= :giatu and obj.gia <= :giaden )");
            }
        }

        Query query = session.createQuery(hql);
        if (giatu != 0 || giaden != 0) {
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
