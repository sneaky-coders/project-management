<?php

/* @var $this \yii\web\View */
/* @var $content string */

use app\assets\AppAsset;

AppAsset::register($this);
?>
<p>Hey there,</p> 
<p>Someone requested a new password for your Anklyticx ERP account</p>

<a href="<?= $url ?>" class="btn btn-primary">Reset Password</a>

<p>If you didnt make this request then you can safely ignore this mail :)</p>

<p>Best Regards,<br>
Anklyticx ERP</p>
<img src="img/logo.png" height="30" alt="" srcset="">