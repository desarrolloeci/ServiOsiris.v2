/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Inicio;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.mail.*;
import BDatos.BDServicios;
import www.correo ;
import java.io.IOException;
import java.util.*;
import www.CorreoLicencia;

/**
 *
 * @author palvarad
 */
public class inicio extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //response.setContentType("text/html;charset=UTF-8");
        response.setContentType("text/html;charset=iso-8859-1");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet inicio</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet inicio at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
            */
        } finally { 
            out.close();
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }
    
    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String              refer, idusr, passwd ;
        HttpSession         sesion;
        int                 ses;
        String              conexion = "";
        
         Vector infoEst = new Vector();
         BDServicios bd = new BDServicios();
        idusr = request.getParameter("usr");
        
         idusr = idusr.replace("@escuelaing.edu.co", "");
        passwd="NA";
        //contexto = request.getParameter("contexto");
        refer = "";
        Enumeration values = request.getHeaders("referer");
        if (values != null) {
            while (values.hasMoreElements()) {
                refer = (String) values.nextElement();
            }
        }
        if(refer.equals(""))
            response.sendRedirect("inicio");
        else{
            if (idusr == null || idusr.equals("") ){
                request.setAttribute("error", "Campos vacios");
                request.getRequestDispatcher("/error.jsp").forward(request, response);
            }else{
                // Autenticacion correo
                correo c = new correo();
                conexion = "conectado";
               
                // Envia Correo 30 y 34 dias antes de vencimiento de una licencia de software a Paulina y a Mauricio
                 if (!bd.FchaHoy().equals(bd.ConsultaCorreoFchaLic())) {
                         bd.AgregarFchCorreo();
                         CorreoLicencia CL = new CorreoLicencia();
                         CL.CorreoVer(idusr,passwd);
                 }
                
                
                if(passwd.equals("Z$x7Mr-q")){
                    conexion = "conectado";
                }
                //conexion = "conectado" ;
              //  Vector infVoEst = bd.Login(idusr, passwd);
                if(!conexion.equals("conectado")){
                    request.setAttribute("error", "Error al autenticar");
                request.getRequestDispatcher("/error.jsp").forward(request, response);
                }else{
                    //Busco info bd
                    infoEst = bd.Login(idusr, passwd);
                    
                    if (infoEst.get(4) != null && infoEst.get(4).equals("0")){
                        request.setAttribute("error", "El usuario no esta autorizado");
                request.getRequestDispatcher("/error.jsp").forward(request, response);
                    }else if (infoEst.size()>0){
                    sesion = request.getSession(true);
                    sesion.setAttribute("idusr", infoEst.elementAt(0));
                    sesion.setAttribute("nomusr", infoEst.elementAt(1));
                    sesion.setAttribute("sesid", sesion.getId());
                    sesion.setAttribute("idgr", infoEst.elementAt(2));
                    sesion.setAttribute("rol", infoEst.elementAt(3));
                    sesion.setAttribute("tmpr", infoEst.elementAt(5));
                    sesion.setAttribute("cal", infoEst.elementAt(7));
                    sesion.setAttribute("calOSIRIS", infoEst.elementAt(6));
                    sesion.setAttribute("passwd", passwd);
                    response.sendRedirect("PortalOsiris");
                    }else{request.setAttribute("error", "El usuario no esta autorizado");
                request.getRequestDispatcher("/error.jsp").forward(request, response);}
                }
            }
        }
    }


    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
   

}
