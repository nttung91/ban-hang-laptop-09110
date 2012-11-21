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
import org.hibernate.Session;

/**
 *
 * @author THANHTUNG
 */
@WebServlet(name = "DoiMatKhau", urlPatterns = {"/DoiMatKhau.do"})
public class DoiMatKhau extends HttpServlet {

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
        String matKhauCu = null,matKhauMoi = null,nhapLaiMatKhauMoi,tenDangNhap = null;
        boolean oke = true;
        String loi="";
        try {
            /* TODO output your page here. You may use following sample code. */
            if (request.getParameter("matKhauCu") != null && !request.getParameter("matKhauCu").equals("")) {
            matKhauCu = request.getParameter("matKhauCu");
        } else {
            oke = false;
        }
            if (request.getParameter("matKhau") != null && !request.getParameter("matKhau").equals("")) {
            matKhauMoi = request.getParameter("matKhau");
        } else {
            oke = false;
        }
        if (request.getParameter("nhapLaiMatKhau") != null && !request.getParameter("nhapLaiMatKhau").equals("")) {
            nhapLaiMatKhauMoi = request.getParameter("nhapLaiMatKhau");
        } else {
            oke = false;
        }
        if (session.getAttribute("tenDangNhap") != null) {
            tenDangNhap = session.getAttribute("tenDangNhap").toString();
        } else {
            oke = false;
            loi+="Bạn Chưa đăng nhập";
        }
        if (oke){
            KhachHangTrucTuyenDAO dao = new KhachHangTrucTuyenDAO();
            KhachHangTrucTuyen kh = dao.getObject(tenDangNhap);
            if (kh!=null){
                loi+=matKhauCu+kh.getMatKhau();
                if (myLib.MD5Convertor.Convert2MD5(matKhauCu.trim()).equals(kh.getMatKhau())){
                    kh.setMatKhau(myLib.MD5Convertor.Convert2MD5(matKhauMoi));
                    dao.saveOrUpdateObject(kh);
                     RequestDispatcher rd = request.getRequestDispatcher("TrangCaNhan.do");
                     rd.forward(request, response);
                }
                else {
                    loi+="Mật khẩu cũ không chính xác."+tenDangNhap;
                }
            }
            else {
                loi+="Tên đăng nhập không tồn tại.";
            }
        }
        request.setAttribute("loi", loi);
            RequestDispatcher rd = request.getRequestDispatcher("DoiMatKhau.jsp");
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
