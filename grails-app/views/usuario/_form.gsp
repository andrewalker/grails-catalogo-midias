<%@ page import="br.ufscar.dc.entidade.Usuario" %>



<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'login', 'error')} ">
	<label for="login">
		<g:message code="usuario.login.label" default="Login" />
		
	</label>
	<g:textField name="login" value="${usuarioInstance?.login}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'midias', 'error')} ">
	<label for="midias">
		<g:message code="usuario.midias.label" default="Midias" />
		
	</label>
	<g:select name="midias" from="${br.ufscar.dc.entidade.Midia.list()}" multiple="multiple" optionKey="id" size="5" value="${usuarioInstance?.midias*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'nome', 'error')} ">
	<label for="nome">
		<g:message code="usuario.nome.label" default="Nome" />
		
	</label>
	<g:textField name="nome" value="${usuarioInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'senha', 'error')} ">
	<label for="senha">
		<g:message code="usuario.senha.label" default="Senha" />
		
	</label>
	<g:textField name="senha" value="${usuarioInstance?.senha}"/>
</div>

