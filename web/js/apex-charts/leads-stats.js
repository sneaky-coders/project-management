(function($) {
    "use strict";
    jQuery(document).on('ready', function() {

        var options = {
            chart: {
                width: '100%',
                height: 365,
                type: 'pie',
            },
            colors: ['#2962ff', '#2458e5', '#204ecc', '#1c44b2', '#183a99'],
            series: [25, 15, 44, 55, 41, 17],
            labels: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
            theme: {
                monochrome: {
                    enabled: true
                }
            },
            title: {
                text: "Number of leads"
            },
            responsive: [{
                breakpoint: 300,
                options: {
                    chart: {
                        width: 200
                    },
                    legend: {
                        position: 'bottom'
                    }
                }
            }]
        }

        var chart = new ApexCharts(
            document.querySelector("#leads-stats"),
            options
        );

        chart.render();

    });
}(jQuery))