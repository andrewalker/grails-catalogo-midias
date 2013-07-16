<%@ page import="br.ufscar.dc.entidade.Midia" %>



<div class="fieldcontain ${hasErrors(bean: midiaInstance, field: 'ano', 'error')} required">
	<label for="ano">
		<g:message code="midia.ano.label" default="Ano" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ano" type="number" value="${midiaInstance.ano}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: midiaInstance, field: 'titulo', 'error')} ">
	<label for="titulo">
		<g:message code="midia.titulo.label" default="Titulo" />
		
	</label>
	<g:textField name="titulo" value="${midiaInstance?.titulo}"/>
</div>

