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

/**
 *
 * @author palvarad
 */
public class logout extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response)
        	throws IOException, ServletException {

        HttpSession         sesion;
        PrintWriter         out = response.getWriter();

        sesion = request.getSession(false);
        if (sesion != null){
            sesion.removeAttribute("idusr");
            sesion.removeAttribute("nomusr");
            sesion.invalidate();
        }
        /* Sesion Cerrada */
        request.getRequestDispatcher("/salir").forward(request, response);
                
    }
}

