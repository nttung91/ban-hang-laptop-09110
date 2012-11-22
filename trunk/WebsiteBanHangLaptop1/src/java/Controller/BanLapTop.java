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
import model.pojo.temp_class;

/**
 *
 * @author MRKYT
 */
@WebServlet(name = "BanLapTop", urlPatterns = {"/BanLapTop.do"})
public class BanLapTop extends HttpServlet {

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

            temp_class obj = new temp_class();


            String urlp = request.getQueryString();

//            int code =-1;
//           
//            for (int i = 0 ; i <urlp.length() ; i ++)
//                if (urlp.charAt(i)=='?' )
//                    code = i;
//            if  (code !=-1)
//            urlp = urlp.substring(code);
            obj.setUrlp(urlp);
            HttpSession session = request.getSession();




            obj.setSosptrang(5);

            obj.setTrang(1);

            obj.setGiatu(0);
            obj.setGiaden(0);

            obj.setMahang("");
            obj.setLoaiSanPham("");


            obj.setTensp("");
            if (request.getParameter("Action") == null) {
                obj.setAction("SanPham");
            }
            if (request.getParameter("Action") != null) {
                obj.setAction((request.getParameter("Action")));
            }





            //request.setAttribute("tam", obj);
            session.setAttribute("temp", obj);

//            header h = new header();
//            h.doGet(request, response);
//            left_1 left = new left_1();
//            left.doGet(request, response);
//            if (obj.getAction().equals("SanPham")) {
//
//                DanhSachSanPham dssp = new DanhSachSanPham();
//                dssp.doGet(request, response);
//
//            }
//            footer foot = new footer();
//            foot.doGet(request, response);

//            String url = "index.jsp";
//
//            request.setAttribute("page", obj.getAction());
//            RequestDispatcher rd = request.getRequestDispatcher(url);
//            rd.forward(request, response);

            String url = "Header.do?" + urlp;
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
