/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.pojo;

import java.util.ArrayList;
import java.util.List;
import model.dao.KhoanGiaDAO;

/**
 *
 * @author THANHTUNG
 */
public class temp_class {
    String timkiem=" ";
    int showdau;
    List<KhoanGia> listKhoanGia;
    List<HangSanXuat> listHangSX;
    int sosptrang;
    int trang;
    int tongtrang;
    double giatu, giaden;
    String mahang;
    String LoaiSanPham;
    String tensp;
    List listsp;
    String Action;
    String tenDangNhap;
    String urlp ;

    public String getTimkiem() {
        return timkiem;
    }

    public void setTimkiem(String timkiem) {
        this.timkiem = timkiem;
    }

    public int getShowdau() {
        return showdau;
    }

    public void setShowdau(int showdau) {
        this.showdau = showdau;
    }

    public String getUrlp() {
        return urlp;
    }

    public void setUrlp(String urlp) {
        this.urlp = urlp;
    }
    
    public String getAction() {
        return Action;
    }

    public void setAction(String Action) {
        this.Action = Action;
    }

    public List getListsp() {
        return listsp;
    }

    public void setListsp(List listsp) {
        this.listsp = listsp;
    }

    public int getTongtrang() {
        return tongtrang;
    }

    public void setTongtrang(int tongtrang) {
        this.tongtrang = tongtrang;
    }

    public void getclearKhoanGia() {
        listKhoanGia = new ArrayList<KhoanGia>();
    }

    public List<KhoanGia> getListKhoanGia() {
        return listKhoanGia;
    }

    public boolean KhoanGiaTonTai(KhoanGia kg) {
        for (int i = 0; i < listKhoanGia.size(); i++) {
            if (kg.getMaKhoanGia().equals(listKhoanGia.get(i).getMaKhoanGia())) {
                return true;
            }
        }
        return false;
    }

    public void addKhoanGia(String maKG) {
        KhoanGiaDAO kgd = new KhoanGiaDAO();
        KhoanGia k = kgd.getObject(maKG);
        listKhoanGia.add(k);

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

    public String getTenDangNhap() {
        return tenDangNhap;
    }

    public void setTenDangNhap(String tenDangNhap) {
        this.tenDangNhap = tenDangNhap;
    }
}
