<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "employee".
 *
 * @property integer $emp_num
 * @property string $emp_fname
 * @property string $emp_lname
 * @property string $emp_address
 * @property string $emp_email
 * @property integer $salary
 * @property string $job_title
 * @property integer $dep_id
 * @property integer $leave_id
 *
 * @property Leaves $leave
 * @property Department $dep
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
            [['emp_num', 'emp_fname', 'emp_lname', 'emp_address', 'emp_email', 'salary', 'job_title', 'dep_id', 'leave_id'], 'required'],
            [['emp_num', 'salary', 'dep_id', 'leave_id'], 'integer'],
            [['emp_fname', 'emp_lname', 'emp_address', 'emp_email', 'job_title'], 'string', 'max' => 45],
            [['leave_id'], 'exist', 'skipOnError' => true, 'targetClass' => Leaves::className(), 'targetAttribute' => ['leave_id' => 'id']],
            [['dep_id'], 'exist', 'skipOnError' => true, 'targetClass' => Department::className(), 'targetAttribute' => ['dep_id' => 'Dep_id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'emp_num' => 'Emp Num',
            'emp_fname' => 'Emp Fname',
            'emp_lname' => 'Emp Lname',
            'emp_address' => 'Emp Address',
            'emp_email' => 'Emp Email',
            'salary' => 'Salary',
            'job_title' => 'Job Title',
            'dep_id' => 'Dep ID',
            'leave_id' => 'Leave ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getLeave()
    {
        return $this->hasOne(Leaves::className(), ['id' => 'leave_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDep()
    {
        return $this->hasOne(Department::className(), ['Dep_id' => 'dep_id']);
    }
}
