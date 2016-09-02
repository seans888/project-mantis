<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "department".
 *
 * @property integer $Dep_id
 * @property string $Department_Name
 * @property string $Description
 *
 * @property Employee[] $employees
 */
class Department extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'department';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['Dep_id', 'Department_Name', 'Description'], 'required'],
            [['Dep_id'], 'integer'],
            [['Department_Name'], 'string', 'max' => 100],
            [['Description'], 'string', 'max' => 150],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'Dep_id' => 'Department ID',
            'Department_Name' => 'Department  Name',
            'Description' => 'Description',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEmployees()
    {
        return $this->hasMany(Employee::className(), ['dep_id' => 'Dep_id']);
    }
}
