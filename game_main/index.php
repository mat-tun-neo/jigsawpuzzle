<!doctype html>

<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <title></title>
  </head>
  <body>
  </body>
</html>
<?php
  require "./commonClassload.php";
  session_start();
  $postchk = new PostCheck($_POST);
?>

<div id="HTTP_REFERER" style="display:none"><?php echo $_SERVER['HTTP_REFERER'] ?></div>
<div id="mode" style="display:none"><?php echo $postchk->getPostValue('mode') ?></div>

<script src="./js/phina.min.js"></script>
<script src="./js/axios.min.js"></script>
<script src="./js/main.js?<?php echo date('YmdHis') ?>"></script>
<script src="./js/SceneMain.js?<?php echo date('YmdHis') ?>"></script>
<script src="./js/SceneExit.js?<?php echo date('YmdHis') ?>"></script>
<script src="./js/SpriteBase.js?<?php echo date('YmdHis') ?>"></script>
<script src="./js/SpriteButtonStart.js?<?php echo date('YmdHis') ?>"></script>
<script src="./js/SpriteButtonGoal.js?<?php echo date('YmdHis') ?>"></script>
<script src="./js/SpriteButtonX.js?<?php echo date('YmdHis') ?>"></script>
<script src="./js/SpriteCharacter.js?<?php echo date('YmdHis') ?>"></script>
<script src="./js/spritesheet/<?php echo $postchk->getPostValue('pattern') ?>.ss?<?php echo date('YmdHis') ?>"></script>
