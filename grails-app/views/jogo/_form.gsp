<%@ page import="br.ufscar.dc.entidade.Jogo" %>



<div class="fieldcontain ${hasErrors(bean: jogoInstance, field: 'genero', 'error')} required">
	<label for="genero">
		<g:message code="jogo.genero.label" default="Genero" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="genero" required="" value="${jogoInstance?.genero}"/>
</div>

