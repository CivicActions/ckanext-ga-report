
window.viz.loadGaReports = ->
  d3.json '/scripts/json/ga_reports.json', (data)->
    #console.log data
    # Create empty graphs
    pie_options = 
      legend: false
      initialDelay: 200
      startAngle: Math.PI/2
      endAngle: Math.PI*5/2
      width: 240
    graph_pie1 = new viz.PieChart('#graph_pie1',data.monthlydata[0].pie1,d3.scale.category20(),pie_options)
    pie_options.initialDelay += 150
    graph_pie2 = new viz.PieChart('#graph_pie2',data.monthlydata[0].pie2,d3.scale.category20(),pie_options)
    pie_options.initialDelay += 150
    graph_pie3 = new viz.PieChart('#graph_pie3',data.monthlydata[0].pie3,d3.scale.category20(),pie_options)
    pie_options.initialDelay += 150
    graph_pie4 = new viz.PieChart('#graph_pie4',data.monthlydata[0].pie4,d3.scale.category20(),pie_options)

    setMonthData = (monthData) ->
      graph_pie1.setData( monthData.pie1 )
      graph_pie2.setData( monthData.pie2 )
      graph_pie3.setData( monthData.pie3 )
      graph_pie4.setData( monthData.pie4 )

    # Bind the month selector to graphs
    d3.select('#monthselector')
      .selectAll('button')
      .data(data.monthlydata)
      .enter()
      .append('button')
      .text((d)->d.datename)
      .on('click', setMonthData)

