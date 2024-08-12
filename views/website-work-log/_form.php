<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use app\models\WebsiteRenewal; // Assuming you have a Website model
use app\models\Users; // Assuming you have a Users model

/* @var $this yii\web\View */
/* @var $model app\models\WebsiteWorkLog */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="website-work-log-form">
    <?php $form = ActiveForm::begin([
        'options' => ['class' => 'modern-form'],
        'fieldConfig' => [
            'template' => "<div class=\"form-group\">{label}{input}{error}</div>",
            'labelOptions' => ['class' => 'form-label'],
            'inputOptions' => ['class' => 'form-control'],
        ],
    ]); ?>

    <div class="form-group">
        <?= $form->field($model, 'website_id')->dropDownList(
            ArrayHelper::map(WebsiteRenewal::find()->all(), 'id', 'website_name'),
            ['prompt' => 'Select Website']
        )->label('Website') ?>
    </div>

    <div class="form-group">
        <?= $form->field($model, 'maintainer_id')->dropDownList(
            ArrayHelper::map(Users::find()->all(), 'id', 'username'),
            ['prompt' => 'Select Maintainer']
        )->label('Maintainer') ?>
    </div>

    <div class="form-group">
        <?= $form->field($model, 'work_description')->textarea([
            'rows' => 6,
            'placeholder' => 'Enter work description',
            'class' => 'form-control'
        ])->label('Work Description') ?>
    </div>

    <div class="form-group">
        <?= $form->field($model, 'work_date')->textInput(['type' => 'date'])->label('Work Date') ?>
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
        max-width: 800px;
        margin: 20px auto;
        padding: 30px;
        background-color: #ffffff;
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
