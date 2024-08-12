<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Users */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="users-form">
    <?php $form = ActiveForm::begin([
        'options' => ['class' => 'form'],
        'fieldConfig' => [
            'template' => "<div class=\"form-group\">{label}<div class=\"col-sm-9\">{input}{error}</div></div>",
            'labelOptions' => ['class' => 'col-sm-3 col-form-label'],
            'inputOptions' => ['class' => 'form-control'],
        ],
    ]); ?>

    <div class="form-group">
        <?= $form->field($model, 'username')->textInput(['maxlength' => true, 'placeholder' => 'Enter username'])->label('Username') ?>
    </div>

    <div class="form-group">
        <?= $form->field($model, 'email')->textInput(['maxlength' => true, 'placeholder' => 'Enter email'])->label('Email') ?>
    </div>

    <div class="form-group">
        <?= $form->field($model, 'password')->passwordInput(['maxlength' => true, 'placeholder' => 'Enter password'])->label('Password') ?>
    </div>



    <div class="form-group">
        <div class="col-sm-9 offset-sm-3">
            <?= Html::submitButton('Save', ['class' => 'btn btn-primary btn-lg']) ?>
        </div>
    </div>

    <?php ActiveForm::end(); ?>
</div>

<style>
    .users-form {
        max-width: 700px;
        margin: 20px auto;
        padding: 30px;
        background-color: #f8f9fa;
        border-radius: 8px;
        box-shadow: 0 6px 12px rgba(0,0,0,0.1);
    }

    .form {
        display: flex;
        flex-direction: column;
    }

    .form-group {
        margin-bottom: 1.5rem;
        display: flex;
        align-items: center;
    }

    .form-group label {
        font-weight: 500;
        color: #495057;
    }

    .form-control {
        border-radius: 6px;
        border: 1px solid #ced4da;
        padding: 0.75rem 1.25rem;
        font-size: 1rem;
        line-height: 1.5;
    }

    .form-control:focus {
        border-color: #007bff;
        box-shadow: 0 0 0 0.2rem rgba(38, 143, 255, 0.25);
    }

    .btn-primary {
        background-color: #007bff;
        border-color: #007bff;
        border-radius: 6px;
        padding: 0.75rem 1.5rem;
        font-size: 1.125rem;
        font-weight: 500;
    }

    .btn-primary:hover {
        background-color: #0056b3;
        border-color: #004085;
    }
</style>
