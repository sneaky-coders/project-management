<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\SearchWebsiteRenewal */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="website-renewal-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'website_name') ?>

    <?= $form->field($model, 'renewal_date') ?>

    <?= $form->field($model, 'renewal_interval') ?>

    <?= $form->field($model, 'last_renewal_date') ?>

    <?php // echo $form->field($model, 'status') ?>

    <?php // echo $form->field($model, 'notes') ?>

    <?php // echo $form->field($model, 'bill_before_payment') ?>

    <?php // echo $form->field($model, 'bill_after_payment') ?>

    <?php // echo $form->field($model, 'technology_stack') ?>

    <?php // echo $form->field($model, 'maintainer_id') ?>

    <?php // echo $form->field($model, 'created_at') ?>

    <?php // echo $form->field($model, 'updated_at') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-outline-secondary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
