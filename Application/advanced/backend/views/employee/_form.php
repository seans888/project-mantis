<?php

namespace common\models;
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;


/* @var $this yii\web\View */
/* @var $model common\models\Employee */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="employee-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'emp_num')->textInput() ?>

    <?= $form->field($model, 'dep_id')->dropDownList(
            ArrayHelper::map(Department::find()->all(),'Dep_id','Department_Name'),
                ['prompt' =>'Select Department']


    ) ?>

      <?= $form->field($model, 'leave_id')->textInput() ?>

    <?= $form->field($model, 'First_Name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Last_Name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Address')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Email')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'salary')->textInput() ?>

    <?= $form->field($model, 'Job_Title')->textInput(['maxlength' => true]) ?>

   

  

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
