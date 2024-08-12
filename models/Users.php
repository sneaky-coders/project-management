<?php

namespace app\models;

use Yii;
use yii\db\ActiveRecord;
use yii\web\IdentityInterface;

class Users extends ActiveRecord implements IdentityInterface
{

    /**
     * {@inheritdoc}
     */
    
     const SCENARIO_REGISTER = 'register';
     const SCENARIO_PASSWORD_CHANGE = 'change password';
     const SCENARIO_FORGOT_PASSWORD = 'forgot password';

     public $password_repeat;
    public $old_password;

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
        [['username',  'password', 'email'], 'required'],
        [['username'], 'unique'],

        [['created_at', 'updated_at'], 'safe'],
        [['username'], 'string', 'max' => 100],
        [['email'], 'email'],
        ['password', 'string', 'min' => 8], // Minimum length of 8 characters
        ['password', 'match', 'pattern' => '/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$/', 'message' => 'Password must contain at least one uppercase letter, one lowercase letter, and one digit.'], // Regex validation for password complexity
        [['email'], 'unique'],
        [['email'], 'required', 'on' => self::SCENARIO_FORGOT_PASSWORD],
        [['email'], 'email', 'on' => self::SCENARIO_FORGOT_PASSWORD],
        [['email'], 'exist', 'targetClass' => self::class, 'on' => self::SCENARIO_FORGOT_PASSWORD],
    ];
}


    public function validatePasswordComplexity($attribute, $params)
    {
        Yii::info('Validating password complexity...');
        Yii::info($this->$attribute); // Check the value being validated
    
        if (!preg_match('/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$/', $this->$attribute)) {
            Yii::info('Password complexity validation failed.');
            $this->addError($attribute, 'Password must contain at least one uppercase letter, one lowercase letter, and one digit.');
        } else {
            Yii::info('Password complexity validation passed.');
        }
    }
    

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'user_id' => 'User ID',
            'username' => 'Username',
            'fullname' => 'Full Name',
            'password' => 'Password',
            'email' => 'Email',
            'level' => 'Level',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'is_deleted' => 'Is Deleted',
        ];
    }

    /**
     * Finds an identity by the given ID.
     * @param string|int $id the ID to be looked for
     * @return IdentityInterface|null the identity object that matches the given ID.
     */
    public static function findIdentity($id)
    {
        return static::findOne($id);
    }

    /**
     * Finds an identity by the given token.
     * @param string $token the token to be looked for
     * @param mixed $type the type of the token. The value of this parameter depends on the implementation.
     * For example, it can be an access token or a refresh token.
     * @return IdentityInterface|null the identity object that matches the given token.
     */
    public static function findIdentityByAccessToken($token, $type = null)
    {
        // Implement this method according to your application's logic
        return null;
    }

    /**
     * {@inheritdoc}
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * {@inheritdoc}
     */
    public function getAuthKey()
    {
        return null;
    }

    /**
     * {@inheritdoc}
     */
    public function validateAuthKey($authKey)
    {
        return null;
    }

    /**
     * Finds user by username.
     * @param string $username
     * @return static|null
     */
    public static function findByUsername($username)
    {
        return static::findOne(['username' => $username]);
    }

    /**
     * Validates password.
     * @param string $password
     * @return bool if password provided is valid for current user
     */
    public function validatePassword($password)
    {
        return Yii::$app->security->validatePassword($password, $this->password);
    }
}