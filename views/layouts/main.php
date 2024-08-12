<?php

/* @var $this \yii\web\View */
/* @var $content string */

use app\widgets\Alert;
use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
#use app\assets\AppAsset;

#AppAsset::register($this);
$reqUrl = Yii::$app->urlManager->parseRequest(Yii::$app->request);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">

<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?php $this->registerCsrfMetaTags() ?>
    <?= Yii::$app->view->renderFile('@app/views/layouts/partials/_head.php'); ?>
    <?php $this->head() ?>
</head>

<body>
    <?php $this->beginBody() ?>

    <body>
        <!-- Preloader -->
        <?= Yii::$app->view->renderFile('@app/views/layouts/partials/_loader.php'); ?>

        <!-- Top Navbar -->
		<!-- This conditions used for conditional header rendering like login, signup etc pages not showing the header -->
		<?php if(!($reqUrl[0] === "user/forgot-password" || $reqUrl[0] === "user/login" || $reqUrl[0] === "user/signup" || $reqUrl[0] === "page/error-404")): ?>
			<?= Yii::$app->view->renderFile('@app/views/layouts/partials/_top-nav.php'); ?>
		
			<!-- Side Menu -->
			<?= Yii::$app->view->renderFile('@app/views/layouts/partials/_sidemenu.php'); ?>

			<!-- Main Content Wrapper -->
			<div class="main-content d-flex flex-column hide-sidemenu">
		<?php endif; ?>
				<!-- Main Content Layout -->
				<?= $content ?>
		
		<!-- This conditions used for conditional footer rendering like login, signup etc pages not showing the footer -->
		<?php if(!($reqUrl[0] === "user/forgot-password" || $reqUrl[0] === "user/login" || $reqUrl[0] === "user/signup" || $reqUrl[0] === "page/error-404")): ?>
				<!-- Footer -->
				<?= Yii::$app->view->renderFile('@app/views/layouts/partials/_footer.php'); ?>
			</div>
			<!-- End Main Content Wrapper -->
		<?php endif; ?>

        <!-- Theme Color customizer Right Modal -->
        <?= Yii::$app->view->renderFile('@app/views/layouts/partials/_theme-color-customizer.php'); ?>

        <!-- Footer Scripts -->
        <?= Yii::$app->view->renderFile('@app/views/layouts/partials/_footer-scripts.php'); ?>

        <?php $this->endBody() ?>
    </body>
</html>
<?php $this->endPage() ?>