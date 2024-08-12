<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\WebsiteRenewal */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Website Renewals', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="website-renewal-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'website_name',
            'renewal_date',
            'renewal_interval',
            'last_renewal_date',
            'status',
            'notes:ntext',
            'bill_before_payment',
            'bill_after_payment',
            'technology_stack',
            'maintainer_id',
            'created_at',
            'updated_at',
        ],
    ]) ?>

</div>
