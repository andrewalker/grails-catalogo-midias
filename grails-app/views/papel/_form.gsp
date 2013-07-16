<%@ page import="br.ufscar.dc.entidade.Papel" %>



<div class="fieldcontain ${hasErrors(bean: papelInstance, field: 'ator', 'error')} ">
	<label for="ator">
		<g:message code="papel.ator.label" default="Ator" />
		
	</label>
	<g:textField name="ator" value="${papelInstance?.ator}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: papelInstance, field: 'nome', 'error')} ">
	<label for="nome">
		<g:message code="papel.nome.label" default="Nome" />
		
	</label>
	<g:textField name="nome" value="${papelInstance?.nome}"/>
</div>

