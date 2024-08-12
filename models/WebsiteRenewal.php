<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "website_renewal".
 *
 * @property int $id
 * @property string $website_name
 * @property string $renewal_date
 * @property int $renewal_interval
 * @property string|null $last_renewal_date
 * @property string|null $status
 * @property string|null $notes
 * @property string|null $bill_before_payment
 * @property string|null $bill_after_payment
 * @property string|null $technology_stack
 * @property int|null $maintainer_id
 * @property string $created_at
 * @property string $updated_at
 *
 * @property Users $maintainer
 * @property WebsiteWorkLog[] $websiteWorkLogs
 */
class WebsiteRenewal extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'website_renewal';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['website_name', 'renewal_date', 'renewal_interval'], 'required'],
            [['renewal_date', 'last_renewal_date', 'created_at', 'updated_at'], 'safe'],
            [['renewal_interval', 'maintainer_id'], 'integer'],
            [['status', 'notes'], 'string'],
            [['website_name', 'bill_before_payment', 'bill_after_payment', 'technology_stack'], 'string', 'max' => 255],
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
            'website_name' => 'Website Name',
            'renewal_date' => 'Renewal Date',
            'renewal_interval' => 'Renewal Interval',
            'last_renewal_date' => 'Last Renewal Date',
            'status' => 'Status',
            'notes' => 'Notes',
            'bill_before_payment' => 'Bill Before Payment',
            'bill_after_payment' => 'Bill After Payment',
            'technology_stack' => 'Technology Stack',
            'maintainer_id' => 'Maintainer ID',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
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

    /**
     * Gets query for [[WebsiteWorkLogs]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getWebsiteWorkLogs()
    {
        return $this->hasMany(WebsiteWorkLog::className(), ['website_id' => 'id']);
    }
}
