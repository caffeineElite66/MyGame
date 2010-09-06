<html>
  <head>
  <link rel="stylesheet" href="${resource(dir:'/css/dot-luv/jquery-ui-1.8.4.custom.css')}" />
<link rel="stylesheet" href="${resource(dir:'/css',file:'custom.css')}" />
<g:javascript src="jquery-1.4.2.min.js" />
<g:javascript src="jquery-ui-1.8.4.custom.min.js" />

    <script type="text/javascript">
            $(function(){
                    $("#player").buttonset();
            });
            $(function(){
                    $("#turn").buttonset();
            });
            $(function(){
                    $("#level").buttonset();
            });
            $(function(){
                    $("input").button();
            });
    </script>

    <style type="text/css">
      #options .ui-button {
        width: 200px;
        font-size: 25px;
      }
      #start .ui-button {
        width: 300px;
        font-size: 45px;
      }
    </style>
  </head>
  <body>
  <g:form action="start" method="POST">
    <div id="options">
      <h1>SELECT PLAYER</h1>
      <div id="player">
        <input type="radio" id="player-x" name="player" value="X" checked="checked"/><label for="player-x">X</label>
        <input type="radio" id="player-o" name="player" value="O"/><label for="player-o">O</label>
      </div>

      <div id="turn">
        <h1>Who Go First</h1>
        <input type="radio" id="human" name="turn" value="HUMAN" checked="checked"/><label for="human">Human</label>
        <input type="radio" id="computer" name="turn" value="COMPUTER"/><label for="computer">Computer</label>
      </div>

      <div id="level">
        <h1>SELECT LEVEL</h1>
        <input type="radio" id="level-e" name="level" value="EASY" checked="checked"/><label for="level-e">easy</label>
        <input type="radio" id="level-h" name="level" value="HARD" /><label for="level-h">hard</label>
      </div>
    </div>
    <br/><br/>
    <div id="start">
      <input type="submit" value="start game"/>
    </div>

  </g:form>
</body>
</html>