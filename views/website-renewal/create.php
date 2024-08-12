<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\WebsiteRenewal */

$this->title = 'Create Website Renewal';
$this->params['breadcrumbs'][] = ['label' => 'Website Renewals', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="website-renewal-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
