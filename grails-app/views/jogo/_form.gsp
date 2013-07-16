<%@ page import="br.ufscar.dc.entidade.Jogo" %>



<div class="fieldcontain ${hasErrors(bean: jogoInstance, field: 'genero', 'error')} ">
	<label for="genero">
		<g:message code="jogo.genero.label" default="Genero" />
		
	</label>
	<g:textField name="genero" value="${jogoInstance?.genero}"/>
</div>

