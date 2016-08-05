<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "department".
 *
 * @property integer $Dep_id
 * @property string $Dep_name
 * @property string $Dep_description
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
            [['Dep_id', 'Dep_name', 'Dep_description'], 'required'],
            [['Dep_id'], 'integer'],
            [['Dep_name'], 'string', 'max' => 100],
            [['Dep_description'], 'string', 'max' => 150],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'Dep_id' => 'Dep ID',
            'Dep_name' => 'Dep Name',
            'Dep_description' => 'Dep Description',
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
