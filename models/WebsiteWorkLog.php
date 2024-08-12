<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "website_work_log".
 *
 * @property int $id
 * @property int $website_id
 * @property int $maintainer_id
 * @property string $work_description
 * @property string $work_date
 *
 * @property WebsiteRenewal $website
 * @property Users $maintainer
 */
class WebsiteWorkLog extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'website_work_log';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['website_id', 'maintainer_id', 'work_description'], 'required'],
            [['website_id', 'maintainer_id'], 'integer'],
            [['work_description'], 'string'],
            [['work_date'], 'safe'],
            [['website_id'], 'exist', 'skipOnError' => true, 'targetClass' => WebsiteRenewal::className(), 'targetAttribute' => ['website_id' => 'id']],
            [['maintainer_id'], 'exist', 'skipOnError' => true, 'targetClass' => Users::className(), 'targetAttribute' => ['maintainer_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'website_id' => 'Website ID',
            'maintainer_id' => 'Maintainer ID',
            'work_description' => 'Work Description',
            'work_date' => 'Work Date',
        ];
    }

    /**
     * Gets query for [[Website]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getWebsite()
    {
        return $this->hasOne(WebsiteRenewal::className(), ['id' => 'website_id']);
    }

    /**
     * Gets query for [[Maintainer]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getMaintainer()
    {
        return $this->hasOne(Users::className(), ['id' => 'maintainer_id']);
    }
}
