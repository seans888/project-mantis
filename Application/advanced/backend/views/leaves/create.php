<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Leaves */

$this->title = 'Create Leaves';
$this->params['breadcrumbs'][] = ['label' => 'Leaves', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="leaves-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
