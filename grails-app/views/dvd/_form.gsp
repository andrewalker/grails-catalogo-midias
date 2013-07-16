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

<div class="fieldcontain ${hasErrors(bean: dvdInstance, field: 'papeis', 'error')} ">
	<label for="papeis">
		<g:message code="dvd.papeis.label" default="Papeis" />
		
	</label>
	<g:select name="papeis" from="${br.ufscar.dc.entidade.Papel.list()}" multiple="multiple" optionKey="id" size="5" value="${dvdInstance?.papeis*.id}" class="many-to-many"/>
</div>

