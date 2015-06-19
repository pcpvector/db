
<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.DriverManager" %> 
<%@ page import="java.sql.Connection" %> 
<%@ page import="java.sql.*" %> 
<%@ page import = "com.custardsource.parfait.*" %>		

<%@ page import = "javax.measure.unit.*" %>		
<%@ page import= "com.custardsource.parfait.dxm.*" %>		
<%@ page import= "com.custardsource.parfait.dxm.PcpWriter" %>		 
<%@ page import= "com.custardsource.parfait.dxm.semantics.*" %>		
<%@ page import= "com.custardsource.parfait.dxm.semantics.PcpDimensionSet" %>		
<%@ page import= "com.custardsource.parfait.pcp.PcpMonitorBridge" %>		
<%@ page import= "com.custardsource.parfait.pcp.*" %>		
<%@ page import= "com.custardsource.parfait.Monitorable" %>		
<%@ page import= "com.custardsource.parfait.MonitoringView" %>
<%@ page import= "com.custardsource.parfait.jdbc.ParfaitDataSource" %>
<%

PcpMmvWriter bridge=new PcpMmvWriter("IQ",IdentifierSourceSet.DEFAULT_SET);
PcpMonitorBridge bridge1 = new PcpMonitorBridge(bridge, MetricNameMapper.PASSTHROUGH_MAPPER, new MetricDescriptionTextSource(), new EmptyTextSource());
try{
    String connection="jdbc:mysql://localhost:3306/EMP";
    Connection con;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    //DataSource d;
    con=DriverManager.getConnection(connection,"root","rootaccess");
 //   ParfaitDataSource parfaitDataSource=new ParfaitDataSource(d); 
    //Collection coll=ParfaitDataSource.getThreadMetrics();
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select * from Employees");
    out.print("<table border='1' class='table table-striped table-bordered'>");
    out.println("<thead><tr>");
    out.println("<th>Client ID</th>");
    out.println("<th>Client Name</th>");
    out.println("<th>Client Last Name</th>");
    out.println("<th>Age</th>");
  //  out.println("<th>Address</th></thead></tr>");
    while(rs.next()){
        out.print("<tr>");
        out.print("<td>"+rs.getInt("id")+"</td>");
        out.print("<td>"+rs.getString("first")+"</td>");
        out.print("<td>"+rs.getString("last")+"</td>");
        out.print("<td>"+rs.getInt("age")+"</td>");
       // out.print("<td>"+rs.get("Address")+"</td>");
        out.print("</tr>");
    }
    out.print("</table>");
}
catch(Exception ex){
    out.println("Error:"+ex.toString());
}
 
%>