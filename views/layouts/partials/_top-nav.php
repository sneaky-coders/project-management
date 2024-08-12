<?php
use app\models\Users;
use yii\helpers\Html;
use yii\helpers\Url;

$model = new Users();

?>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Recursive:wght@300..1000&display=swap');

    /* Profile Dropdown Styles */
    .profile-nav-item .dropdown-menu {
        min-width: 250px;
        border-radius: 15px;
        padding: 20px;
        box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.1);
    }

    .profile-nav-item .dropdown-menu .user-details-card {
        display: flex;
        align-items: center;
        margin-bottom: 20px;
    }

    .profile-nav-item .dropdown-menu .user-details-card .profile-image {
        margin-right: 20px;
    }

    /* Styling for profile image */
    .profile-image {
        text-align: center;
        margin-bottom: 10px;
    }

    .profile-image img {
        border-radius: 50%;
        width: 80px; /* Increased width */
        height: 80px; /* Increased height */
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    }

    .profile-nav-item .dropdown-menu .user-details-card .user-info p {
        margin: 5px 0;
        font-size: 16px;
        color: #333;
    }

    .profile-nav-item .dropdown-menu .user-details-card .user-info p:first-child {
        font-weight: bold;
    }

    .profile-nav-item .dropdown-menu .dropdown-divider {
        margin: 20px 0;
        border-color: #eee;
    }

    .profile-nav-item .dropdown-menu a.dropdown-item {
        padding: 10px 20px;
        font-size: 16px;
        color: #333;
    }

    .profile-nav-item .dropdown-menu a.dropdown-item:hover {
        background-color: #f5f5f5;
    }
</style>


<?php
if (!Yii::$app->user->isGuest) {
    echo '<nav class="navbar navbar-expand fixed-top top-menu">
        <div class="container-fluid">
            <a class="navbar-brand" href="' . Url::to(['/site/index']) . '">
                ' . Html::img("@web/images/logo.png", ["alt" => "Profile",  "height" => "55px", "width" => "55px"]) . '
            </a> 
            <a class="navbar-brand" href="' . Url::to(['/site/index']) . '">
                <h5 style="margin-top:10px">ANKYPRO-CONNECT</h5>
            </a>
    
            <!-- Burger menu -->
            <div class="burger-menu toggle-menu">
                <span class="top-bar"></span>
                <span class="middle-bar"></span>
                <span class="bottom-bar"></span>
            </div>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <!-- Mega Menu -->
            
                <!-- Search form -->
            
                <!-- Right nav -->
                <ul class="navbar-nav right-nav ml-auto">
                    <!-- Email Notification dropdown -->
                  

                        <!-- Message Notification dropdown -->
                      

                        <!-- Profile dropdown -->
                        <li class="nav-item dropdown profile-nav-item">
    <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <div class="menu-profile">
             <span class="name">' . (Yii::$app->user->isGuest ? '' : Yii::$app->user->identity->username) . '</span>
             ' . Html::img('@web/uploads/' . Yii::$app->user->identity->image, ['class' => 'img-thumbnail', 'alt' => 'Profile Picture', "height" => "40px", "width" => "40px"]) . '
        </div>
    </a>
    <div class="dropdown-menu">
        <!-- User details card -->
        <div class="user-details-card">
            <!-- Profile Image -->
            <div class="profile-image">
            ' . Html::img('@web/uploads/' . Yii::$app->user->identity->image, ['class' => 'rounded-circle', 'alt' => 'Profile Picture', "width" => "80px", "height" => "80px"]) . '
            </div>
            <!-- User Information -->
            <div class="user-info">
            <p>' . Yii::$app->user->identity->username . '</p>
            <p>' . Yii::$app->user->identity->email . '</p>
                <!-- Add more user details here if needed -->
            </div>
        </div>
        <div class="dropdown-divider"></div>
        <!-- Logout link -->
        ' . Html::a(
                '<i data-feather="log-out" class="icon"></i> Logout',
                ['/site/logout'],
                ['data-method' => 'post', 'class' => 'dropdown-item']
            ) . '
    </div>
</li>

                    </ul>
                </div>
            </div>
        </nav>';
}
?>
