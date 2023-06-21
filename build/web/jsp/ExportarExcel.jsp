<%@page import="javax.ws.rs.core.Response"%>
<%@page import="BDatos.BDServicios"%>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%@ include file="secure.jsp" %>
<%@page contentType="text/html"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"https://www.w3.org/TR/html4/loose.dtd">
   <% response.setHeader("Cache-Control","no-cache");
      //Periodo Sig  
  String nro = "0", reasig = "";
  BDServicios bd = new BDServicios();
  Vector res = new Vector();
  Vector sol = new Vector();
  String usu = session.getAttribute("idusr").toString();
  String rol = session.getAttribute("rol").toString();
  String nombre = session.getAttribute("nomusr").toString();
  Vector usuari = bd.usuario_osiris();
   %>
<script language="JavaScript" type="text/JavaScript">
   
    function cargar()
    {
        if(!(document.form1.carga[0].selected))
        {
            document.form1.action='Reportes';  
            document.form1.submit();
        }
    }
</script>
<%
int c = 0;
String solic = "";
String est = "";
String usu_con="0";
String fecha_ini ="";
String fecha_fin ="";
String cliente ="";

 est = (String) request.getParameter("Estado");
 usu_con = (String) request.getParameter("Usuario");
 fecha_ini = (String) request.getParameter("fechaini");
 fecha_fin = (String) request.getParameter("fechafin");
 cliente = (String) request.getParameter("cliente");
 

 Vector estado = new Vector();

    estado = bd.ConsultaReporte(fecha_ini,fecha_fin,usu_con,est, cliente) ;
    
 
 
 String formato = request.getParameter("formato");      
 // PrintWriter oout = response.getWriter();
  if ((formato != null) && (formato.equals("excel"))) {
     response.setContentType("application/vnd.ms-excel");
     response.setHeader("Content-Disposition", "attachment; filename=\"Solicitudes" + ".xls\"");
        }%>


 <script language="JavaScript" type="text/JavaScript">
            function enviarexcel(){
                //if(document.formulario.rbopciones[0].checked){
                    document.formulario.target = "";
                    document.formulario.action = "Reportes?formato=excel&x=2";
                    return true;
                //}else{
                   // alert("Seleccione Exportar");
                  //  return false
                //}
            }
</script>

<html lang="es">
    <head>
        <title>Mesa de Ayuda OSIRIS</title>
        <meta charset="iso-8859-1" lang="es"/>
</head>
    <body>

            
          <header>

			</header>      
              <table width="70%" border="0">              
              <tr> 
                <td bgcolor="#FFFFFF" colspan="2" height="33" valign="top"> 
                  <%if (estado.size() > 0 ) {%>
                  <div id="MyTable">
                  <table width="100%" border="1" bordercolor="#FFFFFF" align="top">
                    <tr> 
                      <td bgcolor="#6699CC" colspan="24"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="3" color="#FFFFFF" >Solicitudes: <%=solic%></font></b></td>
                    </tr>
                    <tr>
                      <td width="5%" ><font face="sans-serif" size="2" ><b>Nro. Solicitud</b></font></td>
                      <td width="5%" ><font face="sans-serif" size="2" ><b>Id Asignaci&oacute;n</b></font></td>
                      <td width="5%" ><font face="sans-serif" size="2" ><b>Estado Solicitud</b></font></td>
                      <td width="5%" ><font face="sans-serif" size="2" ><b>Estado Asignaci&oacute;n</b></font></td>
                      <td width="5%" ><font face="sans-serif" size="2" ><b>Responsable</b></font></td>
                      <td width="5%" ><font face="sans-serif" size="2" ><b>Fecha Solicitud</b></font></td>
                      <td width="5%" ><font face="sans-serif" size="2" ><b>Fecha Asignación</b></font></td>
                      <td width="5%" ><font face="sans-serif" size="2" ><b>Fecha Inicio Proceso</b></font></td>
                      <td width="5%" ><font face="sans-serif" size="2" ><b>Fecha Finalización Tecnico</b></font></td>                   
                      <td width="5%" ><font face="sans-serif" size="2" ><b>Fecha Finalización Admin</b></font></td>
                      <td width="5%" ><font face="sans-serif" size="2" ><b>Usuario Solicitante</b></font></td>
                      <td width="5%" ><font face="sans-serif" size="2" ><b>Dependencia</b></font></td>
                      <td width="5%" ><font face="sans-serif" size="2" ><b>Bloque</b></font></td>
                      <td width="5%" ><font face="sans-serif" size="2" ><b>Extensión Solicitante</b></font></td>
                      <td width="5%" ><font face="sans-serif" size="2" ><b>Mail Usuario Crea Tarea</b></font></td>
                      <td width="5%" ><font face="sans-serif" size="2" ><b>Tiempo en Iniciar Tarea</b></font></td>
                      <td width="5%" ><font face="sans-serif" size="2" ><b>Tiempo en Proceso</b></font></td>
                      <td width="5%" ><font face="sans-serif" size="2" ><b>Tiempo Total</b></font></td>
                      <td width="5%" ><font face="sans-serif" size="2" ><b>Tipo Solicitud</b></font></td>
                      <td width="3%" ><font face="sans-serif" size="2" ><b>Descripción Solicitud</b></font></td>
                      <td width="3%" ><font face="sans-serif" size="2" ><b>Observación Responsable</b></font></td>
                      <td width="3%" ><font face="sans-serif" size="2" ><b>Observación Administrador</b></font></td>
                      <td width="3%" ><font face="sans-serif" size="2" ><b>Descripción Solicitud</b></font></td>
                      <td width="3%" ><font face="sans-serif" size="2" ><b>Calificación</b></font></td>
                    </tr>
                    <% for ( int m = 0 ; m < estado.size() ; m++ ){
                        res = (Vector)estado.elementAt(m);
                    %>
                    <tr bgcolor="#CCCCCC"> 
                        <td width="5%" height="48" > 
                          <div align="center"><font face="sans-serif" size="2" ><b><%=res.elementAt(0)%></b></font></div>
                        </td>
                       <td width="5%" height="48" > 
                          <div align="center"><font face="sans-serif" size="2" ><b><%=res.elementAt(1)%></b></font></div>
                        </td>
                        <td width="5%" height="48" > 
                          <div align="center"><font face="sans-serif" size="2" ><b><%=res.elementAt(2)%></b></font></div>
                        </td>
                        <td width="5%" height="48" > 
                          <div align="center"><font face="sans-serif" size="2" ><b><%=res.elementAt(3)%></b></font></div>
                        </td>
                        <td width="5%" height="48" > 
                          <div align="center"><font face="sans-serif" size="2" ><b><%=res.elementAt(4)%></b></font></div>
                        </td>
                        <td width="5%" height="48" > 
                          <div align="center"><font face="sans-serif" size="2" ><b><%=res.elementAt(5)%></b></font></div>
                        </td>
                        <td width="5%" height="48" > 
                          <div align="center"><font face="sans-serif" size="2" ><b><%=res.elementAt(6)%></b></font></div>
                        </td>
                        <td width="5%" height="48" > 
                          <div align="center"><font face="sans-serif" size="2" ><b><%=res.elementAt(7)%></b></font></div>
                        </td>
                        <td width="5%" height="48" > 
                          <div align="center"><font face="sans-serif" size="2" ><b><%=res.elementAt(8)%></b></font></div>
                        </td>
                        <td width="5%" height="48" > 
                          <div align="center"><font face="sans-serif" size="2" ><b><%=res.elementAt(9)%></b></font></div>
                        </td>
                        <td width="5%" height="48" > 
                          <div align="center"><font face="sans-serif" size="2" ><b><%=res.elementAt(10)%></b></font></div>
                        </td>
                        <td width="5%" height="48" > 
                          <div align="center"><font face="sans-serif" size="2" ><b><%=res.elementAt(11)%></b></font></div>
                        </td>
                        <td width="5%" height="48" > 
                          <div align="center"><font face="sans-serif" size="2" ><b><%=res.elementAt(12)%></b></font></div>
                        </td>
                        <td width="5%" height="48" > 
                          <div align="center"><font face="sans-serif" size="2" ><b><%=res.elementAt(13)%></b></font></div>
                        </td>
                        <td width="5%" height="48" > 
                          <div align="center"><font face="sans-serif" size="2" ><b><%=res.elementAt(15)%></b></font></div>
                        </td>
                        <td width="5%" height="48" > 
                            <%String time;%>
                            <%if(res.elementAt(18).equals("No disponible")){time = "";}else{time = "minutos";}%>
                          <div align="center"><font face="sans-serif" size="2" ><b><%=res.elementAt(18)%> <%=time%></b></font></div>
                        </td>
                        <td width="5%" height="48" > 
                            <%if(res.elementAt(19).equals("No disponible")){time = "";}else{time = "minutos";}%>
                          <div align="center"><font face="sans-serif" size="2" ><b><%=res.elementAt(19)%> <%=time%></b></font></div>
                        </td>
                        <td width="5%" height="48" > 
                            <%if(res.elementAt(17).equals("No disponible")){time = "";}else{time = "minutos";}%>
                          <div align="center"><font face="sans-serif" size="2" ><b><%=res.elementAt(17)%> <%=time%></b></font></div>
                        </td>
                        <td width="5%" height="48" > 
                          <div align="center"><font face="sans-serif" size="2" ><b><%=res.elementAt(20)%></b></font></div>
                        </td>
                        <td width="5%" height="48" > 
                          <div align="center"><font face="sans-serif" size="2" ><b><%=res.elementAt(21)%></b></font></div>
                        </td>
                        <td width="5%" height="48" > 
                          <div align="center"><font face="sans-serif" size="2" ><b><%=res.elementAt(22)%></b></font></div>
                        </td>
                        <td width="5%" height="48" > 
                          <div align="center"><font face="sans-serif" size="2" ><b><%=res.elementAt(23)%></b></font></div>
                        </td>
                        <td width="5%" height="48" > 
                          <div align="center"><font face="sans-serif" size="2" ><b><%=res.elementAt(14)%></b></font></div>
                        </td>
                        <td width="5%" height="48" > 
                          <div align="center"><font face="sans-serif" size="2" ><b><%=res.elementAt(24)%></b></font></div>
                        </td>
                    </tr>
                    <%}%>
                  </table>
                  </div>
                    <p>&nbsp;
                </p>
                  <%}else if(c!=9){%>
                  <br><center>No tiene solicitudes <%=solic%></center>
                  <%}%>
                </td>
              </tr>
              
            </table>

    </td>
    <td background="img/portal_r2_c4.jpg" style="background-repeat:repeat-y" width="34">&nbsp;</td>
  </tr>
</table>
    </body>
</html>