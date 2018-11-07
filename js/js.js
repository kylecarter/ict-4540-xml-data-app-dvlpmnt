(function($, Chart) {
    var $canvas = $('#pie-chart');
    if (!$canvas.get( 0 )) return;
    
    var config = {
        labels: [
            "Pacific Islander",
            "Latino",
            "Native American",
            "Asian",
            "Caucasian",
            "African American",
            "Other"
        ],
        datasets: [{
            backgroundColor: ['#d9bde3', '#b4d3e8', '#b3e4c7', '#f8c1ba', '#f6d2ae', '#faeba6', '#dbe1e1'],
            hoverBackgroundColor: ['#7e3f95', '#31739f', '#35965d', '#d12a15', '#c26c16', '#c9a70b', '#6d8383'],
            data: [
                $canvas.attr('data-pacific'),
                $canvas.attr('data-latino'),
                $canvas.attr('data-indian'),
                $canvas.attr('data-asian'),
                $canvas.attr('data-white'),
                $canvas.attr('data-black'),
                $canvas.attr('data-other')
            ]
        }]
    };

    var chart = new Chart($canvas.get(0), {
        type: 'pie',
        data: config,
        options: {cutoutPercentage: 50}
    })
})(jQuery, Chart);