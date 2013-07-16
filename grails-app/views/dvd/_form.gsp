<%@ page import="br.ufscar.dc.entidade.Dvd" %>



<div class="fieldcontain ${hasErrors(bean: dvdInstance, field: 'ano', 'error')} required">
	<label for="ano">
		<g:message code="dvd.ano.label" default="Ano" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ano" type="number" value="${dvdInstance.ano}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: dvdInstance, field: 'diretor', 'error')} ">
	<label for="diretor">
		<g:message code="dvd.diretor.label" default="Diretor" />
		
	</label>
	<g:textField name="diretor" value="${dvdInstance?.diretor}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dvdInstance, field: 'papeis', 'error')} ">
	<label for="papeis">
		<g:message code="dvd.papeis.label" default="Papeis" />
		
	</label>
	<g:select name="papeis" from="${br.ufscar.dc.entidade.Papel.list()}" multiple="multiple" optionKey="id" size="5" value="${dvdInstance?.papeis*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dvdInstance, field: 'titulo', 'error')} ">
	<label for="titulo">
		<g:message code="dvd.titulo.label" default="Titulo" />
		
	</label>
	<g:textField name="titulo" value="${dvdInstance?.titulo}"/>
</div>

