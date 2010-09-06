<!DOCTYPE html>
<html lang="en">
  <head>
<link rel="stylesheet" href="${resource(dir:'/css/dot-luv/jquery-ui-1.8.4.custom.css')}" />
<link rel="stylesheet" href="${resource(dir:'/css',file:'custom.css')}" />
<g:javascript src="jquery-1.4.2.min.js" />
<g:javascript src="jquery-ui-1.8.4.custom.min.js" />

    <script type="text/javascript">
        var turn = "${game.turn}".toUpperCase()
        $(function(){
            if ('${session.game.status}' != 'PROGRESS'){
                $("#dialog-message").dialog({
                        modal: true,
                        buttons: {
                                Restart: function() {
                                        $(this).dialog('close');
                                        redirectToStart();
                                }
                        },
                        close: function(event, ui) { redirectToStart(); }
                });
                }
            });

        function slotTaken(slot) {
          if ($(slot).html() == "") {
            return false;
          } else {
            return true;
          }
        }
        function redirectToStart(){ window.location = "../game/options"; }

        function sendMove(position){
              setTimeout("", 3000);
              window.location = "../game/humanMove/?move="+position
        }

        $(function() {
           <g:each in="${game.board}" var="node">
             $("#slot${node.key}").click(function(){
              if (!slotTaken("#slot"+${node.key})){
                 $("#slot${node.key}").switchClass('ui-state-disabled', 'ui-state-highlight', 100);
                 $("#slot${node.key}").html(turn);
                 sendMove(${node.key});
              }
              return false;
             });
           </g:each>
         });


        <g:each in="${game.board}" var="node">
          $(document).ready(function(){
            $("#slot${node.key}").html('${node.value.player.piece}'.toUpperCase());
          });
        </g:each>
</script>
</head>
<body>

  <div id="content">turn: ${game.turn } pc: ${game.pc} human: ${game.human}
    winner: ${game.winner} level: ${game.level} <g:each in="${game.board}"
                                                        var="node">
${node.key}:${node.value.player.piece} ||
    </g:each>

    <div id="dialog-message" title="We have a winner!"
         style="display: none;">
      <p><span class="ui-icon ui-icon-alert"
               style="float: left; margin: 0 7px 50px 0;"></span> <g:if
        test="${session.game.status == 'WIN'}">
		Winner is ${session.game.winner.piece}
      </g:if><g:if
        test="${session.game.status == 'TIE'}">
		We have a Tie!
      </g:if>
      </p>
      <p><g:if test="${session.game.winner.type == 'HUMAN'}">Woh, something is wrong with my RAM, this match don't count.</g:if>
      <g:if test="${session.game.winner.type == 'COMPUTER'}">That was too easy.</g:if>
      </p>
    </div>



    <div id="board">
      <table id="ttt-board">
        <tr>
          <td id="slot1" class="ui-widget-content"></td>
          <td id="slot2" class="ui-widget-content"></td>
          <td id="slot3" class="ui-widget-content"></td>
        </tr>
        <tr>
          <td id="slot4" class="ui-widget-content"></td>
          <td id="slot5" class="ui-widget-content"></td>
          <td id="slot6" class="ui-widget-content"></td>
        </tr>
        <tr>
          <td id="slot7" class="ui-widget-content"></td>
          <td id="slot8" class="ui-widget-content"></td>
          <td id="slot9" class="ui-widget-content"></td>
        </tr>
      </table>
    </div>
  </div>
  <!-- end of content -->
</body>
</html>
