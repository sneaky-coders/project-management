<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\WebsiteWorkLog */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="website-work-log-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'website_id')->textInput() ?>

    <?= $form->field($model, 'maintainer_id')->textInput() ?>

    <?= $form->field($model, 'work_description')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'work_date')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
