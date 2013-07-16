<%@ page import="br.ufscar.dc.entidade.Papel" %>



<div class="fieldcontain ${hasErrors(bean: papelInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="papel.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${papelInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: papelInstance, field: 'ator', 'error')} required">
	<label for="ator">
		<g:message code="papel.ator.label" default="Ator" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="ator" required="" value="${papelInstance?.ator}"/>
</div>

