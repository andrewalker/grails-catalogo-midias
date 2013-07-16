<%@ page import="br.ufscar.dc.entidade.Cd" %>



<div class="fieldcontain ${hasErrors(bean: cdInstance, field: 'ano', 'error')} required">
	<label for="ano">
		<g:message code="cd.ano.label" default="Ano" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ano" type="number" value="${cdInstance.ano}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: cdInstance, field: 'artista', 'error')} ">
	<label for="artista">
		<g:message code="cd.artista.label" default="Artista" />
		
	</label>
	<g:textField name="artista" value="${cdInstance?.artista}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cdInstance, field: 'faixas', 'error')} ">
	<label for="faixas">
		<g:message code="cd.faixas.label" default="Faixas" />
		
	</label>
	<g:select name="faixas" from="${br.ufscar.dc.entidade.Faixa.list()}" multiple="multiple" optionKey="id" size="5" value="${cdInstance?.faixas*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cdInstance, field: 'titulo', 'error')} ">
	<label for="titulo">
		<g:message code="cd.titulo.label" default="Titulo" />
		
	</label>
	<g:textField name="titulo" value="${cdInstance?.titulo}"/>
</div>

