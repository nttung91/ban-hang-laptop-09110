/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;
import org.apache.commons.io.output.*;

/**
 *
 * @author THANHTUNG
 */
@WebServlet(name = "UploadFile", urlPatterns = {"/UploadFile.do"})
public class UploadFile extends HttpServlet {

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
        String loi = "";
        if (request.getAttribute("loi") != null) {
            loi += request.getAttribute("loi").toString();
        }
        try {
            /* TODO output your page here. You may use following sample code. */

            File file;
            File file1;
            int maxFileSize = 5000 * 1024;
            int maxMemSize = 5000 * 1024;
            ServletContext context = request.getServletContext();
            String filePath = context.getInitParameter("file-upload");
            String filePath1 = context.getInitParameter("file-upload1");
            String kq = "";
            String fp="";
            String err="";
            // Verify the content type
            String contentType = request.getContentType();
            if ((contentType.indexOf("multipart/form-data") >= 0)) {

                DiskFileItemFactory factory = new DiskFileItemFactory();
                // maximum size that will be stored in memory
                factory.setSizeThreshold(maxMemSize);
                // Location to save data that is larger than maxMemSize.
                factory.setRepository(new File("c:\\temp"));

                // Create a new file upload handler
                ServletFileUpload upload = new ServletFileUpload(factory);
                // maximum file size to be uploaded.
                upload.setSizeMax(maxFileSize);
                try {
                    // Parse the request to get file items.
                    List fileItems = upload.parseRequest(request);

                    // Process the uploaded file items
                    Iterator i = fileItems.iterator();


                    while (i.hasNext()) {
                        //out.println("tung");
                        FileItem fi = (FileItem) i.next();
                        if (!fi.isFormField()) {
                            // Get the uploaded file parameters
                            String fieldName = fi.getFieldName();
                            String fileName = fi.getName();
                            boolean isInMemory = fi.isInMemory();
                            long sizeInBytes = fi.getSize();
                            // Write the file
                            if (fileName.lastIndexOf("\\") >= 0) {
                                file = new File(filePath
                                        + fileName.substring(fileName.lastIndexOf("\\")));
                            } else {
                                file = new File(filePath
                                        + fileName.substring(fileName.lastIndexOf("\\") + 1));
                            }
                            //temp
                            if (fileName.lastIndexOf("\\") >= 0) {
                                file1 = new File(filePath1
                                        + fileName.substring(fileName.lastIndexOf("\\")));
                            } else {
                                file1 = new File(filePath1
                                        + fileName.substring(fileName.lastIndexOf("\\") + 1));
                            }
                            ///
                            fi.write(file);
                            fi.write(file1);
                            fp=fileName;
                        }
                    }
                    

                } catch (Exception ex) {
                    System.out.println(ex);
                    err = "Tải ảnh thất bại";
                }
               kq = "Tải ảnh thành công";
            } else {
               err = "Tải ảnh thất bại";
            }
            out.println("{");
            out.println("error: '" +err + "',\n");
            out.println("msg: '" + kq + "',\n");
            out.println("filename: '" + fp + "'\n");
            out.println("}");
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
