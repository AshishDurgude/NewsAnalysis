<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.net.UnknownHostException" %>
<%@ page import ="java.util.Date" %>
<%@ page import ="com.mongodb.BasicDBObject" %>
<%@ page import ="com.mongodb.DB"%>
<%@ page import ="com.mongodb.DBCollection"%>
<%@ page import ="com.mongodb.DBCursor"%>
<%@ page import ="com.mongodb.MongoClient"%>
<%@ page import ="com.mongodb.MongoException"%>
<% 				int cnt=0,cnt1=0,cnt2=0; int total,total1,total2;%>
<%
		try {
			MongoClient mongo = new MongoClient("localhost", 27017);
			DB db = mongo.getDB("trypro1");
			
			DBCollection table = db.getCollection("indianexpress");
			DBCollection table1 = db.getCollection("dna");
			DBCollection table2 = db.getCollection("toi");

	if(request.getParameter("tech").contains("sports")){
		BasicDBObject searchQuery2 
		= new BasicDBObject("link",new BasicDBObject("$regex","sport"));
		cnt=table.find(searchQuery2).count();
		cnt1=table1.find(searchQuery2).count();
		cnt2=table2.find(searchQuery2).count();%>
		
		
		<%	}
	
	else if(request.getParameter("tech").contains("world")){ 
		BasicDBObject searchQuery2 
		= new BasicDBObject("link",new BasicDBObject("$regex","world"));
		cnt=table.find(searchQuery2).count();
		
		cnt1=table1.find(searchQuery2).count();
		
		cnt2=table2.find(searchQuery2).count();
		
		%>
		
		<%}
	
	else if(request.getParameter("tech").contains("entertainment")){
		BasicDBObject searchQuery2 
		= new BasicDBObject("link",new BasicDBObject("$regex","entertainment"));
		cnt=table.find(searchQuery2).count();
		
		cnt1=table1.find(searchQuery2).count();
		
		cnt2=table2.find(searchQuery2).count();
		
		%>
				<%}
	
	
	
	else if(request.getParameter("tech").contains("crime")){
		BasicDBObject searchQuery2 
		= new BasicDBObject("link",new BasicDBObject("$regex","/crime/"));
		cnt=table.find(searchQuery2).count();
		
		cnt1=table1.find(searchQuery2).count();
		
		cnt2=table2.find(searchQuery2).count();
		
		%>
						<%}
	
	else if(request.getParameter("tech").contains("environment")){
		BasicDBObject searchQuery2 
		= new BasicDBObject("link",new BasicDBObject("$regex","envi"));
		cnt=table.find(searchQuery2).count();
		
		cnt1=table1.find(searchQuery2).count();
		
		cnt2=table2.find(searchQuery2).count();
		
		%>
						<%}
	
	else if(request.getParameter("tech").contains("education")){
		BasicDBObject searchQuery2 
		= new BasicDBObject("link",new BasicDBObject("$regex","edu"));
		cnt=table.find(searchQuery2).count();
		
		cnt1=table1.find(searchQuery2).count();
		
		cnt2=table2.find(searchQuery2).count();
		
		%>
						<%}
	
	else if(request.getParameter("tech").contains("governpolicies")){
		BasicDBObject searchQuery2 
		= new BasicDBObject("link",new BasicDBObject("$regex","gov"));
		
		BasicDBObject searchQuery3
		= new BasicDBObject("link",new BasicDBObject("$regex","polic"));
		
		cnt=table.find(searchQuery2).count();
		cnt+=table.find(searchQuery3).count();
		
		cnt1=table1.find(searchQuery2).count();
		cnt1+=table1.find(searchQuery3).count();
		
		cnt2=table2.find(searchQuery2).count();
		cnt2+=table2.find(searchQuery3).count();
		%>
						<%}
	
	
	else if(request.getParameter("tech").contains("science")){
		BasicDBObject searchQuery2 
		= new BasicDBObject("link",new BasicDBObject("$regex","science"));
		cnt=table.find(searchQuery2).count();
		
		cnt1=table1.find(searchQuery2).count();
		
		cnt2=table2.find(searchQuery2).count();
		
		%>
						<%}
	
	else if(request.getParameter("tech").contains("culture")){
		BasicDBObject searchQuery2 
		= new BasicDBObject("link",new BasicDBObject("$regex","culture"));
		cnt=table.find(searchQuery2).count();
		
		cnt1=table1.find(searchQuery2).count();
		
		cnt2=table2.find(searchQuery2).count();
		
		%>
						<%}
	
	
	else if(request.getParameter("tech").contains("india")){
		BasicDBObject searchQuery2 
		= new BasicDBObject("link",new BasicDBObject("$regex","/india/"));
		cnt=table.find(searchQuery2).count();
		
		cnt1=table1.find(searchQuery2).count();
		
		cnt2=table2.find(searchQuery2).count();
		
		%>
						<%}
	
	else if(request.getParameter("tech").contains("techno")){
		BasicDBObject searchQuery2 
		= new BasicDBObject("link",new BasicDBObject("$regex","tech"));
		cnt=table.find(searchQuery2).count();
		
		cnt1=table1.find(searchQuery2).count();
		
		cnt2=table2.find(searchQuery2).count();
		
		%>
		
		<%
	}
			System.out.println("Done");
		} catch (MongoException e) {
			e.printStackTrace();
		}%>
		<!DOCTYPE html>
<html>
<head>
<style>
body{
background:url('graphwall1.png');
}
#graph{
margin-top:50px;
margin-left:200px;
margin-right:200px;
padding-left:200px;
padding-top:70px;
background-color:rgba(0,0,0,0.5);
}
h1{
color:#ffffff;
text-align:center;
}
</style>
 <script type="text/javascript" src="canvasjs.min.js"></script>
 <script type="text/javascript">

		window.onload = function () {
			var chart = new CanvasJS.Chart("chartContainer", {
				theme: "theme2",//theme1
				
				animationEnabled: true,   // change to true
				data: [              
				{
					// Change type to "bar", "splineArea", "area", "spline", "pie",etc.
					type: "column",
					dataPoints: [
						{ label: "India Times",  y: <%=cnt%> },
						{ label: "DNA", y: <%=cnt1%> },
						{ label: "Times Of India",  y: <%=cnt2%>  }
					]
				}
				]
			});
			chart.render();
		}
		</script>

</head>
<body>
<h1>News Analysis Results:</h1>
<div class="graphpaper" id="graph">
<div class="container">
<div id="chartContainer" style="height: 400px; width: 60%;opacity:100.33;"></div>
</div>
</div>
</body>
</html>
