<%@ page import="br.ufscar.dc.entidade.Cd" %>



<div class="fieldcontain ${hasErrors(bean: cdInstance, field: 'titulo', 'error')} required">
	<label for="titulo">
		<g:message code="cd.titulo.label" default="Titulo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="titulo" required="" value="${cdInstance?.titulo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cdInstance, field: 'ano', 'error')} required">
	<label for="ano">
		<g:message code="cd.ano.label" default="Ano" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="ano" from="${1900..2100}" class="range" required="" value="${fieldValue(bean: cdInstance, field: 'ano')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cdInstance, field: 'artista', 'error')} required">
	<label for="artista">
		<g:message code="cd.artista.label" default="Artista" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="artista" required="" value="${cdInstance?.artista}"/>
</div>

<div class="fieldcontain">
    <span id="faixas-label" class="property-label"><g:message code="cd.faixas.label" default="Faixas" /></span>
    <g:each in="${cdInstance.faixas}" var="f">
    <span class="property-value" aria-labelledby="faixas-label"><g:link controller="faixa" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
    </g:each>
    <span class="property-value" aria-labelledby="faixas-label"><g:link controller="faixa" action="create" params="['Cd.id': cdInstance?.id]"><g:message code="faixa.new" default="New Track" /></g:link></span>
</div>
