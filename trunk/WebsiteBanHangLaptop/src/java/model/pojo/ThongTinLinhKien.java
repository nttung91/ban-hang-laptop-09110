/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.pojo;

import java.util.Date;

/**
 *
 * @author THANHTUNG
 */
public class ThongTinLinhKien {
    private String maSanPham;
     private HangSanXuat hangSanXuat;
     private TinhTrangSanPham tinhTrangSanPham;
     private String tenSanPham;
     private String hinhAnh;
     private Double gia;
     private Integer soLuongTon;
     private Date ngayCapNhat;
     private String moTa;

    public ThongTinLinhKien(String maSanPham, HangSanXuat hangSanXuat, TinhTrangSanPham tinhTrangSanPham, String tenSanPham, String hinhAnh, Double gia, Integer soLuongTon, Date ngayCapNhat, String moTa) {
        this.maSanPham = maSanPham;
        this.hangSanXuat = hangSanXuat;
        this.tinhTrangSanPham = tinhTrangSanPham;
        this.tenSanPham = tenSanPham;
        this.hinhAnh = hinhAnh;
        this.gia = gia;
        this.soLuongTon = soLuongTon;
        this.ngayCapNhat = ngayCapNhat;
        this.moTa = moTa;
    }

    public String getMaSanPham() {
        return maSanPham;
    }

    public HangSanXuat getHangSanXuat() {
        return hangSanXuat;
    }

    public TinhTrangSanPham getTinhTrangSanPham() {
        return tinhTrangSanPham;
    }

    public String getTenSanPham() {
        return tenSanPham;
    }

    public String getHinhAnh() {
        return hinhAnh;
    }

    public Double getGia() {
        return gia;
    }

    public Integer getSoLuongTon() {
        return soLuongTon;
    }

    public Date getNgayCapNhat() {
        return ngayCapNhat;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMaSanPham(String maSanPham) {
        this.maSanPham = maSanPham;
    }

    public void setHangSanXuat(HangSanXuat hangSanXuat) {
        this.hangSanXuat = hangSanXuat;
    }

    public void setTinhTrangSanPham(TinhTrangSanPham tinhTrangSanPham) {
        this.tinhTrangSanPham = tinhTrangSanPham;
    }

    public void setTenSanPham(String tenSanPham) {
        this.tenSanPham = tenSanPham;
    }

    public void setHinhAnh(String hinhAnh) {
        this.hinhAnh = hinhAnh;
    }

    public void setGia(Double gia) {
        this.gia = gia;
    }

    public void setSoLuongTon(Integer soLuongTon) {
        this.soLuongTon = soLuongTon;
    }

    public void setNgayCapNhat(Date ngayCapNhat) {
        this.ngayCapNhat = ngayCapNhat;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }
     
}
