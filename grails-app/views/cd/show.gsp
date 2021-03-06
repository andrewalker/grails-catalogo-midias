
<%@ page import="br.ufscar.dc.entidade.Cd" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cd.label', default: 'Cd')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
        <g:render template="/layouts/menu"/>
		<a href="#show-cd" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-cd" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list cd">
				<g:if test="${cdInstance?.titulo}">
				<li class="fieldcontain">
					<span id="titulo-label" class="property-label"><g:message code="cd.titulo.label" default="Titulo" /></span>
					<span class="property-value" aria-labelledby="titulo-label"><g:fieldValue bean="${cdInstance}" field="titulo"/></span>
				</li>
				</g:if>

				<g:if test="${cdInstance?.ano}">
				<li class="fieldcontain">
					<span id="ano-label" class="property-label"><g:message code="cd.ano.label" default="Ano" /></span>
					<span class="property-value" aria-labelledby="ano-label"><g:fieldValue bean="${cdInstance}" field="ano"/></span>
				</li>
				</g:if>

				<g:if test="${cdInstance?.artista}">
				<li class="fieldcontain">
					<span id="artista-label" class="property-label"><g:message code="cd.artista.label" default="Artista" /></span>
					<span class="property-value" aria-labelledby="artista-label"><g:fieldValue bean="${cdInstance}" field="artista"/></span>
				</li>
				</g:if>

				<g:if test="${cdInstance?.faixas}">
				<li class="fieldcontain">
					<span id="faixas-label" class="property-label"><g:message code="cd.faixas.label" default="Faixas" /></span>
					<g:each in="${cdInstance.faixas}" var="f">
					<span class="property-value" aria-labelledby="faixas-label"><g:link controller="faixa" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
					</g:each>
				</li>
				</g:if>

			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${cdInstance?.id}" />
					<g:link class="edit" action="edit" id="${cdInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
