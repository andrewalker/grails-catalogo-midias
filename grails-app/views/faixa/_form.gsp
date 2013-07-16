<%@ page import="br.ufscar.dc.entidade.Faixa" %>



<div class="fieldcontain ${hasErrors(bean: faixaInstance, field: 'duracao', 'error')} required">
	<label for="duracao">
		<g:message code="faixa.duracao.label" default="Duracao" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="duracao" type="number" value="${faixaInstance.duracao}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: faixaInstance, field: 'nome', 'error')} ">
	<label for="nome">
		<g:message code="faixa.nome.label" default="Nome" />
		
	</label>
	<g:textField name="nome" value="${faixaInstance?.nome}"/>
</div>

