<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\SearchWebsiteRenewal */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Website Renewals';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="website-renewal-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Website Renewal', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'website_name',
            'renewal_date',
            'renewal_interval',
            'last_renewal_date',
            //'status',
            //'notes:ntext',
            //'bill_before_payment',
            //'bill_after_payment',
            //'technology_stack',
            //'maintainer_id',
            //'created_at',
            //'updated_at',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>


</div>
