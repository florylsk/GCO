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
				<%  
					List<Recipe> recetas=RecipeDAO.getAllRecipes();
					request.setAttribute("recetas",recetas);  
					String idRecetaToShow=(String)request.getAttribute("recipeToShow");
					Recipe varRecipe=null;
					for (Recipe r: recetas){
						if (r.getId().equals(idRecetaToShow)){
							varRecipe=new Recipe(r.getId(),r.getNombre(),r.getIngredientes(),r.getDescripcion());
						}
					}
					request.setAttribute("Receta",varRecipe);
				%>

	<div  class="page-wrapper with-navbar with-sidebar" data-sidebar-type="overlayed-sm-and-down"">
		
		
		<%-- Navbar --%>
            <nav class="navbar">
		            <div class="navbar-content">
		         <button id="toggle-sidebar-btn" class="btn btn-action" type="button" onclick="halfmoon.toggleSidebar()">
		             <img src="${pageContext.request.contextPath}/resources/images/Hamburger_icon_dark.png" height="100%" width="70%" alt="missing file">
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
		          <h5 class="sidebar-title">Recetas</h5>
		          <div class="sidebar-divider"></div>
		          <c:forEach items="${recetas}" var="r">
		          <form id="show-recipe-${r.getId()}" action="showRecipe" method="post">
		          <a href="#" class="sidebar-link" onclick="document.getElementById('show-recipe-${r.getId()}').submit();" >${r.getNombre()}</a>
		          <input type="hidden" id="show-recipe" name="recipeName" value="${r.getId()}">

				</form>
		          </c:forEach>
		        </div>
		      </div>
		      <!-- Sidebar end -->

				
								<div class="content-wrapper">
				        			<div class="container-fluid">
				           			 <div class="row">
				               			 <div class="col col-xl-9">
				               			 	<h3> &nbsp;&nbsp;&nbsp;${Receta.getNombre()}</h3>
				               			 	 <div class="card p-0">
							                    <div class="content">
							                      <h2 class="content-title">
							                        Ingredientes
							                      </h2>
							                      <p>
							                          ${Receta.getIngredientes()}
							                      </p>
													<h2 class="content-title">
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
		</div>

	

	</body>

</html>
























