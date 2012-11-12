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
public class ThongTinLaptop {
    private String maSanPham;
     private HangSanXuat hangSanXuat;
     private TinhTrangSanPham tinhTrangSanPham;
     private String tenSanPham;
     private String hinhAnh;
     private Double gia;
     private Integer soLuongTon;
     private Date ngayCapNhat;
     private String chipCpu;
     private String ram;
     private String OCung;
     private String cardDoHoa;
     private String heDieuHanh;
     private Double canNang;
     private String manHinh;
     private String pin;

    public ThongTinLaptop(String maSanPham, HangSanXuat hangSanXuat, TinhTrangSanPham tinhTrangSanPham, String tenSanPham, String hinhAnh, Double gia, Integer soLuongTon, Date ngayCapNhat, String chipCpu, String ram, String OCung, String cardDoHoa, String heDieuHanh, Double canNang, String manHinh, String pin) {
        this.maSanPham = maSanPham;
        this.hangSanXuat = hangSanXuat;
        this.tinhTrangSanPham = tinhTrangSanPham;
        this.tenSanPham = tenSanPham;
        this.hinhAnh = hinhAnh;
        this.gia = gia;
        this.soLuongTon = soLuongTon;
        this.ngayCapNhat = ngayCapNhat;
       
        this.chipCpu = chipCpu;
        this.ram = ram;
        this.OCung = OCung;
        this.cardDoHoa = cardDoHoa;
        this.heDieuHanh = heDieuHanh;
        this.canNang = canNang;
        this.manHinh = manHinh;
        this.pin = pin;
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

   

    public String getChipCpu() {
        return chipCpu;
    }

    public String getRam() {
        return ram;
    }

    public String getOCung() {
        return OCung;
    }

    public String getCardDoHoa() {
        return cardDoHoa;
    }

    public String getHeDieuHanh() {
        return heDieuHanh;
    }

    public Double getCanNang() {
        return canNang;
    }

    public String getManHinh() {
        return manHinh;
    }

    public String getPin() {
        return pin;
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

   

    public void setChipCpu(String chipCpu) {
        this.chipCpu = chipCpu;
    }

    public void setRam(String ram) {
        this.ram = ram;
    }

    public void setOCung(String OCung) {
        this.OCung = OCung;
    }

    public void setCardDoHoa(String cardDoHoa) {
        this.cardDoHoa = cardDoHoa;
    }

    public void setHeDieuHanh(String heDieuHanh) {
        this.heDieuHanh = heDieuHanh;
    }

    public void setCanNang(Double canNang) {
        this.canNang = canNang;
    }

    public void setManHinh(String manHinh) {
        this.manHinh = manHinh;
    }

    public void setPin(String pin) {
        this.pin = pin;
    }
     
}
