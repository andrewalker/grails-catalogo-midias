
<%@ page import="br.ufscar.dc.entidade.Dvd" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'dvd.label', default: 'Dvd')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
        <g:render template="/layouts/menu"/>
		<a href="#show-dvd" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-dvd" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list dvd">
			
				<g:if test="${dvdInstance?.titulo}">
				<li class="fieldcontain">
					<span id="titulo-label" class="property-label"><g:message code="dvd.titulo.label" default="Titulo" /></span>
					
						<span class="property-value" aria-labelledby="titulo-label"><g:fieldValue bean="${dvdInstance}" field="titulo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dvdInstance?.ano}">
				<li class="fieldcontain">
					<span id="ano-label" class="property-label"><g:message code="dvd.ano.label" default="Ano" /></span>
					
						<span class="property-value" aria-labelledby="ano-label"><g:fieldValue bean="${dvdInstance}" field="ano"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dvdInstance?.diretor}">
				<li class="fieldcontain">
					<span id="diretor-label" class="property-label"><g:message code="dvd.diretor.label" default="Diretor" /></span>
					
						<span class="property-value" aria-labelledby="diretor-label"><g:fieldValue bean="${dvdInstance}" field="diretor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dvdInstance?.papeis}">
				<li class="fieldcontain">
					<span id="papeis-label" class="property-label"><g:message code="dvd.papeis.label" default="Papeis" /></span>
					
						<g:each in="${dvdInstance.papeis}" var="p">
						<span class="property-value" aria-labelledby="papeis-label"><g:link controller="papel" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${dvdInstance?.id}" />
					<g:link class="edit" action="edit" id="${dvdInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
