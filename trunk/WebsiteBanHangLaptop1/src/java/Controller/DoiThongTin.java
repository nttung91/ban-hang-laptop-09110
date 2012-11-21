/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.dao.KhachHangDAO;
import model.dao.KhachHangTrucTuyenDAO;
import model.pojo.KhachHang;
import model.pojo.KhachHangTrucTuyen;

/**
 *
 * @author THANHTUNG
 */
@WebServlet(name = "DoiThongTin", urlPatterns = {"/DoiThongTin.do"})
public class DoiThongTin extends HttpServlet {

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
        String tenDangNhap = null;
        HttpSession session = request.getSession();
        String loi = "";
        int gt = 0;

        boolean oke = true;

        if (session.getAttribute("tenDangNhap") != null && !session.getAttribute("tenDangNhap").equals("")) {
            tenDangNhap = session.getAttribute("tenDangNhap").toString();

        } else {
            oke = false;
        }




        if (request.getParameter("tenKhachHang") != null && !request.getParameter("tenKhachHang").equals("")) {
            hoTen = request.getParameter("tenKhachHang");

        } else {
            oke = false;
        }

        if (request.getParameter("gioiTinh") != null) {
            gioiTinh = request.getParameter("gioiTinh");
            if (gioiTinh.equals("Nam")) {
                gt = 0;
            } else {
                gt = 1;
            }

        } else {
            oke = false;
        }

        if (request.getParameter("datepicker") != null) {
            datepick = request.getParameter("datepicker");

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

        if (tenDangNhap != null) {
            KhachHangTrucTuyenDAO dao = new KhachHangTrucTuyenDAO();
            KhachHangDAO khdao = new KhachHangDAO();
            KhachHangTrucTuyen khtt = dao.getObject(tenDangNhap);
            if (khtt != null) {
                KhachHang kh = khtt.getKhachHang();
                if (kh != null) {
                    if (oke) {

                        kh.setTenKhachHang(hoTen);
                        kh.setDienThoai(dienThoai);
                        kh.setDiaChi(diaChi);
                        kh.setThanhPho(thanhPho);
                        Date ns = myLib.DateConvertor.Util2SqlDateConvertor(datepick);
                        kh.setNgaySinh(ns);
                        kh.setGioiTinh(gt);
                        khdao.saveOrUpdateObject(kh);
                        RequestDispatcher rd = request.getRequestDispatcher("TrangCaNhan.do");
                        rd.forward(request, response);
                    }
                    request.setAttribute("kh", kh);
                } else 
                {
                    loi += "Bạn chưa đăng nhập";
                }
            }
            else {
                loi += "Bạn chưa đăng nhập";
            }
        } else {
            loi += "Bạn chưa đăng nhập";
        }
        out.println(oke);
        request.setAttribute("loi",loi);
        RequestDispatcher rd = request.getRequestDispatcher("DoiThongTin.jsp");
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
