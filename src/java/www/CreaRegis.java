/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package www;

import BDatos.BDServicios;
import www.correo ;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import javax.mail.*;
import javax.mail.internet.*;

/**
 *
 * @author Paulina Alvarado
 */
public class CreaRegis extends HttpServlet {
  private String tmperr;
  String usr = "" ;
  String pas = "" ;
   /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CreaRegis</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreaRegis at " + request.getContextPath () + "</h1>");
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
         response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String host = "smtp.office365.com";
       // final String to = "paulina.alvarado@escuelaing.edu.co";
       // processRequest(request, response);
        BDServicios bd = new BDServicios();
        HttpSession         sesion;
        String smtp;
        int estado = 0 ;
        Vector res = new Vector();
        Vector sol = new Vector();
        String correo = "", nro = "0", ind = "0";
        String cliente = "", bloque = "", ext = "", asunto = "", tec = "";
        String as = "", texto = "", mensaje = "", crea = "", tiposol="", tipousues="", usuosiris="";
        cliente = request.getParameter("cliente");
        bloque = request.getParameter("ubic");
        ext = request.getParameter("ext");
        asunto = request.getParameter("asunto");
        tiposol = request.getParameter("tiposol");
        tipousues = request.getParameter("usues");
        usuosiris = request.getParameter("UsuarioOS");
       // tec = request.getParameter("juan.vanzina");
        String[] result = cliente.split("/");
        String usu = result[0];
        String depend = result[1];
        String nombre = result[0];
        Vector Solic;
        sesion = request.getSession(true);
        usr = sesion.getAttribute("idusr").toString();
        pas = sesion.getAttribute("passwd").toString();
        String destino = "juan.vanzina@escuelaing.edu.co";
       //String destino = "paulina.alvarado@escuelaing.edu.co";
        crea = usr;
        //usr = usr + "@escuelaing.edu.co";
        
        //Se hace el insert de la solicitud
        // estado = guardaUpdate(usu, bloque, ext, asunto, depend, crea);
        if(usuosiris.equals("0")){
              
              estado = bd.CreaSol(usu, bloque, ext, asunto, depend, crea, tiposol);
              
        }
        else{
              estado = bd.CreaSolProp(usu, bloque, ext, asunto, depend, crea, tiposol, tipousues, usuosiris);
        }
        
        usr = usr + "@escuelaing.edu.co";
        
         Solic = bd.ConsultaSol();
         
         String solici = Solic.elementAt(0).toString();
         String tecni = Solic.elementAt(1).toString();
         //usr = tecni + "@escuelaing.edu.co";                // Se envia mail a tecnico asignado por el sistema
         
        sol.addElement("0"); sol.addElement(asunto); sol.addElement(depend); sol.addElement(bloque);
        sol.addElement(ext); sol.addElement(nombre); sol.addElement(""); sol.addElement(""); sol.addElement("");
        sol.addElement("");sol.addElement("");
         
       //Se hace el envio del correo al coordinador de infraestructura
         //if(!tec.equals("")){
             ind = "1";
             destino = tecni + "@escuelaing.edu.co";
         //}
         correo c = new correo();
         if (estado > 0){
             //Busco el nro de solicitud creado
             res = bd.nsol(usu);
             if (res.size() > 0)
                 nro = (String)res.elementAt(0);
             correo = c.ecorreo(sol, solici, usr, pas, destino, depend, ind, response);
  /*         
             if (correo.equals("ok")){
             //if (mensaje.equals("ok")){
                 sesion = request.getSession(true);
                 sesion.setAttribute("doc", usu);
                 response.sendRedirect("correcto");
                 //Mensaje correcto
             }else{
                 //sesion = request.getSession(true);
                 //sesion.setAttribute("doc", usu);
                 sesion.setAttribute("ind", "0");
                 response.sendRedirect("error");
             } */
             
                 sesion = request.getSession(true);
                 sesion.setAttribute("doc", usu);
                 response.sendRedirect("correcto");
                 
         }else{
             sesion.setAttribute("ind", "1");
            response.sendRedirect("error");
         }      
         

    }

    /*  private int guardaUpdate(String usu, String bloque, String ext, String asunto, String depend, String usr){
        int i, ret = 0;
        //Vector campos = getCampos(request);
        BDServicios bd = new BDServicios();
        

        String consulta = "Error al actualizar disponibilidad de entrevista.";
        try {
            ret = bd.CreaSol(usu, bloque, ext, asunto, depend, usr);
            tmperr = consulta;
        } catch (Exception el) {
            ret = 0;
        }
        return ret;

    }*/

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
     * @return a String containing servlet description
     */
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
