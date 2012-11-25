/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Gobal.Parameters;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.dao.DatHangDAO;
import model.dao.KhachHangDAO;
import model.dao.KhachHangTrucTuyenDAO;
import model.pojo.ChiTietDonHang;
import model.pojo.ChiTietDonHangId;
import model.pojo.KhachHang;
import model.pojo.KhachHangTrucTuyen;
import model.pojo.SanPham;
import model.pojo.TinhTrangDonDatHang;
import model.pojo.temp_class;

/**
 *
 * @author THANHTUNG
 */
@WebServlet(name = "DatHang", urlPatterns = {"/DatHang.do"})
public class DatHang extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String hoTen = null, gioiTinh = null, dienThoai = null, thanhPho = null, diaChi = null, datepick = null;
        boolean oke = true;
        String tenDangNhap = null;
        HttpSession session = request.getSession();
        String loi = "";
        int gt = 0;


        if (session.getAttribute("tenDangNhap") != null && !session.getAttribute("tenDangNhap").equals("")) {
            tenDangNhap = session.getAttribute("tenDangNhap").toString();

        }


        if (request.getParameter("tenKhachHang") != null && !request.getParameter("tenKhachHang").equals("")) {
            hoTen = request.getParameter("tenKhachHang");

        } else {
            oke = false;
        }





        if (request.getParameter("dienThoai") != null && !request.getParameter("dienThoai").equals("")) {
            dienThoai = request.getParameter("dienThoai");

        } else {
            oke = false;
        }

        if (request.getParameter("diaChi") != null) {
            diaChi = request.getParameter("diaChi");

        } else {
            oke = false;
        }
        KhachHang kh = null;
        KhachHangDAO khdao = new KhachHangDAO();
        KhachHangTrucTuyenDAO dao = new KhachHangTrucTuyenDAO();
        KhachHangTrucTuyen khtt = null;
        if (tenDangNhap != null && Boolean.parseBoolean(session.getAttribute("daDangNhap").toString())) {


            khtt = dao.getObject(tenDangNhap);
            if (khtt != null) {
                kh = khtt.getKhachHang();

            }
        }

        DatHangDAO dhdao = new DatHangDAO();
        model.pojo.DatHang dh = new model.pojo.DatHang();
        List<SanPham> gioHang = (List<SanPham>) session.getAttribute("GioHang");
        if (gioHang != null) {
            if (oke) {
                dh.setMaDonHang(dhdao.generateKeyCode("DatHang", "maDonHang", "DH"));
                dh.setNguoiNhan(hoTen);
                dh.setDiaChiGiaoHang(diaChi);
                dh.setDienThoai(dienThoai);
                dh.setNgayDat(myLib.DateConvertor.getCurrentTimeStamp());
                if (kh == null) {
                    kh = new KhachHang(khdao.generateKeyCode("KhachHang", "maKhachHang", "KH"));
                    kh.setTenKhachHang(hoTen);
                    kh.setDiaChi(diaChi);
                    kh.setDienThoai(dienThoai);
                    kh.setGioiTinh(1);
                    kh.setNgaySinh(myLib.DateConvertor.getCurrentDate());

                }
                dh.setKhachHang(kh);

                Set<ChiTietDonHang> ctDonHangs = new HashSet<ChiTietDonHang>();
                for (int i = 0; i < gioHang.size(); i++) {
                    ChiTietDonHang ctdh = new ChiTietDonHang();
                    ChiTietDonHangId id = new ChiTietDonHangId(dh.getMaDonHang(), gioHang.get(i).getMaSanPham());
                    ctdh.setId(id);
                    ctdh.setDatHang(dh);
                    ctdh.setDonGia(gioHang.get(i).getGia());
                    ctdh.setSoLuong(gioHang.get(i).getSoLuongTon());
                    ctDonHangs.add(ctdh);
                }
                dh.setChiTietDonHangs(ctDonHangs);
                dh.setTinhTrangDonDatHang(new TinhTrangDonDatHang(Parameters.TTDH_CHUA_DUYET));
                dhdao.saveOrUpdateObject(dh);
                loi = "Đặt Hàng Thành công!";


            }
        } else {
            loi = "Giỏ Hàng đang rỗng. Không thể đặt hàng";
        }
        if (tenDangNhap != null && Boolean.parseBoolean(session.getAttribute("daDangNhap").toString())) {
            khtt = dao.getObject(tenDangNhap);
            if (khtt !=null && khtt.getKhachHang()==null) {
                khtt.setKhachHang(kh);
                dao.saveOrUpdateObject(khtt);

            }
        }
      
        request.setAttribute("kh", kh);
        request.setAttribute("loi", loi);
        temp_class obj = (temp_class) session.getAttribute("temp");
        String url = "Footer.do";
        if (obj != null) {
            url = "Footer.do?" + obj.getUrlp();

        } else {
            obj = new temp_class();



        }
        if (oke) {
            obj.setAction("ThongBao");
        } else {
            obj.setAction("DatHang");
        }
        request.setAttribute("thongbao", loi);
        session.setAttribute("temp", obj);
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);



    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
