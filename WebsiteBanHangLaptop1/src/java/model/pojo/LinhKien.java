package model.pojo;
// Generated Nov 23, 2012 11:16:33 PM by Hibernate Tools 3.2.1.GA



/**
 * LinhKien generated by hbm2java
 */
public class LinhKien  implements java.io.Serializable {


     private String maSanPham;
     private SanPham sanPham;
     private String moTa;

    public LinhKien() {
    }

	
    public LinhKien(String maSanPham, SanPham sanPham) {
        this.maSanPham = maSanPham;
        this.sanPham = sanPham;
    }
    public LinhKien(String maSanPham, SanPham sanPham, String moTa) {
       this.maSanPham = maSanPham;
       this.sanPham = sanPham;
       this.moTa = moTa;
    }
   
    public String getMaSanPham() {
        return this.maSanPham;
    }
    
    public void setMaSanPham(String maSanPham) {
        this.maSanPham = maSanPham;
    }
    public SanPham getSanPham() {
        return this.sanPham;
    }
    
    public void setSanPham(SanPham sanPham) {
        this.sanPham = sanPham;
    }
    public String getMoTa() {
        return this.moTa;
    }
    
    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }




}


