/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package BDatos;

import java.io.*;
import java.text.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import BDatos.BaseDatos;

/**
 *
 * @author palvarad
 */
public class BDServicios extends BaseDatos {

   private String mensaje;

    /** Creates a new instance of BD.. */
    public BDServicios() {
    }
    
   
     public Vector consultSerial(String serial) {
        Vector retorno = new Vector();
        String consulta = new String();
        String filtro = "";
    
               consulta = new String ("SELECT  Count(Serial)\n" +
                                       "  FROM [ServiOsirirs].[servicios].[Equipo] where Serial = '"+serial+"'");
             
             
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    
    public Vector consultaSoft() {
        Vector retorno = new Vector();
        String consulta = new String();
        String filtro = "";
    
               consulta = new String ("SELECT [idSoftware]\n" +
                                      "      ,[NombreSoft]\n" +
                                      "      ,[VersionS]\n" +
                                      "      ,[FechaCompra]\n" +
                                      "      ,[Estado]\n" +
                                      "      ,[TipoSoft]\n" +
                                      "      ,DATEADD(DD,-30,[fecha_vencimiento]), [fecha_vencimiento]\n" +
                                      "      ,[num_licencias],DATEADD(DD,-34,[fecha_vencimiento]) " +
                                      "  FROM [ServiOsirirs].[servicios].[Software]");
             
        try {
            conectarBD();
            retorno = consultar(consulta, 10, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    
    public Vector FchaHoy() {
        Vector retorno = new Vector();
        String consulta = new String();
        String filtro = "";
    
               consulta = new String ("SELECT convert(date,getdate())");
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    
    public Vector ConsultaCorreoFchaLic() {
        Vector retorno = new Vector();
        String consulta = new String();
        String filtro = "";
    
            consulta = new String ("SELECT convert(date,[fechaEnv])\n" +
                                   "  FROM [ServiOsirirs].[servicios].[FechaCorreoLic]");
           
      
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    
      public Vector ConsultaRepAreaSoft(String CodArea) {
        Vector retorno = new Vector();
        String consulta = new String();
        String filtro = "";
        
            consulta = new String ("Select A.[idSoftware],A.[NombreSoft] ,A.[VersionS],  CONVERT(date,A.[FechaCompra]), CONVERT(date,A.[fecha_vencimiento]),B.[vigencia], A.[num_licencias],B.[costo] ,B.[tipo_licencia] ,B.[descripcion] " +
                                   "  from  [ServiOsirirs].[servicios].[Software] A, [ServiOsirirs].[servicios].[LicenciaSoft] B, [ServiOsirirs].[servicios].[AreaSoftware] C " +
                                   "  Where A.[idSoftware] = B.[idSoftware] AND A.[idSoftware] = C.[idSoftware] AND B.tipo = 'COMPRA' AND A.[Estado] = 1 AND C.CodArea = '"+CodArea+"'");
           
       
        try {
            conectarBD();
            retorno = consultar(consulta, 10, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

        public Vector ConsultaReporteArea(String Area) {
        Vector retorno = new Vector();
        String consulta = new String();
        String filtro = "";
        
        if(!Area.equals("")){  
            consulta = new String ("Select C.NombreSoft, C.VersionS,  C.fecha_vencimiento, EM.nombres, A.[idSalon], A.[CCResponsable], B.[idSoftware], A.[Serial], C.[idSoftware]  " +
                                   "from odi.empnomina EM, Novasoft.dbo.gen_clasif1 CL, [ServiOsirirs].[servicios].[Equipo] A,[ServiOsirirs].[servicios].[EquipoSoftware] B, [ServiOsirirs].[servicios].[Software] C " +
                                   " WHERE  A.Serial = B.Serial AND EM.cod_cl1 = CL.codigo AND B.idSoftware= C.idSoftware  AND EM.cod_emp = A.[CCResponsable] AND em.est_lab IN ('Activo','Vacaciones') AND CL.nombre = '"+Area+"' ORDER BY EM.nombres");
        }
        
            
        try {
            conectarBD();
            retorno = consultar(consulta, 9, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
        
    public Vector ConsultaNombreUsu(String ccUsuario) {
        Vector retorno = new Vector();
        String consulta = new String();
        String filtro = "";
        
        if(!ccUsuario.equals("")){  
            consulta = new String ("Select EM.nombres  from odi.empnomina EM WHERE cod_emp = '"+ccUsuario+"'");
        }
             
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    
      public Vector ReporteSoft(String nombreLic) {
        Vector retorno = new Vector();
        String consulta = new String();
        String filtro = "";
  
        if (nombreLic.equals("all")) {  
            consulta = new String ("Select EM.nombres, A.[idSalon], C.NombreSoft, C.VersionS, C.FechaCompra,  C.fecha_vencimiento,  D.vigencia, C.num_licencias, D.costo, D.tipo_licencia, B.[idSoftware], A.[Serial], C.[idSoftware]\n" +
                                    "from odi.empnomina EM, Novasoft.dbo.gen_clasif1 CL, [ServiOsirirs].[servicios].[Equipo] A,[ServiOsirirs].[servicios].[EquipoSoftware] B, [ServiOsirirs].[servicios].[Software] C, [ServiOsirirs].[servicios].[LicenciaSoft] D \n" +
                                    "WHERE  A.Serial = B.Serial AND EM.cod_cl1 = CL.codigo AND B.idSoftware= C.idSoftware AND C.idSoftware = D.idSoftware AND EM.cod_emp = A.[CCResponsable] AND D.tipo ='COMPRA' AND em.est_lab IN ('Activo','Vacaciones') ORDER BY EM.nombres");
        }else{
         consulta = new String ("Select EM.nombres, A.[idSalon], C.NombreSoft, C.VersionS, C.FechaCompra,  C.fecha_vencimiento,  D.vigencia, C.num_licencias, D.costo, D.tipo_licencia, B.[idSoftware], A.[Serial], C.[idSoftware]\n" +
                                    "from odi.empnomina EM, Novasoft.dbo.gen_clasif1 CL, [ServiOsirirs].[servicios].[Equipo] A,[ServiOsirirs].[servicios].[EquipoSoftware] B, [ServiOsirirs].[servicios].[Software] C, [ServiOsirirs].[servicios].[LicenciaSoft] D \n" +
                                    "WHERE  A.Serial = B.Serial AND EM.cod_cl1 = CL.codigo AND B.idSoftware= C.idSoftware AND C.idSoftware = D.idSoftware AND EM.cod_emp = A.[CCResponsable] AND D.tipo ='COMPRA' AND em.est_lab IN ('Activo','Vacaciones') AND C.NombreSoft = '"+nombreLic+"' ORDER BY EM.nombres");
        
        }
               
        try {
            conectarBD();
            retorno = consultar(consulta, 13, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
      
      public Vector ReporteSoftUsu(String nombreLic, String versionLic) {
        Vector retorno = new Vector();
        String consulta = new String();
        String filtro = "";
  
        if(!nombreLic.equals("")){  
            consulta = new String ("Select EM.nombres, A.[idSalon], C.NombreSoft, C.VersionS, C.FechaCompra,  C.fecha_vencimiento,  D.vigencia, C.num_licencias, D.costo, D.tipo_licencia, B.[idSoftware], A.[Serial], C.[idSoftware]\n" +
                                    "from odi.empnomina EM, Novasoft.dbo.gen_clasif1 CL, [ServiOsirirs].[servicios].[Equipo] A,[ServiOsirirs].[servicios].[EquipoSoftware] B, [ServiOsirirs].[servicios].[Software] C, [ServiOsirirs].[servicios].[LicenciaSoft] D \n" +
                                    "WHERE  A.Serial = B.Serial AND EM.cod_cl1 = CL.codigo AND B.idSoftware= C.idSoftware AND C.idSoftware = D.idSoftware AND EM.cod_emp = A.[CCResponsable] AND D.tipo ='COMPRA' AND em.est_lab IN ('Activo','Vacaciones') AND C.NombreSoft = '"+nombreLic+"' AND C.VersionS = '"+versionLic+"' ORDER BY EM.nombres");
        }
               
        try {
            conectarBD();
            retorno = consultar(consulta, 13, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    
       public Vector ReporteSoftDisp(String Area) {
        Vector retorno = new Vector();
        String consulta = new String();
        String filtro = "";

         
           if (Area.equals("all")) {
                consulta = new String ("Select DISTINCT  C.NombreSoft, C.VersionS,  CL.nombre, D.condicion_uso, C.num_licencias, ( select count (*) from [ServiOsirirs].[servicios].[EquipoSoftware] B\n" +
                                    "  WHERE B.idSoftware = C.idSoftware  group by B.idSoftware)\n" +
                                    "from registro.odi.empnomina EM, Novasoft.dbo.gen_clasif1 CL, [ServiOsirirs].[servicios].[Equipo] A,[ServiOsirirs].[servicios].[EquipoSoftware] B, [ServiOsirirs].[servicios].[Software] C, [ServiOsirirs].[servicios].[LicenciaSoft] D  \n" +
                                    "WHERE  A.Serial = B.Serial AND EM.cod_cl1 = CL.codigo AND B.idSoftware= C.idSoftware AND C.idSoftware = D.idSoftware AND EM.cod_emp = A.[CCResponsable] AND em.est_lab IN ('Activo','Vacaciones')  GROUP BY  NombreSoft, C.VersionS,  CL.nombre, D.condicion_uso, C.num_licencias, EM.nombres, C.idSoftware\n" +
                                    "");
           }else{
            consulta = new String ("Select DISTINCT  C.NombreSoft, C.VersionS,  CL.nombre, D.condicion_uso, C.num_licencias, ( select count (*) from [ServiOsirirs].[servicios].[EquipoSoftware] B\n" +
                                    "  WHERE B.idSoftware = C.idSoftware  group by B.idSoftware)\n" +
                                    "from registro.odi.empnomina EM, Novasoft.dbo.gen_clasif1 CL, [ServiOsirirs].[servicios].[Equipo] A,[ServiOsirirs].[servicios].[EquipoSoftware] B, [ServiOsirirs].[servicios].[Software] C, [ServiOsirirs].[servicios].[LicenciaSoft] D  \n" +
                                    "WHERE  A.Serial = B.Serial AND EM.cod_cl1 = CL.codigo AND B.idSoftware= C.idSoftware AND C.idSoftware = D.idSoftware AND EM.cod_emp = A.[CCResponsable] AND em.est_lab IN ('Activo','Vacaciones') AND CL.nombre = '"+Area+"' GROUP BY  NombreSoft, C.VersionS,  CL.nombre, D.condicion_uso, C.num_licencias, EM.nombres, C.idSoftware\n" +
                                    "");
      
           }
           
          
        try {
            conectarBD();
            retorno = consultar(consulta, 6, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
      
         public Vector ReporteSoftDisponible(String NomSoft) {
        Vector retorno = new Vector();
        String consulta = new String();
        String filtro = "";

           if (NomSoft.equals("all")) {
                consulta = new String ("Select DISTINCT  C.NombreSoft, C.VersionS,  CL.nombre, D.condicion_uso, C.num_licencias, ( select count (*) from [ServiOsirirs].[servicios].[EquipoSoftware] B\n" +
                                    "  WHERE B.idSoftware = C.idSoftware  group by B.idSoftware)\n" +
                                    "from registro.odi.empnomina EM, Novasoft.dbo.gen_clasif1 CL, [ServiOsirirs].[servicios].[Equipo] A,[ServiOsirirs].[servicios].[EquipoSoftware] B, [ServiOsirirs].[servicios].[Software] C, [ServiOsirirs].[servicios].[LicenciaSoft] D  \n" +
                                    "WHERE  A.Serial = B.Serial AND EM.cod_cl1 = CL.codigo AND B.idSoftware= C.idSoftware AND C.idSoftware = D.idSoftware AND EM.cod_emp = A.[CCResponsable] AND em.est_lab IN ('Activo','Vacaciones')  GROUP BY  NombreSoft, C.VersionS,  CL.nombre, D.condicion_uso, C.num_licencias, EM.nombres, C.idSoftware");
           }else{
            consulta = new String ("Select DISTINCT  C.NombreSoft, C.VersionS,  CL.nombre, D.condicion_uso, C.num_licencias, ( select count (*) from [ServiOsirirs].[servicios].[EquipoSoftware] B\n" +
                                    "  WHERE B.idSoftware = C.idSoftware  group by B.idSoftware)\n" +
                                    "from registro.odi.empnomina EM, Novasoft.dbo.gen_clasif1 CL, [ServiOsirirs].[servicios].[Equipo] A,[ServiOsirirs].[servicios].[EquipoSoftware] B, [ServiOsirirs].[servicios].[Software] C, [ServiOsirirs].[servicios].[LicenciaSoft] D  \n" +
                                    "WHERE  A.Serial = B.Serial AND EM.cod_cl1 = CL.codigo AND B.idSoftware= C.idSoftware AND C.idSoftware = D.idSoftware AND EM.cod_emp = A.[CCResponsable] AND em.est_lab IN ('Activo','Vacaciones') AND C.NombreSoft = '"+NomSoft+"' GROUP BY  NombreSoft, C.VersionS,  CL.nombre, D.condicion_uso, C.num_licencias, EM.nombres, C.idSoftware");

           }
        try {
            conectarBD();
            retorno = consultar(consulta, 6, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
       
    public Vector ConsultaReporteUsuario(String ccUsuario) {
        Vector retorno = new Vector();
        String consulta = new String();
        String filtro = "";
  
        if(!ccUsuario.equals("")){  
            consulta = new String ("SELECT A.[CCResponsable],A.[idSalon],B.[idSoftware],C.NombreSoft, C.VersionS,  C.fecha_vencimiento, A.[Serial], C.[idSoftware] " +
                                   "FROM [ServiOsirirs].[servicios].[Equipo] A, [ServiOsirirs].[servicios].[EquipoSoftware] B, [ServiOsirirs].[servicios].[Software] C " +
                                   "WHERE A.Serial = B.Serial AND B.idSoftware= C.idSoftware AND A.CCResponsable = '"+ccUsuario+"'");
        }
               
        try {
            conectarBD();
            retorno = consultar(consulta, 8, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
        
            
    public Vector ConsultaReporteLicencias(String fechaini, String fechafin, String nombreLic) {
        Vector retorno = new Vector();
        String consulta = new String();
        String filtro = "";
        
       
        
        if(!fechaini.equals("") && !fechafin.equals("") && nombreLic.equals("0")){  
            consulta = new String ("Select A.[idSoftware],A.[NombreSoft] ,A.[VersionS], CONVERT(date,A.[fecha_vencimiento]), CONVERT(date,A.[FechaCompra]), A.[num_licencias],B.[vigencia],B.[costo] ,B.[tipo_licencia] ,B.[descripcion]" +
                                    " from  [ServiOsirirs].[servicios].[Software] A, [ServiOsirirs].[servicios].[LicenciaSoft] B " +
                                    " Where A.[idSoftware] = B.[idSoftware] AND  A.[fecha_vencimiento]>=CONVERT(date,'"+fechaini+"') " +" AND Cast(A.[fecha_vencimiento] As date) <= CONVERT(date,'"+fechafin+"') AND B.tipo = 'COMPRA' AND A.[Estado] = 1");
        }
        if(!nombreLic.equals("0") && fechaini.equals("") && fechafin.equals("")){
                     
           consulta = new String ("Select A.[idSoftware],A.[NombreSoft] ,A.[VersionS], CONVERT(date,A.[fecha_vencimiento]), CONVERT(date,A.[FechaCompra]), A.[num_licencias],B.[vigencia],B.[costo] ,B.[tipo_licencia] ,B.[descripcion]" +
                                    " from  [ServiOsirirs].[servicios].[Software] A, [ServiOsirirs].[servicios].[LicenciaSoft] B " +
                                    " Where A.[idSoftware] = B.[idSoftware] AND A.[NombreSoft] like '%"+nombreLic+"%' AND B.tipo = 'COMPRA' AND A.[Estado] = 1");
           
        }
        
        if(!fechaini.equals("") && !fechafin.equals("") && !nombreLic.equals("0")){
         consulta = new String ("Select A.[idSoftware],A.[NombreSoft] ,A.[VersionS], CONVERT(date,A.[fecha_vencimiento]), CONVERT(date,A.[FechaCompra]), A.[num_licencias],B.[vigencia],B.[costo] ,B.[tipo_licencia] ,B.[descripcion]" +
                                    " from  [ServiOsirirs].[servicios].[Software] A, [ServiOsirirs].[servicios].[LicenciaSoft] B " +
                                    " Where A.[idSoftware] = B.[idSoftware] AND A.[NombreSoft] like '%"+nombreLic+"%' "
                                    + "AND  A.[fecha_vencimiento]>=CONVERT(date,'"+fechaini+"') " +" AND Cast(A.[fecha_vencimiento] As date) <= CONVERT(date,'"+fechafin+"')"
                                    + " AND B.tipo = 'COMPRA' AND A.[Estado] = 1");
        }
       
       
        try {
            conectarBD();
            retorno = consultar(consulta, 10, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    
    public Vector Detalle_Salon( String Salon) {
        Vector retorno = new Vector();
        String consulta = new String();
         consulta = new String(" SELECT [idSalon]\n" +
                                "      ,[Descripcion]\n" +
                                "      ,[TipoSalon]\n" +
                                "      ,[CCResponsableSalon]\n" +
                                "      ,[bloque]\n" +
                                "  FROM [ServiOsirirs].[servicios].[Salon] where  [idSalon] = '"+Salon+"'");
         
      
                                        try {
            conectarBD();
            retorno = consultar(consulta, 5, 0);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    
    
public Vector nombre_Salon() {
        Vector retorno = new Vector();
        String consulta = new String();
         consulta = new String("  SELECT[idSalon]\n" +
                                "  FROM [ServiOsirirs].[servicios].[Salon]");
                                        try {
            conectarBD();
            retorno = consultar(consulta, 1, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    
    public Vector nombre_Licsoftware() {
        Vector retorno = new Vector();
        String consulta = new String();
         consulta = new String("Select distinct ([NombreSoft]) from [ServiOsirirs].[servicios].[Software] where TipoSoft = 3 Order by [NombreSoft] asc");
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    
    public Vector version_software(String nomsoft) {
        Vector retorno = new Vector();
        String consulta = new String();
         consulta = new String("Select distinct ([VersionS]) from [ServiOsirirs].[servicios].[Software] where TipoSoft = 3 and [NombreSoft] = '"+nomsoft+"'");
         
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    
     public Vector Detalle_Renovacion(String NomSoft, String VerSoft) {
        Vector retorno = new Vector();
        String consulta = new String();
        String filtro = "";
        
       // if(!NomSoft.equals("") && !VerSoft.equals("")){
           consulta = new String ("Select A.[idSoftware],A.[NombreSoft] ,A.[VersionS], CONVERT(date,B.[fecha_renovacion]),B.[costo],B.[vigencia], A.[num_licencias] ,B.[tipo_licencia] ,B.[descripcion], B.[IdLicencia]" +
                                    " from  [ServiOsirirs].[servicios].[Software] A, [ServiOsirirs].[servicios].[LicenciaSoft] B " +
                                    " Where A.[idSoftware] = B.[idSoftware] AND  A.[NombreSoft] =  '"+NomSoft+"' AND A.[VersionS] = '"+VerSoft+"' AND B.tipo = 'RENOVA'");
     //   }
    
        
        try {
            conectarBD();
            retorno = consultar(consulta, 10, 1);
            
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    
    public Vector Detalle_Licencia(String NomSoft, String VerSoft) {
        Vector retorno = new Vector();
        String consulta = new String();
        String filtro = "";
        
       // if(!NomSoft.equals("") && !VerSoft.equals("")){
           consulta = new String ("Select A.[idSoftware],A.[NombreSoft] ,A.[VersionS], CONVERT(date,A.[fecha_vencimiento]), CONVERT(date,A.[FechaCompra]), A.[num_licencias],B.[vigencia],B.[costo] ,B.[tipo_licencia] ,B.[descripcion], B.[condicion_uso]" +
                                    " from  [ServiOsirirs].[servicios].[Software] A, [ServiOsirirs].[servicios].[LicenciaSoft] B " +
                                    " Where A.[idSoftware] = B.[idSoftware] AND  A.[NombreSoft] =  '"+NomSoft+"' AND A.[VersionS] = '"+VerSoft+"' AND B.tipo = 'COMPRA'");
       
     //   }
    
         
        try {
            conectarBD();
            retorno = consultar(consulta, 11, 0);
            
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    
     public Vector Detalle_Area(String idLic) {
        Vector retorno = new Vector();
        String consulta = new String();
        String filtro = "";
        
     
           consulta = new String ("SELECT  [idAreaSoft]\n" +
                                    "      ,(Select nombre from Novasoft.dbo.gen_clasif1 Where codigo = [CodArea])\n" +
                                    "      ,[CodArea]\n" +
                                    "      ,[idSoftware]\n" +
                                    "  FROM [ServiOsirirs].[servicios].[AreaSoftware] WHERE idSoftware = "+idLic+"");
         
        
    
         
        try {
            conectarBD();
            retorno = consultar(consulta, 4, 1);
            
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    
    public Vector Login(String nomusr, String passwd) {
        Vector retorno = new Vector();
        String consulta = new String();
        
        consulta = new String("Select usuario, nombres, idgrp, rol, estado_usuario, isnull((Select AVG(DATEDIFF (mi ,fecha_asignacion , fecha_finalizacion)) from serviosirirs.servicios.Asignacion Where estado_asignacion = 6 AND usuario = '" + limpiarStr(nomusr) + "' AND fecha_asignacion >= DATEADD(MM,-1,convert(date,getdate()))),'0') AS prmt, (Select AVG(Convert(decimal,calificacion)) from ServiOsirirs.servicios.Solicitud Where fecha_solicitud >= DATEADD(MM,-1,convert(date,getdate()))), (Select AVG(Convert(decimal,calificacion)) from ServiOsirirs.servicios.Solicitud S, ServiOsirirs.servicios.Asignacion A Where S.id_solicitud = A.id_solicitud AND fecha_solicitud >= DATEADD(MM,-1,convert(date,getdate())) AND A.usuario = '" + limpiarStr(nomusr) + "') from ServiOsirirs.servicios.Usuario Where usuario =  '" + limpiarStr(nomusr) + "'");

        try {
            conectarBD();
            retorno = consultar(consulta, 8, 0);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

 public Vector Tecnico() {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String("select usuario, nombres from ServiOsirirs.servicios.usuarios order by nombres");
        try {
            conectarBD();
            retorno = consultar(consulta, 2, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

 public String mail_usuario(String nombre) {
        String valor="";
        Vector retorno = new Vector();
        String consulta = new String();
            
             consulta = new String("Select usuario from ServiOsirirs.servicios.Usuario Where nombres = '"+nombre+"'");
            
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        valor = (String) retorno.elementAt(0);
        desconectarBD();
        return valor;
    }
  
  public Vector nsol(String doc) {
        Vector retorno = new Vector();
        String consulta = new String();
            
            // consulta = new String("select max(idev) from fuo.fuo.registrofuo where usuario = '" + doc + "'");
            //consulta = new String("Select max(servicios.Solicitud.id_solicitud) from servicios.Solicitud Where usuario_crea = 'juan.vanzina'");

        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

   public Vector consArea() {
        Vector retorno = new Vector();
        String consulta = new String();
         consulta = new String("select cod_cl1, NCcosto from servicios.LicenciasDecanos");
         //consulta = new String("Select distinct (Select nombre from Novasoft.dbo.gen_clasif1 Where codigo = EM.cod_cl1), EM.cod_cl1 from odi.empnomina EM Where est_lab IN ('Activo','Vacaciones', 'Retirado')");      
         
         try {
            conectarBD();
            retorno = consultar(consulta, 2, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
   
  public ArrayList consArea2() {
         ArrayList retorno = new ArrayList();
         String consulta = new String();
         consulta = new String("select codigo, nombre from Novasoft.dbo.gen_clasif1 cl1  where codigo IN('1212010000','1211010000','1210010000','1217010000','1220010000','1205010000','1207010000','1206010000','1209010000','1208010000','1213010000','1214010000','1215010000','1212021000','1205040500'," +
        "'1205050300','1210030000','1216020000','1205070500','1208020100','1208040100','1205060300','1205030300','1216030000','1207070000','1217015006','1205020000','1206020000','1209050000','1208070000','1216010000') order by nombre asc");
                 
         try {
            conectarBD();
            retorno = consultarSoft(consulta);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
  }
   
  
  public Vector usuario() {
        Vector retorno = new Vector();
        String consulta = new String();
         consulta = new String("select rtrim(cod_emp), rtrim(nom_cco), rtrim(ap1_emp)+' '+rtrim(ap2_emp)+' '+rtrim(nom_emp) from registro.directorioemplea order by ap1_emp");
        try {
            conectarBD();
            retorno = consultar(consulta, 3, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
  
          public Vector usuarioInactivo() {
        Vector retorno = new Vector();
        String consulta = new String();
         consulta = new String("Select cod_emp, nom_cl1, nombres from odi.empnomina EM Where est_lab IN ('Retirado') order by nombres");
        try {
            conectarBD();
            retorno = consultar(consulta, 3, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
  
    public Vector EquiposUsuario(String cc) {
        Vector retorno = new Vector();
        String consulta = new String();
         consulta = new String("Select Serial, PlacaInventario, Ubicación, Marca, Modelo, " +
                                "CASE TipoEqui WHEN 1 THEN 'All in One' " +
                                "              WHEN 2 THEN 'Portatil' " +
                                "              WHEN 3 THEN 'Desktop' " +
                                "              WHEN 4 THEN 'Pantalla' " +
                                "              WHEN 5 THEN 'Teléfono' " +
                                "              WHEN 6 THEN 'Escaner' " +
                                "              WHEN 7 THEN 'Video Beam' " +
                                "              WHEN 8 THEN 'Switch' " +
                                "              ELSE 'Desconocido' " +
                                "END, idSalon, Aprobado from serviosirirs.servicios.Equipo Where CCResponsable = "+cc);
      
        try {
            conectarBD();
            retorno = consultar(consulta, 8, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
  
  
    public Vector salon() {
        Vector retorno = new Vector();
        String consulta = new String();
         //consulta = new String("Select idsalon + ' - ' + Descripcion as idsalon, Descripcion, TipoSalon, CCResponsableSalon from serviosirirs.servicios.Salon");
         consulta = new String("Select idsalon, Descripcion, TipoSalon, CCResponsableSalon from serviosirirs.servicios.Salon");
        try {
            conectarBD();
            retorno = consultar(consulta, 4, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
  
    public Vector EquiposAprob() {
        Vector retorno = new Vector();
        String consulta = new String();
         consulta = new String("Select Serial, PlacaInventario, Marca, Modelo, FechaCompra, fechacrea, isnull((Select nombres from registro.odi.empnomina where cod_emp = rtrim(CCResponsable)),0), Estado, idSalon, rtrim(CCResponsable)  from serviosirirs.servicios.equipo Where Aprobado = '0' Order by CCResponsable");
        try {
            conectarBD();
            retorno = consultar(consulta, 10, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

  public Vector usuario_osiris() {
        Vector retorno = new Vector();
        String consulta = new String();
         consulta = new String("Select nombres, usuario from ServiOsirirs.servicios.Usuario u where u.estado_usuario In(1)  Order by u.nombres asc");
        try {
            conectarBD();
            retorno = consultar(consulta, 2, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
  
  
    public Vector info_solicitud(String IdSOL) {
        Vector retorno = new Vector();
        String consulta = new String();
         consulta = new String("Select usuario_solicitante, descripcion_solicitud, fecha_solicitud, bloque, extension_solicitantes from ServiOsirirs.servicios.Solicitud Where id_solicitud = "+IdSOL);
        try {
            conectarBD();
            retorno = consultar(consulta, 5, 0);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
  
    public Vector Solicitud(String nombre) {
        Vector retorno = new Vector();
        String consulta = new String();
         consulta = new String("    Select S.id_solicitud, S.usuario_solicitante, S.bloque, S.extension_solicitantes, S.descripcion_solicitud, U.nombres, A.fecha_asignacion " 
                                +"  From ServiOsirirs.servicios.Solicitud S, ServiOsirirs.servicios.Asignacion A, ServiOsirirs.servicios.Usuario U " 
                                +"  Where A.id_solicitud = S.id_solicitud AND A.usuario = U.usuario AND S.id_solicitud = (Select max(ServiOsirirs.servicios.Solicitud.id_solicitud) From ServiOsirirs.servicios.Solicitud)");
        try {
            conectarBD();
            retorno = consultar(consulta, 7, 0);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    

public Vector Detalle_sol(String id_sol) {
        Vector retorno = new Vector();
        String consulta = new String();
         consulta = new String("    Select S.id_solicitud, S.usuario_solicitante, S.bloque, S.extension_solicitantes, S.descripcion_solicitud, (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 1 AND valor_num = S.estado_solicitud), S.fecha_solicitud, S.observacion_admin, (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 3 AND valor_num = S.tipo_solicitud), S.fecha_solucion , S.cc_usuario_solicitante" 
                                +"  From ServiOsirirs.servicios.Solicitud S, ServiOsirirs.servicios.Asignacion A, ServiOsirirs.servicios.Usuario U " 
                                +"  Where A.id_solicitud = S.id_solicitud AND A.usuario = U.usuario AND S.id_solicitud = "+id_sol+"");
        try {
            conectarBD();
            retorno = consultar(consulta, 11, 0);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }


    public Vector Detalle_Asigna(String Id_sol) {
        Vector retorno = new Vector();
        String consulta = new String();
            consulta = new String("Select A.id_asignacion, A.fecha_asignacion, A.fecha_inicio_proceso, A.fecha_finalizacion, A.observacion_solucion, A.estado_asignacion, (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 4 AND valor_num = A.tipo_asignacion), U.nombres, (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 2 AND valor_num = A.estado_asignacion) from ServiOsirirs.servicios.Asignacion A, ServiOsirirs.servicios.Usuario U Where A.usuario = U.usuario AND A.id_solicitud = "+Id_sol);
        try {
            conectarBD();
            retorno = consultar(consulta, 9, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    
    
    public Vector Detalle_Equipo(String ideq) {
        Vector retorno = new Vector();
        String consulta = new String();
            consulta = new String("Select PlacaInventario, Estado, fechacompra, mesesgarantia, Serial, PuntoRed, HostDominio, MacAddress, Marca, Modelo, TipoEqui, Ubicación, Observaciones, " +
                                    " isnull(CCresponsable,0), idSalon, Aprobado, usucrea, CONVERT(varchar(11),mantenimiento,103), eqcincuenta, OrdenCompra, macAddress2  from ServiOsirirs.servicios.Equipo where Serial = '"+ideq+"'");
        try {
            conectarBD();
            retorno = consultar(consulta, 21, 0);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    
      public Vector Detalle_Equipo_orden(String OrdenComp) {
        Vector retorno = new Vector();
        String consulta = new String();
            consulta = new String("		Select PlacaInventario, Estado, fechacompra, mesesgarantia, Serial, PuntoRed, HostDominio, MacAddress, Marca, Modelo, \n" +
"												CASE TipoEqui WHEN 1 THEN 'All In One' \n" +
"												WHEN 2 THEN 'Portatil'\n" +
"                                                WHEN 3 THEN 'Desktop' \n" +
"                                                WHEN 4 THEN 'Pantalla' \n" +
"                                                WHEN 5 THEN 'Teléfono' \n" +
"                                                WHEN 6 THEN 'Escaner' \n" +
"                                                WHEN 7 THEN 'Video Beam' \n" +
"                                                WHEN 8 THEN 'Switch' \n" +
"                                                Else 'Desconocido' \n" +
"                                                END,  Ubicación, Observaciones,  CASE CCresponsable WHEN 1 THEN 'OSIRIS' \n" +
"                                                ELSE (Select nombres from odi.empnomina Where cod_emp = Convert(Varchar(50),CCResponsable)) END, idSalon, Aprobado, usucrea, CONVERT(varchar(11),mantenimiento,103), eqcincuenta, OrdenCompra, macAddress2  from ServiOsirirs.servicios.Equipo where OrdenCompra = '"+OrdenComp+"'");
        
           
            try {
            conectarBD();
            retorno = consultar(consulta, 21, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    
     public Vector ConsultaSerialxOC(String OC) {
        Vector retorno = new Vector();
        String consulta = new String();
            consulta = new String("Select top 1 Serial from ServiOsirirs.servicios.Equipo Where OrdenCompra = '"+OC+"'");
            
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
           
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    
    public String ConsultaSerial(String ideq) {
        Vector retorno = new Vector();
        String consulta = new String();
            consulta = new String("Select top 1 Serial from ServiOsirirs.servicios.Equipo Where placainventario = '"+ideq+"'");
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno.elementAt(0).toString();
    }

    
        public Vector ConsultaNumeroSerialesIgualPlaca(String ideq) {
        Vector retorno = new Vector();
        String consulta = new String();
            consulta = new String("Select Serial from ServiOsirirs.servicios.Equipo Where placainventario = '"+ideq+"'");
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector Horarios() {
        Vector retorno = new Vector();
        String consulta = new String();
            consulta = new String(" Select\n" +
                                    " Nombres, \n" +
                                    " bloque, \n" +
                                    " (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 5 AND valor_num = estado_usuario), \n" +
                                    " (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 6 AND valor_num = tipo_horario), \n" +
                                    " CAST(hora_ini_lv AS TIME(0)), \n" +
                                    " CAST(hora_fin_lv AS TIME(0)), \n" +
                                    " CAST(hora_ini_sab AS TIME(0)), \n" +
                                    " CAST(hora_fin_sab AS TIME(0)), \n" +
                                    " usuario, \n" +
                                    " isnull((Select AVG(DATEDIFF (mi ,fecha_asignacion , fecha_finalizacion)) from serviosirirs.servicios.Asignacion Where estado_asignacion = 6 AND usuario = U.usuario AND fecha_asignacion >= DATEADD(MM,-1,convert(date,getdate()))),'0') AS tma, \n" +
                                    " (Select COUNT(id_asignacion) from serviosirirs.servicios.Asignacion Where estado_asignacion = 6 AND usuario = U.usuario AND fecha_asignacion >= DATEADD(MM,-1,convert(date,getdate()))) AS Solu, \n" +
                                    " (Select COUNT(id_asignacion) from serviosirirs.servicios.Asignacion Where estado_asignacion = 3 AND usuario = U.usuario AND fecha_asignacion >= DATEADD(MM,-1,convert(date,getdate()))) AS Cancel,\n" +
                                    " (Select COUNT(id_asignacion) from serviosirirs.servicios.Asignacion Where estado_asignacion = 4 AND usuario = U.usuario AND fecha_asignacion >= DATEADD(MM,-1,convert(date,getdate()))) AS Suspen, \n" +
                                    " (Select COUNT(id_asignacion) from serviosirirs.servicios.Asignacion Where estado_asignacion = 7 AND usuario = U.usuario AND fecha_asignacion >= DATEADD(MM,-1,convert(date,getdate()))) AS FinReasig, \n" +
                                    " (Select COUNT(id_asignacion) from serviosirirs.servicios.Asignacion Where estado_asignacion = 5 AND usuario = U.usuario AND fecha_asignacion >= DATEADD(MM,-1,convert(date,getdate()))) AS PenReasig, \n" +
                                                        " (Select COUNT(id_asignacion) from serviosirirs.servicios.Asignacion Where estado_asignacion IN (1,2) AND usuario = U.usuario AND fecha_asignacion >= DATEADD(MM,-1,convert(date,getdate()))) AS PenProc, \n" +
                                    " (Select COUNT(id_asignacion) from serviosirirs.servicios.Asignacion Where usuario = U.usuario AND fecha_asignacion >= DATEADD(MM,-1,convert(date,getdate()))) AS Total, \n" +
                                    " Cast(isnull((Select AVG(Convert(decimal,calificacion)) from ServiOsirirs.servicios.Solicitud S, ServiOsirirs.servicios.Asignacion A Where S.id_solicitud = A.id_solicitud AND fecha_solicitud >= DATEADD(MM,-1,convert(date,getdate())) AND A.usuario = U.usuario),0) as decimal(3,2))"+                    
                                    " from ServiOsirirs.servicios.Usuario U, ServiOsirirs.servicios.Horario H Where U.id_horario = H.id_horario Order by tma desc, U.rol asc, total asc ");
        try {
            conectarBD();
            retorno = consultar(consulta, 18, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    

     public Vector ReporteSemanal(String fechaini, String fechafin) {
        Vector retorno = new Vector();
        String consulta = new String();
            consulta = new String(" Select " +
                                    "Nombres, " +
                                    "bloque, " +
                                    "(Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 6 AND valor_num = tipo_horario), " +
                                    "CAST(hora_ini_lv AS TIME(0)), " +
                                    "CAST(hora_fin_lv AS TIME(0)), " +
                                    "CAST(hora_ini_sab AS TIME(0)), " +
                                    "CAST(hora_fin_sab AS TIME(0)), " +
                                    "isnull((Select AVG(DATEDIFF (mi ,fecha_asignacion , fecha_finalizacion)) from serviosirirs.servicios.Asignacion Where estado_asignacion = 6 AND usuario = U.usuario AND fecha_asignacion BETWEEN '"+fechaini+"' AND '"+fechafin+"'),'0') AS tma, " +
                                    "isnull((Select AVG(DATEDIFF (mi ,fecha_asignacion , fecha_finalizacion)) from serviosirirs.servicios.Asignacion Where usuario = U.usuario AND fecha_asignacion BETWEEN '"+fechaini+"' AND '"+fechafin+"'),'0') AS tma2, " +
                                    "(Select COUNT(id_asignacion) from serviosirirs.servicios.Asignacion Where estado_asignacion = 6 AND usuario = U.usuario AND fecha_asignacion BETWEEN '"+fechaini+"' AND '"+fechafin+"') AS Solu, " +
                                    "(Select COUNT(id_asignacion) from serviosirirs.servicios.Asignacion Where estado_asignacion = 3 AND usuario = U.usuario AND fecha_asignacion BETWEEN '"+fechaini+"' AND '"+fechafin+"') AS Cancel, " +
                                    "(Select COUNT(id_asignacion) from serviosirirs.servicios.Asignacion Where estado_asignacion = 4 AND usuario = U.usuario AND fecha_asignacion BETWEEN '"+fechaini+"' AND '"+fechafin+"') AS Suspen, " +
                                    "(Select COUNT(id_asignacion) from serviosirirs.servicios.Asignacion Where estado_asignacion = 7 AND usuario = U.usuario AND fecha_asignacion BETWEEN '"+fechaini+"' AND '"+fechafin+"') AS FinReasig, " +
                                    "(Select COUNT(id_asignacion) from serviosirirs.servicios.Asignacion Where estado_asignacion = 5 AND usuario = U.usuario AND fecha_asignacion BETWEEN '"+fechaini+"' AND '"+fechafin+"') AS PenReasig, " +
                                    "(Select COUNT(id_asignacion) from serviosirirs.servicios.Asignacion Where estado_asignacion IN (1,2) AND usuario = U.usuario AND fecha_asignacion BETWEEN '"+fechaini+"' AND '"+fechafin+"') AS PenProc, " +
                                    "(Select COUNT(id_asignacion) from serviosirirs.servicios.Asignacion Where usuario = U.usuario AND fecha_asignacion BETWEEN '"+fechaini+"' AND '"+fechafin+"') AS Total " +
                                    "from ServiOsirirs.servicios.Usuario U, ServiOsirirs.servicios.Horario H Where U.id_horario = H.id_horario Order by tma desc, U.rol asc, total asc");
        try {
            conectarBD();
            retorno = consultar(consulta, 16, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    
 
  public Vector Tipos_Horario() {
        Vector retorno = new Vector();
        String consulta = new String();
            consulta = new String("Select id_horario, (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 6 AND valor_num = tipo_horario), CAST(hora_ini_lv AS time(0)), CAST(hora_fin_lv AS time(0)), CAST(hora_ini_sab AS time(0)), CAST(hora_fin_sab AS time(0)) from ServiOsirirs.servicios.Horario");
        try {
            conectarBD();
            retorno = consultar(consulta, 6, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
 
  public Vector Horario_Usuario(String usu_con) {
        Vector retorno = new Vector();
        String consulta = new String();
            consulta = new String("Select Nombres, bloque, (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 5 AND valor_num = estado_usuario), (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 6 AND valor_num = tipo_horario), CAST(hora_ini_lv AS TIME(0)), CAST(hora_fin_lv AS TIME(0)), CAST(hora_ini_sab AS TIME(0)), CAST(hora_fin_sab AS TIME(0)), usuario, H.id_horario, U.idgrp from ServiOsirirs.servicios.Usuario U, ServiOsirirs.servicios.Horario H Where U.id_horario = H.id_horario AND U.usuario = '"+usu_con+"'");
        try {
            conectarBD();
            retorno = consultar(consulta, 11, 0);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    
public Vector EstSolicitud(String rol, String est, String usu) {
        Vector retorno = new Vector();
        String consulta = new String();
        
        if(rol.equals("8")) {
        
        consulta = new String("Select top 50 S.id_solicitud, S.usuario_solicitante, S.estado_solicitud, S.fecha_solicitud, A.usuario, S.bloque, A.estado_asignacion, A.fecha_asignacion, A.id_asignacion " 
        +"From ServiOsirirs.servicios.Solicitud S, ServiOsirirs.servicios.Asignacion A, ServiOsirirs.servicios.Usuario U " 
        +"Where A.id_solicitud = S.id_solicitud AND A.usuario = U.usuario AND  S.estado_solicitud = "+est+"");
        
        }
        
        else{

        consulta = new String("Select top 50 S.id_solicitud, S.usuario_solicitante, S.estado_solicitud, S.fecha_solicitud, A.usuario, S.bloque, A.estado_asignacion, A.fecha_asignacion, A.id_asignacion " 
        +"From ServiOsirirs.servicios.Solicitud S, ServiOsirirs.servicios.Asignacion A, ServiOsirirs.servicios.Usuario U " 
        +"Where A.id_solicitud = S.id_solicitud AND A.usuario = U.usuario AND  S.estado_solicitud = "+est+" AND A.usuario = '"+usu+"'");

        }
        
        try {
            conectarBD();
            retorno = consultar(consulta, 9, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }


public Vector ConsultaEquiposInventario(String tipocon, String tipoeqm) {
        Vector retorno = new Vector();
        String consulta = new String();
    
        if(tipocon.equals("0")){
                                        consulta = new String("Select nombre from ServiOsirirs.servicios.MarcaModelo where tipoeqm = "+tipoeqm+" Order by nombre");                                        
        }
        else{
                                        consulta = new String("Select nombre from ServiOsirirs.servicios.MarcaModelo Where relacion = (Select idMM from serviOsirirs.servicios.MarcaModelo where nombre = '"+tipocon+"' AND tipoeqm = "+tipoeqm+") Order by nombre");
        }
    
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

//*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
//*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

public ArrayList<Licencia> ConsultaSoftwareDependencia(String tipodep) {
        
    ArrayList<Licencia> retorno = new ArrayList<Licencia>();
    String query = new String();
    
    query = new String("SELECT DISTINCT a.idSoftware, s.NombreSoft " +
    "FROM ServiOsirirs.servicios.AreaSoftware a " +
    "INNER JOIN Novasoft.dbo.gen_clasif1 gc1 ON gc1.codigo = a.CodArea " +
    "INNER JOIN ServiOsirirs.servicios.Software s ON s.idSoftware = a.idSoftware " +
    "WHERE s.TipoSoft IN(3) AND LTRIM(RTRIM(a.CodArea)) = '" + tipodep  + "' " +
    "ORDER BY s.NombreSoft");
    
        try {
            conectarBD();
            retorno = consultarSoft2(query);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
}

//*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
//*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

public Vector ConsultaCaracteristicas(String serial) {
        Vector retorno = new Vector();
        String consulta = new String();
    
              consulta = new String("Select idSoftware AS ID, (Select NombreSoft from serviosirirs.servicios.Software where ES.idSoftware = idSoftware) AS Linea, (Select VersionS from serviosirirs.servicios.Software where ES.idSoftware = idSoftware) AS Modelo, 'Software' AS Tipo from serviosirirs.servicios.EquipoSoftware ES Where Serial = '"+serial+"' UNION " +
                                    "Select idCaracteristica AS ID, (Select Linea from ServiOsirirs.servicios.Caracteristica Where EC.idCaracteristica = idCaracteristica) AS Linea, (Select Nombre from ServiOsirirs.servicios.Caracteristica Where EC.idCaracteristica = idCaracteristica) AS Modelo, 'Hardware' AS Tipo from ServiOsirirs.servicios.EquipoCaracteristica EC Where Serial = '"+serial+"' Order by Tipo, Linea");
   
        try {
            conectarBD();
            retorno = consultar(consulta, 4, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

public Vector ConsultaLogs(String serial) {
        Vector retorno = new Vector();
        String consulta = new String();
    
              consulta = new String("Select Top 10 idLogT, Tipo, Descripcion, FechaLog, UsuarioOSIRIS, isnull((Select nombres from registro.odi.empnomina where cod_emp = rtrim(CCResponsable)),0), Serial, id_solicitud from serviosirirs.servicios.LogTransaccional Where Serial = '"+serial+"'  Order by idLogT desc");
   
        try {
            conectarBD();
            retorno = consultar(consulta, 8, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }


public Vector ConsultaNovedades(String serial) {
        Vector retorno = new Vector();
        String consulta = new String();
    
              consulta = new String("Select idNovedad, Descripcion, Serial, Usuario, Fecha from ServiOsirirs.servicios.Novedades Where serial = '"+serial+"'");
   
        try {
            conectarBD();
            retorno = consultar(consulta, 5, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

public Vector ConsultaSoftwareHardware(String tipocon, String tipoeqm) {
        Vector retorno = new Vector();
        String consulta = new String();
    
        if(tipocon.equals("0")){
                                        consulta = new String("Select Concat(Linea, (' - ' COLLATE Modern_Spanish_CI_AS) ,Nombre) from ServiOsirirs.servicios.Caracteristica Where tipo =  "+tipoeqm);
        }
        else{
                                        consulta = new String("Select Concat(NombreSoft, (' - ' COLLATE Modern_Spanish_CI_AS) ,VersionS) from serviosirirs.servicios.Software Where TipoSoft =  "+tipoeqm);
        }

 
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

public Vector PendAdmin(String rol, String est, String usu) {
        Vector retorno = new Vector();
        String consulta = new String();
        
        if(est.equals("0")){
           est = "3,5,6";
        }
        
        if(est.equals("10")){
           est = "1,2";
        }
        
        consulta = new String(" Select S.id_solicitud, S.usuario_solicitante, (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 1 AND valor_num = S.estado_solicitud), S.fecha_solicitud, U.nombres, S.bloque, (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 2 AND valor_num = A.estado_asignacion), A.fecha_asignacion, A.fecha_inicio_proceso, A.fecha_finalizacion " +
                                "from ServiOsirirs.servicios.Solicitud S, ServiOsirirs.servicios.Asignacion A,  ServiOsirirs.servicios.Usuario U " +
                                "Where A.id_solicitud = S.id_solicitud AND estado_solicitud = 1  AND " +
                                "      A.usuario = U.usuario AND A.estado_asignacion IN ("+est+") " +
                                "Order by S.id_solicitud desc");
 
        try {
            conectarBD();
            retorno = consultar(consulta, 10, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

public Vector Solicitud_porUsuario(String rol, String est, String usu, String usu_con) {
        Vector retorno = new Vector();
        String consulta = new String();
        
        if(est.equals("0")){
           est = "1,2,3,4,5,6,7";
        }
        
        if(rol.equals("8")) {
        
            consulta = new String("Select top 50 S.id_solicitud, A.id_asignacion, (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 1 AND valor_num = S.estado_solicitud), (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 2 AND valor_num = A.estado_asignacion), S.fecha_solicitud, A.fecha_asignacion, A.fecha_inicio_proceso, A.fecha_finalizacion, S.bloque, S.usuario_solicitante, U.nombres  from ServiOsirirs.servicios.Asignacion A, ServiOsirirs.servicios.Solicitud S, ServiOsirirs.servicios.Usuario U Where A.id_solicitud = S.id_solicitud AND S.estado_solicitud =  1 AND U.usuario = A.usuario AND A.usuario = (Select usuario from ServiOsirirs.servicios.Usuario Where nombres = '"+usu_con+"') AND estado_asignacion IN ("+est+") Order by id_asignacion desc");
        
        }
        
        else{

             //consulta = new String("Select top 50 S.id_solicitud, A.id_asignacion, S.estado_solicitud, A.estado_asignacion, S.fecha_solicitud, A.fecha_asignacion, A.fecha_inicio_proceso, A.fecha_finalizacion, S.bloque, S.usuario_solicitante, U.nombres  from ServiOsirirs.servicios.Asignacion A, ServiOsirirs.servicios.Solicitud S, ServiOsirirs.servicios.Usuario U Where A.id_solicitud = S.id_solicitud AND U.usuario = A.usuario AND nombres = '"+usu+"') AND estado_asignacion IN (1,2,3,4,5,6) Order by id_asignacion desc");
               consulta = new String("Select top 50 S.id_solicitud, A.id_asignacion, (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 1 AND valor_num = S.estado_solicitud), (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 2 AND valor_num = A.estado_asignacion), S.fecha_solicitud, A.fecha_asignacion, A.fecha_inicio_proceso, A.fecha_finalizacion, S.bloque, S.usuario_solicitante, U.nombres  from ServiOsirirs.servicios.Asignacion A, ServiOsirirs.servicios.Solicitud S, ServiOsirirs.servicios.Usuario U Where A.id_solicitud = S.id_solicitud AND U.usuario = A.usuario AND S.estado_solicitud =  1 AND A.usuario = (Select usuario from ServiOsirirs.servicios.Usuario Where nombres = '"+usu+"') AND estado_asignacion IN ("+est+") Order by id_asignacion desc");
        }
        
        try {
            conectarBD();
            retorno = consultar(consulta, 11, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

public Vector ConsultaReporte(String fechaini, String fechafin, String usu_con, String est, String cliente) {
        Vector retorno = new Vector();
        String consulta = new String();
        String filtro = "";
        
        
        if(!cliente.equals("") || cliente!=""){
            filtro = " AND S.usuario_solicitante like '%"+cliente+"'";
        }
        
        
        if(est.equals("0")){
           est = "1,2,3,4,5,6";
        }
                
        if(!usu_con.equals("0") && !fechaini.equals("") && !fechafin.equals("")){
           consulta = new String ("Select S.id_solicitud, A.id_asignacion,(Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 1 AND valor_num = S.estado_solicitud), " +
                                    "       (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 2 AND valor_num = A.estado_asignacion), U.nombres, S.fecha_solicitud, " +
                                    "        A.fecha_asignacion, A.fecha_inicio_proceso, A.fecha_finalizacion, " +
                                    "        S.fecha_solucion, S.usuario_solicitante, S.depto_area, S.bloque, S.extension_solicitantes, S.descripcion_solicitud, S.usuario_crea, S.depto_area, DATEDIFF (mi ,S.fecha_solicitud , S.fecha_solucion), DATEDIFF (mi, A.fecha_asignacion , A.fecha_inicio_proceso), DATEDIFF (mi , A.fecha_inicio_proceso , A.fecha_finalizacion), (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 3 AND valor_num = S.tipo_solicitud)," +
                                    "        S.descripcion_solicitud, A.observacion_solucion, S.observacion_admin, S.calificacion "+
                                    " from ServiOsirirs.servicios.Solicitud S, ServiOsirirs.servicios.Asignacion A, ServiOsirirs.servicios.Usuario U " +
                                    " Where  S.id_solicitud = A.id_solicitud AND A.usuario = U.usuario AND U.nombres = '"+usu_con+"' AND fecha_solicitud >= CONVERT(date,'"+fechaini+"') " +
                                    "        AND Cast(fecha_solicitud As date) <= CONVERT(date,'"+fechafin+"') AND S.estado_solicitud IN ("+est+") "+filtro+" Order by S.id_solicitud");
        }
        
        if(usu_con.equals("0") && fechaini.equals("") && fechafin.equals("")){
           consulta = new String ("Select S.id_solicitud, A.id_asignacion,(Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 1 AND valor_num = S.estado_solicitud), " +
                                    "       (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 2 AND valor_num = A.estado_asignacion), U.nombres, S.fecha_solicitud, " +
                                    "        A.fecha_asignacion, A.fecha_inicio_proceso, A.fecha_finalizacion, " +
                                    "        S.fecha_solucion, S.usuario_solicitante, S.depto_area, S.bloque, S.extension_solicitantes, S.descripcion_solicitud, S.usuario_crea, S.depto_area, DATEDIFF (mi ,S.fecha_solicitud , S.fecha_solucion), DATEDIFF (mi , A.fecha_asignacion , A.fecha_inicio_proceso), DATEDIFF (mi , A.fecha_inicio_proceso , A.fecha_finalizacion), (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 3 AND valor_num = S.tipo_solicitud)," +
                                    "        S.descripcion_solicitud, A.observacion_solucion, S.observacion_admin, S.calificacion "+
                                    " from ServiOsirirs.servicios.Solicitud S, ServiOsirirs.servicios.Asignacion A, ServiOsirirs.servicios.Usuario U " +
                                    " Where  S.id_solicitud = A.id_solicitud AND A.usuario = U.usuario " +
                                    "        AND S.estado_solicitud IN ("+est+") "+filtro+" Order by S.id_solicitud");
        }
        
        if(!usu_con.equals("0") && (fechaini.equals("") && fechafin.equals(""))){
           consulta = new String ("Select S.id_solicitud, A.id_asignacion,(Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 1 AND valor_num = S.estado_solicitud), " +
                                    "       (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 2 AND valor_num = A.estado_asignacion), U.nombres, S.fecha_solicitud, " +
                                    "        A.fecha_asignacion, A.fecha_inicio_proceso, A.fecha_finalizacion, " +
                                    "        S.fecha_solucion, S.usuario_solicitante, S.depto_area, S.bloque, S.extension_solicitantes, S.descripcion_solicitud, S.usuario_crea, S.depto_area, DATEDIFF (mi ,S.fecha_solicitud , S.fecha_solucion), DATEDIFF (mi , A.fecha_asignacion , A.fecha_inicio_proceso), DATEDIFF (mi , A.fecha_inicio_proceso , A.fecha_finalizacion), (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 3 AND valor_num = S.tipo_solicitud)," +
                                    "        S.descripcion_solicitud, A.observacion_solucion, S.observacion_admin, S.calificacion "+
                                    " from ServiOsirirs.servicios.Solicitud S, ServiOsirirs.servicios.Asignacion A, ServiOsirirs.servicios.Usuario U " +
                                    " Where  S.id_solicitud = A.id_solicitud AND A.usuario = U.usuario AND U.nombres = '"+usu_con+"' " +
                                    "        AND S.estado_solicitud IN ("+est+") "+filtro+" Order by S.id_solicitud");
        }
        
        
        if(usu_con.equals("0") && (!fechaini.equals("") && !fechafin.equals(""))){
           consulta = new String ("Select S.id_solicitud, A.id_asignacion,(Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 1 AND valor_num = S.estado_solicitud), " +
                                    "       (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 2 AND valor_num = A.estado_asignacion), U.nombres, S.fecha_solicitud, " +
                                    "        A.fecha_asignacion, A.fecha_inicio_proceso, A.fecha_finalizacion, " +
                                    "        S.fecha_solucion, S.usuario_solicitante, S.depto_area, S.bloque, S.extension_solicitantes, S.descripcion_solicitud, S.usuario_crea, S.depto_area, DATEDIFF (mi ,S.fecha_solicitud , S.fecha_solucion), DATEDIFF (mi , A.fecha_asignacion , A.fecha_inicio_proceso), DATEDIFF (mi , A.fecha_inicio_proceso , A.fecha_finalizacion), (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 3 AND valor_num = S.tipo_solicitud)," +
                                    "        S.descripcion_solicitud, A.observacion_solucion, S.observacion_admin, S.calificacion "+
                                    " from ServiOsirirs.servicios.Solicitud S, ServiOsirirs.servicios.Asignacion A, ServiOsirirs.servicios.Usuario U " +
                                    " Where  S.id_solicitud = A.id_solicitud AND A.usuario = U.usuario AND fecha_solicitud >= CONVERT(date,'"+fechaini+"') " +
                                    "        AND Cast(fecha_solicitud As date) <= CONVERT(date,'"+fechafin+"') AND S.estado_solicitud IN ("+est+") "+filtro+" Order by S.id_solicitud");
        }
        
        
        try {
            conectarBD();
            retorno = consultar(consulta, 25, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

public Vector ConsultaReporte2(String salon, String tipoeq, String marca, String modelo)
{       
        //Define variable de tipo Vector
        Vector retorno = new Vector();
        //Define variable de tipo string
        String consulta = new String();        
        String filtro = "";
        
        //Variable que determina si el query requiere incluir elementos de "BAJA".
        boolean retval = salon.contains("BAJA");                
                
        //Se indica unicamente el Salón/Bodega/Àrea
        if(!salon.equals("0"))   {filtro = filtro + "idSalon = '"+salon+"'";}                
        //Se indica tanto el Salón/Bodega/Área como el Tipo de Equipo
        if(!salon.equals("0") && !tipoeq.equals("0"))  {filtro = filtro + " AND TipoEqui = "+tipoeq+"";}
        //No se indica el salon pero si el Tipo de Equipo
        if(salon.equals("0") && !tipoeq.equals("0"))  {filtro = filtro + " TipoEqui = "+tipoeq+"";}
        //Para ingresar a éste If tuvo que haberse indicado un Tipo de Equipo y también una marca
        if(!marca.equals("0"))   {filtro = filtro + " AND marca = '"+marca+"'";}
        //Para ingresar a éste If tuvo que haberse indicado un Tipo de Equipo, Marca y Modelo
        if(!modelo.equals("0"))  {filtro = filtro + " AND modelo = '"+modelo+"'";}
        
        
        //Si la variable "filtro" Posee! un valor distinto de "" entonces ingresa al if.
        if(!filtro.equals(""))
        {      
                //Si el usuario selecciono algún valor de filtro
                if(retval)
                {
                    //TRUE: El usuario desea filtrar por algún valor de "Salón/Bodega/Área" que hace relación a algún elemento de "BAJA".
                    consulta = new String ("SELECT Serial, " +
                                       "PlacaInventario, " +
                                       "CASE Estado WHEN 1 THEN 'Activo' ELSE 'INACTIVO' END, " +
                                       "FechaCompra, " +
                                       "MesesGarantia, " +
                                       "PuntoRed, " +
                                       "HostDominio, " +
                                       "MacAddress, " +
                                       "Marca, " +
                                       "Modelo, " +
                                       "CASE TipoEqui WHEN 1 THEN 'All In One' " +
                                       "              WHEN 2 THEN 'Portatil'" +
                                       "              WHEN 3 THEN 'Desktop' " +
                                       "              WHEN 4 THEN 'Pantalla' " +
                                       "              WHEN 5 THEN 'Teléfono' " +
                                       "              WHEN 6 THEN 'Escaner' " +
                                       "              WHEN 7 THEN 'Video Beam' " +
                                       "              WHEN 8 THEN 'Switch' " +
                                       "              Else 'Desconocido' " +
                                       "              END, \n" +
                                       "Ubicación, Observaciones, \n" +
                                       "CASE CCresponsable WHEN 1 THEN 'OSIRIS' " +
                                       "                   ELSE " +
                                       "                   (Select nombres from odi.empnomina Where cod_emp = Convert(Varchar(50),CCResponsable))\n" +
                                       "END," +
                                       "Eq.idSalon, \n" +
                                       "Aprobado, usucrea, \n" +
                                       "fechacrea, (Select EM.nombres from odi.empnomina EM WHERE cod_emp = CAST(Sa.CCResponsableSalon as varchar )) " +
                                       "FROM ServiOsirirs.servicios.Equipo Eq, ServiOsirirs.servicios.Salon Sa Where Eq."+filtro+" AND Eq.idSalon = Sa.idSalon");

                }
                else
                {
                    //FALSE: La consulta se realiza omitiendo los elementos de "BAJA".
                    consulta = new String ("SELECT Serial, " +
                                       "PlacaInventario, " +
                                       "CASE Estado WHEN 1 THEN 'Activo' ELSE 'INACTIVO' END, " +
                                       "FechaCompra, " +
                                       "MesesGarantia, " +
                                       "PuntoRed, " +
                                       "HostDominio, " +
                                       "MacAddress, " +
                                       "Marca, " +
                                       "Modelo, " +
                                       "CASE TipoEqui WHEN 1 THEN 'All In One' " +
                                       "              WHEN 2 THEN 'Portatil'" +
                                       "              WHEN 3 THEN 'Desktop' " +
                                       "              WHEN 4 THEN 'Pantalla' " +
                                       "              WHEN 5 THEN 'Teléfono' " +
                                       "              WHEN 6 THEN 'Escaner' " +
                                       "              WHEN 7 THEN 'Video Beam' " +
                                       "              WHEN 8 THEN 'Switch' " +
                                       "              Else 'Desconocido' " +
                                       "              END, \n" +
                                       "Ubicación, Observaciones, \n" +
                                       "CASE CCresponsable WHEN 1 THEN 'OSIRIS' " +
                                       "                   ELSE " +
                                       "                   (Select nombres from odi.empnomina Where cod_emp = Convert(Varchar(50),CCResponsable))\n" +
                                       "END," +
                                       "Eq.idSalon, \n" +
                                       "Aprobado, usucrea, \n" +
                                       "fechacrea, (Select EM.nombres from odi.empnomina EM WHERE cod_emp = CAST(Sa.CCResponsableSalon as varchar )) " +
                                       "FROM ServiOsirirs.servicios.Equipo Eq, ServiOsirirs.servicios.Salon Sa Where Eq."+filtro+" " +
                                       "AND Eq.idSalon not like '%BAJA%' AND Eq.idSalon = Sa.idSalon");

                }
           }
        /*------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          ------------------------- Si! ingresa al ELSE implica que No se definio ningún valor de filtro!!!
          ------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
           else
           {
                consulta = new String ("SELECT Serial, " +
                                       "PlacaInventario, " +
                                       "CASE Estado WHEN 1 THEN 'Activo' ELSE 'INACTIVO' END, " +
                                       "FechaCompra, " +
                                       "MesesGarantia, " +
                                       "PuntoRed, " +
                                       "HostDominio, " +
                                       "MacAddress, " +
                                       "Marca, " +
                                       "Modelo, " +
                                       "CASE TipoEqui WHEN 1 THEN 'All In One' " +
                                       "              WHEN 2 THEN 'Portatil' " +
                                       "              WHEN 3 THEN 'Desktop' " +
                                       "              WHEN 4 THEN 'Pantalla' " +
                                       "              WHEN 5 THEN 'Teléfono' " +
                                       "              WHEN 6 THEN 'Escaner' " +
                                       "              WHEN 7 THEN 'Video Beam' " +
                                       "              WHEN 8 THEN 'Switch' " +
                                       "              Else 'Desconocido' " +
                                       "              END, " +
                                       "Ubicación, Observaciones,  " +
                                       "CASE CCresponsable WHEN 1 THEN 'OSIRIS' " +
                                       "                   ELSE " +
                                       "                   (Select nombres from odi.empnomina Where cod_emp = Convert(Varchar(50),CCResponsable))\n" +
                                       "END," +
                                       "Eq.idSalon, " +
                                       "Aprobado, usucrea, " +
                                       "fechacrea, (Select EM.nombres  from odi.empnomina EM WHERE cod_emp = CAST(Sa.CCResponsableSalon as varchar ))" +
                                       "FROM ServiOsirirs.servicios.Equipo Eq, ServiOsirirs.servicios.Salon Sa WHERE Eq.idSalon not like '%BAJA%' AND Eq.idSalon = Sa.idSalon");
           }
        /*------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          ------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
        try
        {
            conectarBD();
            retorno = consultar(consulta, 19, 1);
        }
        catch (Exception ex)
        {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
}

public Vector Solicitud_porAsignacion(String rol, String est, String usu, String id_asig) {
        Vector retorno = new Vector();
        String consulta = new String();
        
        if(est.equals("0")){
           est = "1,2,3,4,5,6";
        }
        
        if(rol.equals("8")) {
        
            if(id_asig.equals("0")){
                    consulta = new String("Select Top 50 A.id_asignacion, A.fecha_inicio_proceso, A.fecha_asignacion, A.fecha_finalizacion, A.observacion_solucion, (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 2 AND valor_num = A.estado_asignacion), (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 4 AND valor_num = A.tipo_asignacion), U.nombres, A.id_solicitud from ServiOsirirs.servicios.Asignacion A, ServiOsirirs.servicios.Usuario U Where A.usuario = U.usuario AND A.estado_asignacion IN ("+est+") Order by id_asignacion desc");
            }else{
                    consulta = new String("Select Top 50 A.id_asignacion, A.fecha_inicio_proceso, A.fecha_asignacion, A.fecha_finalizacion, A.observacion_solucion, (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 2 AND valor_num = A.estado_asignacion), (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 4 AND valor_num = A.tipo_asignacion), U.nombres, A.id_solicitud from ServiOsirirs.servicios.Asignacion A, ServiOsirirs.servicios.Usuario U Where A.usuario = U.usuario AND A.estado_asignacion IN ("+est+") AND A.id_asignacion IN ("+id_asig+")");
            }
        }
        
        else{

            if(id_asig.equals("0")){
                consulta = new String("Select Top 50 A.id_asignacion, A.fecha_inicio_proceso, A.fecha_asignacion, A.fecha_finalizacion, A.observacion_solucion, (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 2 AND valor_num = A.estado_asignacion), (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 4 AND valor_num = A.tipo_asignacion), U.nombres, A.id_solicitud from ServiOsirirs.servicios.Asignacion A, ServiOsirirs.servicios.Usuario U Where A.usuario = U.usuario AND A.estado_asignacion IN ("+est+") AND A.usuario='"+usu+"' Order by id_asignacion desc");   
                //consulta = new String("Select Top 50 * from ServiOsirirs.servicios.Asignacion where estado_asignacion IN ("+est+" AND  usuario = (Select usuario from ServiOsirirs.servicios.Usuario Where nombres = '"+usu+"') Order by id_asignacion desc");
            }else{
                //consulta = new String("Select Top 50 * from ServiOsirirs.servicios.Asignacion where estado_asignacion IN ("+est+") AND id_asignacion IN ("+id_asig+") AND usuario = (Select usuario from ServiOsirirs.servicios.Usuario Where nombres = '"+usu+"')");
                consulta = new String("Select Top 50 A.id_asignacion, A.fecha_inicio_proceso, A.fecha_asignacion, A.fecha_finalizacion, A.observacion_solucion, (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 2 AND valor_num = A.estado_asignacion), (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 4 AND valor_num = A.tipo_asignacion), U.nombres, A.id_solicitud from ServiOsirirs.servicios.Asignacion A, ServiOsirirs.servicios.Usuario U Where A.usuario = U.usuario AND A.estado_asignacion IN ("+est+") AND A.usuario='"+usu+"' AND A.id_asignacion IN ("+id_asig+")");
            }

        }
        
        try {
            conectarBD();
            retorno = consultar(consulta, 9, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }


public Vector Solicitud_porSolic(String rol, String est, String usu, String id_sol) {
        Vector retorno = new Vector();
        String consulta = new String();
        
        if(est.equals("0")){
           est = "1,2,3,4";
        }
        
        if(rol.equals("8")) {
        
            if(id_sol.equals("0")){
                    consulta = new String("Select top 50 S.id_solicitud, S.usuario_solicitante, S.descripcion_solicitud, S.fecha_solicitud, S.fecha_solucion, (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 1 AND valor_num = S.estado_solicitud), S.bloque, S.depto_area, (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 3 AND valor_num = S.tipo_solicitud), S.extension_solicitantes, S.usuario_crea from ServiOsirirs.servicios.Solicitud S Where estado_solicitud IN ("+est+") Order by id_solicitud desc");
            }else{
                    consulta = new String("Select top 50 S.id_solicitud, S.usuario_solicitante, S.descripcion_solicitud, S.fecha_solicitud, S.fecha_solucion, (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 1 AND valor_num = S.estado_solicitud), S.bloque, S.depto_area, (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 3 AND valor_num = S.tipo_solicitud), S.extension_solicitantes, S.usuario_crea from ServiOsirirs.servicios.Solicitud S Where estado_solicitud IN ("+est+") AND id_solicitud IN ("+id_sol+")");
            }
        }
        
        else{

 /*           if(id_asig.equals("0")){
                    consulta = new String("Select top 50 * from ServiOsirirs.servicios.Solicitud Where estado_solicitud IN ("+est+" AND  usuario = (Select usuario from ServiOsirirs.servicios.Usuario Where nombres = '"+usu+"') Order by id_solicitud desc");
            }else{
                    consulta = new String("Select top 50 * from ServiOsirirs.servicios.Solicitud Where estado_solicitud IN ("+est+") AND id_solicitud = ("+id_asig+") AND usuario = (Select usuario from ServiOsirirs.servicios.Usuario Where nombres = '"+usu+"')");
            }*/

            if(id_sol.equals("0")){
                    consulta = new String("Select top 50 S.id_solicitud, S.usuario_solicitante, S.descripcion_solicitud, S.fecha_solicitud, S.fecha_solucion, (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 1 AND valor_num = S.estado_solicitud), S.bloque, S.depto_area, (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 3 AND valor_num = S.tipo_solicitud), S.extension_solicitantes, S.usuario_crea " 
                                          +"from ServiOsirirs.servicios.Solicitud S , ServiOsirirs.servicios.Asignacion A "
                                          +"Where S.id_solicitud = A.id_solicitud AND A.usuario = (Select usuario from ServiOsirirs.servicios.Usuario Where nombres = 'Juan David Vanzina') AND estado_solicitud IN ("+est+") Order by S.id_solicitud desc");
            }else{
                    consulta = new String("Select top 50 S.id_solicitud, S.usuario_solicitante, S.descripcion_solicitud, S.fecha_solicitud, S.fecha_solucion, (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 1 AND valor_num = S.estado_solicitud), S.bloque, S.depto_area, (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 3 AND valor_num = S.tipo_solicitud), S.extension_solicitantes, S.usuario_crea " 
                                          +"from ServiOsirirs.servicios.Solicitud S , ServiOsirirs.servicios.Asignacion A "
                                          +"Where S.id_solicitud = A.id_solicitud AND A.usuario = (Select usuario from ServiOsirirs.servicios.Usuario Where nombres = 'Juan David Vanzina') AND S.id_solicitud IN ("+id_sol+") AND estado_solicitud IN ("+est+") Order by S.id_solicitud desc");
            }
            
        }
        
        try {
            conectarBD();
            retorno = consultar(consulta, 11, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

public Vector EstSolicitud_Cons(String rol, String est, String usu) {
        Vector retorno = new Vector();
        String consulta = new String();
        
        if(rol.equals("8")) {
        
        consulta = new String("Select S.id_solicitud, S.usuario_solicitante, (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 1 AND valor_num = S.estado_solicitud), S.fecha_solicitud,  U.nombres, S.bloque, (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 2 AND valor_num = A.estado_asignacion), A.fecha_asignacion, A.id_asignacion, (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 4 AND valor_num = A.tipo_asignacion) " 
        +"From ServiOsirirs.servicios.Solicitud S, ServiOsirirs.servicios.Asignacion A, ServiOsirirs.servicios.Usuario U " 
        +"Where A.id_solicitud = S.id_solicitud AND A.estado_asignacion = 1 AND A.usuario = U.usuario AND  S.estado_solicitud = 1");
        
        }
        
        else{

    //    consulta = new String("Select S.id_solicitud, S.usuario_solicitante, S.estado_solicitud, S.fecha_solicitud, A.usuario, S.bloque, A.estado_asignacion, A.fecha_asignacion, A.id_asignacion " 
    //    +"From ServiOsirirs.servicios.Solicitud S, ServiOsirirs.servicios.Asignacion A, ServiOsirirs.servicios.Usuario U " 
    //    +"Where A.id_solicitud = S.id_solicitud AND A.estado_asignacion = 1 AND A.usuario = U.usuario AND  S.estado_solicitud = 1 AND A.usuario = '"+usu+"'");
      
        consulta = new String("Select S.id_solicitud, S.usuario_solicitante, (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 1 AND valor_num = S.estado_solicitud), S.fecha_solicitud,  U.nombres, S.bloque, (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 2 AND valor_num = A.estado_asignacion), A.fecha_asignacion, A.id_asignacion, (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 4 AND valor_num = A.tipo_asignacion) " 
        +"From ServiOsirirs.servicios.Solicitud S, ServiOsirirs.servicios.Asignacion A, ServiOsirirs.servicios.Usuario U " 
        +"Where A.id_solicitud = S.id_solicitud AND A.estado_asignacion = 1 AND A.usuario = U.usuario AND  S.estado_solicitud = 1 AND A.usuario = '"+usu+"'");
            
        }
        
        try {
            conectarBD();
            retorno = consultar(consulta, 10, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

public Vector EstSolicitud_Tram(String rol, String usu) {
        Vector retorno = new Vector();
        String consulta = new String();
        
        if(rol.equals("8")) {
        
        consulta = new String("Select S.id_solicitud, S.usuario_solicitante, (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 1 AND valor_num = S.estado_solicitud), S.fecha_solicitud, U.nombres, S.bloque, (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 2 AND valor_num = A.estado_asignacion), A.fecha_asignacion, A.id_asignacion " 
        +"From ServiOsirirs.servicios.Solicitud S, ServiOsirirs.servicios.Asignacion A, ServiOsirirs.servicios.Usuario U " 
        +"Where A.id_solicitud = S.id_solicitud AND A.estado_asignacion IN (2,4) AND A.usuario = U.usuario AND  S.estado_solicitud = 1 ");
        
        }
        
        else{

        consulta = new String("Select S.id_solicitud, S.usuario_solicitante, (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 1 AND valor_num = S.estado_solicitud), S.fecha_solicitud, A.usuario, S.bloque, (Select valor_cadena from ServiOsirirs.servicios.Parametros Where id_grupo = 2 AND valor_num = A.estado_asignacion), A.fecha_asignacion, A.id_asignacion " 
        +"From ServiOsirirs.servicios.Solicitud S, ServiOsirirs.servicios.Asignacion A, ServiOsirirs.servicios.Usuario U " 
        +"Where A.id_solicitud = S.id_solicitud AND A.estado_asignacion IN (2,4) AND A.usuario = U.usuario AND  S.estado_solicitud = 1 AND A.usuario = '"+usu+"'");
        
        }
        
        try {
            conectarBD();
            retorno = consultar(consulta, 9, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }



public int ActulizaRespSalon (String CeduUsu, String id_salon){

        int retorno = 0 ;
        String consulta = new String();
        
        consulta = new String("UPDATE [ServiOsirirs].[servicios].[Salon] SET [CCResponsableSalon]= "+CeduUsu+" WHERE [idSalon] = '"+id_salon+"'");
       
        BaseDatos m = new BaseDatos();
        try {
            conectarBD();
            retorno = actualizar(consulta);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno; 
}
        
        public int ActualizarArea( String CodAreActual, String CodAreaNew) {
        int retorno = 0;
        String consulta3 = new String();
        
       consulta3 = new String("UPDATE [ServiOsirirs].[servicios].[AreaSoftware] " +
                                "   SET [CodArea] = '"+CodAreaNew+"' "+
                                " WHERE [idAreaSoft] = '"+CodAreActual+"'");
       
       
          
        BaseDatos m = new BaseDatos();
        
      
        try {
            conectarBD();
            retorno = actualizar(consulta3);
           
            
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
           
            
        desconectarBD();
        return retorno;
    }

public int ActualizarLicSoft(String NomSoftware,String fechaVenci,String FechaComp,String version, String idLic, String numLic, String VigLic, String valorSoft, String TipoLic, String DescripLic, String CondUsoLic) {
        int retorno = 0;
        String consulta = new String();
        String consulta2 = new String();
        String consulta3 = new String();
        
       consulta = new String("UPDATE [ServiOsirirs].[servicios].[Software] " +
                                "   SET [NombreSoft] = '" +NomSoftware+ "' "+
                                "      ,[VersionS] = '"+version+"' "+
                                "      ,[FechaCompra] = '"+FechaComp+"' "+
                                "      ,[Estado] = '1' "+
                                "      ,[TipoSoft] = '3' "+
                                "      ,[fecha_vencimiento] = '"+fechaVenci+"' "+
                                "      ,[num_licencias] = '"+numLic+"' "+
                                " WHERE [idSoftware] = '"+idLic+"'");
       
       consulta2 = new String("UPDATE [ServiOsirirs].[servicios].[LicenciaSoft] " +
                                "   SET [fecha_renovacion] = null "+
                                "      ,[costo] = '"+valorSoft+"' "+
                                "      ,[tipo_licencia] = '"+TipoLic+"' "+
                                "      ,[tipo] = 'COMPRA' "+
                                "      ,[descripcion] = '"+DescripLic+"' "+
                                "      ,[vigencia] = '"+VigLic+"' "+
                                "      ,[idSoftware] = '"+idLic+"' "+
                                "      ,[estado] = '1' "+
                                "      ,[condicion_uso] = '"+CondUsoLic+"' "+
                                " WHERE [idSoftware] = '"+idLic+"' AND [tipo] = 'COMPRA'");
       
   
          
        BaseDatos m = new BaseDatos();
        
      
        try {
            conectarBD();
            retorno = actualizar(consulta);
            retorno = actualizar(consulta2);
           
            
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
           
            
        desconectarBD();
        return retorno;
    }

public int IniciarProceso (String id_asig){

        int retorno = 0 ;
        String consulta = new String();
        
        consulta = new String("Update ServiOsirirs.servicios.Asignacion SET estado_asignacion = 2, fecha_inicio_proceso = GETDATE() Where id_asignacion = "+id_asig);
        try {
            conectarBD();
            retorno = actualizar(consulta);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
 
}



public int actualiza_token (String token){

        int retorno = 0 ;
        String consulta = new String();
        
        consulta = new String("UPDATE [registro].[registro].[Icfes]  SET [token] = '"+token+"'");
        try {
            conectarBD();
            retorno = actualizar(consulta);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
 
}

public int CambiarTipoSolicitud (String NroSol){

        int retorno = 0 ;
        String consulta = new String();
        
        consulta = new String("Update ServiOsirirs.servicios.Solicitud set tipo_solicitud = 2 Where id_solicitud = "+NroSol);
        try {
            conectarBD();
            retorno = actualizar(consulta);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
 
}

public int Actualizar_Usuario (String usuario, String bloque, String estado, String id_horario, String AsignaAuto){

        int retorno = 0 ;
        String consulta = new String();
        
        consulta = new String("Update ServiOsirirs.servicios.Usuario Set bloque = '"+bloque+"', estado_usuario = "+estado+", id_horario = "+id_horario+", idgrp = '"+AsignaAuto+"'  Where usuario = '"+usuario+"'");
        try {
            conectarBD();
            retorno = actualizar(consulta);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
 
}



public int Actualizar_RespEquipo (String serial, String observacion, String ccresp, String usuosiris, String salon){

        int retorno = 0 ;
        String consulta = new String();
        
        consulta = new String("Update Serviosirirs.servicios.Equipo " +
                                " set CCResponsable = "+ccresp+", aprobado = '0', idSalon = '"+ salon +"'"+
                                " Where Serial = '"+serial+"'");
        try {
            conectarBD();
            retorno = actualizar(consulta);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
 
}


public int ActualizaS(String id_asig, String estado, String Soluc){

        int retorno = 0 ;
        String consulta = new String();
        
        consulta = new String("Update ServiOsirirs.servicios.Asignacion SET fecha_finalizacion = GETDATE(), observacion_solucion = '"+Soluc+"', estado_asignacion = "+estado+" Where id_asignacion = (Select max(id_asignacion) from ServiOsirirs.servicios.Asignacion Where id_solicitud ="+id_asig+")");
        try {
            conectarBD();
            retorno = actualizar(consulta);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
 
}

public Vector ConsultaSolicitud(String usu, String est) {
        Vector retorno = new Vector();
        String consulta = new String();
        
        if(usu.equals("8")) {
        
        consulta = new String("Select S.id_solicitud, S.usuario_solicitante, S.estado_solicitud, S.fecha_solicitud, A.usuario, S.bloque, A.estado_asignacion, A.fecha_asignacion " 
        +"From ServiOsirirs.servicios.Solicitud S, ServiOsirirs.servicios.Asignacion A, ServiOsirirs.servicios.Usuario U " 
        +"Where A.id_solicitud = S.id_solicitud AND A.estado_asignacion IN (3) AND A.usuario = U.usuario AND  S.estado_solicitud = "+est+"");
        
        }
        
        else{

        consulta = new String("Select S.id_solicitud, S.usuario_solicitante, S.estado_solicitud, S.fecha_solicitud, A.usuario, S.bloque, A.estado_asignacion, A.fecha_asignacion " 
        +"From ServiOsirirs.servicios.Solicitud S, ServiOsirirs.servicios.Asignacion A, ServiOsirirs.servicios.Usuario U " 
        +"Where A.id_solicitud = S.id_solicitud AND A.estado_asignacion IN (3) AND A.usuario = U.usuario AND  S.estado_solicitud = "+est+" AND A.usuario = '"+usu+"'");
        }
        
        try {
            conectarBD();
            retorno = consultar(consulta, 8, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }


//============= Actualizar Datos =================================================================================
public int setsec(String a, String nom) {
        int retorno = 0 ;
        String consulta = new String();
        consulta = new String("update registro.secuencias set sig_sec = '" + a + "' where nombre = '" + nom + "'");
        try {
            conectarBD();
            retorno = actualizar(consulta);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }


//============ ELIMINAR DATOS ==========================================

public int EliminaSoft(String idLic, String idLicRe) {
        int retorno = 0 ;
        String consulta = new String();
        String consulta1 = new String();
        String consulta2 = new String();
        
        consulta2 = new String("Delete from [ServiOsirirs].[servicios].[EquipoSoftware] where [idSoftware] = '"+idLic+"'");
        consulta = new String("Delete from [ServiOsirirs].[servicios].[LicenciaSoft] where [idSoftware] = '"+idLic+"'");
        consulta1 = new String("Delete from [ServiOsirirs].[servicios].[Software] where [idSoftware] = '"+idLic+"'");
        
      
        
        try {
            conectarBD();
            retorno = actualizar(consulta2);
            retorno = actualizar(consulta);
            retorno = actualizar(consulta1);
            
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

public int EliminaLicSoftware(String idLic, String idLicRe) {
        int retorno = 0 ;
        String consulta = new String();
        consulta = new String("Delete from [ServiOsirirs].[servicios].[LicenciaSoft] where [IdLicencia] = "+idLicRe+" AND [idSoftware] = "+idLic+" AND [tipo] = 'RENOVA'");
       
        try {
            conectarBD();
            retorno = actualizar(consulta);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

public int ElimEntrev(int id) {
        int retorno = 0 ;
        String consulta = new String();
        consulta = new String("delete from registro.dispentrev where idde = " + id + " ");
        try {
            conectarBD();
            retorno = actualizar(consulta);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }


public int EliminaCaracter(String serial, String idcar) {
        int retorno = 0 ;
        String consulta = new String();
        consulta = new String("Delete from serviosirirs.servicios.EquipoCaracteristica where Serial = '"+serial+"' AND idCaracteristica = "+idcar);
        try {
            conectarBD();
            retorno = actualizar(consulta);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }


public int EliminaSoftware(String serial, String idcar) {
        int retorno = 0 ;
        String consulta = new String();
        consulta = new String("Delete from serviosirirs.servicios.EquipoSoftware where Serial = '"+serial+"' AND idSoftware = "+idcar);
        try {
            conectarBD();
            retorno = actualizar(consulta);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

public int EliminaDisp(String idd) {
        int retorno = 0 ;
        String consulta = new String();
        consulta = new String("delete from registro.dispentrev where id_hor = " + idd +" and idest = 0 ");
        try {
            conectarBD();
            retorno = actualizar(consulta);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

//============ Consulta Nro Sol =======================================


public Vector ConsultaSol() {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String("Select Top 1 id_solicitud, usuario from ServiOsirirs.servicios.Asignacion Order by id_asignacion desc");
        try {
            conectarBD();
            retorno = consultar(consulta, 2, 0);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }


public Vector ConsultaTipoSol( String ids) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String("Select tipo_solicitud from ServiOsirirs.servicios.Solicitud Where id_solicitud = "+ids);
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
//Retorna nombres por cedula
public String ConsultaNombreCC(String cc) {
        Vector retorno = new Vector();
        String consulta = new String();
        if(cc.equals("0")){return "Equipo NUEVO";}
        if(cc.equals("1")){return "OSIRIS";}
        consulta = new String("Select nombres from registro.odi.empnomina Where cod_emp = '"+cc+"'");
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno.elementAt(0).toString();
    }


public Vector ConsultaCambioResp(String serial) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String("Select top 1 UsuarioOSIRIS, (Select nombres from registro.odi.empnomina Where cod_emp = Convert( Varchar(50),CCResponsable)) from serviosirirs.servicios.LogTransaccional where Serial = '"+serial+"' AND Tipo = 4 Order by idLogT desc");
        try {
            conectarBD();
            retorno = consultar(consulta, 2, 0);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

//============ INSERTA DATOS ==========================================

public int AgregarFchCorreo() {
        int retorno = 0;
        String consulta = new String();
        String consulta2 = new String();

       consulta = new String("UPDATE [ServiOsirirs].[servicios].[FechaCorreoLic] Set fechaEnv = getdate() where [idCorreo] = 1 "); 
       
         
          
        BaseDatos m = new BaseDatos();
        try {
            conectarBD();
            retorno = actualizar(consulta);
            
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
  
        desconectarBD();
        return retorno;
    }

public int CreaLogSoftware(String NomSoft, String version, String desc, String usu, String tipo) {
        int retorno = 0;
        String consulta = new String();

       consulta = new String("INSERT INTO [ServiOsirirs].[servicios].[LogLicencias] " +
                                "           ([NomSoftware] " +
                                "           ,[version] " +
                                "           ,[DescripcionLog] " +
                                "           ,[FchLog]" +
                                "           ,[Usuario] " +
                                "           ,[Tipo])" +
                                "     VALUES " +
                                "           ('" + NomSoft +
                                "           ','" + version +"' " +
                                "           ,'" + desc +"' " +
                                "           ,GETDATE() " +
                                "           ,'" + usu +"' "+
                                "           ,"+ tipo +")");
          
        BaseDatos m = new BaseDatos();
        
     
        try {
            conectarBD();
            retorno = actualizar(consulta);
            
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
           
            
        desconectarBD();
        return retorno;
    }


public int AgregarArea( String CodArea, String idLic) {
        int retorno = 0;
        String consulta = new String();
        String consulta2 = new String();

       consulta = new String("INSERT INTO [ServiOsirirs].[servicios].[AreaSoftware] " +
                            "           ([CodArea] " +
                            "           ,[idSoftware]) " +

                            "     VALUES " +
                            "           ('"   + CodArea + 
                            "           ','"  + idLic + "')"); 
       
       
          
        BaseDatos m = new BaseDatos();
        try {
            conectarBD();
            retorno = actualizar(consulta);
            
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
  
        desconectarBD();
        return retorno;
    }

public int CreaRenovacion( String CostReno,String FchRenova, String TipLic, String VigRenova, String DescRenova, String idLic) {
        int retorno = 0;
        String consulta = new String();
        String consulta2 = new String();
     
        //consulta = new String("INSERT INTO serviosirirs.servicios.solicitud (usuario_solicitante,descripcion_solicitud,fecha_solicitud,fecha_solucion,estado_solicitud,bloque,depto_area,tipo_solicitud,extension_solicitantes,usuario_crea)"
        //    +"values ('juan.vanzina','ok', GETDATE(), NULL, 1,'B','Area',1,225,'juan.vanzina')"); 

       consulta = new String("INSERT INTO [ServiOsirirs].[servicios].[LicenciaSoft] " +
                            "           ([fecha_renovacion] " +
                            "           ,[costo] " +
                            "           ,[tipo_licencia] " +
                            "           ,[tipo]" +
                            "           ,[descripcion]" +
                            "           ,[vigencia] " +
                            "           ,[idSoftware] " +
                            "           ,[estado]) " +

                            "     VALUES " +
                            "           ('"   + FchRenova + 
                            "           ','"  + CostReno + "'" +
                            "           ,'"   + TipLic + "'"  +
                            "           ,'RENOVA'"  + //TIPO RENOVA = RENOVACION
                            "           ,'"   + DescRenova + "'"  +    
                            "           ,'"   + VigRenova + "'"  + 
                            "           ,'"   + idLic + "'"  +                
                            "           ,'1')"); //ESATDO 1 ACTIVO - 0 INACTIVO
       
       
          
        BaseDatos m = new BaseDatos();
      
        try {
            conectarBD();
            retorno = actualizar(consulta);
            
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
  
        desconectarBD();
        return retorno;
    }

public int CreaLicSoftware( String NomSoftware, String fechaVenci,String FechaComp,String version,String numLic,String VigLic,String valorSoft,String TipoLic,String DescripLic, String CodArea, String CondUso, String TipoSoft) {
        int retorno = 0;
        String consulta = new String();
        String consulta2 = new String();
        String consulta3 = new String();
     
       
       consulta = new String("INSERT INTO [ServiOsirirs].[servicios].[Software] " +
                            "           ([NombreSoft] " +
                            "           ,[VersionS] " +
                            "           ,[FechaCompra] " +
                            "           ,[Estado]" +
                            "           ,[TipoSoft]" +
                            "           ,[fecha_vencimiento] " +
                            "           ,[num_licencias]) " +
               
                            "     VALUES " +
                            "           ('"   + NomSoftware + 
                            "           ','"  + version + "'" +
                            "           ,'"   + FechaComp + "'"  +
                            "           ,'1'"  + // estado 1: activo, 0: inactivo
                            "           ,'"+TipoSoft+"'"  + // tipo software
                            "           ,'"   + fechaVenci + "'"  +             
                            "           ,'"  + numLic + "')");
                            
       
       consulta2 = new String("INSERT INTO [ServiOsirirs].[servicios].[LicenciaSoft] " +
                            "           ([fecha_renovacion] " +
                            "           ,[costo] " +
                            "           ,[tipo_licencia] " +
                            "           ,[tipo]" +
                            "           ,[descripcion]" +
                            "           ,[vigencia] " +
                            "           ,[idSoftware] " +
                            "           ,[estado] " +
                            "           ,[version_renovacion] " +
                            "           ,[condicion_uso]) " +

                            "     VALUES " +
                            "           (NULL" + 
                            "           ,'"  + valorSoft + "'" +
                            "           ,'"   + TipoLic + "'"  +
                            "           ,'COMPRA'"  + //TIPO compra o renov: renovacion
                            "           ,'"   + DescripLic + "'"  +
                            "           ,'"   + VigLic + "'"  +
                            "           , (SELECT  MAX([idSoftware]) FROM [ServiOsirirs].[servicios].[Software])"  +               
                            "           ,'1', NULL, '"+CondUso+"')"); // estado 1: activo, 0: inactivo
                      
          
          consulta3 = new String("INSERT INTO [ServiOsirirs].[servicios].[AreaSoftware] " +
                            "           ([CodArea] " +
                            "           ,[idSoftware]) " +

                            "     VALUES " +
                            "           ('" +CodArea+"'"+
                            "           ,(SELECT  MAX([idSoftware]) FROM [ServiOsirirs].[servicios].[Software]))");
          
       
        BaseDatos m = new BaseDatos();
   
        try {
            conectarBD();
            retorno = actualizar(consulta);
            retorno = actualizar(consulta2);
            retorno = actualizar(consulta3);
            
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
                      
        desconectarBD();
        return retorno;
    }


public int CreaEquipo(String placa, String fcompra, String garant, String serial, String ptored, String domain, String Mac, String Marca, String Modelo, String TipoEq, String Ubicacion, String Observacions, String usuario, String OrdenComp, String mac2) {
        int retorno = 0;
        String consulta = new String();
     
        //consulta = new String("INSERT INTO serviosirirs.servicios.solicitud (usuario_solicitante,descripcion_solicitud,fecha_solicitud,fecha_solucion,estado_solicitud,bloque,depto_area,tipo_solicitud,extension_solicitantes,usuario_crea)"
        //    +"values ('juan.vanzina','ok', GETDATE(), NULL, 1,'B','Area',1,225,'juan.vanzina')"); 

       consulta = new String("INSERT INTO [ServiOsirirs].[servicios].[Equipo] " +
                            "           ([PlacaInventario] " +
                            "           ,[Estado] " +
                            "           ,[FechaCompra] " +
                            "           ,[MesesGarantia] " +
                            "           ,[Serial] " +
                            "           ,[PuntoRed] " +
                            "           ,[HostDominio] " +
                            "           ,[MacAddress] " +
                            "           ,[Marca] " +
                            "           ,[Modelo] " +
                            "           ,[TipoEqui] " +
                            "           ,[Ubicación] " +
                            "           ,[Observaciones] " +
                            "           ,[CCResponsable] " +
                            "           ,[idSalon] " +
                            "           ,[Aprobado] " +
                            "           ,[fechacrea] " +
                            "           ,[usucrea], [eqcincuenta],[OrdenCompra],[macAddress2])" +
                            "     VALUES " +
                            "           ("   + placa + 
                            "           ,1 " +
                            "           ,'"  + fcompra + "'" +
                            "           ,"   + garant  +
                            "           ,'"  + serial  + "'" +
                            "           ,'"  + ptored  + "'" +
                            "           ,'"  + domain  + "'" +
                            "           ,'"  + Mac     + "'" +
                            "           ,'"  + Marca   + "'" +
                            "           ,'"  + Modelo   + "'" +
                            "           ,'"  + TipoEq   + "'" +
                            "           ,'"  + Ubicacion   + "'" +
                            "           ,'"  + Observacions   + "'" +
                            "           ,NULL" +
                            "           ,NULL" +
                            "           ,'Sin Aprobar', GETDATE(),'"+usuario+"', 'No','"+OrdenComp+"','"+mac2+"')");
         
        BaseDatos m = new BaseDatos();
        
        try {
            conectarBD();
            retorno = actualizar(consulta);
            
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
           
            
        desconectarBD();
        return retorno;
    }



public int CreaLogEquipo(String tipo, String desc, String usuosiris, String ccresp, String serial, String id_sol) {
        int retorno = 0;
        String consulta = new String();

       consulta = new String("INSERT INTO [ServiOsirirs].[servicios].[LogTransaccional] " +
                                "           ([Tipo] " +
                                "           ,[Descripcion] " +
                                "           ,[FechaLog] " +
                                "           ,[UsuarioOSIRIS] " +
                                "           ,[CCResponsable] " +
                                "           ,[Serial] " +
                                "           ,[id_solicitud]) " +
                                "     VALUES " +
                                "           (" + tipo +
                                "           ,'" + desc +"' " +
                                "           ,GETDATE() " +
                                "           ,'" + usuosiris +"' "+
                                "           ,"+ ccresp +
                                "           ,'" + serial +"' "+
                                "           ,"+id_sol+")");
          
        BaseDatos m = new BaseDatos();
        
        try {
            conectarBD();
            retorno = actualizar(consulta);
            
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
           
            
        desconectarBD();
        return retorno;
    }


public int CreaNovedadEq(String novedad, String serial, String usu) {
        int retorno = 0;
        String consulta = new String();

       consulta = new String("INSERT INTO [ServiOsirirs].[servicios].[Novedades]\n" +
                                "           ([Descripcion] " +
                                "           ,[Serial] " +
                                "           ,[Fecha],[Usuario]) " +
                                "     VALUES " +
                                "           ('"+ novedad +"'"+
                                "           ,'"+ serial +"'"+
                                "           ,GETDATE()"+
                                "           ,'"+usu+"')");
          
        BaseDatos m = new BaseDatos();
        
        try {
            conectarBD();
            retorno = actualizar(consulta);
            
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
           
            
        desconectarBD();
        return retorno;
    }



public int CreaSol(String cliente, String bloque, String ext, String asunto, String depend, String usr, String tec) {
        int retorno = 0;
        String consulta = new String();
     
        //consulta = new String("INSERT INTO serviosirirs.servicios.solicitud (usuario_solicitante,descripcion_solicitud,fecha_solicitud,fecha_solucion,estado_solicitud,bloque,depto_area,tipo_solicitud,extension_solicitantes,usuario_crea)"
        //    +"values ('juan.vanzina','ok', GETDATE(), NULL, 1,'B','Area',1,225,'juan.vanzina')"); 

        consulta = new String("INSERT INTO serviosirirs.servicios.solicitud (usuario_solicitante,descripcion_solicitud,fecha_solicitud,fecha_solucion,estado_solicitud,bloque,depto_area,tipo_solicitud,extension_solicitantes,usuario_crea, cc_usuario_solicitante)"
            +"values ('"+cliente+"','"+asunto+"', GETDATE(), NULL, 1,'"+bloque+"','"+depend+"',"+tec+","+ext+",'"+usr+"', (Select rtrim(cod_emp) from odi.empnomina where nombres like '%"+cliente+"%'))"); 
          
        BaseDatos m = new BaseDatos();
        
        try {
            conectarBD();
            retorno = actualizar(consulta);
            
             m.conectarBDErpProcCrea(bloque);
             
           
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
           
            
        desconectarBD();
        return retorno;
    }


public int ConectaEquipoSoftHard(String accion, String tipo, String valor, String serial) {
        int retorno = 0;
        String consulta = new String();

        if(accion.equals("S")){
                    consulta = new String("INSERT INTO [ServiOsirirs].[servicios].[EquipoSoftware] " +
                                            "           ([idSoftware] " +
                                            "           ,[Serial]) " +
                                            "     VALUES " +
                                            "           ((Select idSoftware from ServiOsirirs.servicios.Software where TipoSoft = "+tipo+" AND Concat(NombreSoft, (' - ' COLLATE Modern_Spanish_CI_AS) ,VersionS) = '"+valor+"' COLLATE Modern_Spanish_CI_AS) " +
                                            "           ,'"+serial+"' COLLATE Modern_Spanish_CI_AS)");
        }else if(accion.equals("H")){
                    consulta = new String("INSERT INTO [ServiOsirirs].[servicios].[EquipoCaracteristica] " +
                                            "           ([idCaracteristica] " +
                                            "           ,[Serial]) " +
                                            "     VALUES " +
                                            "           ((Select idCaracteristica from ServiOsirirs.servicios.Caracteristica Where Concat(Linea, ' - ' COLLATE Modern_Spanish_CI_AS, Nombre) = '"+valor+"' COLLATE Modern_Spanish_CI_AS) " +
                                            "           ,'"+serial+"')");
        }

        try {
            conectarBD();
            retorno = actualizar(consulta);
            
         
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
                
        desconectarBD();
        return retorno;
    }


public int CreaSolProp(String cliente, String bloque, String ext, String asunto, String depend, String usr, String tec, String tipo, String uosiris){
     
     int retorno = 0;
     String consulta = new String();
     String consulta2 = new String();
    
    consulta = new String("INSERT INTO serviosirirs.servicios.solicitud (usuario_solicitante,descripcion_solicitud,fecha_solicitud,fecha_solucion,estado_solicitud,bloque,depto_area,tipo_solicitud,extension_solicitantes,usuario_crea, cc_usuario_solicitante)"
            +"values ('"+cliente+"','"+asunto+"', GETDATE(), NULL, 1,'"+bloque+"','"+depend+"',"+tec+","+ext+",'"+usr+"', (Select rtrim(cod_emp) from odi.empnomina where nombres like '%"+cliente+"%'))"); 

    try {
            conectarBD();
            retorno = actualizar(consulta);
           
             
                   consulta2 = new String("INSERT INTO ServiOsirirs.servicios.asignacion(fecha_inicio_proceso,fecha_asignacion,fecha_finalizacion,observacion_solucion,estado_asignacion,tipo_asignacion,usuario,id_solicitud) " +
                   " values (NULL,GETDATE(),NULL,'',1,1,'"+uosiris+"',IDENT_CURRENT('ServiOsirirs.servicios.Solicitud'))");
                    actualizar(consulta2);
  
                } catch (Exception ex) {
                    mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
                }
            
        desconectarBD();
        return retorno;
}

public int Asigna(String bql) {
        int retorno = 0;
        String consulta = new String();
     
        //consulta = new String("INSERT INTO serviosirirs.servicios.solicitud (usuario_solicitante,descripcion_solicitud,fecha_solicitud,fecha_solucion,estado_solicitud,bloque,depto_area,tipo_solicitud,extension_solicitantes,usuario_crea)"
        //    +"values ('juan.vanzina','ok', GETDATE(), NULL, 1,'B','Area',1,225,'juan.vanzina')"); 

        consulta = new String("EXEC AsignaTareas'A'"); 
                       
        try {
            conectarBD();
            retorno = actualizar(consulta);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }



public int Actualiza_Fin_Solicitud(String tipo_ac, String Nro_Sol, String usu, String Obs_admin, String Calidad) {
        int retorno = 0;
        String consulta = new String();
        String estado = "0";
        String consulta2 = new String();
        String consulta3 = new String();
        
        if(tipo_ac.equals("R")){
        
              consulta = new String("INSERT INTO ServiOsirirs.servicios.Asignacion (fecha_asignacion, estado_asignacion, tipo_asignacion, usuario, id_solicitud)" 
                                    + "VALUES (GETDATE(), 1, 2, (Select usuario from ServiOsirirs.servicios.Usuario Where nombres = '"+usu+"'), "+Nro_Sol+")");
              
              consulta2 = new String("Update ServiOsirirs.servicios.Asignacion Set estado_asignacion = 7 Where id_solicitud = "+Nro_Sol); 
              consulta3 = new String("Update ServiOsirirs.servicios.Solicitud SET observacion_admin = '"+Obs_admin+"' Where id_solicitud = "+Nro_Sol);
       }
       else if(tipo_ac.equals("C") || tipo_ac.equals("S")){

            consulta2 = new String(""); 
            
            if(tipo_ac.equals("C")){estado="2";}
            if(tipo_ac.equals("S")){estado="3";}
            if(!estado.equals("0")){
              consulta = new String("Update ServiOsirirs.servicios.Solicitud SET estado_solicitud = "+estado+", fecha_solucion = GETDATE(), observacion_admin = '"+Obs_admin+"', calificacion = "+Calidad+" Where id_solicitud = "+Nro_Sol);
            }
         }
   
        if(!consulta2.equals("")){
        
            conectarBD();
            actualiza(consulta2);
            actualiza(consulta3);
            
        }
        
        try {
            conectarBD();
            retorno = actualizar(consulta);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }



public int AprobarEquipo(String Serial, String Usuario) {
        int retorno = 0;
        String consulta = new String();

        consulta = new String("  Update serviosirirs.servicios.Equipo " +
                              "  set Aprobado = '"+Usuario+"'" +
                              "  where Serial = '"+Serial+"'");
        BaseDatos m = new BaseDatos();
        
        try {
            conectarBD();
            retorno = actualizar(consulta);
            
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }


public int ActualizaMantenimiento(String serial) {
        int retorno = 0;
        String consulta = new String();

       consulta = new String("UPDATE [ServiOsirirs].[servicios].[Equipo] " +
                                "   SET [mantenimiento] = GETDATE()"  +
                                " WHERE [Serial] = '"+serial+"'");
          
        BaseDatos m = new BaseDatos();
        
        try {
            conectarBD();
            retorno = actualizar(consulta);
            
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
           
            
        desconectarBD();
        return retorno;
    }

public int ActualizaEquipo(String placa, String estado,String fcompra, String garant, String serial, String ptored, String domain, String Mac, String Marca, String Modelo, String TipoEq, String Ubicacion, String Observacions, String CCresp, String Salon, String eqcinc, String OrdenComp, String mac2) {
        int retorno = 0;
        String consulta = new String();

       consulta = new String("UPDATE [ServiOsirirs].[servicios].[Equipo] " +
                                "   SET [PlacaInventario] = " + placa +
                                "      ,[Estado] = " + estado +
                                "      ,[FechaCompra] = '" + fcompra +"'"+
                                "      ,[MesesGarantia] = " + garant +
                                "      ,[PuntoRed] = '" +ptored+ "' "+
                                "      ,[HostDominio] = '"+domain+"' "+
                                "      ,[MacAddress] = '"+Mac+"' "+
                                "      ,[Marca] = '"+Marca+"' "+
                                "      ,[Modelo] = '"+Modelo+"' "+
                                "      ,[TipoEqui] = "+TipoEq+" "+
                                "      ,[Ubicación] = '"+Ubicacion+"' "+
                                "      ,[Observaciones] = '"+Observacions+"' "+
                                "      ,[eqcincuenta] = '" +eqcinc+ "'"+
                                "      ,[OrdenCompra] = '" +OrdenComp+ "'"+
                                "      ,[macAddress2] = '" +mac2+ "'"+
                             // "      ,[idSalon] = "+Salon+" "+
                                " WHERE [Serial] = '"+serial+"'");
     
        BaseDatos m = new BaseDatos();
        
        try {
            conectarBD();
            retorno = actualizar(consulta);
            
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
           
            
        desconectarBD();
        return retorno;
    }


//==========================================================================

   private String limpiarStr(String cadena) {
        cadena = cadena.replace("'", "");
        cadena = cadena.replace(" ", "");
        return cadena;
    }

    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

public String Secuencia(String entidad){
        String consulta, secuencia = new String("");;
        Vector retorno = new Vector();
        BaseDatos bdnot = new BaseDatos();
        consulta = " select sig_sec from registro.secuencias where nombre = '" + entidad + "'  " ;
       try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
            secuencia = retorno.elementAt(0).toString();
            this.mensaje = bdnot.getMensaje();
            consulta = new String("update registro.secuencias set sig_sec = sig_sec + 1 where nombre = '" + entidad + "' ") ;
            int ret  = actualizar(consulta);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return secuencia;
    }

//================================================================================================ Call Stored Procedure
    


}
