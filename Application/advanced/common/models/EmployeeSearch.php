<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Employee;

/**
 * EmployeeSearch represents the model behind the search form about `common\models\Employee`.
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
            [['First_Name', 'Last_Name', 'Address', 'Email', 'Job_Title'], 'safe'],
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

        $query->andFilterWhere(['like', 'First_Name', $this->First_Name])
            ->andFilterWhere(['like', 'Last_Name', $this->Last_Name])
            ->andFilterWhere(['like', 'Address', $this->Address])
            ->andFilterWhere(['like', 'Email', $this->Email])
            ->andFilterWhere(['like', 'Job_Title', $this->Job_Title]);

        return $dataProvider;
    }
}
