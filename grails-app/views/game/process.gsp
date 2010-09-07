<!DOCTYPE html>
<html lang="en">
  <head>

    <!-- custom css and javascript files for jquery -->
    <link rel="stylesheet" href="${resource(dir:'/css/dot-luv/jquery-ui-1.8.4.custom.css')}" />
    <link rel="stylesheet" href="${resource(dir:'/css',file:'custom.css')}" />
  <g:javascript src="jquery-1.4.2.min.js" />
  <g:javascript src="jquery-ui-1.8.4.custom.min.js" />

  <script type="text/javascript">

    /**
    * This variable keep tracks of the players turn.
    */
    var turn = "${game.turn}".toUpperCase()

    /**
    * Singleton object for setting up the modal dialog
    * whe a player win or tie
    */
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

    /**
    * Check to see if a slot on the board is taken already.
    *
    */
    function slotTaken(slot) {
      if ($(slot).html() == "") {
        return false;
      } else {
        return true;
      }
    }

    /**
     * Redirect user back to the begining of the match.
     */
    function redirectToStart(){ window.location = "../game/options"; }

    /**
     * Responsible for sending human player moves to the
     * controller.
     */
    function sendMove(position){
      //setTimeout("progressbar()", 10000);
      progressbar();
      window.location = "../game/humanMove/?move="+position
    }

    /**
     * Using grails gsp tag to generate javascript funtions
     * for all 9 slots of the board. This function is responsible
     * for higlighting the user selected slots.
     */
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

    /**
    * Again using grails gsp tag to generate all 9 slots function.
    * Use for setting the slot's html so we can display which player
    * took which move.
    */
    <g:each in="${game.board}" var="node">
    $(document).ready(function(){
    $("#slot${node.key}").html('${node.value.player.piece}'.toUpperCase());
    });
    </g:each>

    /**
     * Call back function for progress bar. This will hide the
     * progress bar once it's done.
     */
    function callback(){
       setTimeout(function(){
      $('#progressbar:visible').removeAttr('style').hide().fadeOut();}, 5000);
    }

    /**
     * Responsible for displaying the progress bar when a human player
     * selected a slot.
     */
    function progressbar(){
    var options = {}
    $("#progressbar").show('slide', {}, 1, callback );
    }
  </script>
</head>
<body>

  <!--
  This div is use for displaying debug information and
  should be commented out in production envirment.
  -->
  <!--
  <div id="content">
    turn: ${game.turn }
    pc: ${game.pc}
    human: ${game.human}
    winner: ${game.winner}
    level: ${game.level}
    <g:each in="${game.board}" var="node">
      ${node.key}:${node.value.player.piece} ||
    </g:each>
  </div>
  -->
  
  <div id="dialog-message" title="We have a winner!" style="display: none;">
    <p>
      <span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 50px 0;"></span>
      <g:if test="${session.game.status == 'WIN'}">
          Winner is ${session.game.winner.piece}
      </g:if>
      <g:if test="${session.game.status == 'TIE'}">
       We have a Tie!
      </g:if>
   </p>
   <p>
    <g:if test="${session.game.winner.type == 'HUMAN'}">
      Woh, something is wrong with my RAM, this match don't count.
    </g:if>
    <g:if test="${session.game.winner.type == 'COMPUTER'}">
      That was too easy.
    </g:if>
   </p>
  </div>


  <!--
    The game board. just a simple table with jquery ui classes.
  -->
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
  <br/>

  <!-- hidden div for the progress bar -->
  <div id="progressbar" style="display: none;"/>
  <!-- end of content -->
</body>
</html>
