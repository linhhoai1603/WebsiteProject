var ctx = document.getElementById("revenue-chart").getContext("2d");

var data = {
  labels: ["Thang 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5","Thang 6", "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"],
  datasets: [
    {
      label: "Doanh thu mỗi tháng (Nghìn VND)",
      backgroundColor: "rgba(50,8,190,0.5)",
      borderColor: "rgba(15,7,5,1)",
      data: [1000, 6000, 4000, 8000, 1600, 6000, 2500, 5100, 5000, 8000, 4030 ,6000]
    },
    
  ]
};
var myBarChart = new Chart(ctx, {
  type: "line", 
  data: data,
  options: {
    scales: {
      yAxes: [{
        ticks: {
          beginAtZero: true,
          max: 10000    
        }
      }]
    }
  }
});

const bestSalerCtx = document.getElementById("best-saler-chart").getContext("2d");
  const bestSalerData = {
    labels: ["Sản phẩm A", "Sản phẩm B", "Sản phẩm C", "Sản phẩm D", "Sản phẩm E"],
    datasets: [
      {
        label: "Số lượng bán ra",
        data: [500, 300, 400, 600, 200],
        backgroundColor: [
          "rgba(255, 99, 132, 0.5)",
          "rgba(54, 162, 235, 0.5)",
          "rgba(255, 206, 86, 0.5)",
          "rgba(75, 192, 192, 0.5)",
          "rgba(153, 102, 255, 0.5)"
        ],
        borderColor: [
          "rgba(255, 99, 132, 1)",
          "rgba(54, 162, 235, 1)",
          "rgba(255, 206, 86, 1)",
          "rgba(75, 192, 192, 1)",
          "rgba(153, 102, 255, 1)"
        ],
        borderWidth: 1,
      }
    ]
  };
  new Chart(bestSalerCtx, {
    type: "pie",
    data: bestSalerData,
    options: {
      responsive: true,
      plugins: {
        legend: {
          position: "top"
        },
        tooltip: {
          enabled: true
        }
      }
    }
  });
  const chartLegend = document.getElementById("chart-legend");
  bestSalerData.labels.forEach((label, index) => {
    const color = bestSalerData.datasets[0].backgroundColor[index];
    const legendItem = document.createElement("li");
    legendItem.innerHTML = `
      <span style="display:inline-block;width:15px;height:15px;background-color:${color};margin-right:10px;"></span>
      ${label}
    `;
    chartLegend.appendChild(legendItem);
  });