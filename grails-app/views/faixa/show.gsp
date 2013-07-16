
<%@ page import="br.ufscar.dc.entidade.Faixa" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'faixa.label', default: 'Faixa')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
        <g:render template="/layout/menu"/>
		<a href="#show-faixa" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-faixa" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list faixa">
			
				<g:if test="${faixaInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="faixa.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${faixaInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${faixaInstance?.duracao}">
				<li class="fieldcontain">
					<span id="duracao-label" class="property-label"><g:message code="faixa.duracao.label" default="Duracao" /></span>
					
						<span class="property-value" aria-labelledby="duracao-label"><g:fieldValue bean="${faixaInstance}" field="duracao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${faixaInstance?.cd}">
				<li class="fieldcontain">
					<span id="cd-label" class="property-label"><g:message code="faixa.cd.label" default="Cd" /></span>
					
						<span class="property-value" aria-labelledby="cd-label"><g:link controller="cd" action="show" id="${faixaInstance?.cd?.id}">${faixaInstance?.cd?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${faixaInstance?.id}" />
					<g:link class="edit" action="edit" id="${faixaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
