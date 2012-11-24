/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.dao.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import model.pojo.temp_class;

/**
 *
 * @author THANHTUNG
 */
@WebServlet(name = "DangNhap", urlPatterns = {"/DangNhap.do"})
public class DangNhap extends HttpServlet {

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
          temp_class obj = (temp_class) session.getAttribute("temp");

        String username = null, password = null;

        //kiem tra dieu kien

        boolean flag = true;
        boolean oke = true;
        if (request.getParameter("tenDangNhap") != null) {
            username = request.getParameter("tenDangNhap").toString();
        } else {
            flag = false;

        }
        if (request.getParameter("matKhau") != null) {
            password = request.getParameter("matKhau").toString();
        } else {
            flag = false;
        }
        if (flag) {
            KhachHangTrucTuyenDAO khttdao = new KhachHangTrucTuyenDAO();
            oke = khttdao.isDangNhapThanhCong(username, myLib.MD5Convertor.Convert2MD5(password.trim()));
            if (oke) {
                //session.removeAttribute("listVal");
                session.setAttribute("tenDangNhap", username);
                session.setAttribute("daDangNhap", true);
                out.println("<h1>fad</h1>");
//                    out.println("<script language='JavaScript'>");
//                    out.println("window.location = " + Parameters.DANH_SACH_SAN_PHAM_LINK);
//                    out.println("</script>");
                // response.sendRedirect("DanhSachSanPham.do");
                //  return;
                //out.println("<h1>fad</h1>");
               
                    response.sendRedirect("BanLapTop.do");
                    return;
               
            }
        }
        if (!flag) {
            oke = true;
        }
        request.setAttribute("oke", oke);
        //out.println(oke);

        boolean rememberPassword = false;
        if (request.getParameter("rememberPassword") != null && request.getParameter("rememberPassword").equals("Yes")) {

            rememberPassword = true;
        }
        request.setAttribute("rememberPassword", rememberPassword);
      
        String url = "Footer.do?" + obj.getUrlp();
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
