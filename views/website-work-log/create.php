<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\WebsiteWorkLog */

$this->title = 'Create Website Work Log';
$this->params['breadcrumbs'][] = ['label' => 'Website Work Logs', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="website-work-log-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
