
<%@ page import="br.ufscar.dc.entidade.Midia" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main" />
		<g:set var="entityName" value="${message(code: 'midia.label', default: 'Midia')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
        <resource:autoComplete skin="default" />
	</head>
	<body>
    <table>
        <thead>
            <th><g:message code="midia.search.label" /></th>
            <th><richui:autoComplete name="search" action="${createLinkTo(dir: 'midia/searchAJAX')}" onItemSelect="location.href='${createLinkTo(dir: 'midia/show/')}' + id" /></th>
        </thead>
    </table>
	</body>
</html>
