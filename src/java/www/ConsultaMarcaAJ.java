/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package www;

import BDatos.BDServicios;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mario Martínez
 */
public class ConsultaMarcaAJ extends HttpServlet {

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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ConsultaMarcaAJ</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConsultaMarcaAJ at " + request.getContextPath() + "</h1>");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //processRequest(request, response);
        
                BDServicios bd = new BDServicios();
                List<String> list = new ArrayList<String>();
                String json = null;
                Vector infusu = new Vector();
                Vector retorno = new Vector();
                String valor = request.getParameter("valor");     //se contiene el valor de sports (TIPO EQUIPO)
                String tipcon = request.getParameter("tipcon");   //se contiene un valor igual "0"
                
                //reemplaza el valor de la variable tipcon que llega como "0" y lo cambia a: "Seleccione Marca"
                tipcon = tipcon.replaceAll("Seleccione Marca", "");
        
                retorno =  bd.ConsultaEquiposInventario(tipcon, valor);
                
                
                for(int i = 0 ; i < retorno.size(); i++){
                    infusu = (Vector)retorno.elementAt(i);
                    list.add(infusu.elementAt(0).toString());
                }

                json = new Gson().toJson(list);
                response.setContentType("application/json");
                response.getWriter().write(json);
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
        processRequest(request, response); 
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
