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

<div class="fieldcontain ${hasErrors(bean: papelInstance, field: 'dvd', 'error')} required">
	<label for="dvd">
		<g:message code="papel.dvd.label" default="Dvd" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="dvd" name="dvd.id" from="${br.ufscar.dc.entidade.Dvd.list()}" optionKey="id" required="" value="${papelInstance?.dvd?.id}" class="many-to-one"/>
</div>

