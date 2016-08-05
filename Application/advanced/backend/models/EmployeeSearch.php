<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Employee;

/**
 * EmployeeSearch represents the model behind the search form about `backend\models\Employee`.
 */
class EmployeeSearch extends Employee
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['emp_num', 'salary', 'dep_id', 'leave_id'], 'integer'],
            [['emp_fname', 'emp_lname', 'emp_address', 'emp_email', 'job_title'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Employee::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'emp_num' => $this->emp_num,
            'salary' => $this->salary,
            'dep_id' => $this->dep_id,
            'leave_id' => $this->leave_id,
        ]);

        $query->andFilterWhere(['like', 'emp_fname', $this->emp_fname])
            ->andFilterWhere(['like', 'emp_lname', $this->emp_lname])
            ->andFilterWhere(['like', 'emp_address', $this->emp_address])
            ->andFilterWhere(['like', 'emp_email', $this->emp_email])
            ->andFilterWhere(['like', 'job_title', $this->job_title]);

        return $dataProvider;
    }
}
