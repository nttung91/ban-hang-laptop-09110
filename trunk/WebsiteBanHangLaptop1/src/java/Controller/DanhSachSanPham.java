/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.dao.HangSanXuatDAO;
import model.dao.LaptopDAO;
import model.dao.LinhKienDAO;
import model.dao.SanPhamDAO;
import model.pojo.SanPham;
import model.pojo.temp_class;
import myLib.SearchStringConvertor;

/**
 *
 * @author MRKYT
 */
@WebServlet(name = "DanhSachSanPham", urlPatterns = {"/DanhSachSanPham.do"})
public class DanhSachSanPham extends HttpServlet {

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
            SanPhamDAO spdao = new SanPhamDAO();
            HangSanXuatDAO hangsxDAO = new HangSanXuatDAO();
            HttpSession session = request.getSession();
            temp_class obj = (temp_class) session.getAttribute("temp");
            List<String> LString = null;
            List<SanPham> list = null;
            
//              obj.setTensp("");
//            if (request.getParameter("tenSanPham") != null) {
//                obj.setTensp(request.getParameter("tenSanPham"));
//            }
            
            if (request.getParameter("tenSanPham") != null) {
                
                obj.setTimkiem(request.getParameter("tenSanPham"));
            }

            if (request.getParameter("HangSanXuat") != null) {
                obj.setMahang(request.getParameter("HangSanXuat"));
            }

            if (request.getParameter("LoaiSanPham") != null) {
                obj.setLoaiSanPham(request.getParameter("LoaiSanPham"));
            }
            if (request.getParameter("SoSanPham") != null) {
                obj.setSosptrang(Integer.parseInt(request.getParameter("SoSanPham")));
            }
            if (request.getParameter("Trang") != null) {
                obj.setTrang(Integer.parseInt(request.getParameter("Trang")));
            }
            if (request.getParameter("giatu") != null) {
                obj.setGiatu(Double.parseDouble(request.getParameter("giatu")));
            }
            if (request.getParameter("giaden") != null) {
                obj.setGiaden(Double.parseDouble(request.getParameter("giaden")));
            }
            
            obj.setShowdau((obj.getTrang() % 5 == 0 ? (((obj.getTrang() / 5) - 1) * 5 + 1 ): ((obj.getTrang() / 5) * 5 + 1)));
           
            String timkiem = (obj.getTimkiem() + "," + obj.getMahang());
            // String Tim Kiem Tra Ve Se La 1 List<String> (LoaiSanPham , HangSanXuat , TenSP)
            LString = SearchStringConvertor.GetClear(timkiem);
            if (!LString.get(0).equals(" ")) {
                obj.setLoaiSanPham(LString.get(0));
            }
            if (!LString.get(1).equals(" ")) {
                obj.setMahang(LString.get(1));
            }
            if (!LString.get(2).equals(" ")) {
                obj.setTensp(LString.get(2));
            }
            timkiem = (obj.getTensp() + "," + obj.getMahang());

            list = spdao.search(timkiem, obj.getGiatu(), obj.getGiaden());

            int sosp = 0;

            for (int i = 0; i < list.size(); i++) {
                SanPham sp = list.get(i);
                if (obj.getLoaiSanPham().equals("laptop") && !sp.getLaptops().isEmpty()) {
                    sosp++;
                } else if (obj.getLoaiSanPham().equals("linhkien") && !sp.getLinhKiens().isEmpty()) {
                    sosp++;
                } else if (!obj.getLoaiSanPham().equals("laptop") && !obj.getLoaiSanPham().equals("linhkien")) {
                    sosp++;
                }
            }
            int tongtrang = (sosp % obj.getSosptrang() == 0 ? sosp / obj.getSosptrang() : ((sosp / obj.getSosptrang()) + 1));
            obj.setTongtrang(tongtrang);


            ///////
            List l = null;
            LaptopDAO laptopDAO = new LaptopDAO();
            LinhKienDAO linhkienDAO = new LinhKienDAO();
            //  l=laptopDAO.searchPhanTrang(timkiem, sosptrang, trang);
           
            
            l = spdao.searchPhanTrangTheoGia(timkiem, obj.getSosptrang(), obj.getTrang(), obj.getGiatu(), obj.getGiaden());
            
            if (obj.getLoaiSanPham().equals("laptop")) {
                l = laptopDAO.searchPhanTrang(timkiem, obj.getSosptrang(), obj.getTrang(), obj.getGiatu(), obj.getGiaden());
                
            }
            if (obj.getLoaiSanPham().equals("linhkien")) {
                l = linhkienDAO.searchPhanTrang(timkiem, obj.getSosptrang(), obj.getTrang(), obj.getGiatu(), obj.getGiaden());
                
            }
            obj.setListsp(l);
            //////
             session.setAttribute("temp", obj);
             String url = "footer.do?"+obj.getUrlp();
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
