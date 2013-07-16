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

<div class="fieldcontain ${hasErrors(bean: cdInstance, field: 'faixas', 'error')} ">
	<label for="faixas">
		<g:message code="cd.faixas.label" default="Faixas" />
		
	</label>
	<g:select name="faixas" from="${br.ufscar.dc.entidade.Faixa.list()}" multiple="multiple" optionKey="id" size="5" value="${cdInstance?.faixas*.id}" class="many-to-many"/>
</div>

