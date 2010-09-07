<!DOCTYPE html>
<!--
  This is a prototype for the UI. Need to test some classes with the
  jquery ui packages.
-->
<html lang="en">
<head>
<meta charset="UTF-8" />
<link rel="stylesheet" href="${resource(dir:'/css',file:'custom.css')}" />
<link rel="stylesheet" href="${resource(dir:'/css/ui-lightness/jquery-ui-1.8.4.custom.css')}" />
<g:javascript src="jquery-1.4.2.min.js" />
<g:javascript src="jquery-ui-1.8.4.custom.min.js" />

<style type="text/css">
#ttt-board td { margin: 0px;padding: 0px;width: 200px;height: 200px;font-size: 10em;text-align: center;}
#slot1 { border-top: none; border-left: none; border-right: solid; border-bottom: solid;}
#slot2 { border-top: none; border-left: solid; border-right: solid; border-bottom: solid;}
#slot3 { border-top: none; border-left: solid; border-right: none; border-bottom: solid;}
#slot4 { border-top: solid; border-left: none; border-right: solid; border-bottom: solid;}
#slot5 { border-top: solid; border-left: solid; border-right: solid; border-bottom: solid;}
#slot6 { border-top: solid; border-left: solid; border-right: none; border-bottom: solid;}
#slot7 { border-top: solid; border-left: none; border-right: solid; border-bottom: none;}
#slot8 { border-top: solid; border-left: solid; border-right: solid; border-bottom: none;}
#slot9 { border-top: solid; border-left: solid; border-right: none; border-bottom: none;}
</style>


<script type="text/javascript">
var turn = "X";

	$(function() {
		$("#slot1").click(function(){
			$("#slot1").switchClass('ui-state-disabled', 'ui-state-highlight', 100);
			$("#slot1").html(turn);
			return false;
		});
		$("#slot2").click(function(){
			$("#slot2").switchClass('ui-state-disabled', 'ui-state-highlight', 100);
			$("#slot2").html(turn);
			return false;
		});
		$("#slot3").click(function(){
			$("#slot3").switchClass('ui-state-disabled', 'ui-state-highlight', 100);
			$("#slot3").html(turn);
			return false;
		});
		$("#slot4").click(function(){
			$("#slot4").switchClass('ui-state-disabled', 'ui-state-highlight', 100);
			$("#slot4").html(turn);
			return false;
		});
		$("#slot5").click(function(){
			$("#slot5").switchClass('ui-state-disabled', 'ui-state-highlight', 100);
			$("#slot5").html(turn);
			return false;
		});
		$("#slot6").click(function(){
			$("#slot6").switchClass('ui-state-disabled', 'ui-state-highlight', 100);
			$("#slot6").html(turn);
			return false;
		});
		$("#slot7").click(function(){
			$("#slot7").switchClass('ui-state-disabled', 'ui-state-highlight', 100);
			$("#slot7").html(turn);
			return false;
		});
		$("#slot8").click(function(){
			$("#slot8").switchClass('ui-state-disabled', 'ui-state-highlight', 100);
			$("#slot8").html(turn);
			return false;
		});
		$("#slot9").click(function(){
			$("#slot9").switchClass('ui-state-disabled', 'ui-state-highlight', 100);
			$("#slot9").html(turn);
			return false;
		});
	});
</script>

</head>
<body>
<div id="board" style="">
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
</body>
</html>
