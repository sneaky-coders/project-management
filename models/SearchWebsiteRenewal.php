<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\WebsiteRenewal;

/**
 * SearchWebsiteRenewal represents the model behind the search form of `app\models\WebsiteRenewal`.
 */
class SearchWebsiteRenewal extends WebsiteRenewal
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'renewal_interval', 'maintainer_id'], 'integer'],
            [['website_name', 'renewal_date', 'last_renewal_date', 'status', 'notes', 'bill_before_payment', 'bill_after_payment', 'technology_stack', 'created_at', 'updated_at'], 'safe'],
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
        $query = WebsiteRenewal::find();

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
            'renewal_date' => $this->renewal_date,
            'renewal_interval' => $this->renewal_interval,
            'last_renewal_date' => $this->last_renewal_date,
            'maintainer_id' => $this->maintainer_id,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ]);

        $query->andFilterWhere(['like', 'website_name', $this->website_name])
            ->andFilterWhere(['like', 'status', $this->status])
            ->andFilterWhere(['like', 'notes', $this->notes])
            ->andFilterWhere(['like', 'bill_before_payment', $this->bill_before_payment])
            ->andFilterWhere(['like', 'bill_after_payment', $this->bill_after_payment])
            ->andFilterWhere(['like', 'technology_stack', $this->technology_stack]);

        return $dataProvider;
    }
}
