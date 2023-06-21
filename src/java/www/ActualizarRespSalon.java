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
public class ActualizarRespSalon extends HttpServlet {
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
            out.println("<title>Servlet ActualizarLicSoft</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ActualizarLicSoft at " + request.getContextPath() + "</h1>");
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
       // processRequest(request, response);
        
        int retorno = 0;
        HttpSession    sesion;
        sesion       = request.getSession(true);
        
        String NomSoftware, fechaVenci, FechaComp, version, idLic, numLic, VigLic, valorSoft, TipoLic, DescripLic, CodArea, NomSalon, CeduUsu;
        
        NomSalon     = request.getParameter("NomSalon");
        CeduUsu      = request.getParameter("CeduUsu");
    
        
        usr = sesion.getAttribute("idusr").toString();
        BDServicios bd = new BDServicios();
       
     
       
        retorno = bd.ActulizaRespSalon(CeduUsu,NomSalon);
      
        if(retorno != 0){
                        //    bd.CreaLogEquipo("2", "Actualización Equipo", usr, cc, serial, "0"); 
                        //    response.sendRedirect("/ServiOsiris.v2/ActInvent?ideq="+serial+"#inf");  
           
           response.sendRedirect("/ServiOsiris.v2/ResponsableSalon?nomSalon="+NomSalon);   
        }
        
        else{
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
