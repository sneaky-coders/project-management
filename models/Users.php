<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "users".
 *
 * @property int $id
 * @property string $username
 * @property string $email
 * @property string $password_hash
 * @property string $auth_key
 * @property int|null $status
 * @property string $created_at
 * @property string $updated_at
 *
 * @property WebsiteRenewal[] $websiteRenewals
 * @property WebsiteWorkLog[] $websiteWorkLogs
 */
class Users extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'users';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['username', 'email', 'password_hash', 'auth_key'], 'required'],
            [['status'], 'integer'],
            [['created_at', 'updated_at'], 'safe'],
            [['username', 'email', 'password_hash'], 'string', 'max' => 255],
            [['auth_key'], 'string', 'max' => 32],
            [['username'], 'unique'],
            [['email'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'username' => 'Username',
            'email' => 'Email',
            'password_hash' => 'Password Hash',
            'auth_key' => 'Auth Key',
            'status' => 'Status',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }

    /**
     * Gets query for [[WebsiteRenewals]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getWebsiteRenewals()
    {
        return $this->hasMany(WebsiteRenewal::className(), ['maintainer_id' => 'id']);
    }

    /**
     * Gets query for [[WebsiteWorkLogs]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getWebsiteWorkLogs()
    {
        return $this->hasMany(WebsiteWorkLog::className(), ['maintainer_id' => 'id']);
    }
}
