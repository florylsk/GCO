<%@page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
        <%-- Meta tags --%>
        <meta charset="utf-8" />
        <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
        <meta name="viewport" content="width=device-width" />

        <%-- Title --%>
        <title>Search - GCO</title>

        <%-- CSS and JS--%>
        <link href="${pageContext.request.contextPath}/resources/css/halfmoon-variables.min.css" rel="stylesheet" />
        <script src="${pageContext.request.contextPath}/resources/js/halfmoon.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/fa.7465cf6e1c.js"></script>
        <script type="text/javascript">
  			function correct_Update(){
	         	halfmoon.initStickyAlert({
		        content: "Receta modificada con éxito",
		        title: "Éxito",
		        alertType: "alert-success",
		        hasDismissButton: true,
		        timeShown: 5000,
		    })
				}
  			function incorrect_Update(){
	         	halfmoon.initStickyAlert({
		        content: "La receta no ha podido ser modificada",
		        title: "Algo ha ido mal",
		        alertType: "alert-danger",
		        hasDismissButton: true,
		        timeShown: 5000,
		    })
				}
  			function correct_Delete(){
	         	halfmoon.initStickyAlert({
		        content: "Receta eliminada con éxito",
		        title: "Éxito",
		        alertType: "alert-success",
		        hasDismissButton: true,
		        timeShown: 5000,
		    })
				}
  			function incorrect_Delete(){
	         	halfmoon.initStickyAlert({
		        content: "La receta no ha podido ser eliminada",
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
			 <c:if test="${correctUpdatedRecipe == true}">
				 				<script>
				 				 window.onload = function() {
				 				    correct_Update();
				 				  };
						         	</script>
						         	
									<%
										request.setAttribute("correctUpdatedRecipe",false);
									%>
						    	 </c:if>
			 <c:if test="${incorrectUpdatedRecipe == true}">
				 				<script>
				 				 window.onload = function() {
				 				    incorrect_Update();
				 				  };
						         	</script>
						         	
									<%
										request.setAttribute("incorrectUpdatedRecipe",false);
									%>
						    	 </c:if>
			 <c:if test="${correctDeletedRecipe == true}">
				 				<script>
				 				 window.onload = function() {
				 				    correct_Delete();
				 				  };
						         	</script>
						         	
									<%
										request.setAttribute("correctDeletedRecipe",false);
									%>
						    	 </c:if>
			 <c:if test="${incorrectDeletedRecipe == true}">
				 				<script>
				 				 window.onload = function() {
				 				    incorrect_Delete();
				 				  };
						         	</script>
						         	
									<%
										request.setAttribute("incorrectDeletedRecipe",false);
									%>
						    	 </c:if>
		
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
                    Almon
                </a>
                <ul class="navbar-nav d-none d-md-flex"> <!-- d-none = display: none, d-md-flex = display: flex on medium screens and up (width > 768px) -->
          			<li class="nav-item">
           				 <a href="index.jsp" class="nav-link">Home</a>
      			 
      			  <li class="nav-item active">
           				 <a href="search.jsp" class="nav-link">Search</a>
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
            
            <!-- search -->
            
            <div class="content-wrapper ">
            
	            <div class="w-400 m-auto my-20">
	                	<form action="searchRecipes" class="form-inline" method="post" >
	   							<input type="text" id="searchInput" class="form-control" name="keyword" placeholder="Introduzca una palabra clave" title="Búsqueda de recetas">		
	 							<input class="btn btn-primary" type="submit" value="Buscar">
	                	</form>
	                </div>
	                
	                
	             <div id="recipes-searched">
                	<table class="table table-striped table-hover sortable" id="Recetas">
            			<thead>
              				<tr>
                 				<th style="width: 90">Receta</th>
                 				<th class="text text-right" style="width: 10%">Acciones</th>
              				</tr>
		            	</thead>
        		    	<tbody>
            
	            <c:forEach items="${recipesSearched}" var="r">
	            	<tr>
	            		<td><a href="#modal-description-receta-${r.getId()}">${r.getNombre()}</a></td>	
	            		<td class="text text-right">
	            		  <a href="#modal-update-recipe-${r.getId()}" class="btn btn-square btn-primary ml-5" role="button"><i class="fas fa-edit"></i></a>
	            		  <a href="#modal-delete-recipe-${r.getId()}" class="btn btn-square btn-danger ml-5" role="button"><i class="fas fa-trash"></i></a>	  
	            		  
	            		</td>
	            	</tr>
	            	<div class="modal modal-full" id="modal-description-receta-${r.getId()}" tabindex="-1" role="dialog">
              							  <div class="modal-dialog" role="document">
                   							 <div class="modal-content"> 
                       						   <h4 class="modal-text text-center font-weight-bold">${r.getNombre()}</h4>
                       						   <h5 class="modal-text text-left font-weight-bold">Ingredientes</h5>
                       						   <p>${r.getIngredientes()}<p>
                       						   <h5 class="modal-text text-left font-weight-bold">Receta</h5>
                       						   <p>${r.getDescripcion()}<p>
								        </div>
								   </div>
								 </div>
								 
				 	<div class="modal" id="modal-update-recipe-${r.getId()}" tabindex="-1" role="dialog">
              							  <div class="modal-dialog" role="document">
                   							 <div class="modal-content">
                     						   <h5 class="modal-title text-center">Modificar Receta</h5>
						                        <form id="update-recipe" action="updateRecipe" method="post">
						                             <input type="hidden" id="update-recipe-id" name="id" value="${r.getId()}">
						                            <div class="form-group text-left">
						                                <label for="update-student-firstname" class="required">Nombre</label>
						                                <input type="text" name="name" id="update-recipe-nombre" class="form-control" required="required" value="${r.getNombre()}" />
						                            </div>
						                            <div class="form-group text-left">
						                                <label for="update-student-surnames" class="required">Apellidos</label>
						                                <textarea name="ingredients" id="update-recipe-ingredientes" class="form-control" required="required">${r.getIngredientes()}</textarea>
						                            </div>
						                            <div class="form-group text-left">
						                                <label for="update-student-birth" class="required">Fecha de nacimiento</label>
						                                <textarea name="recipe" id="update-recipe-receta" class="form-control" required="required">${r.getDescripcion()}</textarea>
						                            </div>
						                            <div class="text-center mt-20">
						                            <a class="btn mr-5" href="#" type="button">Cancelar</a>
						                            <input class="btn btn-primary" type="submit" value="Modificar estudiante">
						                      	    </div>
						                        </form>
                        
								       </div>
								 </div>
						</div>
						
						    									  				
    		    			 <div class="modal" id="modal-delete-recipe-${r.getId()}" tabindex="-1" role="dialog">
           						<div class="modal-dialog" role="document">
               						<div class="modal-content">
                						 <h5 class="modal-title text-center">Borrar receta</h5>
                 							 <p class="text-left">
                      						¿Está seguro de querer borrar la receta ${r.getNombre()}?
                    						</p>
                 						 <div class="text-center">
                       						 <form action="deleteRecipe" method="post">
                       					<a class="btn mr-5" href="#"  type="button">Cancelar</a>
										<button type="submit"name="id" value="${r.getId()}"class="btn btn-danger" type="button" >Borrar Estudiante</button>
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
            
            
            
          		

	

	</body>

</html>  
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            