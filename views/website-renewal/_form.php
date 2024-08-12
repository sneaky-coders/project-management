<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use app\models\Users;

/* @var $this yii\web\View */
/* @var $model app\models\WebsiteRenewal */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="website-renewal-form">
    <?php $form = ActiveForm::begin([
        'options' => ['class' => 'modern-form'],
        'fieldConfig' => [
            'template' => "<div class=\"form-group\">{label}{input}{error}</div>",
            'labelOptions' => ['class' => 'form-label'],
            'inputOptions' => ['class' => 'form-control'],
        ],
    ]); ?>

    <div class="form-group">
        <?= $form->field($model, 'website_name')->textInput(['maxlength' => true, 'placeholder' => 'Website Name'])->label('Website Name') ?>
    </div>

    <div class="form-group">
        <?= $form->field($model, 'renewal_date')->textInput(['type' => 'date'])->label('Renewal Date') ?>
    </div>

    <div class="form-group">
        <?= $form->field($model, 'renewal_interval')->textInput(['placeholder' => 'Renewal Interval'])->label('Renewal Interval') ?>
    </div>

    <div class="form-group">
        <?= $form->field($model, 'last_renewal_date')->textInput(['type' => 'date'])->label('Last Renewal Date') ?>
    </div>

    <div class="form-group">
        <?= $form->field($model, 'status')->dropDownList([
            'active' => 'Active', 
            'expired' => 'Expired', 
            'pending' => 'Pending'
        ], ['prompt' => 'Select Status'])->label('Status') ?>
    </div>

    <div class="form-group">
        <?= $form->field($model, 'notes')->textarea(['rows' => 4, 'placeholder' => 'Additional notes'])->label('Notes') ?>
    </div>

    <div class="form-group">
        <?= $form->field($model, 'bill_before_payment')->textInput(['maxlength' => true, 'placeholder' => 'Amount Before Payment'])->label('Bill Before Payment') ?>
    </div>

    <div class="form-group">
        <?= $form->field($model, 'bill_after_payment')->textInput(['maxlength' => true, 'placeholder' => 'Amount After Payment'])->label('Bill After Payment') ?>
    </div>

    <div class="form-group">
        <?= $form->field($model, 'technology_stack')->textInput(['maxlength' => true, 'placeholder' => 'Technology Stack'])->label('Technology Stack') ?>
    </div>

    <div class="form-group">
        <?= $form->field($model, 'maintainer_id')->dropDownList(
            ArrayHelper::map(Users::find()->all(), 'id', 'username'),
            ['prompt' => 'Select Maintainer']
        )->label('Maintainer') ?>
    </div>



    <div class="form-group">
        <div class="form-actions">
            <?= Html::submitButton('Save', ['class' => 'btn btn-primary']) ?>
        </div>
    </div>

    <?php ActiveForm::end(); ?>
</div>

<style>
    .modern-form {
        max-width: 900px;
        margin: 20px auto;
        padding: 30px;
        background-color: #f9f9f9;
        border-radius: 12px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }

    .form-group {
        margin-bottom: 20px;
    }

    .form-label {
        font-weight: 600;
        color: #333;
    }

    .form-control {
        border-radius: 8px;
        border: 1px solid #dcdcdc;
        padding: 12px 16px;
        font-size: 16px;
        line-height: 1.5;
    }

    .form-control:focus {
        border-color: #007bff;
        box-shadow: 0 0 0 0.2rem rgba(38, 143, 255, 0.25);
    }

    .btn-primary {
        background-color: #007bff;
        border-color: #007bff;
        border-radius: 8px;
        padding: 12px 24px;
        font-size: 16px;
        font-weight: 600;
    }

    .btn-primary:hover {
        background-color: #0056b3;
        border-color: #004085;
    }

    .form-actions {
        text-align: right;
    }
</style>
