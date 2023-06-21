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
 
 String Orden = request.getParameter("Orden");

 Vector estado = new Vector();

 estado = bd.Detalle_Equipo_orden(Orden);
    
 
 
 String formato = request.getParameter("formato");      
 // PrintWriter oout = response.getWriter();
  if ((formato != null) && (formato.equals("excel"))) {
     response.setContentType("application/vnd.ms-excel");
     response.setHeader("Content-Disposition", "attachment; filename=\"Reporte Orden Compra "+Orden+"" + ".xls\"");
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
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Serial</b></font></td>  
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>PlacaInventario</b></font></td>
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>fechacompra</b></font></td>                     
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Marca</b></font></td>
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Modelo</b></font></td>
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Tipo Equipo</b></font></td>
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>meses garantia</b></font></td>
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Ubicación</b></font></td>
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Observaciones</b></font></td>
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Respomsable</b></font></td>
                   
                    </tr>
                    <% for ( int m = 0 ; m < estado.size() ; m++ ){
                        res = (Vector)estado.elementAt(m);
                    %>
                    <tr bgcolor="#CCCCCC"> 
                        <td width="5%" height="48" > 
                          <div align="center"><font face="sans-serif" size="2" ><b><%=res.elementAt(4)%></b></font></div>
                        </td>
                       <td width="5%" height="48" > 
                          <div align="center"><font face="sans-serif" size="2" ><b><%=res.elementAt(0)%></b></font></div>
                        </td>
                        <td width="5%" height="48" > 
                          <div align="center"><font face="sans-serif" size="2" ><b><%=res.elementAt(2)%></b></font></div>
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
                          <div align="center"><font face="sans-serif" size="2" ><b><%=res.elementAt(3)%></b></font></div>
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
</h