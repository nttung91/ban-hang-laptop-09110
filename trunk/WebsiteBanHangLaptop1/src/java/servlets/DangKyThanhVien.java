/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

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
    String[] info = null;
    String tenDanhNhap = null;
    boolean isMore = true;

    private String checkData(HttpServletRequest request, HttpSession session) {
        String matKhau = null, email = null, hoTen = null, gioiTinh = null, dienThoai = null, thanhPho = null, nhapLaiMatKhau = null, nhapLaiEmail = null, diaChi = null;

        String[] listVal;
        String kq = "";

       
        boolean oke = true;
        listVal = new String[10];
        if (request.getParameter("tenDangNhap") != null && !request.getParameter("tenDangNhap").equals("")) {
            tenDanhNhap = request.getParameter("tenDangNhap");
            listVal[0] = tenDanhNhap;
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
            listVal[1] = email;
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
                listVal[2] = hoTen;
            } else {
                oke = false;
            }

            if (request.getParameter("gioiTinh") != null) {
                gioiTinh = request.getParameter("gioiTinh");
                listVal[3] = gioiTinh;
            } else {
                oke = false;
            }
            if (request.getParameter("dienThoai") != null && !request.getParameter("dienThoai").equals("")) {
                dienThoai = request.getParameter("dienThoai");
                listVal[7] = dienThoai;
            } else {
                oke = false;
            }
            if (request.getParameter("thanhPho") != null) {
                thanhPho = request.getParameter("thanhPho");
                listVal[8] = thanhPho;
            } else {
                oke = false;
            }
            if (request.getParameter("diaChi") != null) {
                diaChi = request.getParameter("diaChi");
                listVal[9] = thanhPho;
            } else {
                oke = false;
            }



            listVal[4] = request.getParameter("datepicker");
            
        }
        session.setAttribute("listVal", listVal);
        info = listVal;
        if (!oke) {
            kq += "Các mục (*) không được bỏ trống.</br>";
        } else {

            boolean f = true;
            if (!matKhau.equals(nhapLaiMatKhau)) {
                kq += "Mật khẩu nhập lại không trùng khớp</br>";
                f = false;
            }
            if (!email.equals(nhapLaiEmail)) {
                kq += "Email nhập lại không trùng khớp</br>";
                f = false;
            }
            if (!myLib.RegexChecking.CheckEmail(email)) {
                kq += "Email không đúng !</br>";
                f = false;
            }
            if (isMore) {
                if (!myLib.RegexChecking.CheckDienThoai(dienThoai) && isMore) {
                    kq += "Số Điện Thoại không đúng !";
                    f = false;
                }
            }
            
            ///
            if (rpHash(request.getParameter("defaultReal")).equals(
				request.getParameter("defaultRealHash"))) {
			// Accepted
		}
		else {
			 kq += "Ma xac nhan khong chinh xac !";
                        f = false;
		}
          
            if (f) {
                //check trung lap trong csdl
                boolean f1 = true;
                //1. kiem tra ten dang nhap ton tai
                KhachHangTrucTuyenDAO khDao = new KhachHangTrucTuyenDAO();
                if (khDao.isUsernameTonTai(tenDanhNhap)) {
                    kq += "Tên đăng nhap da ton tai</br>";
                    f1 = false;
                }
                // String pass
                //2.kiem tra email trung lap
                if (khDao.isEmailTonTai(email)) {
                    kq += "Email da ton tai</br>";
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
                            kq += "Dang ky that bai</br>";
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
                        Date ns = myLib.DateConvertor.Util2SqlDateConvertor(listVal[4]);
                        kh.setNgaySinh(ns);
                        kh.setGioiTinh(Integer.parseInt(gioiTinh));
                        khtt.setKhachHang(kh);

                        //kh.setNgaySinh();
                        try {
                            khachhangttDao.saveOrUpdateObject(khtt);
                        } catch (HibernateException ex) {
                            kq += "Dang ky that bai</br>";
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
                session.removeAttribute("listVal");
                info = null;
                session.setAttribute("tenDangNhap", tenDanhNhap);
                session.setAttribute("daDangNhap", true);
                //response.sendRedirect("DangNhap.jsp");
                RequestDispatcher rd = request.getRequestDispatcher("DangNhap.do");
                rd.forward(request, response);
            }
            if (info == null) {
                info = new String[10];
            }
            request.setAttribute("info", info);
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
