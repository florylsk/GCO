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
        <script type="text/javascript">
  			function correct_Add(){
	         	halfmoon.initStickyAlert({
		        content: "Receta añadida con éxito",
		        title: "Éxito",
		        alertType: "alert-success",
		        hasDismissButton: true,
		        timeShown: 5000,
		    })
				}
  			function incorrect_Add(){
	         	halfmoon.initStickyAlert({
		        content: "Algo ha ido mal",
		        title: "Receta no añadida",
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
				<%  
					List<Recipe> recetas=RecipeDAO.getAllRecipes();
					request.setAttribute("recetas",recetas);  
					Recipe RecetaToShow=(Recipe)request.getAttribute("recipeToShow");
					request.setAttribute("Receta",RecetaToShow);
				%>

	<div  class="page-wrapper with-navbar with-sidebar" data-sidebar-type="overlayed-sm-and-down">
		<%-- Sticky alerts (toasts), empty container --%>
            <div class="sticky-alerts"></div>
			 <c:if test="${correctAddedRecipe == true}">
				 				<script>
				 				 window.onload = function() {
				 				    correct_Add();
				 				  };
						         	</script>
						         	
									<%
										request.setAttribute("correctAddedRecipe",false);
									%>
						    	 </c:if>
			 <c:if test="${incorrectAddedRecipe == true}">
				 				<script>
				 				 window.onload = function() {
				 				    incorrect_Add();
				 				  };
						         	</script>
						         	
									<%
										request.setAttribute("incorrectAddedRecipe",false);
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
                    Recetas
                </a>
                <ul class="navbar-nav d-none d-md-flex"> <!-- d-none = display: none, d-md-flex = display: flex on medium screens and up (width > 768px) -->
          			<li class="nav-item active">
           				 <a href="index.jsp" class="nav-link">Home</a>
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
					 <!-- Sidebar overlay -->
		      <div class="sidebar-overlay" onclick="halfmoon.toggleSidebar()"></div>
		
		      <!-- Sidebar start -->
		      <div class="sidebar">
		        <div class="sidebar-menu">
		          <!-- Sidebar links and titles -->
		          <h5 class="sidebar-title">Recetas <a href="#modal-add-recipe" class="btn btn-rounded btn-primary btn-sm" style="float: right;" role="button">Añadir</a> </h5>
		          <div class="sidebar-divider"></div>
		          <c:forEach items="${recetas}" var="r">
		          		<c:choose>
				          <c:when test="${r.getId() == Receta.getId()}">
						 				<form id="show-recipe-${r.getId()}" action="showRecipe" method="post">
								          <a href="#" class="sidebar-link active" onclick="document.getElementById('show-recipe-${r.getId()}').submit();" >${r.getNombre()}</a>
								          <input type="hidden" id="show-recipe" name="recipeName" value="${r.getId()}">
						
										</form>
								    	 </c:when>
						  <c:otherwise>
					          <form id="show-recipe-${r.getId()}" action="showRecipe" method="post">
					          <a href="#" class="sidebar-link" onclick="document.getElementById('show-recipe-${r.getId()}').submit();" >${r.getNombre()}</a>
					          <input type="hidden" id="show-recipe" name="recipeName" value="${r.getId()}">
					          </form>
					      </c:otherwise>
		
						
						 
						</c:choose>
		          </c:forEach>
		        </div>
		      </div>
		      <!-- Sidebar end -->
		      
		      <div class="modal" id="modal-add-recipe" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <h5 class="modal-title text-center">Añadir Receta</h5>
                        <form id="add-recipe" action="addRecipe" method="post">
                            <div class="form-group">
                                <label for="create-student-firstname" class="required">Nombre</label>
                                <input type="text" name="name" id="create-recipe-name" class="form-control" required="required" placeholder="Nombre de la receta"/>
                            </div>
                            <div class="form-group">
                                <label for="create-student-ingredients" class="required">Ingredientes</label>
                                <input type="text" name="ingredients" id="create-recipe-ingredients" class="form-control" required="required" placeholder="Ingredientes de la receta"/>
                            </div>
                            <div class="form-group">
                                <label for="create-student-recipe" class="required">Receta</label>
                                <input type="text" name="recipe" id="create-recipe-recipe" class="form-control" required="required" placeholder="Pasos para su preparación"/>
                            </div>
                            <div class="text-center mt-20">
                            	<a class="btn mr-5" href="#"  type="button">Cancelar</a>
                            	<input class="btn btn-primary" type="submit" value="Añadir Receta">
                      	    </div>
                        </form>
                        
                    </div>
                </div>
            </div>

						<c:if test="${Receta.getId()>0}">
								<div class="content-wrapper">
				        			<div class="container-fluid">
				           			 <div class="row">
				               			 <div class="col col-xl-12">
				               			 	<h3 class="text-center font-weight-bold">${Receta.getNombre()}</h3>
				               			 	 <div class="card p-0">
							                    <div class="content">
							                      <h2 class="content-title font-weight-bold">
							                        Ingredientes
							                      </h2>
							                      <p>
							                          ${Receta.getIngredientes()}
							                      </p>
													<h2 class="content-title font-weight-bold">
							                        Receta
							                      </h2>
							                      <p>
							                          ${Receta.getDescripcion()}
							                      </p>
							                    </div>
							                    </div>
				               			 	
				               			 	
				               			 	
				              			</div>
				              		 </div>
				              	 </div>
				               </div>
				               </c:if>
		</div>

	

	</body>

</html>
























