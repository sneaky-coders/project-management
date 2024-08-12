<?php

/* @var $this yii\web\View */

use app\models\Client;
use app\models\Employee;
use app\models\LoginLog;
use app\models\Purchase;
use yii\helpers\Html;
use app\models\Invoice;
use yii\db\Expression;
use yii\helpers\Json;

$month = date('m'); // current month

// Count total number of records for the specified month
$currentMonth = date('m'); // Get the current month in numeric format (e.g., 01 for January, 02 for February, etc.)

$totalRevenue = Invoice::find()
	->where(new Expression('MONTH(invoice_date) = :month', [':month' => $currentMonth]))
	->sum('total');

$logsCount = LoginLog::find()->count();

$total = Invoice::find()->where(new Expression('MONTH(invoice_date) = :month', [':month' => $currentMonth]))->count();




// Calculate the sum of the 'total' field for the specified month
$totalSum = Invoice::find()->sum('total');
$totalPurchase = Purchase::find()->sum('amount');
$client = Client::find()->count();
$emp = Employee::find()->count();

$profit = $totalSum - $totalPurchase;
$invoices = Invoice::find()->all();

$chartData = [];
foreach ($invoices as $invoice) {
	$chartData[] = [
		'x' => $invoice->invoice_number,
		'y' => $invoice->total,
		'payment_status' => $invoice->payment_status,
	];
}

$pie = Json::encode($chartData);

// Fetch purchase data
$purchases = Purchase::find()->all();

// Calculate monthly revenue (assuming you have appropriate fields in your tables)
$monthlyRevenue = [];
foreach ($invoices as $invoice) {
	$month = date('Y-m', strtotime($invoice->invoice_date));
	if (!isset($monthlyRevenue[$month])) {
		$monthlyRevenue[$month] = 0;
	}
	$monthlyRevenue[$month] += $invoice->total;
}

$months = json_encode(array_keys($monthlyRevenue));
$revenues = json_encode(array_values($monthlyRevenue));

$recentOrders = Invoice::find()
	->joinWith('client')
	->orderBy(['invoice_id' => SORT_DESC])
	->limit(10)
	->all();

?>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<!-- Main Content Header -->
<div class="main-content-header">
	<h1>Dashboard</h1>
	<ol class="breadcrumb">
		<li class="breadcrumb-item">
			<a href="/">Dashboard</a>
		</li>
		<li class="breadcrumb-item active">
			<span class="active">Sales</span>
		</li>
	</ol>
</div>

<?php
$successMessage = Yii::$app->session->getFlash('success');
if ($successMessage !== null) {
	echo '<div class="alert alert-success flash-message" style="width: 40%;">' . $successMessage . '</div>';
}


$this->registerJs("
    var options = {
        chart: {
            type: 'pie',
        },
        series: [],
        labels: [],
        colors: [],
    };

    var chartData = $pie;  // Echo the PHP variable containing JSON data

    chartData.forEach(function(data) {
        options.series.push(data.y);
        options.labels.push(data.x);
        // Set colors based on payment status
        if (data.payment_status == 1) {
            options.colors.push('#4CAF50'); // Green for paid
        } else {
            options.colors.push('#FFC107'); // Orange for pending or other statuses
        }
    });

    var chart = new ApexCharts(document.querySelector('#sales-by-countries1'), options);
    chart.render();
", \yii\web\View::POS_END);


?>
<!-- End Main Content Header -->

<!-- Stats Card -->
<div class="row">
	<div class="col-lg-3 col-sm-6">
		<div class="stats-card-one mb-30">
			<div class="d-flex justify-content-between align-items-center">
				<div>
					<p class="mb-10 line-height-1">Monthly Revenue</p>
					<h3 class="mb-0 fs-25">₹<?php echo $totalRevenue ?></h3>
				</div>

				<span class="badge badge-cyan fs-12">
					<i class="icofont-swoosh-up"></i>
					<span class="fw-600 m-l-5">8.70%</span>
				</span>
			</div>

			<div class="mt-15">
				<div class="d-flex justify-content-between">
					<div class="d-flex align-items-center">
						<span>Monthly Goal</span>
					</div>
					<span class="fw-600">70%</span>
				</div>

				<div class="progress progress-sm mt-1">
					<div class="progress-bar bg-primary" style="width: 70%"></div>
				</div>
			</div>
		</div>
	</div>

	<div class="col-lg-3 col-sm-6">
		<div class="stats-card-one mb-30">
			<div class="d-flex justify-content-between align-items-center">
				<div>
					<p class="mb-10 line-height-1">Total Revenue</p>
					<h3 class="mb-0 fs-25">₹<?php echo $totalSum ?></h3>
				</div>

				<span class="badge badge-cyan font-size-12">
					<i class="icofont-swoosh-up"></i>
					<span class="fw-600 m-l-5">8.80%</span>
				</span>
			</div>

			<div class="mt-15">
				<div class="d-flex justify-content-between">
					<div class="d-flex align-items-center">
						<span>Monthly Goal</span>
					</div>
					<span class="fw-600">75%</span>
				</div>

				<div class="progress progress-sm mt-1">
					<div class="progress-bar bg-success" style="width: 75%"></div>
				</div>
			</div>
		</div>
	</div>

	<div class="col-lg-3 col-sm-6">
		<div class="stats-card-one mb-30">
			<div class="d-flex justify-content-between align-items-center">
				<div>
					<p class="mb-10 line-height-1">Total Clients</p>
					<h3 class="mb-0 fs-25"><?php echo $client ?></h3>
				</div>

				<span class="badge badge-red font-size-12">
					<i class="icofont-swoosh-down"></i>
					<span class="fw-600 m-l-5">6.10%</span>
				</span>
			</div>

			<div class="mt-15">
				<div class="d-flex justify-content-between">
					<div class="d-flex align-items-center">
						<span>Monthly Goal</span>
					</div>
					<span class="fw-600">60%</span>
				</div>

				<div class="progress progress-sm mt-1">
					<div class="progress-bar bg-warning" style="width: 60%"></div>
				</div>
			</div>
		</div>
	</div>

	<div class="col-lg-3 col-sm-6">
		<div class="stats-card-one mb-30">
			<div class="d-flex justify-content-between align-items-center">
				<div>
					<p class="mb-10 line-height-1">Total Employees</p>
					<h3 class="mb-0 fs-25"><?php echo $emp ?></h3>
				</div>

				<span class="badge badge-red font-size-12">
					<i class="icofont-swoosh-down"></i>
					<span class="fw-600 m-l-5">5.70%</span>
				</span>
			</div>

			<div class="mt-15">
				<div class="d-flex justify-content-between">
					<div class="d-flex align-items-center">
						<span>Monthly Goal</span>
					</div>
					<span class="fw-600">50%</span>
				</div>

				<div class="progress progress-sm mt-1">
					<div class="progress-bar bg-purple" style="width: 50%"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End Stats Card -->

<!-- Month Sales Statistics -->
<div class="row">
	<div class="col-lg-8">
		<div class="card mb-30">
			<div class="card-body">
				<div class="card-header">
					<h5 class="card-title"><?= Html::encode($this->title) ?></h5>
				</div>
				<div id="month-sales-statistics1" class="mh-100"></div>
			</div>
		</div>
	</div>

	<script>
		var months = <?= $months ?>;
		var revenues = <?= $revenues ?>;
	</script>

	<div class="col-lg-4">
		<div class="card mb-30">
			<div class="card-body">
				<div class="card-header">
					<h5 class="card-title">Overview</h5>
				</div>

				<div class="media pt-2 pb-3 border-bottom">
					<div class="media-body">
						<h4 class="mt-0 mb-1 font-size-22 font-weight-normal"><?php echo $logsCount ?></h4>
						<span class="text-muted">Total Visitors</span>
					</div>
					<i data-feather="users" class="icon align-self-center theme-color"></i>
				</div>

				<div class="media py-3 border-bottom">
					<div class="media-body">
						<h4 class="mt-0 mb-1 font-size-22 font-weight-normal"><?php echo $profit ?></h4>
						<span class="text-muted">Monthly Profit</span>
					</div>
					<i data-feather="dollar-sign" class="icon align-self-center theme-color"></i>
				</div>

				<div class="media py-3 border-bottom">
					<div class="media-body">
						<h4 class="mt-0 mb-1 font-size-22 font-weight-normal"><?php echo $total ?></h4>
						<span class="text-muted">Monthly Orders</span>
					</div>
					<i data-feather="check-circle" class="icon align-self-center theme-color"></i>
				</div>


			</div>
		</div>
	</div>
</div>

<!-- Sales by Countries & Recent Order -->
<div class="row">
	<div class="col-lg-12 col-xl-5">
		<div class="card mb-30">
			<div class="card-body">
				<div class="card-header">
					<h5 class="card-title">Sales by Sales Order</h5>
				</div>

				<!-- File path: assets/js/apex-charts/sales-by-countries.js -->
				<div id="sales-by-countries1"></div>
			</div>
		</div>
	</div>

	<div class="col-lg-12 col-xl-7">
		<div class="card mb-30">
			<div class="card-body">
				<div class="card-header">
				
					<h5 class="card-title">Recent Sales Order</h5>
				</div>

				<div class="height-365">
					<div class="table-responsive">
						<table class="table table-hover mb-0">
							<thead class="bort-none borpt-0">
								<tr>
									<th scope="col">ID</th>
									<th scope="col">Invoice Number</th>
									<th scope="col">Customer</th>
									<th scope="col">Price</th>
									<th scope="col">Status</th>
								</tr>
							</thead>
							<tbody>
								<?php foreach ($recentOrders as $order): ?>
									<tr>
										<td><strong>#<?= $order->invoice_id ?></strong></td>
										<td><?= $order->invoice_number ?></td>
										<td><?= $order->client->companyname ?? 'NA' ?></td>
										<td>₹<?= $order->total ?></td>
										<td>
											<?php
											if ($order->payment_status == 1) {
												echo '<span class="badge badge-success py-1">Paid</span>';
											} else {
												echo '<span class="badge badge-warning py-1">Pending</span>';
											}
											?>
										</td>
									</tr>
								<?php endforeach; ?>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- Top Rated Products & Best Sellers -->

<!-- Top Users Conversion Rate & Product Categories -->

<script>
	// Delay in milliseconds before hiding the flash message
	const delay = 5000; // 5 seconds

	// Hide the flash message after a delay
	setTimeout(() => {
		const alert = document.querySelector('.alert');
		if (alert) {
			alert.style.display = 'none';
		}
	}, delay);

	document.addEventListener('DOMContentLoaded', function () {

		var options = {
			chart: {
				type: 'bar'
			},
			series: [{
				name: 'Revenue',
				data: revenues
			}],
			xaxis: {
				categories: months
			}
		}

		var chart = new ApexCharts(document.querySelector("#month-sales-statistics1"), options);
		chart.render();
	});

</script>