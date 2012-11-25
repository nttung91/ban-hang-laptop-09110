/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

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
import model.dao.DatHangDAO;
import model.pojo.SanPham;
import model.pojo.temp_class;

/**
 *
 * @author THANHTUNG
 */
@WebServlet(name = "ChiTietDonHang", urlPatterns = {"/ChiTietDonHang.do"})
public class ChiTietDonHang extends HttpServlet {

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
        String maDonHang = null;
         ArrayList<SanPham> chiTietDonHangs = new ArrayList<SanPham>();
         model.pojo.DatHang datHang = null;
        if (request.getParameter("MaDonHang")!=null){
            maDonHang = request.getParameter("MaDonHang");
            chiTietDonHangs = (new DatHangDAO()).getChiTietDonHangs(maDonHang);
            datHang = (new DatHangDAO()).getObject(maDonHang);
        }
        
        request.setAttribute("chiTietDonHangs", chiTietDonHangs);
        request.setAttribute("datHang", datHang);
        temp_class obj = (temp_class) session.getAttribute("temp");
        String url = "Footer.do";
        if (obj != null) {
            url = "Footer.do?" + obj.getUrlp();
        } else {
            obj = new temp_class();


        }
        obj.setAction("ChiTietDonHang");
        session.setAttribute("temp", obj);
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
        out.close();

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
