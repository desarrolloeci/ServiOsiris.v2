/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package www;

import BDatos.BDServicios;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Vector;

/**
 *
 * @author nicolas.almanzar
 */
public class CorreoLicencia {
    
    public void CorreoVer (String correo, String psw){
    
    correo c = new correo();
    BDServicios bd = new BDServicios();
    Vector consultaSoft = bd.consultaSoft();
    
    

            for(int i = 0; i < consultaSoft.size(); i++){
                   Vector aux = (Vector)consultaSoft.elementAt(i);

                 //  if (!aux.elementAt(6).equals("No disponible")) {

                       if ((aux.elementAt(6).toString().equals(bd.FchaHoy().elementAt(0))) || (aux.elementAt(9).toString().equals(bd.FchaHoy().elementAt(0))) ) {
                         //  correo = correo+"@escuelaing.edu.co";
                          
                          // c.correoVencLic(correo, psw, "nicolas.almanzar@escuelaing.edu.co", (String) aux.elementAt(1), (String) aux.elementAt(2), (String) aux.elementAt(7)); 
                           c.correoVencLic("vencimiento.licencia@escuelaing.edu.co", "0120Vence", "nicolas.almanzar@escuelaing.edu.co", (String) aux.elementAt(1), (String) aux.elementAt(2), (String) aux.elementAt(7)); 
                             
                           c.correoVencLic("vencimiento.licencia@escuelaing.edu.co", "0120Vence", "mauricio.tovar@escuelaing.edu.co", (String) aux.elementAt(1), (String) aux.elementAt(2), (String) aux.elementAt(7)); 
                           c.correoVencLic("vencimiento.licencia@escuelaing.edu.co", "0120Vence", "paulina.alvarado@escuelaing.edu.co", (String) aux.elementAt(1), (String) aux.elementAt(2), (String) aux.elementAt(7)); 
                       }
              //   }
              }
            
             
          
    }
}
