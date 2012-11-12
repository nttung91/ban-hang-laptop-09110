/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.dao.*;
import model.pojo.*;

/**
 *
 * @author THANHTUNG
 */
@WebServlet(name = "ChiTietSanPham", urlPatterns = {"/ChiTietSanPham.do"})
public class ChiTietSanPham extends HttpServlet {

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
            String maSanPham = null, loaiSanPham = null;
            boolean hasSanPham = true;

            LaptopDAO daolt = new LaptopDAO();
            LinhKienDAO daolk = new LinhKienDAO();
            SanPham sp = null;
            Laptop lt = new Laptop();
            LinhKien lk = new LinhKien();
            //tang so luot xem
            
            //
            hasSanPham = true;
            String ss = request.getRequestURI();
            ss = ss.substring(ss.lastIndexOf("/"), ss.length());
            ss = ss.replaceAll(".jsp", ".do") + "?"+request.getQueryString();
            out.println(ss);
            session.setAttribute("prePage", ss);
            if (request.getParameter("logout") != null) {
                if (Boolean.parseBoolean(request.getParameter("logout").toString())) {
                    session.invalidate();
                    // out.println("set maps");
                }
            }
            //out.println(maSanPham+loaiSanPham+hasSanPham);   
            if (request.getParameter("maSanPham") != null) {
                maSanPham = request.getParameter("maSanPham");
                //out.println("set masp");

            } else {
                hasSanPham = false;
            }
            if (request.getParameter("loaiSanPham") != null) {
                loaiSanPham = request.getParameter("loaiSanPham");
                // out.println("set loaisp");
            } else {
                hasSanPham = false;
            }
            // tuy chinh de test
            //out.println(maSanPham+loaiSanPham+hasSanPham);   
            //maSanPham = "SP001";
            //loaiSanPham = "Laptop";
            boolean isItemExist = false;
            if (hasSanPham) {
                //out.println("<script>alert("+maSanPham+loaiSanPham+")</script>");
                if (loaiSanPham.equals("laptop")) {
                    lt = daolt.getObject(maSanPham);
                    if (lt != null) {
                        sp = lt.getSanPham();
                        isItemExist = true;
                    }
                    out.println(isItemExist);
                } else {
                    lk = daolk.getObject(maSanPham);
                    if (lk != null) {
                        sp = lk.getSanPham();
                        isItemExist = true;
                    }
                    //out.println(isItemExist);
                }
                out.println(isItemExist);
                if (sp == null) {
                    isItemExist = false;
                }

            } else {
                isItemExist = false;
            }
            //kiem tra gio hang va lay san tu gio hang
            
           
            // out.println(isItemExist);
            request.setAttribute("maSanPham", maSanPham);
            request.setAttribute("isItemExist", isItemExist);
            request.setAttribute("hasSanPham", hasSanPham);
            request.setAttribute("sanPham", sp);
            request.setAttribute("loaiSanPham", loaiSanPham);
            request.setAttribute("laptop", lt);
            request.setAttribute("linhkien", lk);
            RequestDispatcher rd = request.getRequestDispatcher("ChiTietSanPham.jsp");
            rd.forward(request, response);
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
