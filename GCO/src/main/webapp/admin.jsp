<%@page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
        <%-- Meta tags --%>
        <meta charset="utf-8" />
        <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
        <meta name="viewport" content="width=device-width" />

        <%-- Title --%>
        <title>Home - GCO</title>

        <%-- CSS and JS--%>
        <link href="${pageContext.request.contextPath}/resources/css/halfmoon-variables.min.css" rel="stylesheet" />
        <script src="${pageContext.request.contextPath}/resources/js/halfmoon.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/fa.7465cf6e1c.js"></script>
</head>
<body class="dark-mode with-custom-webkit-scrollbars with-custom-css-scrollbars" data-dm-shortcut-enabled="true" data-set-preferred-mode-onload="true">
		<%@page import="beans.*,java.util.*"%>  
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
		
		
		
		
		
		
		<div  class="page-wrapper with-navbar with-navbar-fixed-bottom" data-sidebar-type="overlayed-sm-and-down">
		<%-- Sticky alerts (toasts), empty container --%>
            <div class="sticky-alerts"></div>
            
            
            
        
            
        <%-- Navbar --%>
            <nav class="navbar">
		            <div class="navbar-content">
		         <button id="toggle-sidebar-btn" class="btn btn-action" type="button" onclick="halfmoon.toggleSidebar()">
		             <i class="fas fa-bars"></i>
		         </button>
		       </div>
                <%-- Navbar brand --%>
                <a href="index.jsp" class="navbar-brand font-size-16">
                    <img alt="UPFV Dark Mode Logo" class="hidden-lm" src="${pageContext.request.contextPath}/resources/images/logo_white_small.png">
                    <img alt="UPFV Light Mode Logo" class="hidden-dm" src="${pageContext.request.contextPath}/resources/images/logo_black_small.png">
                    Administración
                </a>
                <ul class="navbar-nav d-none d-md-flex"> <!-- d-none = display: none, d-md-flex = display: flex on medium screens and up (width > 768px) -->
          			<li class="nav-item active">
           				 <a href="admin.jsp" class="nav-link">Home</a>
      			  </ul>
                <%-- Navbar form. Here, search, help and profile buttons are shown --%>
                <div class="navbar-content d-none d-md-flex ml-auto">
                    <%-- dark mode button --%>
                    <button class="btn btn-action ml-10" onclick="halfmoon.toggleDarkMode()">
            				<i class="fas fa-moon"></i>
           				 <span class="sr-only">Modo oscuro</span>
      				  </button>
                    <%-- Profile dropdown --%>
                    <div class="dropdown with-arrow">
                        <%-- Button --%>
                        <button class="btn btn-action btn-primary ml-10" data-toggle="dropdown" type="button" id="navbar-dropdown-profile">
                            <i class="fas fa-user"></i>
                            <span class="sr-only">Perfil</span>
                        </button>
                        <%-- Content --%>
                        <div class="dropdown-menu dropdown-menu-right w-300" aria-labelledby="navbar-dropdown-profile">
                            <div class="inline-block text-center mw-full mt-10">
                                <img alt="Profile image" src="${pageContext.request.contextPath}/resources/images/profile.jpeg" id="profile-image" class="inline w-150" />
                            </div>
                            <div class="dropdown-item text-center font-size-20" id="profile-name">${nombre} ${apellido}</div>
                            <a href="#" class="dropdown-item" onclick="halfmoon.toggleDarkMode()">
                                <span class="hidden-lm"><i class="fas fa-sun"></i> Modo claro</span>
                                <span class="hidden-dm"><i class="fas fa-moon"></i> Modo oscuro</span>
                            </a>
                            <a href="/GCO/userlogout" class="dropdown-item text-danger"><i class="fas fa-sign-out-alt"></i> Cerrar sesión</a>
                        </div>
                    </div>
                </div>
				
            </nav>
            
            
            <div class="content-wrapper ">
            	<%-- crear la lista con los registros llamando al DAO --%>
                <%  
					List<Record> records=RecordDAO.getAllRecords();
					request.setAttribute("records",records);  
				%>  
            
            <div id="records">
                	<table class="table table-striped" id="records">
            			<thead>
              				<tr>
                 				<th style="width: 20%">Username</th>
                 				<th style="width: 20%">Nombre</th>
                 				<th style="width: 20%">Apellidos</th>
                 				<th style="width: 20%">Fecha inicio</th>
                 				<th style="width: 20%">Fecha Salida</th>
              				</tr>
		            	</thead>
        		    	<tbody>
        		    		<c:forEach items="${records}" var="r">
        		    			<tr>
        		    				<th>
        		    					${r.getUsername()}
        		    				</th>
        		    				<td>
        		    					${r.getFirstname()}
        		    				</td>
        		    				<td>
        		    					${r.getLastname()}
        		    				</td>
        		    				<td>
        		    					${r.getStartTime()}
        		    				</td>
        		    				<td>
        		    					${r.getEndTime()}
        		    				</td>
        		    			</tr>
        		    		</c:forEach>
        		    		
            			</tbody>
            			
            			
            		</table>
            		<div class="divider mt-0 mb-5 border-bottom"></div>
                </div>
            
            </div>
            
            

            
            
            <nav class="navbar navbar-fixed-bottom">
                	<div class="container-fluid">
                   	 <ul class="navbar-nav ml-auto">
                      	  <li class="nav-item">
                        	    <a href="#" class="nav-link">Política de privacidad</a>
                      	  </li>
                  	  </ul>
                  	  <span class="navbar-text"> &copy; Almon </span>
               	 </div>
			</nav>
		</div>
     		

	

	</body>

</html>       
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            