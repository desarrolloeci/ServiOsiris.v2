/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package www;

import BDatos.BDServicios;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Juan Vanzina
 */
public class Administrar_Sol extends HttpServlet {
    
    String usr;
    String pas;
       
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
        response.setContentType("text/html;charset=iso-8859-1");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Administrar_Sol</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Administrar_Sol at " + request.getContextPath() + "</h1>");
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
        
         HttpSession  sesion;
         sesion = request.getSession(true);
         String solucion, estado, idd, Calidad;
         
         int retorno = 0;
       
         String tipo_ac, User, Nro_Sol, destino, cor="0", ind ="0", Obs_admin, Responsable;
         
         destino = "juan.vanzina@escuelaing.edu.co";
         
          tipo_ac = (String) request.getParameter("tipo_ac");
         //tipo_ac = "S";
          User = (String) request.getParameter("User");
         //User = "";
          Nro_Sol = (String) request.getParameter("Nro_Sol");
         //Nro_Sol="89";
          Obs_admin = (String) request.getParameter("obs_admin");
         
          Calidad = (String) request.getParameter("Calidad");
          
          Responsable = (String) request.getParameter("responsable");
          
         BDServicios bd = new BDServicios();
         
         retorno = bd.Actualiza_Fin_Solicitud(tipo_ac, Nro_Sol, User, Obs_admin, Calidad);
         
         if(retorno!=0){
             
                      correo c = new correo();
         Vector sol = new Vector();
         Vector tmp = new Vector();
         Vector UltSol = new Vector();
         
         UltSol = bd.ConsultaSol();
         tmp =  bd.info_solicitud(Nro_Sol);
         
         String usuario_solicitante, asunto, bloque, ext;
         
         usuario_solicitante=tmp.elementAt(0).toString();
         asunto=tmp.elementAt(1).toString();
         bloque=tmp.elementAt(3).toString();
         ext=tmp.elementAt(4).toString();
         
         ind = "6";
         sesion = request.getSession(true);
         usr = sesion.getAttribute("idusr").toString();
         pas = sesion.getAttribute("passwd").toString();
         
         //usr = usr + "@escuelaing.edu.co";
         
         usr = usr + "@escuelaing.edu.co";
         
         String usudes;
         
         if(tipo_ac.equals("R")){ 
             ind = "5"; Nro_Sol = UltSol.elementAt(0).toString(); 
             usudes = bd.mail_usuario(User);
             destino = usudes+"@escuelaing.edu.co";
         }
         else{
             usudes = bd.mail_usuario(Responsable);
             destino = usudes+"@escuelaing.edu.co";
         }
         //if(tipo_ac.equals("S")){ ind = "6";}
         //if(tipo_ac.equals("C")){ ind = "3";}
         
         sol.addElement("0"); sol.addElement(asunto); sol.addElement(""); sol.addElement(bloque);
         sol.addElement(ext); sol.addElement(usuario_solicitante); sol.addElement(""); sol.addElement(""); sol.addElement("");
         sol.addElement("");sol.addElement(""); 
             
             
                     
            cor = c.ecorreo(sol, Nro_Sol, usr, pas, destino, "", ind, response);
             
         sesion = request.getSession(true);
         response.sendRedirect("Historial");
         }
         //response.sendRedirect(User);        
    }
    
        private Vector getCampos(HttpServletRequest request){
        Vector cmps = new Vector();
        String tmp;
        Enumeration lispar = request.getParameterNames();
        while (lispar.hasMoreElements()) {
            tmp = (String)lispar.nextElement();
            if(tmp.charAt(0) == 'z' && tmp.charAt(1) == 'z'){
                cmps.addElement(tmp.substring(2, tmp.length()));
            }
        }
        return cmps;
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
