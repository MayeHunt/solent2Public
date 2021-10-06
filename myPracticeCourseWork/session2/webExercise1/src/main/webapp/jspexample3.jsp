<%-- 
    Document   : jspexample3
    Created on : 22-Jul-2021, 11:16:28
    Author     : admin
    THIS EXAMPLE SHOWS HOW OBJECTS CAN BE STORED IN THE SESSION
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
    // retrieve the stored users list from the session
    List<String> users = (List<String>) session.getAttribute("users");
    if (users == null) {
        users = new ArrayList<String>();
        session.setAttribute("users", users);
    }
    
    List<String> addresses = (List<String>) session.getAttribute("addresses");
    if (addresses == null) {
        addresses = new ArrayList<String>();
        session.setAttribute("addresses", addresses);
    }


    String name = request.getParameter("userName");
    String address = request.getParameter("userAddress");

    // find what action to perform on the page
    String action = request.getParameter("action");

    if ("removeUser".equals(action)) {
        users.remove(name);
    } else if ("addUser".equals(action)) {
        users.add(name);
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Example 3</title>
    </head>
    <body>
        <h1>JSP Example 3: User list</h1>

        
        <table>
            <tr>
                <th>
                    user list
                </th>
                <th>
                    address
                </th>
            </tr>
                <% for (String user : users) {%>
                    <tr>
                        <td><%=user%></td>
                        <td><%=addresses%></td>
                        <td><form action="./jspexample3.jsp" method="get">
                            <input type="hidden" name="userName" value=<%=user%>>
                            <input type="hidden" name="action" value="removeUser">
                            <button type="submit" >remove</button>
                            </form></td>
                    </tr>
                
                    
                    <%
                        }
                    %>
            
        </table>
        
        <h2>commands</h2>
        <form action="./jspexample3.jsp" method="get">
            <p>user name <input type="text" name="userName" value=""></p>
            <input type="hidden" name="action" value="addUser">
            <p>user address <input type="text" name="userAddress" value=""></p>
            <input type="hidden" name="action" value="addAddress">
            <button type="submit" >add name to list</button>
        </form> 
        <br>
        <form action="./jspexample3.jsp" method="get">
            <p>user name <input type="text" name="userName" value=""></p>
            <input type="hidden" name="action" value="removeUser">
            <button type="submit" >remove name from list</button>
        </form> 


    </body>
</html>

