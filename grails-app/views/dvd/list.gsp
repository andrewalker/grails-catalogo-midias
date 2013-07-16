
<%@ page import="br.ufscar.dc.entidade.Dvd" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'dvd.label', default: 'Dvd')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-dvd" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-dvd" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="ano" title="${message(code: 'dvd.ano.label', default: 'Ano')}" />
					
						<g:sortableColumn property="diretor" title="${message(code: 'dvd.diretor.label', default: 'Diretor')}" />
					
						<g:sortableColumn property="titulo" title="${message(code: 'dvd.titulo.label', default: 'Titulo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${dvdInstanceList}" status="i" var="dvdInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${dvdInstance.id}">${fieldValue(bean: dvdInstance, field: "ano")}</g:link></td>
					
						<td>${fieldValue(bean: dvdInstance, field: "diretor")}</td>
					
						<td>${fieldValue(bean: dvdInstance, field: "titulo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${dvdInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
