/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package www;

import BDatos.BDServicios;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nicolas.almanzar
 */
public class EliminarSoftUsu extends HttpServlet{
    
      String usr = "";
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
            out.println("<title>Servlet EliminarLicSoft</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EliminarLicSoft at " + request.getContextPath() + "</h1>");
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
        
        String idLic, serial, tipo, secuencial, nomcar, usrresp, NomSoftware, version, idLicRe, TipoDelete, NomUsu;
    
        NomSoftware = request.getParameter("NomSoft");
        version     = request.getParameter("VersionSoft");   
        serial      = request.getParameter("serial");
        tipo        = request.getParameter("TipoDelete");
        secuencial  = request.getParameter("secuencial");
        NomUsu      = request.getParameter("NomUsu");
        int retorno = 0;
        BDServicios bd = new BDServicios();
        
        HttpSession    sesion;
        sesion       = request.getSession(true);
        
        usr  = sesion.getAttribute("idusr").toString();
        
        System.out.println("nombre soft "+NomSoftware +"version "+version);
        
        /* NOTA VARIABLE TipoDelete, TipoDelete = 1 cuando elimina desde JSP ReporteLicArea por usuario
         *  TipoDelete = 2 cuando elimina renovacion desde el JSP ReporteLicArea por area
         */
        if(tipo.equals("1")){
            retorno = bd.EliminaSoftware(serial, secuencial);
            bd.CreaLogSoftware( NomSoftware, version ,"Se desvinculo el Software "+NomSoftware+" versión "+version+" del usuario "+NomUsu +" equipo con serial "+serial, usr,"6");
            response.sendRedirect("/ServiOsiris.v2/ReporteLicArea"); 
        }else if(tipo.equals("2")){
            retorno = bd.EliminaSoftware(serial, secuencial);
            bd.CreaLogSoftware( NomSoftware, version ,"Se desvinculo el Software "+NomSoftware+" versión "+version+" del usuario "+NomUsu +" equipo con serial "+serial, usr,"6");
            response.sendRedirect("/ServiOsiris.v2/ReporteLicArea"); 
        }
        
       
        
      //  if(retorno!=0){
       // response.sendRedirect("/ServiOsiris.v2/ActInvent?ideq="+serial);
     //   }
            
           
            
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
