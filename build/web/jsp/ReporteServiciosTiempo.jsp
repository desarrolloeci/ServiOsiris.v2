<%-- 
    Document   : ReporteServiciosTiempo
    Created on : 11/09/2017, 03:26:47 PM
    Author     : Juan Vanzina
--%>

<%@page import="java.util.Vector"%>
<%@page import="BDatos.BDServicios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% response.setHeader("Cache-Control","no-cache");
      //Periodo Sig  
  String nro = "0", reasig = "";
  BDServicios bd = new BDServicios();
  Vector res = new Vector();
  Vector aux = new Vector();
  String fechaini = request.getParameter("feini");
  String fechafin = request.getParameter("fefin");
  res = bd.ReporteSemanal(fechaini, fechafin);
  
   %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reporte Servicios</title>
    </head>
    <body>
        
        <table border="1">
            <tr>
                <td>Nombres</td>
                <td>Bloque</td>
                <td>Tipo Horario</td>
                <td>Entrada L-V</td>
                <td>Salida L-V</td>
                <td>Entrada S</td>
                <td>Salida S</td>
                <td>Solucionados</td>
                <td>Cancelados</td>
                <td>Suspendidos</td>
                <td>Reasignados</td>
                <td>Pendientes Reasignar</td>
                <td>Pendientes/En Proceso</td>
                <td>Total Solicitudes</td>
                <td>Tiempo Promedio Solución</td>
                <td>Tiempo Promedio General</td>
            </tr>
            <%  if(res.size() > 0){
                for(int i = 0 ; i < res.size(); i++){
                 aux = (Vector)res.elementAt(i);
            %>
            <tr>
                <td><%=aux.elementAt(0)%></td>
                <td><%=aux.elementAt(1)%></td>
                <td><%=aux.elementAt(2)%></td>
                <td><%=aux.elementAt(3)%></td>
                <td><%=aux.elementAt(4)%></td>
                <td><%=aux.elementAt(5)%></td>
                <td><%=aux.elementAt(6)%></td>
                <td><%=aux.elementAt(9)%></td>
                <td><%=aux.elementAt(10)%></td>
                <td><%=aux.elementAt(11)%></td>
                <td><%=aux.elementAt(12)%></td>
                <td><%=aux.elementAt(13)%></td>
                <td><%=aux.elementAt(14)%></td>
                <td><%=aux.elementAt(15)%></td>
                <td><%=aux.elementAt(7)%></td>
                <td><%=aux.elementAt(8)%></td>
            </tr>
            <%}}%>
        </table>
        
    </body>
</html>
