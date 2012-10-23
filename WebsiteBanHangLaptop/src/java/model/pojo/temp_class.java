/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.pojo;

import java.util.List;

/**
 *
 * @author THANHTUNG
 */
public class temp_class {

    List<KhoanGia> listKhoanGia ;
    List<HangSanXuat> listHangSX;
    int sosptrang;
    int trang;
            
    double giatu,giaden;
    String mahang;
    String LoaiSanPham;
    String tensp;

    public List<KhoanGia> getListKhoanGia() {
        return listKhoanGia;
    }

    public void setListKhoanGia(List<KhoanGia> listKhoanGia) {
        this.listKhoanGia = listKhoanGia;
    }

    public List<HangSanXuat> getListHangSX() {
        return listHangSX;
    }

    public void setListHangSX(List<HangSanXuat> listHangSX) {
        this.listHangSX = listHangSX;
    }

    public int getSosptrang() {
        return sosptrang;
    }

    public void setSosptrang(int sosptrang) {
        this.sosptrang = sosptrang;
    }

    public int getTrang() {
        return trang;
    }

    public void setTrang(int trang) {
        this.trang = trang;
    }

    public double getGiatu() {
        return giatu;
    }

    public void setGiatu(double giatu) {
        this.giatu = giatu;
    }

    public double getGiaden() {
        return giaden;
    }

    public void setGiaden(double giaden) {
        this.giaden = giaden;
    }

    public String getMahang() {
        return mahang;
    }

    public void setMahang(String mahang) {
        this.mahang = mahang;
    }

    public String getLoaiSanPham() {
        return LoaiSanPham;
    }

    public void setLoaiSanPham(String LoaiSanPham) {
        this.LoaiSanPham = LoaiSanPham;
    }

    public String getTensp() {
        return tensp;
    }

    public void setTensp(String tensp) {
        this.tensp = tensp;
    }
    
}
