<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "employee".
 *
 * @property integer $emp_num
 * @property string $First_Name
 * @property string $Last_Name
 * @property string $Address
 * @property string $Email
 * @property integer $salary
 * @property string $Job_Title
 * @property integer $dep_id
 * @property integer $leave_id
 *
 * @property Department $dep
 * @property Leaves $leaves
 */
class Employee extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'employee';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['emp_num', 'First_Name', 'Last_Name', 'Address', 'Email', 'salary', 'Job_Title', 'dep_id', 'leave_id'], 'required'],
            [['emp_num', 'salary', 'dep_id', 'leave_id'], 'integer'],
            [['First_Name', 'Last_Name', 'Address', 'Email', 'Job_Title'], 'string', 'max' => 45],
            [['dep_id'], 'exist', 'skipOnError' => true, 'targetClass' => Department::className(), 'targetAttribute' => ['dep_id' => 'Dep_id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'emp_num' => 'Employee Number',
            'First_Name' => 'First  Name',
            'Last_Name' => 'Last  Name',
            'Address' => 'Address',
            'Email' => 'Email',
            'salary' => 'Salary',
            'Job_Title' => 'Job  Title',
            'dep_id' => 'Department Name',
            'leave_id' => 'Leave ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDep()
    {
        return $this->hasOne(Department::className(), ['Dep_id' => 'dep_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getLeaves()
    {
        return $this->hasOne(Leaves::className(), ['id' => 'leave_id']);
    }
}
