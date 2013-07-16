<%@ page import="br.ufscar.dc.entidade.Faixa" %>



<div class="fieldcontain ${hasErrors(bean: faixaInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="faixa.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${faixaInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: faixaInstance, field: 'duracao', 'error')} required">
	<label for="duracao">
		<g:message code="faixa.duracao.label" default="Duracao" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="duracao" type="number" value="${faixaInstance.duracao}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: faixaInstance, field: 'cd', 'error')} required">
	<label for="cd">
		<g:message code="faixa.cd.label" default="Cd" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cd" name="cd.id" from="${br.ufscar.dc.entidade.Cd.list()}" optionKey="id" required="" value="${faixaInstance?.cd?.id}" class="many-to-one"/>
</div>

