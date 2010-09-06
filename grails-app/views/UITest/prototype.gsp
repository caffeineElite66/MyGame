<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
<link rel="stylesheet" href="${resource(dir:'/css',file:'custom.css')}" />
<link rel="stylesheet" href="${resource(dir:'/css/ui-lightness/jquery-ui-1.8.4.custom.css')}" />
<g:javascript src="jquery-1.4.2.min.js" />
<g:javascript src="jquery-ui-1.8.4.custom.min.js" />
    <style type="text/css">
      #feedback { font-size: 1.4em; }
      #selectable .ui-selecting { background: #FECA40; }
      #selectable .ui-selected { background: #F39814; color: white; }
      #selectable { list-style-type: none; margin: 0; padding: 0; }
      #selectable li { margin: 3px; padding: 1px; float: left; width: 100px; height: 80px; font-size: 4em; text-align: center; }
    </style>

    <script type="ttext/javascript">
      $(function() {
$("#selectable").selectable();
});
</script>

</head>
<body>
<div class="demo">

<ol id="selectable">
<li class="ui-state-default">1</li>
<li class="ui-state-default">2</li>
<li class="ui-state-default">3</li>
<li class="ui-state-default">4</li>
<li class="ui-state-default">5</li>

<li class="ui-state-default">6</li>
<li class="ui-state-default">7</li>
<li class="ui-state-default">8</li>
<li class="ui-state-default">9</li>
<li class="ui-state-default">10</li>
<li class="ui-state-default">11</li>

<li class="ui-state-default">12</li>
</ol>

</div><!-- End demo -->

<div class="demo-description">

<p>To arrange selectable items as a grid, give them identical dimensions and float them using CSS.</p>

</div><!-- End demo-description -->
</body>
</html>
