<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%  Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://192.168.5.101:3306/te3232db","te3232","te3232");  
Statement st= con.createStatement(); 
ResultSet rs=null; 

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(request.getParameter("q1")!=null){%>
<%
st= con.createStatement(); 
rs=st.executeQuery("select prof_name,Departments.dept_name,city,salary from Professors inner join Departments on Professors.dept_id=Departments.dept_id;"); 
%>
1. List the  names of professor, dname, city and salary of all professors
<TABLE BORDER="1">
            <TR>
                <TH>Name</TH>
                <TH>Department Name</TH>
                <TH>City</TH>
                <TH>Phone</TH>
            </TR>
            <% while(rs.next()){ %>
            <TR>
                <TD> <%= rs.getString(1) %></td>
                <TD> <%= rs.getString(2) %></td>
                <TD> <%= rs.getString(3) %></td>
                <TD> <%= rs.getString(4) %></td>
            </TR>
            <% } %>
        </TABLE>
                <%rs.close(); %>
<%} %>

<% if(request.getParameter("q2")!=null){%>
<%
st= con.createStatement(); 
rs=st.executeQuery("select p.prof_name,h.prof_name as headname from Professors h,Professors p inner join works w where p.prof_id=w.prof_id and w.head_id=h.prof_id" ); 
%>
2. List all the name of professors & their corresponding head name.
<TABLE BORDER="1">
            <TR>
                <TH>Professor Name</TH>
                <TH>Head Name</TH>
            </TR>
            <% while(rs.next()){ %>
            <TR>
                <TD> <%= rs.getString(1) %></td>
                <TD> <%= rs.getString(2) %></td>
            </TR>
            <% } %>
        </TABLE>
        <%rs.close(); %>
<%} %>

<%if(request.getParameter("q3")!=null){%>
<%
st= con.createStatement(); 
rs=st.executeQuery("select d.dept_name from Departments d left join Professors p on d.dept_id=p.dept_id where prof_name is NULL" ); 
%>

3. Display all the names of the departments for which no professor is working.
<TABLE BORDER="1">
            <TR>
                <TH>Dept Name</TH>
            </TR>
            <% while(rs.next()){ %>
            <TR>
                <TD> <%= rs.getString(1) %></td>
            </TR>
            <% } %>
        </TABLE>
                <%rs.close(); %>
<%} %>
<%if(request.getParameter("q4")!=null){%>
<%
st= con.createStatement(); 
rs=st.executeQuery(" select p.prof_name from Departments d right join Professors p on d.dept_id=p.dept_id where dept_name is NULL" ); 
%>
4. Display professors who are not working for any department. 

<TABLE BORDER="1">
            <TR>
                <TH>Professor Name</TH>
            </TR>
            <% while(rs.next()){ %>
            <TR>
                <TD> <%= rs.getString(1) %></td>
            </TR>
            <% } %>
        </TABLE>
                <%rs.close(); %>
<%} %>

<%if(request.getParameter("q5")!=null){%>
<%
st= con.createStatement(); 
rs=st.executeQuery("select d.dept_name,count(p.prof_id) from( Departments d inner join Professors p on p.dept_id=d.dept_id) group by dept_name" ); 
%>
5. Find the total no of  department wise professors.
<TABLE BORDER="1">
            <TR>
                <TH>Department Name</TH>
                <TH>No. of Professors</TH>
            </TR>
            <% while(rs.next()){ %>
            <TR>
                <TD> <%= rs.getString(1) %></td>
                <TD> <%= rs.getString(2) %></td>
            </TR>
            <% } %>
        </TABLE>
                <%rs.close(); %>
<%} %>

</body>
</html>