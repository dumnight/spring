<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! 
	Connection conn = null;
	Statement stmt = null;

	ResultSet rs = null;
	

	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "scott";
	String pass = "tiger";
	

	String sql = "SELECT DECODE(GR,'00',CD_NM,'01',CD_NM||'합계','총계') CD_NM\r\n" + 
			"      ,REGION_AREA\r\n" + 
			"      ,c0 \r\n" + 
			"       ||' ('||TO_CHAR(ROUND(c0*100/tot,2),'FM990.09')||' %)' \r\n" + 
			"       ||DECODE(c0,GREATEST(c0,c1,c2,c3,c4,c5,c6,c7,c8,c9),'▲')\r\n" + 
			"       ||DECODE(c0,LEAST(c0,c1,c2,c3,c4,c5,c6,c7,c8,c9),'▼')\r\n" + 
			"       ||' *'||DECODE(GR,'00',NVL(R_c0,MX_RK),'01',NVL(AR_c0,MX_AP_RK),'11',NVL(PR_c0,MX_P_RK)) c0 \r\n" + 
			"      ,c1 \r\n" + 
			"       ||' ('||TO_CHAR(ROUND(c1*100/tot,2),'FM990.09')||' %)' \r\n" + 
			"       ||DECODE(c1,GREATEST(c0,c1,c2,c3,c4,c5,c6,c7,c8,c9),'▲')\r\n" + 
			"       ||DECODE(c1,LEAST(c0,c1,c2,c3,c4,c5,c6,c7,c8,c9),'▼')\r\n" + 
			"       ||' *'||DECODE(GR,'00',NVL(R_c1,MX_RK),'01',NVL(AR_c1,MX_AP_RK),'11',NVL(PR_c1,MX_P_RK)) c1    \r\n" + 
			"      ,c2\r\n" + 
			"       ||' ('||TO_CHAR(ROUND(c2*100/tot,2),'FM990.09')||' %)' \r\n" + 
			"       ||DECODE(c2,GREATEST(c0,c1,c2,c3,c4,c5,c6,c7,c8,c9),'▲')\r\n" + 
			"       ||DECODE(c2,LEAST(c0,c1,c2,c3,c4,c5,c6,c7,c8,c9),'▼')\r\n" + 
			"       ||' *'||DECODE(GR,'00',NVL(R_c2,MX_RK),'01',NVL(AR_c2,MX_AP_RK),'11',NVL(PR_c2,MX_P_RK)) c2        \r\n" + 
			"      ,c3\r\n" + 
			"       ||' ('||TO_CHAR(ROUND(c3*100/tot,2),'FM990.09')||' %)' \r\n" + 
			"       ||DECODE(c3,GREATEST(c0,c1,c2,c3,c4,c5,c6,c7,c8,c9),'▲')\r\n" + 
			"       ||DECODE(c3,LEAST(c0,c1,c2,c3,c4,c5,c6,c7,c8,c9),'▼')\r\n" + 
			"       ||' *'||DECODE(GR,'00',NVL(R_c3,MX_RK),'01',NVL(AR_c3,MX_AP_RK),'11',NVL(PR_c3,MX_P_RK)) c3\r\n" + 
			"      ,c4 \r\n" + 
			"       ||' ('||TO_CHAR(ROUND(c4*100/tot,2),'FM990.09')||' %)' \r\n" + 
			"       ||DECODE(c4,GREATEST(c0,c1,c2,c3,c4,c5,c6,c7,c8,c9),'▲')\r\n" + 
			"       ||DECODE(c4,LEAST(c0,c1,c2,c3,c4,c5,c6,c7,c8,c9),'▼')\r\n" + 
			"       ||' *'||DECODE(GR,'00',NVL(R_c4,MX_RK),'01',NVL(AR_c4,MX_AP_RK),'11',NVL(PR_c4,MX_P_RK)) c4  \r\n" + 
			"      ,c5 \r\n" + 
			"       ||' ('||TO_CHAR(ROUND(c5*100/tot,2),'FM990.09')||' %)' \r\n" + 
			"       ||DECODE(c5,GREATEST(c0,c1,c2,c3,c4,c5,c6,c7,c8,c9),'▲')\r\n" + 
			"       ||DECODE(c5,LEAST(c0,c1,c2,c3,c4,c5,c6,c7,c8,c9),'▼')\r\n" + 
			"       ||' *'||DECODE(GR,'00',NVL(R_c5,MX_RK),'01',NVL(AR_c5,MX_AP_RK),'11',NVL(PR_c5,MX_P_RK)) c5 \r\n" + 
			"      ,c6 \r\n" + 
			"       ||' ('||TO_CHAR(ROUND(c6*100/tot,2),'FM990.09')||' %)' \r\n" + 
			"       ||DECODE(c6,GREATEST(c0,c1,c2,c3,c4,c5,c6,c7,c8,c9),'▲')\r\n" + 
			"       ||DECODE(c6,LEAST(c0,c1,c2,c3,c4,c5,c6,c7,c8,c9),'▼')\r\n" + 
			"       ||' *'||DECODE(GR,'00',NVL(R_c6,MX_RK),'01',NVL(AR_c6,MX_AP_RK),'11',NVL(PR_c6,MX_P_RK)) c6\r\n" + 
			"      ,c7 \r\n" + 
			"       ||' ('||TO_CHAR(ROUND(c7*100/tot,2),'FM990.09')||' %)' \r\n" + 
			"       ||DECODE(c7,GREATEST(c0,c1,c2,c3,c4,c5,c6,c7,c8,c9),'▲')\r\n" + 
			"       ||DECODE(c7,LEAST(c0,c1,c2,c3,c4,c5,c6,c7,c8,c9),'▼')\r\n" + 
			"       ||' *'||DECODE(GR,'00',NVL(R_c7,MX_RK),'01',NVL(AR_c7,MX_AP_RK),'11',NVL(PR_c7,MX_P_RK)) c7       \r\n" + 
			"      ,c8\r\n" + 
			"       ||' ('||TO_CHAR(ROUND(c8*100/tot,2),'FM990.09')||' %)' \r\n" + 
			"       ||DECODE(c8,GREATEST(c0,c1,c2,c3,c4,c5,c6,c7,c8,c9),'▲')\r\n" + 
			"       ||DECODE(c8,LEAST(c0,c1,c2,c3,c4,c5,c6,c7,c8,c9),'▼')\r\n" + 
			"       ||' *'||DECODE(GR,'00',NVL(R_c8,MX_RK),'01',NVL(AR_c8,MX_AP_RK),'11',NVL(PR_c8,MX_P_RK)) c8     \r\n" + 
			"      ,c9 \r\n" + 
			"       ||' ('||TO_CHAR(ROUND(c9*100/tot,2),'FM990.09')||' %)' \r\n" + 
			"       ||DECODE(c9,GREATEST(c0,c1,c2,c3,c4,c5,c6,c7,c8,c9),'▲')\r\n" + 
			"       ||DECODE(c9,LEAST(c0,c1,c2,c3,c4,c5,c6,c7,c8,c9),'▼')\r\n" + 
			"       ||' *'||DECODE(GR,'00',NVL(R_c9,MX_RK),'01',NVL(AR_c9,MX_AP_RK),'11',NVL(PR_c9,MX_P_RK)) c9\r\n" + 
			"      ,tot\r\n" + 
			"FROM (\r\n" + 
			"         SELECT MIN(CD_NM) CD_NM \r\n" + 
			"              ,AREA_CD\r\n" + 
			"              ,REGION_AREA\r\n" + 
			"              ,NVL(SUM(DECODE(PROD_ID,'100000',SALE_CNT)),0) c0  \r\n" + 
			"              ,NVL(SUM(DECODE(PROD_ID,'100001',SALE_CNT)),0) c1  \r\n" + 
			"              ,NVL(SUM(DECODE(PROD_ID,'100002',SALE_CNT)),0) c2  \r\n" + 
			"              ,NVL(SUM(DECODE(PROD_ID,'100003',SALE_CNT)),0) c3  \r\n" + 
			"              ,NVL(SUM(DECODE(PROD_ID,'100004',SALE_CNT)),0) c4  \r\n" + 
			"              ,NVL(SUM(DECODE(PROD_ID,'100005',SALE_CNT)),0) c5  \r\n" + 
			"              ,NVL(SUM(DECODE(PROD_ID,'100006',SALE_CNT)),0) c6 \r\n" + 
			"              ,NVL(SUM(DECODE(PROD_ID,'100007',SALE_CNT)),0) c7     \r\n" + 
			"              ,NVL(SUM(DECODE(PROD_ID,'100008',SALE_CNT)),0) c8     \r\n" + 
			"              ,NVL(SUM(DECODE(PROD_ID,'100009',SALE_CNT)),0) c9\r\n" + 
			"              ,MIN(DECODE(PROD_ID,'100000',RK)) R_c0\r\n" + 
			"              ,MIN(DECODE(PROD_ID,'100001',RK)) R_c1\r\n" + 
			"              ,MIN(DECODE(PROD_ID,'100002',RK)) R_c2\r\n" + 
			"              ,MIN(DECODE(PROD_ID,'100003',RK)) R_c3\r\n" + 
			"              ,MIN(DECODE(PROD_ID,'100004',RK)) R_c4\r\n" + 
			"              ,MIN(DECODE(PROD_ID,'100005',RK)) R_c5\r\n" + 
			"              ,MIN(DECODE(PROD_ID,'100006',RK)) R_c6\r\n" + 
			"              ,MIN(DECODE(PROD_ID,'100007',RK)) R_c7\r\n" + 
			"              ,MIN(DECODE(PROD_ID,'100008',RK)) R_c8\r\n" + 
			"              ,MIN(DECODE(PROD_ID,'100009',RK)) R_c9                        \r\n" + 
			"              ,MIN(DECODE(PROD_ID,'100000',AP_RK)) AR_c0\r\n" + 
			"              ,MIN(DECODE(PROD_ID,'100001',AP_RK)) AR_c1\r\n" + 
			"              ,MIN(DECODE(PROD_ID,'100002',AP_RK)) AR_c2\r\n" + 
			"              ,MIN(DECODE(PROD_ID,'100003',AP_RK)) AR_c3\r\n" + 
			"              ,MIN(DECODE(PROD_ID,'100004',AP_RK)) AR_c4\r\n" + 
			"              ,MIN(DECODE(PROD_ID,'100005',AP_RK)) AR_c5\r\n" + 
			"              ,MIN(DECODE(PROD_ID,'100006',AP_RK)) AR_c6\r\n" + 
			"              ,MIN(DECODE(PROD_ID,'100007',AP_RK)) AR_c7\r\n" + 
			"              ,MIN(DECODE(PROD_ID,'100008',AP_RK)) AR_c8\r\n" + 
			"              ,MIN(DECODE(PROD_ID,'100009',AP_RK)) AR_c9\r\n" + 
			"              ,MIN(DECODE(PROD_ID,'100000',P_RK)) PR_c0\r\n" + 
			"              ,MIN(DECODE(PROD_ID,'100001',P_RK)) PR_c1\r\n" + 
			"              ,MIN(DECODE(PROD_ID,'100002',P_RK)) PR_c2\r\n" + 
			"              ,MIN(DECODE(PROD_ID,'100003',P_RK)) PR_c3\r\n" + 
			"              ,MIN(DECODE(PROD_ID,'100004',P_RK)) PR_c4\r\n" + 
			"              ,MIN(DECODE(PROD_ID,'100005',P_RK)) PR_c5\r\n" + 
			"              ,MIN(DECODE(PROD_ID,'100006',P_RK)) PR_c6\r\n" + 
			"              ,MIN(DECODE(PROD_ID,'100007',P_RK)) PR_c7\r\n" + 
			"              ,MIN(DECODE(PROD_ID,'100008',P_RK)) PR_c8\r\n" + 
			"              ,MIN(DECODE(PROD_ID,'100009',P_RK)) PR_c9\r\n" + 
			"              ,MAX(RK)+1 MX_RK\r\n" + 
			"              ,MAX(AP_RK)+1 MX_AP_RK\r\n" + 
			"              ,MAX(P_RK)+1 MX_P_RK\r\n" + 
			"              ,NVL(SUM(SALE_CNT),0) tot \r\n" + 
			"              ,GROUPING(AREA_CD)||GROUPING(REGION_AREA) GR\r\n" + 
			"        FROM (\r\n" + 
			"                SELECT  AREA_CD\r\n" + 
			"                       ,REGION_AREA\r\n" + 
			"                       ,PROD_ID\r\n" + 
			"                       ,SALE_CNT\r\n" + 
			"                       ,RK\r\n" + 
			"                       ,DENSE_RANK() OVER(PARTITION BY AREA_CD ORDER BY AP_RK DESC ) AP_RK     \r\n" + 
			"                       ,DENSE_RANK() OVER( ORDER BY P_RK DESC ) P_RK\r\n" + 
			"                FROM (\r\n" + 
			"                        SELECT AREA_CD\r\n" + 
			"                              ,REGION_AREA\r\n" + 
			"                              ,PROD_ID\r\n" + 
			"                              ,SUM(SALE_CNT) SALE_CNT\r\n" + 
			"                              ,DENSE_RANK() OVER( PARTITION BY  AREA_CD ,REGION_AREA ORDER BY SUM(SALE_CNT) DESC ) RK\r\n" + 
			"                              ,SUM(SUM(SALE_CNT)) OVER(PARTITION BY AREA_CD,PROD_ID) AP_RK                      \r\n" + 
			"                              ,SUM(SUM(SALE_CNT)) OVER(PARTITION BY PROD_ID) P_RK\r\n" + 
			"                        FROM SALE_TBL\r\n" + 
			"                        WHERE ROWNUM <= 10000" + 
			"                        GROUP BY AREA_CD\r\n" + 
			"                                ,REGION_AREA\r\n" + 
			"                                ,PROD_ID \r\n" + 
			"                      )\r\n" + 
			"            ) TA, CD_TBL TB \r\n" + 
			"        WHERE TA.AREA_CD = TB.CD_ID\r\n" + 
			"        AND   LENGTH(TB.CD_ID) = 2\r\n" + 
			"        GROUP BY ROLLUP(AREA_CD ,REGION_AREA)                \r\n" + 
			"  )";
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table width="800" border="1">
<%
try{
   
     

	Class.forName("oracle.jdbc.driver.OracleDriver");

	conn = DriverManager.getConnection(url, user, pass);

	stmt = conn.createStatement();

	rs = stmt.executeQuery(sql);

    while(rs.next()){
        out.println("<tr>");
        out.println("<td>"+rs.getString("CD_NM")+"</td>");
        out.println("<td>"+rs.getString("REGION_AREA")+"</td>");
        out.println("<td>"+rs.getString("c0")+"</td>");
        out.println("<td>"+rs.getString("c1")+"</td>");
        out.println("<td>"+rs.getString("c2")+"</td>");
        out.println("<td>"+rs.getString("c3")+"</td>");
        out.println("<td>"+rs.getString("c4")+"</td>");
        out.println("<td>"+rs.getString("c5")+"</td>");
        out.println("<td>"+rs.getString("c6")+"</td>");
        out.println("<td>"+rs.getString("c7")+"</td>");
        out.println("<td>"+rs.getString("c8")+"</td>");
        out.println("<td>"+rs.getString("c9")+"</td>");
        out.println("<td>"+rs.getString("tot")+"</td>");
        out.println("</tr>");
    }
}catch(Exception e) {
	e.printStackTrace();
}finally{
	try{
		if(rs != null) 	 rs.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
}
     
%>
</table>
</body>
</html>