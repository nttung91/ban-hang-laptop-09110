/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.dao.SanPhamDAO;
import model.pojo.SanPham;
import model.pojo.temp_class;

/**
 *
 * @author THANHTUNG
 */
@WebServlet(name = "GioHang", urlPatterns = {"/GioHang.do"})
public class GioHang extends HttpServlet {

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
        HttpSession session = request.getSession();
        try {

            if (request.getParameter("logout") != null) {
                if (Boolean.parseBoolean(request.getParameter("logout").toString())) {
                    session.invalidate();
                    out.println("session remove giohang");
                }
            }
            session.setAttribute("PrevPage", request.getRequestURL());
            if (session.getAttribute("daDangNhap") == null) {
                session.setAttribute("daDangNhap", false);
            }

            ArrayList<SanPham> gioHang = new ArrayList<SanPham>();
            String action;
            String maSanPham;
            int[] soLuongMoi = null;
            boolean oke = true;
            //kiem tra gio hang

            if (session.getAttribute("GioHang") != null) {
                gioHang = (ArrayList<SanPham>) session.getAttribute("GioHang");
                soLuongMoi = new int[gioHang.size()];
            } else {
                session.setAttribute("GioHang", gioHang);
            }
            if (request.getParameter("ThaoTac") != null) {
                action = request.getParameter("ThaoTac");
            } else {
                action = "CapNhat";
            }
            if (action.equals("ThemVaoGio")) {
                if (request.getParameter("maSanPham") != null) {
                    maSanPham = request.getParameter("maSanPham");
                    if (maSanPham == null) {
                        return;
                    }
                    SanPhamDAO dao = new SanPhamDAO();
                    SanPham sanPham = dao.getObject(maSanPham);
                    int soLuong = 1;
                    if (request.getParameter("soLuong") != null) {
                        try {
                            soLuong = Integer.parseInt(request.getParameter("soLuong"));
                        } catch (Exception ex) {
                            soLuong = 1;
                        }
                    }
                    if (sanPham != null) {
                        boolean isExist = false;
                        for (int i = 0; i < gioHang.size(); i++) {
                            if (gioHang.get(i).getMaSanPham().equals(maSanPham)) {
                                gioHang.get(i).setSoLuongTon(gioHang.get(i).getSoLuongTon() + soLuong);
                                isExist = true;
                                break;
                            }
                        }
                        if (!isExist) {
                            sanPham.setSoLuongTon(soLuong);
                            gioHang.add(sanPham);
                        }
                    }

                } else {
                    //den trang bao loi ko tim thay ma san pham
                }
            } else if (action.equals("CapNhat")) {
                if (request.getParameter("txt_so_luong") != null) {
                    try {
                        String[] s = request.getParameterValues("txt_so_luong");
                        for (int i = 0; i < gioHang.size(); i++) {
                            soLuongMoi[i] = Integer.parseInt(s[i]);
                            gioHang.get(i).setSoLuongTon(soLuongMoi[i]);
                        }
                    } catch (NullPointerException ex) {
                        ex.printStackTrace();
                        for (int i = 0; i < gioHang.size(); i++) {
                            soLuongMoi[i] = 1;
                        }
                    }
                } else {
                    for (int i = 0; i < gioHang.size(); i++) {
                        soLuongMoi[i] = 1;
                    }
                }
                if (request.getParameter("maSanPham") != null) {

                    maSanPham = request.getParameter("maSanPham");

                } else {
                }
            } else if (action.equals("XoaSanPham")) {
                if (request.getParameter("maSanPham") != null) {

                    maSanPham = request.getParameter("maSanPham");
                    for (int i = 0; i < gioHang.size(); i++) {
                        if (gioHang.get(i).getMaSanPham().equals(maSanPham)) {
                            gioHang.remove(i);
                            i--;
                        }
                    }

                } else {
                    //fdsaf
                }
            } else if (action.equals("HuyGioHang")) {
                session.removeAttribute("GioHang");
                //  out.println("session remove giohang");
                //  response.sendRedirect("GioHang.do");
                oke = false;

            }
            //tinh toan

            double tong = 0;
            if (session.getAttribute("GioHang") != null) {
                for (int i = 0; i < gioHang.size(); i++) {
                    tong += gioHang.get(i).getGia() * gioHang.get(i).getSoLuongTon();
                }
            }
            double vat = tong * 0.1;
            double thanhtien = tong + vat;
            request.setAttribute("tong", tong);
            request.setAttribute("vat", vat);
            request.setAttribute("thanhtien", thanhtien);


            temp_class obj = (temp_class) session.getAttribute("temp");
            String url = "Footer.do";
            if (obj != null) {
                url = "Footer.do?" + obj.getUrlp();
            } else {
                obj = new temp_class();


            }
            obj.setAction("GioHang");
            session.setAttribute("temp", obj);
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
            out.close();
        } finally {
            out.close();
        }
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
