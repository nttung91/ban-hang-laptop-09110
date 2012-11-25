/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Gobal;

/**
 *
 * @author THANHTUNG
 */
public class SiteMaps {

    public static String getPageFromAction(String action) {
        String res = "DanhSachSanPham.do";
        if (action.equals("ChiTietSanPham")) {
            res = "ChiTietSanPham.do";
        }
        if (action.equals("GioHang")) {
            res = "GioHang.do";
        }
        if (action.equals("DangKy")) {
            res = "DangKyThanhVien.do";
        }
        if (action.equals("DangNhap")) {
            res = "DangNhap.do";
        }
        if (action.equals("TrangCaNhan")) {
            res = "TrangCaNhan.do";
        }
        if (action.equals("DoiMatKhau")) {
            res = "DoiMatKhau.do";
        }
        if (action.equals("DoiEmail")) {
            res = "DoiEmail.do";
        }
        if (action.equals("DoiThongTin")) {
            res = "DoiThongTin.do";
        }
        if (action.equals("DatHang")) {
            res = "DatHang.do";
        }
        if (action.equals("ChiTietDonHang")) {
            res = "ChiTietDonHang.do";
        }
        return res;
    }
}
