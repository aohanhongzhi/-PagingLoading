<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.thxopen.dt.bean.User" %>
<%@ page import="com.google.gson.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="com.thxopen.dt.sys.Config" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    ResultSet rs = null;
    Statement stmt = null;
    Connection conn = new Config(application).getConn();
    String table = "user";

    //直接返回前台
    String draw = request.getParameter("draw");
    //数据起始位置
    String startIndex = request.getParameter("startIndex");
    //数据长度
    String pageSize = request.getParameter("pageSize");

    //总记录数
    String total = "0";

    //定义列名
    String[] cols = {"name", "position", "salary", "start_date", "office", "extn", "status", "role"};
    //获取客户端需要那一列排序
    String orderColumn = request.getParameter("orderColumn");
    if(orderColumn == null){
    	orderColumn = "name";
    }
   
    //获取排序方式 默认为asc
    String orderDir = request.getParameter("orderDir");
    if(orderDir == null){
    	orderDir = "asc";
    }

    //获取用户过滤框里的字符
    List<String> sArray = new ArrayList<String>();
    
    String fuzzy = request.getParameter("fuzzySearch");
    if("true".equals(fuzzy)){
    	String searchValue = request.getParameter("fuzzy");
    	if (searchValue!=null&&!searchValue.equals("")) {
            sArray.add(" name like '%" + searchValue + "%'");
            sArray.add(" position like '%" + searchValue + "%'");
            sArray.add(" salary like '%" + searchValue + "%'");
            sArray.add(" start_date like '%" + searchValue + "%'");
            sArray.add(" office like '%" + searchValue + "%'");
            sArray.add(" extn like '%" + searchValue + "%'");
        }
    }else{
    	String name = request.getParameter("name");
    	if (name!=null&&!name.equals("")) {
            sArray.add(" name like '%" + name + "%'");
        }
    	String position = request.getParameter("position");
    	if (position!=null&&!position.equals("")) {
            sArray.add(" position like '%" + position + "%'");
        }
    	String office = request.getParameter("office");
    	if (office!=null&&!office.equals("")) {
            sArray.add(" office like '%" + office + "%'");
        }
    	String extn = request.getParameter("extn");
    	if (extn!=null&&!extn.equals("")) {
            sArray.add(" extn like '%" + extn + "%'");
        }
    	String role = request.getParameter("role");
    	if (role!=null&&!role.equals("")) {
            sArray.add(" role = " + role + "");
        }
    	String status = request.getParameter("status");
    	if (status!=null&&!status.equals("")) {
            sArray.add(" status = " + status + "");
        }
    }

    String individualSearch = "";
    if (sArray.size() == 1) {
        individualSearch = sArray.get(0);
    } else if (sArray.size() > 1) {
        for (int i = 0; i < sArray.size() - 1; i++) {
            individualSearch += sArray.get(i) + " and ";
        }
        individualSearch += sArray.get(sArray.size() - 1);
    }

    List<User> users = new ArrayList<User>();
    if (conn != null) {
        String recordsTotalSql = "select count(1) as total from " + table;
        stmt = conn.createStatement();

        String searchSQL = "";
        String sql = "SELECT * FROM " + table;
        if (individualSearch != "") {
            searchSQL = " where " + individualSearch;
        }
        sql += searchSQL;
        recordsTotalSql += searchSQL;
        sql += " order by " + orderColumn + " " + orderDir;
        recordsTotalSql += " order by " + orderColumn + " " + orderDir;
        sql += " limit " + startIndex + ", " + pageSize;


        rs = stmt.executeQuery(sql);
        while (rs.next()) {
            users.add(new User(rs.getString("name"),
                    rs.getString("position"),
                    rs.getString("salary"),
                    rs.getString("start_date"),
                    rs.getString("office"),
                    rs.getString("extn"),
                    rs.getInt("status"),
                    rs.getInt("role")
                    ));
        }

        rs = stmt.executeQuery(recordsTotalSql);
        while (rs.next()) {
            total = rs.getString("total");
        }
    }


    Map<Object, Object> info = new HashMap<Object, Object>();
    info.put("pageData", users);
    info.put("total", total);
    info.put("draw", draw);
    String json = new Gson().toJson(info);
    rs.close();
    stmt.close();
    conn.close();
    out.write(json);
%>
