package model.pojo;
// Generated Oct 23, 2012 10:38:34 AM by Hibernate Tools 3.2.1.GA


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * KhachHang generated by hbm2java
 */
public class KhachHang  implements java.io.Serializable {


     private String maKhachHang;
     private String tenKhachHang;
     private Integer gioiTinh;
     private Date ngaySinh;
     private String dienThoai;
     private String diaChi;
     private String thanhPho;
     private Integer tinhTrang;
     private Set khachHangTrucTuyens = new HashSet(0);
     private Set datHangs = new HashSet(0);

    public KhachHang() {
    }

	
    public KhachHang(String maKhachHang) {
        this.maKhachHang = maKhachHang;
    }
    public KhachHang(String maKhachHang, String tenKhachHang, Integer gioiTinh, Date ngaySinh, String dienThoai, String diaChi, String thanhPho, Integer tinhTrang, Set khachHangTrucTuyens, Set datHangs) {
       this.maKhachHang = maKhachHang;
       this.tenKhachHang = tenKhachHang;
       this.gioiTinh = gioiTinh;
       this.ngaySinh = ngaySinh;
       this.dienThoai = dienThoai;
       this.diaChi = diaChi;
       this.thanhPho = thanhPho;
       this.tinhTrang = tinhTrang;
       this.khachHangTrucTuyens = khachHangTrucTuyens;
       this.datHangs = datHangs;
    }
   
    public String getMaKhachHang() {
        return this.maKhachHang;
    }
    
    public void setMaKhachHang(String maKhachHang) {
        this.maKhachHang = maKhachHang;
    }
    public String getTenKhachHang() {
        return this.tenKhachHang;
    }
    
    public void setTenKhachHang(String tenKhachHang) {
        this.tenKhachHang = tenKhachHang;
    }
    public Integer getGioiTinh() {
        return this.gioiTinh;
    }
    
    public void setGioiTinh(Integer gioiTinh) {
        this.gioiTinh = gioiTinh;
    }
    public Date getNgaySinh() {
        return this.ngaySinh;
    }
    
    public void setNgaySinh(Date ngaySinh) {
        this.ngaySinh = ngaySinh;
    }
    public String getDienThoai() {
        return this.dienThoai;
    }
    
    public void setDienThoai(String dienThoai) {
        this.dienThoai = dienThoai;
    }
    public String getDiaChi() {
        return this.diaChi;
    }
    
    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }
    public String getThanhPho() {
        return this.thanhPho;
    }
    
    public void setThanhPho(String thanhPho) {
        this.thanhPho = thanhPho;
    }
    public Integer getTinhTrang() {
        return this.tinhTrang;
    }
    
    public void setTinhTrang(Integer tinhTrang) {
        this.tinhTrang = tinhTrang;
    }
    public Set getKhachHangTrucTuyens() {
        return this.khachHangTrucTuyens;
    }
    
    public void setKhachHangTrucTuyens(Set khachHangTrucTuyens) {
        this.khachHangTrucTuyens = khachHangTrucTuyens;
    }
    public Set getDatHangs() {
        return this.datHangs;
    }
    
    public void setDatHangs(Set datHangs) {
        this.datHangs = datHangs;
    }




}


