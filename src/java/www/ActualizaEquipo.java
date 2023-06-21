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
 * @author Mario Martínez
 */
public class ActualizaEquipo extends HttpServlet {
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
            out.println("<title>Servlet ActualizaEquipo</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ActualizaEquipo at " + request.getContextPath() + "</h1>");
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
        
        String serial, placa, fcomp, mgarant, puntored, dominio, mac, mac2, marca, modelo, ubicacion, observa, TEqu, estado, cc, eqcinc, OrdenComp;
        
        eqcinc      = request.getParameter("eqcinc");
        serial      = request.getParameter("serial");
        placa       = request.getParameter("placa");
        fcomp       = request.getParameter("fcomp");
        mgarant     = request.getParameter("mgarant");
        puntored    = request.getParameter("puntored");
        dominio     = request.getParameter("dominio");
        mac         = request.getParameter("mac");
        mac2        = request.getParameter("mac2");
        marca       = request.getParameter("marca");
        modelo      = request.getParameter("modelo");
        ubicacion   = request.getParameter("ubicacion");
        observa     = request.getParameter("observa");
        TEqu        = request.getParameter("tipoeq");
        cc          = request.getParameter("cc");
        OrdenComp   = request.getParameter("OrdenComp");

        usr = sesion.getAttribute("idusr").toString();
        
        estado = "1";
        
        BDServicios bd = new BDServicios();
        retorno = bd.ActualizaEquipo(placa, estado, fcomp, mgarant, serial, puntored, dominio, mac, marca, modelo, TEqu, ubicacion, observa, "NULL","NULL", eqcinc, OrdenComp, mac2);
        
        if(retorno != 0){
                            bd.CreaLogEquipo("2", "Actualización Equipo", usr, cc, serial, "0"); 
                            response.sendRedirect("/ServiOsiris.v2/ActInvent?ideq="+serial+"#inf");   
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
