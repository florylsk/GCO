<%@page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
        <%-- Meta tags --%>
        <meta charset="utf-8" />
        <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
        <meta name="viewport" content="width=device-width" />

        <%-- Title --%>
        <title>Recipes - GCO</title>

        <%-- CSS and JS--%>
        <link href="${pageContext.request.contextPath}/resources/css/halfmoon-variables.min.css" rel="stylesheet" />
        <script src="${pageContext.request.contextPath}/resources/js/halfmoon.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/fa.7465cf6e1c.js"></script>
        <script type="text/javascript">
  			function correct_Update(){
	         	halfmoon.initStickyAlert({
		        content: "Usuario modificado con éxito",
		        title: "Éxito",
		        alertType: "alert-success",
		        hasDismissButton: true,
		        timeShown: 5000,
		    })
				}
  			function incorrect_Update(){
	         	halfmoon.initStickyAlert({
		        content: "El usuario no ha podido ser modificado",
		        title: "Algo ha ido mal",
		        alertType: "alert-danger",
		        hasDismissButton: true,
		        timeShown: 5000,
		    })
				}
  			function correct_Delete(){
	         	halfmoon.initStickyAlert({
		        content: "Usuario eliminado con éxito",
		        title: "Éxito",
		        alertType: "alert-success",
		        hasDismissButton: true,
		        timeShown: 5000,
		    })
				}
  			function incorrect_Delete(){
	         	halfmoon.initStickyAlert({
		        content: "El usuario no ha podido ser eliminado",
		        title: "Algo ha ido mal",
		        alertType: "alert-danger",
		        hasDismissButton: true,
		        timeShown: 5000,
		    })
				}
  			</script>
</head>
<body class="dark-mode with-custom-webkit-scrollbars with-custom-css-scrollbars" data-dm-shortcut-enabled="true" data-set-preferred-mode-onload="true">
		<%@page import="beans.*,java.util.*"%>  
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
		
		
		
		
		
		
		<div  class="page-wrapper with-navbar with-navbar-fixed-bottom" data-sidebar-type="overlayed-sm-and-down">
		<%-- Sticky alerts (toasts), empty container --%>
            <div class="sticky-alerts"></div>
			 <c:if test="${correctUpdatedUser == true}">
				 				<script>
				 				 window.onload = function() {
				 				    correct_Update();
				 				  };
						         	</script>
						         	
									<%
										request.setAttribute("correctUpdatedUser",false);
									%>
						    	 </c:if>
			 <c:if test="${incorrectUpdatedUser == true}">
				 				<script>
				 				 window.onload = function() {
				 				    incorrect_Update();
				 				  };
						         	</script>
						         	
									<%
										request.setAttribute("incorrectUpdatedUser",false);
									%>
						    	 </c:if>
			 <c:if test="${correctDeletedUser == true}">
				 				<script>
				 				 window.onload = function() {
				 				    correct_Delete();
				 				  };
						         	</script>
						         	
									<%
										request.setAttribute("correctDeletedUser",false);
									%>
						    	 </c:if>
			 <c:if test="${incorrectDeletedUser == true}">
				 				<script>
				 				 window.onload = function() {
				 				    incorrect_Delete();
				 				  };
						         	</script>
						         	
									<%
										request.setAttribute("incorrectDeletedUser",false);
									%>
						    	 </c:if>
            
            
        
            
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
          			<li class="nav-item">
           				 <a href="admin.jsp" class="nav-link">Home</a>
           		    <li class="nav-item">
           				 <a href="recipesAdmin.jsp" class="nav-link">Recetas</a>
      			  	<li class="nav-item active">
           				 <a href="usersAdmin.jsp" class="nav-link">Usuarios</a>
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
            
            
            
            <div class="w-400 m-auto my-20">
	                	<form action="searchUser" class="form-inline" method="post" >
	   						<input type="text" id="searchInput" class="form-control" onkeyup="searchFunction()" placeholder="Búsqueda por nombre" title="Escribe un nombre">		

	                	</form>	
	                </div>
            
            <div id="users">
            
            	<%  
					List<User> users=userDAO.getAllUsers();
					request.setAttribute("users",users);  
				%> 
                	<table class="table table-striped table-hover sortable" id="Users">
            			<thead>
              				<tr>
                 				<th style="width: 20%">Username</th>
                 				<th style="width: 20%">Nombre</th>
                 				<th style="width: 20%">Apellidos</th>
                 				<th style="width: 20%">E-Mail</th>
                 				<th class="text-right" style="width: 20%">Acciones</th>
              				</tr>
		            	</thead>
        		    	<tbody>
            
            		<c:forEach items="${users}" var="u">
        		    			<tr>
        		    				<th>
        		    					${u.getUsername()}
        		    				</th>
        		    				<td>
        		    					${u.getFirstname()}
        		    				</td>
        		    				<td>
        		    					${u.getLastname()}
        		    				</td>
        		    				<td>
        		    					${u.getMail()}
        		    				</td>
        		    				<td class="text text-right">
				            		  <a href="#modal-update-user-${u.getUsername()}" class="btn btn-square btn-primary ml-5" role="button"><i class="fas fa-edit"></i></a>
				            		  <a href="#modal-delete-user-${u.getUsername()}" class="btn btn-square btn-danger ml-5" role="button"><i class="fas fa-trash"></i></a>	  
				            		</td>
        		    			</tr>
        		    			<div class="modal" id="modal-update-user-${u.getUsername()}" tabindex="-1" role="dialog">
              							  <div class="modal-dialog" role="document">
                   							 <div class="modal-content">
                     						   <h5 class="modal-title text-center">Modificar Usuario</h5>
						                        <form id="update-user" action="updateUser" method="post">
						                             <input type="hidden" id="update-user-username" name="username" value="${u.getUsername()}">
						                             <input type="hidden" id="update-user-password" name="password" value="${u.getPassword()}">
						                            <div class="form-group text-left">
						                                <label for="update-user-firstname" class="required">Nombre</label>
						                                <input type="text" name="firstname" id="update-user-firstname" class="form-control" required="required" value="${u.getFirstname()}" />
						                            </div>
						                            
						                            <div class="form-group text-left">
						                                <label for="update-user-lastname" class="required">Apellidos</label>
						                                <input type="text" name="lastname" id="update-user-lastname" class="form-control" required="required" value="${u.getLastname()}" />
						                            </div>
						                            
						                            <div class="form-group text-left">
						                                <label for="update-user-mail" class="required">E-Mail</label>
						                                <input type="text" name="mail" id="update-user-mail" class="form-control" required="required" value="${u.getMail()}" />
						                            </div>
						                            
						                            <div class="text-center mt-20">
						                            <a class="btn mr-5" href="#" type="button">Cancelar</a>
						                            <input class="btn btn-primary" type="submit" value="Modificar Usuario">
						                      	    </div>
						                        </form>
                        
								       </div>
								 </div>
						</div>
						
						    									  				
    		    			 <div class="modal" id="modal-delete-user-${u.getUsername()}" tabindex="-1" role="dialog">
           						<div class="modal-dialog" role="document">
               						<div class="modal-content">
                						 <h5 class="modal-title text-center">Borrar usuario</h5>
                 							 <p class="text-left">
                      						¿Está seguro de querer borrar al usuario ${u.getFirstname()} ${u.getLastname()}?
                    						</p>
                 						 <div class="text-center">
                       						 <form action="deleteUser" method="post">
                       					<a class="btn mr-5" href="#"  type="button">Cancelar</a>
										<button type="submit"name="username" value="${r.getUsername()}"class="btn btn-danger" type="button" >Borrar Usuario</button>
								</form>
                        
                   					 </div>
               					</div>
           				 </div>
           			 </div>
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
     		
					<script>
							function searchFunction() {
 							 var input, filter, table, tr, td, i, txtValue;
 							 input = document.getElementById("searchInput");
 							 filter = input.value.toUpperCase();
  							table = document.getElementById("users");
  							tr = table.getElementsByTagName("tr");
 							 for (i = 0; i < tr.length; i++) {
   								 td = tr[i].getElementsByTagName("td")[0];
   								 if (td) {
      								txtValue = td.textContent || td.innerText;
      								if (txtValue.toUpperCase().indexOf(filter) > -1) {
        							tr[i].style.display = "";
      								} else {
       									 tr[i].style.display = "none";
     								 }
   								 }       
 							 }
							}
					</script>
	

	</body>

</html>    