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
public class CreaLicSoft extends HttpServlet {
    
     String usr = "" ;
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
            out.println("<title>Servlet CreaLicSoft</title>");            
            out.println("</head>");
            out.println("<body>");
          //  out.println("<h1>Servlet CreaLicSoft at " + request.getContextPath() + "</h1>");
              out.println("<h1>Servlet CreaLicSoft at " + request.getContextPath() + "</h1>");
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
        
        int retorno;
        HttpSession    sesion;
        sesion       = request.getSession(true);
        
        String NomSoftware,fechaVenci,FechaComp,version, numLic, VigLic, valorSoft, TipoLic, DescripLic, CodArea, CondUso, TipoSoft;
        
        NomSoftware      = request.getParameter("NomSoftware");
        fechaVenci       = request.getParameter("FechaVenci");
        FechaComp        = request.getParameter("fechaComp");
        version          = request.getParameter("version");
        numLic           = request.getParameter("numLic");
        VigLic           = request.getParameter("VigLic");
        valorSoft        = request.getParameter("valorSoft");
        TipoLic          = request.getParameter("TipoLic");
        CodArea          = request.getParameter("CodArea");
        DescripLic       = request.getParameter("DescripLic");
        CondUso          = request.getParameter("CondUso");
        TipoSoft         = request.getParameter("TipoSoft");
        usr = sesion.getAttribute("idusr").toString();
        
     //   TEqu = request.getParameter("tipoeq");
        
        BDServicios bd = new BDServicios();
     //   retorno = bd.CreaEquipo(placa, fcomp, mgarant, serial, puntored, dominio, mac, marca, modelo, TEqu, ubicacion, observa, usr);
           retorno = bd.CreaLicSoftware(NomSoftware,fechaVenci,FechaComp,version, numLic, VigLic, valorSoft, TipoLic, DescripLic, CodArea, CondUso, TipoSoft);
              
        
        if(retorno != 0){
                 //   bd.CreaLogEquipo("1", "Creación Equipo", usr, "0", serial, "0"); sirev para hacer el log
                 //   response.sendRedirect("/ServiOsiris.v2/ActInvent?ideq="+serial+"#car");
            bd.CreaLogSoftware( NomSoftware, version ,"Creación del Software "+NomSoftware+" versión "+version, usr,"1"); 
            response.sendRedirect("/ServiOsiris.v2/AddLicSoftware");
        }else{
                    response.sendRedirect("/ServiOsiris.v2/Error");
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
