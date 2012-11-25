/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Gobal.Parameters;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
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
import model.dao.KhachHangTrucTuyenDAO;
import model.pojo.KhachHangTrucTuyen;
import model.pojo.temp_class;
import model.pojo.DatHang;
import model.pojo.KhachHang;
import org.hibernate.tool.hbm2x.pojo.POJOClass;

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
        String tenDangNhap = null;
        boolean oke = true;
        String loi = "";
        boolean delOke = true;
        String thaoTac = null, maDonHang = null;
        if (request.getParameter("ThaoTac") != null) {
            thaoTac = request.getParameter("ThaoTac");
        } else {
            delOke = false;
        }
        if (request.getParameter("MaDonHang") != null) {
            maDonHang = request.getParameter("MaDonHang");
        } else {
            delOke = false;
        }
        if (session.getAttribute("tenDangNhap") != null) {
            tenDangNhap = session.getAttribute("tenDangNhap").toString();
        } else {
            oke = false;
            loi += "Bạn Chưa đăng nhập";
        }
        DatHangDAO dhdao = new DatHangDAO();
        if (delOke) {
            DatHang dhdel = dhdao.getObject(maDonHang);
            if (dhdel != null && dhdel.getTinhTrangDonDatHang().getMaTinhTrang()==Parameters.TTDH_CHUA_DUYET) {
                dhdao.deleteObject(dhdel);
            }
        }
        if (oke) {
            KhachHangTrucTuyenDAO dao = new KhachHangTrucTuyenDAO();
            
            KhachHangTrucTuyen kh = dao.getObject(tenDangNhap);
            ArrayList<DatHang> dhs = new ArrayList<DatHang>();
            if (kh != null) {
                request.setAttribute("loi", loi);
                request.setAttribute("khachhang", kh);
                KhachHang khs = kh.getKhachHang();
                if (khs != null) {

                    Set<DatHang> dhset = khs.getDatHangs();
                    Iterator<DatHang> iterator = dhset.iterator();
                    while (iterator.hasNext()) {
                        dhs.add(iterator.next());
                    }
                }
                request.setAttribute("TTDH_CHUA_DUYET", Parameters.TTDH_CHUA_DUYET);
                request.setAttribute("dhs", dhs);
                temp_class obj = (temp_class) session.getAttribute("temp");
                String url = "Footer.do?" + obj.getUrlp();
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
                return;
            } else {
                loi += "Tên đăng nhập không tồn tại.";
            }
        }
        request.setAttribute("TTDH_CHUA_DUYET", Parameters.TTDH_CHUA_DUYET);
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
