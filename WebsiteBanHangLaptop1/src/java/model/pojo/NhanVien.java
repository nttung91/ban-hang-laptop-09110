package model.pojo;
// Generated Nov 23, 2012 11:16:33 PM by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * NhanVien generated by hbm2java
 */
public class NhanVien  implements java.io.Serializable {


     private String maNhanVien;
     private String tenNhanVien;
     private Integer chucVu;
     private Integer tinhTrang;
     private Set datHangs = new HashSet(0);

    public NhanVien() {
    }

	
    public NhanVien(String maNhanVien) {
        this.maNhanVien = maNhanVien;
    }
    public NhanVien(String maNhanVien, String tenNhanVien, Integer chucVu, Integer tinhTrang, Set datHangs) {
       this.maNhanVien = maNhanVien;
       this.tenNhanVien = tenNhanVien;
       this.chucVu = chucVu;
       this.tinhTrang = tinhTrang;
       this.datHangs = datHangs;
    }
   
    public String getMaNhanVien() {
        return this.maNhanVien;
    }
    
    public void setMaNhanVien(String maNhanVien) {
        this.maNhanVien = maNhanVien;
    }
    public String getTenNhanVien() {
        return this.tenNhanVien;
    }
    
    public void setTenNhanVien(String tenNhanVien) {
        this.tenNhanVien = tenNhanVien;
    }
    public Integer getChucVu() {
        return this.chucVu;
    }
    
    public void setChucVu(Integer chucVu) {
        this.chucVu = chucVu;
    }
    public Integer getTinhTrang() {
        return this.tinhTrang;
    }
    
    public void setTinhTrang(Integer tinhTrang) {
        this.tinhTrang = tinhTrang;
    }
    public Set getDatHangs() {
        return this.datHangs;
    }
    
    public void setDatHangs(Set datHangs) {
        this.datHangs = datHangs;
    }




}


