/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.dao.HangSanXuatDAO;
import model.dao.KhoanGiaDAO;
import model.dao.SanPhamDAO;
import model.pojo.HangSanXuat;
import model.pojo.temp_class;

/**
 *
 * @author MRKYT
 */
@WebServlet(name = "Left", urlPatterns = {"/Left.do"})
public class Left extends HttpServlet {

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
        try {

            HangSanXuatDAO hangsxDAO = new HangSanXuatDAO();
            KhoanGiaDAO khoanGiaDAO = new KhoanGiaDAO();

            HttpSession session = request.getSession();

            // temp_class obj = (temp_class) session.getAttribute("Info");
            temp_class obj = (temp_class) session.getAttribute("temp");
            obj.setListHangSX(hangsxDAO.getList());
            obj.setListKhoanGia(khoanGiaDAO.getList());
            //  session.setAttribute("term", out);
            if (request.getParameter("Action") != null) {
                obj.setAction((request.getParameter("Action")));
            }
           
            session.setAttribute("temp", obj);
            String url = "";
            if(obj.getAction().equals("SanPham")){
            url = "DanhSachSanPham.do?" + obj.getUrlp();
            
          
            }
            else{
                 url = "Footer.do?" + obj.getUrlp();
            }


            RequestDispatcher rd = request.getRequestDispatcher(url);
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
