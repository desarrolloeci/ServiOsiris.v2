/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package www;

import BDatos.BDServicios;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mario Martínez
 */
public class AprobarEquipo extends HttpServlet {
    String usr = "" ;
    String pass = "" ;
    
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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AprobarEquipo</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AprobarEquipo at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        //processRequest(request, response);
        
       String serial, resp;   
       serial   = request.getParameter("serial");
       resp     = request.getParameter("resp");
                
       HttpSession    sesion;
       sesion       = request.getSession(true);
        
       usr  = sesion.getAttribute("idusr").toString();
       pass = sesion.getAttribute("passwd").toString();
       
           BDServicios bd = new BDServicios();
           correo c = new correo();
           
           
           
           bd.AprobarEquipo(serial, usr);
           
           Vector tmp = bd.ConsultaCambioResp(serial);
           int q = 0;
                   q = bd.CreaLogEquipo("6", "Aprueba asignacion Equipo", usr, resp , serial, "0");
           
           usr = usr + "@escuelaing.edu.co";
           
           c.correoaprobacion(usr, pass, tmp.elementAt(0).toString()+"@escuelaing.edu.co",serial, tmp.elementAt(1).toString());
           
           response.sendRedirect("/ServiOsiris.v2/VerAprobar");
       
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
