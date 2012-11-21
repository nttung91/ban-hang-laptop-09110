/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Gobal.Parameters;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.dao.KhachHangDAO;
import model.dao.KhachHangTrucTuyenDAO;
import model.pojo.KhachHang;
import model.pojo.KhachHangTrucTuyen;
import org.hibernate.HibernateException;

/**
 *
 * @author THANHTUNG
 */
@WebServlet(name = "DangKyThanhVien", urlPatterns = {"/DangKyThanhVien.do"})
public class DangKyThanhVien extends HttpServlet {

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
   
    String tenDanhNhap = null;
    boolean isMore = true;

    private String checkData(HttpServletRequest request, HttpSession session) {
        String matKhau = null, email = null, hoTen = null, gioiTinh = null, dienThoai = null, thanhPho = null, nhapLaiMatKhau = null, nhapLaiEmail = null, diaChi = null,datepick=null;

       
        String kq = "";

       
        boolean oke = true;
       
        if (request.getParameter("tenDangNhap") != null && !request.getParameter("tenDangNhap").equals("")) {
            tenDanhNhap = request.getParameter("tenDangNhap");
            
        } else {
            oke = false;
        }
        if (request.getParameter("matKhau") != null && !request.getParameter("matKhau").equals("")) {
            matKhau = request.getParameter("matKhau");
        } else {
            oke = false;
        }
        if (request.getParameter("nhapLaiMatKhau") != null && !request.getParameter("nhapLaiMatKhau").equals("")) {
            nhapLaiMatKhau = request.getParameter("nhapLaiMatKhau");
        } else {
            oke = false;
        }
        if (request.getParameter("email") != null && !request.getParameter("email").equals("")) {
            email = request.getParameter("email");
            
        } else {
            oke = false;
        }
        if (request.getParameter("nhapLaiEmail") != null && !request.getParameter("nhapLaiEmail").equals("")) {
            nhapLaiEmail = request.getParameter("nhapLaiEmail");
        } else {
            oke = false;
        }
        if (request.getParameter("isMore") != null) {
            if (request.getParameter("isMore").equals("noMore")) {
                isMore = false;
            } else {
                isMore = true;
            }
        }


        if (isMore) {
            if (request.getParameter("tenKhachHang") != null && !request.getParameter("tenKhachHang").equals("")) {
                hoTen = request.getParameter("tenKhachHang");
                
            } else {
                oke = false;
            }

            if (request.getParameter("gioiTinh") != null) {
                gioiTinh = request.getParameter("gioiTinh");
               
            } else {
                oke = false;
            }
            if (request.getParameter("datepicker") != null) {
                datepick = request.getParameter("datepicker");
               
            } else {
                oke = false;
            }
            if (request.getParameter("dienThoai") != null && !request.getParameter("dienThoai").equals("")) {
                dienThoai = request.getParameter("dienThoai");
                
            } else {
                oke = false;
            }
            if (request.getParameter("thanhPho") != null) {
                thanhPho = request.getParameter("thanhPho");
                
            } else {
                oke = false;
            }
            if (request.getParameter("diaChi") != null) {
                diaChi = request.getParameter("diaChi");
                
            } else {
                oke = false;
            }
        }
       
        if (!oke) {
            kq += "Các mục (*) không được bỏ trống.";
        } else {

            boolean f = true;
            if (!matKhau.equals(nhapLaiMatKhau)) {
              
                f = false;
            }
            if (!email.equals(nhapLaiEmail)) {
                
                f = false;
            }
            if (!myLib.RegexChecking.CheckEmail(email)) {
                
                f = false;
            }
            if (isMore) {
                if (!myLib.RegexChecking.CheckDienThoai(dienThoai) && isMore) {
                    
                    f = false;
                }
            }
            if (rpHash(request.getParameter("defaultReal")).equals(
				request.getParameter("defaultRealHash"))) {
			// Accepted
		}
		else {
			 kq += "Mã xác nhận không chính xác !";
                        f = false;
		}
          
            if (f) {
                //check trung lap trong csdl
                boolean f1 = true;
                //1. kiem tra ten dang nhap ton tai
                KhachHangTrucTuyenDAO khDao = new KhachHangTrucTuyenDAO();
                if (khDao.isUsernameTonTai(tenDanhNhap)) {
                    kq += "Tên đăng nhập đã tồn tại";
                    f1 = false;
                }
                // String pass
                //2.kiem tra email trung lap
                if (khDao.isEmailTonTai(email) && f1) {
                    kq += "Email đã tồn tại";
                    f1 = false;
                }
                if (f1) {
                    //luu vao csdl
                    KhachHangDAO khachHangDao = new KhachHangDAO();
                    KhachHangTrucTuyenDAO khachhangttDao = new KhachHangTrucTuyenDAO();
                    KhachHangTrucTuyen khtt = new KhachHangTrucTuyen();
                    khtt.setUsername(tenDanhNhap);
                    khtt.setMatKhau(myLib.MD5Convertor.Convert2MD5(matKhau));
                    //khtt.setHoTen(hoTen);
                    khtt.setEmail(email);
                    if (!isMore) {
                        try {
                            khachhangttDao.saveOrUpdateObject(khtt);
                        } catch (HibernateException ex) {
                            kq += "Đăng ký thất bại";
                            kq += ex.toString();
                        }
                    } else {


                        KhachHang kh = new KhachHang();
                        String maKhachHang = khachHangDao.generateKeyCode("KhachHang", "maKhachHang", "KH");
                        kh.setMaKhachHang(maKhachHang);
                        kh.setTenKhachHang(hoTen);
                        kh.setDienThoai(dienThoai);
                        kh.setDiaChi(diaChi);
                        kh.setThanhPho(thanhPho);
                        Date ns = myLib.DateConvertor.Util2SqlDateConvertor(datepick);
                        kh.setNgaySinh(ns);
                        kh.setGioiTinh(Integer.parseInt(gioiTinh));
                        khtt.setKhachHang(kh);

                        //kh.setNgaySinh();
                        try {
                            khachhangttDao.saveOrUpdateObject(khtt);
                        } catch (HibernateException ex) {
                            kq += "Đăng ký thất bại</br>";
                            kq += ex.toString();
                        }
                    }
                }
            }

        }
        return kq;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        try {
            /* TODO output your page here. You may use following sample code. */
            if (request.getParameter("logout") != null) {
                if (Boolean.parseBoolean(request.getParameter("logout").toString())) {
                    session.setAttribute("daDangNhap", false);
                }
            }
            if (session.getAttribute("daDangNhap") != null) {
            } else {
                //chua dang nhap
                session.setAttribute("daDangNhap", false);
            }
            String kq = checkData(request, session);
            if (kq.equals("")) {
                //dang ky thanh cong
                //remove tham so dang ky
              
                session.setAttribute("tenDangNhap", tenDanhNhap);
                session.setAttribute("daDangNhap", true);
                //response.sendRedirect("DangNhap.jsp");
                RequestDispatcher rd = request.getRequestDispatcher("DangNhap.do");
                rd.forward(request, response);
            }
         
           
            request.setAttribute("loi", kq);
            request.setAttribute("isMore", isMore);
            RequestDispatcher rd = request.getRequestDispatcher("DangKyThanhVien.jsp");
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
    private String rpHash(String value) {
		int hash = 5381;
		value = value.toUpperCase();
		for(int i = 0; i < value.length(); i++) {
			hash = ((hash << 5) + hash) + value.charAt(i);
		}
		return String.valueOf(hash);
	}
}
