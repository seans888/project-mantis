<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "leaves".
 *
 * @property integer $id
 * @property string $date
 * @property string $status
 * @property string $leave_request
 * @property string $leave_type
 *
 * @property Employee $id0
 */
class Leaves extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'leaves';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'date', 'status', 'leave_request', 'leave_type'], 'required'],
            [['id'], 'integer'],
            [['date'], 'safe'],
            [['status', 'leave_request', 'leave_type'], 'string', 'max' => 100],
            [['id'], 'exist', 'skipOnError' => true, 'targetClass' => Employee::className(), 'targetAttribute' => ['id' => 'leave_id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'date' => 'Date',
            'status' => 'Status',
            'leave_request' => 'Leave Request',
            'leave_type' => 'Leave Type',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getId0()
    {
        return $this->hasOne(Employee::className(), ['leave_id' => 'id']);
    }
}
