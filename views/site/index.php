<?php

use yii\helpers\Html;
use app\models\WebsiteWorkLog;
use app\models\WebsiteRenewal;
use app\models\Users; // User model

/* @var $this yii\web\View */
/* @var $recentWorkLogs app\models\WebsiteWorkLog[] */
/* @var $upcomingRenewals app\models\WebsiteRenewal[] */

$this->title = 'Dashboard';

// Fetch recent work logs
$recentWorkLogs = WebsiteWorkLog::find()
    ->joinWith('maintainer')
    ->joinWith('website')
    ->orderBy(['work_date' => SORT_DESC])
    ->limit(5)
    ->all();

// Fetch websites coming up for renewal in the next 30 days
$upcomingRenewals = WebsiteRenewal::find()
    ->where(['status' => 'active'])
    ->andWhere(['<=', 'renewal_date', date('Y-m-d', strtotime('+30 days'))])
    ->all();

// Fetch all websites for renewal details
$allWebsites = WebsiteRenewal::find()->all();

// Fetch statistics
$totalWebsites = WebsiteRenewal::find()->count();
$totalWorkLogs = WebsiteWorkLog::find()->count();
$totalUsers = Users::find()->count();  // Assuming you have a User model

// Set flash message for renewal alert
if (!empty($upcomingRenewals)) {
    Yii::$app->session->setFlash('renewalAlert', 'Some websites are coming up for renewal. Please check the details.');
}
?>

<!-- Flash Messages -->
<?php if (Yii::$app->session->hasFlash('renewalAlert')): ?>
    <div class="alert alert-warning">
        <?= Yii::$app->session->getFlash('renewalAlert') ?>
    </div>
<?php endif; ?>

<!-- Dashboard Layout -->
<div class="dashboard-container">

    <!-- Statistics Overview -->
    <div class="card statistics-overview">
        <h2>Statistics Overview</h2>
        <div class="stats">
            <div class="stat-item">
                <h3>Total Websites</h3>
                <p><?= Html::encode($totalWebsites) ?></p>
            </div>
            <div class="stat-item">
                <h3>Total Work Logs</h3>
                <p><?= Html::encode($totalWorkLogs) ?></p>
            </div>
            <div class="stat-item">
                <h3>Total Users</h3>
                <p><?= Html::encode($totalUsers) ?></p>
            </div>
        </div>
    </div>

    <!-- Recent Work Logs -->
    <div class="card timeline">
        <h2>Recent Work Logs</h2>
        <div class="timeline-items">
            <?php foreach ($recentWorkLogs as $log): ?>
                <div class="timeline-item" onclick="showDetails('<?= Html::encode($log->work_description) ?>', '<?= Html::encode($log->maintainer->username) ?>', '<?= Html::encode($log->website->website_name) ?>', '<?= date('M d, Y', strtotime($log->work_date)) ?>')">
                    <div class="timeline-content">
                        <h4><?= Html::encode($log->work_description) ?></h4>
                        <p><strong>Maintainer:</strong> <?= Html::encode($log->maintainer->username) ?></p>
                        <p><strong>Website:</strong> <?= Html::encode($log->website->website_name) ?></p>
                        <p><strong>Date:</strong> <?= date('M d, Y', strtotime($log->work_date)) ?></p>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    </div>

    <!-- Upcoming Renewals -->
    <div class="card upcoming-renewals">
        <h2>Websites Coming Up for Renewal</h2>
        <?php if (!empty($upcomingRenewals)): ?>
            <ul class="renewal-list">
                <?php foreach ($upcomingRenewals as $renewal): ?>
                    <?php
                        $currentDate = date('Y-m-d');
                        $isPastRenewal = $renewal->renewal_date < $currentDate;
                        $renewalClass = $isPastRenewal ? 'past-renewal' : '';
                    ?>
                    <li class="renewal-item <?= $renewalClass ?>" onclick="showRenewalDetails('<?= Html::encode($renewal->website_name) ?>', '<?= date('M d, Y', strtotime($renewal->renewal_date)) ?>', '<?= date('M d, Y', strtotime($renewal->last_renewal_date)) ?>')">
                        <div class="website-name"><?= Html::encode($renewal->website_name) ?></div>
                        <div class="renewal-date">Next Renewal: <?= date('M d, Y', strtotime($renewal->renewal_date)) ?></div>
                    </li>
                <?php endforeach; ?>
            </ul>
        <?php else: ?>
            <p>No upcoming renewals.</p>
        <?php endif; ?>
    </div>

    <!-- All Websites -->
    <div class="card all-websites">
        <h2>All Websites</h2>
        <ul class="website-list">
            <?php foreach ($allWebsites as $website): ?>
                <li class="website-item">
                    <div class="website-name"><?= Html::encode($website->website_name) ?></div>
                    <div class="renewal-date">Last Renewal: <?= date('M d, Y', strtotime($website->last_renewal_date)) ?></div>
                    <div class="next-renewal-date">Next Renewal: <?= date('M d, Y', strtotime($website->renewal_date)) ?></div>
                </li>
            <?php endforeach; ?>
        </ul>
    </div>

</div>

<!-- Modals -->
<div id="workLogModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal('workLogModal')">&times;</span>
        <h3>Work Log Details</h3>
        <p id="workLogDescription"></p>
        <p id="workLogMaintainer"></p>
        <p id="workLogWebsite"></p>
        <p id="workLogDate"></p>
    </div>
</div>

<div id="renewalModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal('renewalModal')">&times;</span>
        <h3>Renewal Details</h3>
        <p id="renewalWebsiteName"></p>
        <p id="renewalDate"></p>
        <p id="lastRenewalDate"></p>
    </div>
</div>

<script>
    function showDetails(description, maintainer, website, date) {
        document.getElementById('workLogDescription').innerText = 'Description: ' + description;
        document.getElementById('workLogMaintainer').innerText = 'Maintainer: ' + maintainer;
        document.getElementById('workLogWebsite').innerText = 'Website: ' + website;
        document.getElementById('workLogDate').innerText = 'Date: ' + date;
        document.getElementById('workLogModal').style.display = 'block';
    }

    function showRenewalDetails(websiteName, renewalDate, lastRenewalDate) {
        document.getElementById('renewalWebsiteName').innerText = 'Website: ' + websiteName;
        document.getElementById('renewalDate').innerText = 'Next Renewal Date: ' + renewalDate;
        document.getElementById('lastRenewalDate').innerText = 'Last Renewal Date: ' + lastRenewalDate;
        document.getElementById('renewalModal').style.display = 'block';
    }

    function closeModal(modalId) {
        document.getElementById(modalId).style.display = 'none';
    }
</script>

<style>
    /* General Styles */
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f7f6;
        color: #333;
    }

    .alert {
        padding: 15px;
        margin-bottom: 20px;
        border: 1px solid transparent;
        border-radius: 4px;
        background-color: #fff3cd;
        color: #856404;
    }

    .alert-warning {
        background-color: #fff3cd;
        border-color: #ffeeba;
    }

    /* Card Styles */
    .card {
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding: 20px;
        margin-top: 20px;
    }

    /* Statistics Overview Styles */
    .statistics-overview h2 {
        font-size: 1.75rem;
        color: #0072ff;
    }

    .stats {
        display: flex;
        justify-content: space-around;
    }

    .stat-item {
        text-align: center;
    }

    .stat-item h3 {
        font-size: 1.25rem;
        color: #333;
    }

    .stat-item p {
        font-size: 2rem;
        font-weight: bold;
        color: #0072ff;
    }

    /* Timeline Styles */
    .timeline {
        margin-top: 20px;
    }

    .timeline h2 {
        font-size: 1.75rem;
        color: #0072ff;
    }

    .timeline-item {
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 8px;
        margin-bottom: 10px;
        cursor: pointer;
        background-color: #fff;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    .timeline-item:hover {
        background-color: #f0f8ff;
    }

    .timeline-content h4 {
        font-size: 1.2rem;
        margin: 0;
    }

    .timeline-content p {
        margin: 5px 0;
    }

    /* Upcoming Renewals Styles */
    .upcoming-renewals h2 {
        font-size: 1.75rem;
        color: #0072ff;
    }

    .renewal-list {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .renewal-item {
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 8px;
        margin-bottom: 10px;
        cursor: pointer;
        background-color: #fff;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    .renewal-item:hover {
        background-color: #f0f8ff;
    }

    .past-renewal {
        background-color: #f8d7da;
        border-color: #f5c6cb;
    }

    .past-renewal .website-name {
        color: #721c24;
    }

    /* All Websites Styles */
    .all-websites h2 {
        font-size: 1.75rem;
        color: #0072ff;
    }

    .website-list {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .website-item {
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 8px;
        margin-bottom: 10px;
        background-color: #fff;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    /* Modal Styles */
    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgb(0,0,0);
        background-color: rgba(0,0,0,0.4);
        padding-top: 60px;
    }

    .modal-content {
        background-color: #fefefe;
        margin: 5% auto;
        padding: 20px;
        border: 1px solid #888;
        width: 80%;
        max-width: 600px;
    }

    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }
</style>
