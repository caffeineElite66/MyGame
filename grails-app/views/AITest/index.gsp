<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sample title</title>
  </head>
  <body>
  Human = X || PC = O
  <p>${session.turn}'s turn</p>
  <g:form controller="AITest" action="index">
    <input type="text" name="position"/>
    <input type="submit" value="move"/>
  </g:form>
  
  <g:form controller="AITest" action="clear">
  	<input type="submit" value="start over"/>
  </g:form>
  
  <p>${message}</p>
  <h4>Board</h4>
  <g:each in="${1..3}">
    ${it} : <g:if test="${session.board[Integer.toString(it)] == 3}">X|</g:if><g:if test="${session.board[Integer.toString(it)] == 8}">O|</g:if><g:if test="${session.board[Integer.toString(it)] == 0}">__|</g:if> 
  </g:each>
  <br/>
  <g:each in="${4..6}">
    ${it} : <g:if test="${session.board[Integer.toString(it)] == 3}">X|</g:if><g:if test="${session.board[Integer.toString(it)] == 8}">O|</g:if><g:if test="${session.board[Integer.toString(it)] == 0}">__|</g:if>
  </g:each>
  <br/>
  <g:each in="${7..9}">
      ${it} : <g:if test="${session.board[Integer.toString(it)] == 3}">X|</g:if><g:if test="${session.board[Integer.toString(it)] == 8}">O|</g:if><g:if test="${session.board[Integer.toString(it)] == 0}">__|</g:if>
  </g:each>
  
  <p>
  	<g:each in="${1..9}">
  		${it}:${session.board[Integer.toString(it)]}
  	</g:each>
  </p>
</body>
</html>
