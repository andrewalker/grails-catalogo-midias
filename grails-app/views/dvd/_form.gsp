<%@ page import="br.ufscar.dc.entidade.Dvd" %>



<div class="fieldcontain ${hasErrors(bean: dvdInstance, field: 'titulo', 'error')} required">
	<label for="titulo">
		<g:message code="dvd.titulo.label" default="Titulo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="titulo" required="" value="${dvdInstance?.titulo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dvdInstance, field: 'ano', 'error')} required">
	<label for="ano">
		<g:message code="dvd.ano.label" default="Ano" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="ano" from="${1900..2100}" class="range" required="" value="${fieldValue(bean: dvdInstance, field: 'ano')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dvdInstance, field: 'diretor', 'error')} required">
	<label for="diretor">
		<g:message code="dvd.diretor.label" default="Diretor" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="diretor" required="" value="${dvdInstance?.diretor}"/>
</div>

<g:if test="${dvdInstance?.papeis}">
    <div class="fieldcontain">
        <span id="papeis-label" class="property-label"><g:message code="dvd.papeis.label" default="Papéis" /></span>
        <g:each in="${dvdInstance.papeis}" var="f">
        <span class="property-value" aria-labelledby="papeis-label"><g:link controller="papel" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
        </g:each>
        <span class="property-value" aria-labelledby="papeis-label"><g:link controller="papel" action="create" params="['Dvd.id': dvdInstance?.id]"><g:message code="papel.new" default="New Role" /></g:link></span>
    </div>
</g:if>
