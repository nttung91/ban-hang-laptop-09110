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
import model.dao.HangSanXuatDAO;
import model.dao.KhachHangDAO;
import model.dao.SanPhamDAO;
import model.pojo.HangSanXuat;
import model.pojo.Laptop;
import model.pojo.LinhKien;
import model.pojo.SanPham;

/**
 *
 * @author THANHTUNG
 */
@WebServlet(name = "ThemSanPham", urlPatterns = {"/ThemSanPham.do"})
public class ThemSanPham extends HttpServlet {

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
        try 
        {
        String tensp = null, hangsx = null, thoigianbaohanh = null, loaisp = null, cpu = null, kichthuocmanhinh = null, ram = null, ocung = null, diaquang = null, cardmanhinh = null, wireless = null, hedieuhanh = null, tinhnangkhac = null, giasp, soluong = null, hinhsp, thongtinlinhkien = null;
        String gia = null, pin = null, cannang = null, imgPath = null;
        boolean oke = true;
        String loi = "";
        if (request.getParameter("tenSanPham") != null) {
            tensp = request.getParameter("tenSanPham");
        } else {
            oke = false;
        }
        loi += oke;
        if (request.getParameter("hangSanXuat") != null) {
            hangsx = request.getParameter("hangSanXuat");
        } else {
            oke = false;
        }

        if (request.getParameter("thoiGianBaoHanh") != null) {
            thoigianbaohanh = request.getParameter("thoiGianBaoHanh");
        } else {
            oke = false;
        }
        if (request.getParameter("loaiSanPham") != null) {
            loaisp = request.getParameter("loaiSanPham");
        } else {
            oke = false;
        }
        if (request.getParameter("cpu") != null) {
            cpu = request.getParameter("cpu");
        }

        if (request.getParameter("kichThuocManHinh") != null) {
            kichthuocmanhinh = request.getParameter("kichThuocManHinh");
        }
        if (request.getParameter("pin") != null) {
            pin = request.getParameter("pin");
        }
        if (request.getParameter("cannang") != null) {
            cannang = request.getParameter("cannang");
        }
        if (request.getParameter("ram") != null) {
            ram = request.getParameter("ram");
        }
        if (request.getParameter("oCung") != null) {
            ocung = request.getParameter("oCung");
        }
        if (request.getParameter("diaQuang") != null) {
            diaquang = request.getParameter("diaQuang");
        }
        if (request.getParameter("cardManHinh") != null) {
            cardmanhinh = request.getParameter("cardManHinh");
        }
        if (request.getParameter("wireless") != null) {
            wireless = request.getParameter("wireless");
        }
        if (request.getParameter("tinhNangKhac") != null) {
            tinhnangkhac = request.getParameter("tinhNangKhac");
        }
        if (request.getParameter("os") != null) {
            hedieuhanh = request.getParameter("os");
        }
        if (request.getParameter("linhKien_info") != null) {
            thongtinlinhkien = request.getParameter("linhKien_info");
        }
        
        if (request.getParameter("imgPath") != null) {
            imgPath = request.getParameter("imgPath");
        }
        if (request.getParameter("soLuong") != null) {
            soluong = request.getParameter("soLuong");
        } else {
            oke = false;
        }
        if (request.getParameter("gia") != null) {
            gia = request.getParameter("gia");
        } else {
            oke = false;
        }
        if (loaisp!=null && loaisp.equals("linhkien") && thongtinlinhkien==null){
            oke =false;
        }
        if (oke) {
            SanPhamDAO dao = new SanPhamDAO();
            String masp = dao.generateKeyCode("SanPham", "maSanPham", "SP");
            SanPham sp = new SanPham(masp);
            sp.setTenSanPham(tensp);
            sp.setGia(Double.parseDouble(gia));
            sp.setSoLuotXem(0);
            sp.setSoLuongTon(Integer.parseInt(soluong));
            sp.setNgayCapNhat(myLib.DateConvertor.getCurrentDate());
            sp.setThoiGianBaoHanh(Integer.parseInt(thoigianbaohanh));
            HangSanXuatDAO hdao = new HangSanXuatDAO();
            HangSanXuat hang = hdao.getObject(hangsx);
            sp.setHangSanXuat(hang);
            sp.setHinhAnh(imgPath);
            if (loaisp.equals("laptop")) {

                Laptop lt = new Laptop();
                lt.setMaSanPham(masp);
                lt.setCardDoHoa(cardmanhinh);
                lt.setCardKhongDay(wireless);
                lt.setChipCpu(cpu);
                lt.setRam(ram);
                lt.setDiaQuang(diaquang);
                lt.setHeDieuHanh(hedieuhanh);
                lt.setManHinh(kichthuocmanhinh);
                lt.setOCung(ocung);
                lt.setPin(gia);
                lt.setTinhNangKhac(tinhnangkhac);
                lt.setPin(pin);
                lt.setCanNang(Double.parseDouble(cannang));
                sp.getLaptops().add(lt);
            } else if (loaisp.equals("linhkien")) {
                LinhKien lk = new LinhKien();
                //xu ly thong tin link kien
                thongtinlinhkien = thongtinlinhkien.replaceAll("\r\n", "</br>");
                
                lk.setMoTa(thongtinlinhkien);
                lk.setMaSanPham(masp);
                sp.getLinhKiens().add(lk);
            } else {
                loi += "Loại sản phẩm ko đúng";
                request.setAttribute("loi", loi);
                RequestDispatcher rd = request.getRequestDispatcher("ThemSanPham.jsp");
                rd.forward(request, response);
            }
            dao.saveOrUpdateObject(sp);
            
            loi = "Thêm thành công";
            request.setAttribute("loi", loi);
            RequestDispatcher rd = request.getRequestDispatcher("ThemSanPham.jsp");
            rd.forward(request, response);
            return;
        }
       
        request.setAttribute("loi", loi);   
        RequestDispatcher rd = request.getRequestDispatcher("ThemSanPham.jsp");
        rd.forward(request, response);
        } finally 
        {
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
