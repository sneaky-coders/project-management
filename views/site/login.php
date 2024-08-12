<?php

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \common\models\LoginForm */

?>

<style>
    /* Add custom CSS rules here */
    body {
        background-image: url('/web/uploads/bg3.jpg');
        background-size: cover;
        background-position: center;
        font-family: Arial, sans-serif;
    }

    .login-container {
        max-width: 500px;
        /* Adjust width as needed */
        background-color: rgba(255, 255, 255, 0.9);
        /* Semi-transparent white background */
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        padding: 40px;
    }

    .login-container .logo {
        width: 100px;
        margin: 0 auto 20px;
    }

    .login-container h2 {
        text-align: center;
        margin-bottom: 30px;
        color: #333;
    }

    .form-control {
        border-radius: 4px;
        border-color: #ced4da;
    }

    .btn-primary {
        background-color: #007bff;
        border-color: #007bff;
        border-radius: 4px;
        width: 100%;
        padding: 12px;
        margin-top: 20px;
    }

    .btn-primary:hover {
        background-color: #0056b3;
        border-color: #0056b3;
    }

    .social-login-buttons {
        margin-top: 20px;
    }

    .social-login-buttons .btn {
        width: 100%;
        padding: 12px;
        margin-bottom: 10px;
    }

    .btn-facebook {
        background-color: #3b5998;
        border-color: #3b5998;
    }

    .btn-facebook:hover {
        background-color: #2d4373;
        border-color: #2d4373;
    }

    .btn-google {
        background-color: #dd4b39;
        border-color: #dd4b39;
    }

    .btn-google:hover {
        background-color: #c23321;
        border-color: #c23321;
    }

    .footer {
        margin-top: 30px;
        text-align: center;
    }

    .footer a {
        color: #007bff;
        text-decoration: none;
    }

    .logo {
        display: block;
        /* Ensure the logo behaves as a block element */
        margin: 0 auto 20px;
        /* Center the logo horizontally and add some bottom margin */
        width: 250px;
        /* Set the width of the logo */
        height: auto;
        /* Allow the height to adjust proportionally */
    }
</style>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="login-container">
                <!-- Add your logo here -->
          

                <h2><?= Html::encode($this->title) ?></h2>
                <?php $form = ActiveForm::begin(['id' => 'login-form']); ?>
                <?= $form->field($model, 'username')->textInput(['autofocus' => true, 'placeholder' => 'Enter Your Registered Email', 'class' => 'form-control'])->label('Username or Email') ?>
                <?= $form->field($model, 'password')->passwordInput(['placeholder' => 'Password', 'class' => 'form-control'])->label('Password') ?>
                <?= $form->field($model, 'rememberMe')->checkbox() ?>

                <!-- Forgot Password Link -->
                <div class="form-group">
                    <?= Html::a('Forgot Password?', ['/users/forgot-password']) ?>
                </div>

                <?= Html::submitButton('Login', ['class' => 'btn btn-primary', 'name' => 'login-button']) ?>
                <?php ActiveForm::end(); ?>
            </div>
        </div>
    </div>
</div>


<!-- Include Feather Icons library -->
<script src="https://cdn.jsdelivr.net/npm/feather-icons/dist/feather.min.js"></script>
<script>
    // Call Feather Icons
    feather.replace();
</script>
