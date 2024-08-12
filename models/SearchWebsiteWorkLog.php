<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\WebsiteWorkLog;

/**
 * SearchWebsiteWorkLog represents the model behind the search form of `app\models\WebsiteWorkLog`.
 */
class SearchWebsiteWorkLog extends WebsiteWorkLog
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'website_id', 'maintainer_id'], 'integer'],
            [['work_description', 'work_date'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
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
        $query = WebsiteWorkLog::find();

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
            'id' => $this->id,
            'website_id' => $this->website_id,
            'maintainer_id' => $this->maintainer_id,
            'work_date' => $this->work_date,
        ]);

        $query->andFilterWhere(['like', 'work_description', $this->work_description]);

        return $dataProvider;
    }
}
