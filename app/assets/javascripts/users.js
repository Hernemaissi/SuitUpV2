//= require d3 


$(function() {
    // var width = 960,
    //     height = 500;

    // var domain0 = [+new Date(2000, 0, 1), +new Date(2003, 0, 1)],
    //     domain1 = [+new Date(2000, 1, 1), +new Date(2000, 1, 2)];

    // var x = d3.time.scale.utc()
    //     .domain(domain0)
    //     .range([0, width]);

    // var xAxis = d3.svg.axis()
    //     .scale(x);

    // var svg = d3.select("body").append("svg")
    //     .attr("width", width)
    //     .attr("height", height)
    //     .append("g")
    //     .attr("transform", "translate(0,200)");

    // console.log(svg);

    // var gAxis = svg.append("g")
    //     .attr("class", "x axis")
    //     .call(xAxis);

    // transition();
    // setInterval(transition, 10000);

    // function transition() {
    //     gAxis.transition().duration(8500).tween("axis", function(d, i) {
    //         var i = d3.interpolate(domain0, domain1);
    //         return function(t) {
    //             x.domain(i(t));
    //             gAxis.call(xAxis);
    //         }
    //     });
    // }


    var margin = {
        top: 20,
        right: 50,
        bottom: 30,
        left: 50
    },
        width = 400 - margin.left - margin.right,
        height = 200 - margin.top - margin.bottom;

    var parseDate = d3.time.format("%d-%b-%y").parse,
        bisectDate = d3.bisector(function(d) {
            return d.date;
        }).left,
        formatCurrency = function(d) {
            return d;
        };

    var x = d3.time.scale()
        .range([0, width]);

    var y = d3.scale.linear()
        .range([height, 0]);

    var xAxis = d3.svg.axis()
        .scale(x)
        .orient("bottom")
        .tickFormat(d3.time.format("%d %b"));

    var yAxis = d3.svg.axis()
        .scale(y)
        .orient("left");

    var line = d3.svg.line()
        .x(function(d) {
            return x(d.date);
        })
        .y(function(d) {
            return y(d.close);
        });


    var svg = d3.select("#graph").append("svg")
        .attr("width", width + margin.left + margin.right)
        .attr("height", height + margin.top + margin.bottom)
        .append("g")
        .attr("transform", "translate(" + margin.left + "," + margin.top + ")");


    d3.json("../adverts/impressions/1", function(error, json) {
        // return console.warn(error) if error
        data = json.data;
        console.log(data);
        // data.forEach(function(d) {
        //     console.log(d)
        //     d.date = parseDate(d.date);
        //     d.close = +d.close;
        // });
        for (var i = 0; i < data.length; i++) {
            // data[i]
            data[i].date = parseDate(data[i].date);
            console.log(data[i]);
        };

        data.sort(function(a, b) {
            return a.date - b.date;
        });

        x.domain([data[0].date, data[data.length - 1].date]);
        y.domain(d3.extent(data, function(d) {
            return d.close;
        }));

        svg.append("g")
            .attr("class", "x axis")
            .attr("transform", "translate(0," + height + ")")
            .call(xAxis);

        svg.append("g")
            .attr("class", "y axis")
            .call(yAxis)
            .append("text")
            .attr("transform", "rotate(-90)")
            .attr("y", 6)
            .attr("dy", ".71em")
            .style("text-anchor", "end")
            .text("Views");

        svg.append("path")
            .datum(data)
            .attr("class", "line")
            .attr("d", line);

        var focus = svg.append("g")
            .attr("class", "focus")
            .style("display", "none");

        focus.append("circle")
            .attr("r", 4.5);

        focus.append("text")
            .attr("x", 9)
            .attr("dy", ".35em");

        svg.append("rect")
            .attr("class", "overlay")
            .attr("width", width)
            .attr("height", height)
            .on("mouseover", function() {
                focus.style("display", null);
            })
            .on("mouseout", function() {
                focus.style("display", "none");
            })
            .on("mousemove", mousemove);

        function mousemove() {
            var x0 = x.invert(d3.mouse(this)[0]),
                i = bisectDate(data, x0, 1),
                d0 = data[i - 1],
                d1 = data[i],
                d = x0 - d0.date > d1.date - x0 ? d1 : d0;
            focus.attr("transform", "translate(" + x(d.date) + "," + y(d.close) + ")");
            focus.select("text").text(d);
        }
    });
});