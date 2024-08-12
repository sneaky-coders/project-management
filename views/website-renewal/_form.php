<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\WebsiteRenewal */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="website-renewal-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'website_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'renewal_date')->textInput() ?>

    <?= $form->field($model, 'renewal_interval')->textInput() ?>

    <?= $form->field($model, 'last_renewal_date')->textInput() ?>

    <?= $form->field($model, 'status')->dropDownList([ 'active' => 'Active', 'expired' => 'Expired', 'pending' => 'Pending', ], ['prompt' => '']) ?>

    <?= $form->field($model, 'notes')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'bill_before_payment')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'bill_after_payment')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'technology_stack')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'maintainer_id')->textInput() ?>

    <?= $form->field($model, 'created_at')->textInput() ?>

    <?= $form->field($model, 'updated_at')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
