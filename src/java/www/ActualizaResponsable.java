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
public class ActualizaResponsable extends HttpServlet {

    String usr = "", pass = "" ;
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
            out.println("<title>Servlet ActualizaResponsable</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ActualizaResponsable at " + request.getContextPath() + "</h1>");
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
        
        String serial, observacion, ccresponsable, salon;
        
        HttpSession    sesion;
        sesion       = request.getSession(true);
        
        serial          = request.getParameter("serial");
        observacion     = request.getParameter("observacion");
        ccresponsable   = request.getParameter("ccresponsable");
        salon           = request.getParameter("idsalon");
        usr             = sesion.getAttribute("idusr").toString();
        pass            = sesion.getAttribute("passwd").toString();
        
        BDServicios bd = new BDServicios();
        
        int retorno;
        
        Vector infequipo = bd.Detalle_Equipo(serial);
         
        retorno = bd.Actualizar_RespEquipo(serial, observacion, ccresponsable, usr, salon);
        
        if(retorno!=0){
                 bd.CreaLogEquipo("4", "Cambio de Responsable. Salon: "+salon+" Ob: "+observacion, usr, ccresponsable, serial, "0");
                 
                 
                 
                 correo c = new correo();
                
                   c.CorreoSolicitudAprob(usr, pass, "carlos.acevedo@escuelaing.edu.co", usr, serial, infequipo.elementAt(13).toString(), observacion,  infequipo.elementAt(14).toString());
              //   c.CorreoSolicitudAprob(usr, pass, "francisco.farfan@escuelaing.edu.co", usr, serial, infequipo.elementAt(13).toString(), observacion,  infequipo.elementAt(14).toString());
              //   c.CorreoSolicitudAprob(usr, pass, "mauricio.tovar@escuelaing.edu.co", usr, serial, infequipo.elementAt(13).toString(), observacion,  infequipo.elementAt(14).toString());
                 //c.CorreoSolicitudAprob(usr, pass, "juan.vanzina@escuelaing.edu.co", usr, serial, infequipo.elementAt(13).toString(), observacion,  infequipo.elementAt(14).toString());
                 
                 
                response.sendRedirect("/ServiOsiris.v2/ActInvent?ideq="+serial+"#inf");
        }
        
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
