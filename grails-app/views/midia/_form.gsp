<%@ page import="br.ufscar.dc.entidade.Midia" %>



<div class="fieldcontain ${hasErrors(bean: midiaInstance, field: 'titulo', 'error')} required">
	<label for="titulo">
		<g:message code="midia.titulo.label" default="Titulo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="titulo" required="" value="${midiaInstance?.titulo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: midiaInstance, field: 'ano', 'error')} required">
	<label for="ano">
		<g:message code="midia.ano.label" default="Ano" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="ano" from="${1900..2100}" class="range" required="" value="${fieldValue(bean: midiaInstance, field: 'ano')}"/>
</div>

