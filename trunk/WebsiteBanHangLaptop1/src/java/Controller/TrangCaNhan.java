/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.dao.KhachHangTrucTuyenDAO;
import model.pojo.KhachHangTrucTuyen;
import model.pojo.temp_class;

/**
 *
 * @author THANHTUNG
 */
@WebServlet(name = "TrangCaNhan", urlPatterns = {"/TrangCaNhan.do"})
public class TrangCaNhan extends HttpServlet {

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
        String matKhauCu = null, matKhauMoi = null, nhapLaiMatKhauMoi, tenDangNhap = null;
        boolean oke = true;
        String loi = "";

        if (session.getAttribute("tenDangNhap") != null) {
            tenDangNhap = session.getAttribute("tenDangNhap").toString();
        } else {
            oke = false;
            loi += "Bạn Chưa đăng nhập";
        }
        if (oke) {
            KhachHangTrucTuyenDAO dao = new KhachHangTrucTuyenDAO();
            KhachHangTrucTuyen kh = dao.getObject(tenDangNhap);
            if (kh != null) {
                request.setAttribute("loi", loi);
                request.setAttribute("khachhang", kh);
                temp_class obj = (temp_class) session.getAttribute("temp");
                String url = "Footer.do?" + obj.getUrlp();
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
                return;
            } else {
                loi += "Tên đăng nhập không tồn tại.";
            }
        }
        request.setAttribute("loi", loi);
        temp_class obj = (temp_class) session.getAttribute("temp");
        String url = "Footer.do?" + obj.getUrlp();
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
