<%@page import="java.util.Iterator"%>
<%@page import="model.Usuario"%>
<%@page import="dao.AccederUsuarioDAO"%>
<%@page import="model.Turnos"%>
<%@page import="java.util.List"%>
<%@page import="dao.TurnosDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" />
<!-- Google Fonts Roboto -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" />
<!-- MDB -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.4.0/mdb.min.css" />
<!-- Custom styles -->
<link rel="stylesheet" href="css/style.css" />
<!-- Bootstrap 5.2 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous" />

</head>

<!-- Navbar -->
<nav class="navbar navbar-expand-md navbar-light ">
	<!-- Container wrapper -->
	<div class="container-fluid">
		<!-- Navbar brand -->
		<a class="navbar-brand me-4" href=""> <img src="IMG/logo.png"
			height="35" alt="PS Logo" loading="lazy" style="margin-top: -1px" />
		</a>

		<!-- Toggle button -->
		<button class="navbar-toggler" type="button"
			data-mdb-toggle="collapse" data-mdb-target="#navbarButtonsExample"
			aria-controls="navbarButtonsExample" aria-expanded="false"
			aria-label="Toggle navigation">
			<i class="fas fa-bars"></i>
		</button>

		<!-- Collapsible wrapper -->
		<div class="collapse navbar-collapse" id="navbarButtonsExample">
			<!-- Left links -->
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link fs-4" href="#">Program
						Salud</a></li>
			</ul>
			<!-- Left links -->

			<button type="button" class="btn btn-outline-info me-3"
				data-mdb-ripple-color="dark">Ingresar</button>
			<button type="button" class="btn btn-primary me-3">Registrate</button>
			<!-- Git del Proyecto -->
			<a class="btn btn-dark px-3" href="" role="button"><i
				class="fab fa-github"></i></a>
		</div>
	</div>
	<!-- Collapsible wrapper -->
	</div>
	<!-- Container wrapper -->
</nav>
<!-- Navbar -->

<body>

	<%
	Integer dni = Integer.parseInt(request.getParameter("dni"));

	AccederUsuarioDAO accederUsuarioDAO = new AccederUsuarioDAO();
	List<Usuario> usuario = accederUsuarioDAO.accederUsuario(dni);

	Integer id_U = usuario.get(0).getId();
	%>

	<section id="BG_Turnos" class="d-flex">
		<div style="width: 100%; min-height: 100vh; ">
			<div class="mt-2 w-100" style="top: 10%; color:lightskyblue;">

				<div
					class="container bg-white bg-opacity-75 rounded border border-secondary">
					<div class="row">
						<div class="col">

							<table
								class="table table-sm table-responsive-md align-middle table-hover">
								<thead class="table-primary">
									<tr>
										<th>Especialidad</th>
										<th>Nombre profesional</th>
										<th>Fecha</th>
										<th>Hora</th>
										<th>Consultorio</th>
										<th></th>

									</tr>
								</thead>
								<%
								TurnosDAO turnosDAO = new TurnosDAO();
								List<Turnos> turnos = turnosDAO.ListarTurnos();
								Iterator<Turnos> iter = turnos.iterator();
								Turnos turno = null;

								while (iter.hasNext()) {
									turno = iter.next();
								%>

								<tbody>
									<tr>
										<td><p class="fw-bold mb-1"><%=turno.getEspecialidad()%></p></td>
										<td><%=turno.getNom_prof()%></td>
										<td><%=turno.getFecha()%></td>
										<td><%=turno.getHora()%></td>
										<td><%=turno.getConsultorio()%></td>
										<td>
											<p>
												<abbr title="TOMAR"><button type="button"
														class="btn btn-link btn-md px-3" style="color: green"
														data-ripple-color="dark">
														<i class="fas fa-check"></i>
													</button></abbr>
											</p>
										</td>
									</tr>
									<%
									}
									%>
								</tbody>
							</table>

						</div>
					</div>
				</div>


			</div>

		</div>
		</div>
	</section>


	<footer class="fixed-bottom bg-light text-center text-white">

		<!-- Copyright -->
		<div class="text-center p-2 "
			style="background-color: rgba(0, 0, 0, 0.2);">
			© 2022 Copyright: <a class="text-white fw-bold">Cach0n3.io</a>
		</div>
		<!-- Copyright -->
	</footer>


	<!-- MDB -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.4.0/mdb.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js"
		integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js"
		integrity="sha384-ODmDIVzN+pFdexxHEHFBQH3/9/vQ9uori45z4JjnFsRydbmQbmL5t1tQ0culUzyK"
		crossorigin="anonymous"></script>



</body>
</html>