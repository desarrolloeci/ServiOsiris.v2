/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BDatos;

/**
 *
 * @author jersson.salazar
 */
public class Licencia {
    
    //variables propias de la Clase
    private int IdSoft;
    private String NombreSoft;
    
    //Método constructor
    public Licencia(){
        
    }       
    
    public Licencia(int IdSoft1, String NombreSoft1){
        
        this.IdSoft=IdSoft1;        
        this.NombreSoft=NombreSoft1;        
    }
    
    public String dameDatos(){
    
        return NombreSoft;                
    }
    
    public String NombLicencia(){
    
        return NombreSoft;                
    }
    
    public int IdLicencia(){
    
        return IdSoft;                
    }    
}
