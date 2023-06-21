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
public class ActualizaSol extends HttpServlet {
    
      String usr = "" ;
      String pas = "" ;

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
       /*     out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ActualizaSol</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ActualizaSol at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");*/
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
         HttpSession  sesion;
         sesion = request.getSession(true);
         String solucion, estado, idd, destino;
         
         BDServicios bd = new BDServicios();
         
         int retorno = 0;
       
         idd = request.getParameter("idd").toString();
         
         String tiposol = bd.ConsultaTipoSol(idd).elementAt(0).toString();

         
         //idd="85";
         solucion = request.getParameter("sol_1");
         //solucion = "prueba";
         estado = request.getParameter("est_1");
         //estado="2";         
         //destino = request.getParameter("respons");
         destino = "sandra.rojas@escuelaing.edu.co"; //Se hizo cambio de correo 15-11-2018sa
         //destino = "juan.vanzina@escuelaing.edu.co"; // Cambiar cada nueva version en Produccion. Solo Pruebas
         String ind = "0", cor = "0";
         
         
         retorno = bd.ActualizaS(idd, estado, solucion);
         
         if(retorno!=0){
         
         correo c = new correo();
         Vector sol = new Vector();
         Vector tmp = new Vector();
         
         tmp =  bd.info_solicitud(idd);
         
         String usuario_solicitante, asunto, bloque, ext;
         
         usuario_solicitante=tmp.elementAt(0).toString();
         asunto=tmp.elementAt(1).toString();
         bloque=tmp.elementAt(3).toString();
         ext=tmp.elementAt(4).toString();
         
         ind = "2";
         sesion = request.getSession(true);
         usr = sesion.getAttribute("idusr").toString();
         pas = sesion.getAttribute("passwd").toString();
         
         //usr = usr + "@escuelaing.edu.co";
         
         usr = usr + "@escuelaing.edu.co";
         
         if(estado.equals("5")){ ind = "3";}
         
         sol.addElement("0"); sol.addElement(asunto); sol.addElement(""); sol.addElement(bloque);
         sol.addElement(ext); sol.addElement(usuario_solicitante); sol.addElement(""); sol.addElement(""); sol.addElement("");
         sol.addElement("");sol.addElement(""); 
 
            
            sesion = request.getSession(true);
            
          if(tiposol.equals("3")){
         
            retorno = bd.Actualiza_Fin_Solicitud("S", idd, "", "", "5");
         
         }else{
          
               cor = c.ecorreo(sol, idd, usr, pas, destino, "", ind, response);
          
          }
          
          
          response.sendRedirect("Tramitar");
            
         }
         
         
         
         
         //response.sendRedirect(idd);
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
