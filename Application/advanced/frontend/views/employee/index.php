<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\EmployeeSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Employees';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="employee-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

  
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            //'emp_num',
            'dep.Department_Name',
            'First_Name',
            'Last_Name',
            'Address',
            'Email:email',
            'leaves.leave_type',
             'salary',
             'Job_Title',
            // 'dep_id',
            // 'leave_id',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
