<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\SearchWebsiteWorkLog */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Website Work Logs';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="website-work-log-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Website Work Log', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'website_id',
            'maintainer_id',
            'work_description:ntext',
            'work_date',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>


</div>
