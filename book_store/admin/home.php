<?php include 'db_connect.php' ?>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
span.float-right.summary_icon {
    font-size: 3rem;
    position: absolute;
    right: 1rem;
    top: 0;
}

.imgs {
    margin: .5em;
    max-width: calc(100%);
    max-height: calc(100%);
}

.imgs img {
    max-width: calc(100%);
    max-height: calc(100%);
    cursor: pointer;
}

#imagesCarousel,
#imagesCarousel .carousel-inner,
#imagesCarousel .carousel-item {
    height: 60vh !important;
    background: black;
}

#imagesCarousel .carousel-item.active {
    display: flex !important;
}

#imagesCarousel .carousel-item-next {
    display: flex !important;
}

#imagesCarousel .carousel-item img {
    margin: auto;
}

#imagesCarousel img {
    width: auto !important;
    height: auto !important;
    max-height: calc(100%) !important;
    max-width: calc(100%) !important;
}
</style>
<div class="containe-fluid">
    <div class="row mt-3 ml-3 mr-3">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <?php echo "Bienvenido de nuevo ". $_SESSION['login_name']."!"  ?>
                    <hr>
                    <div class="col-md-20">
                        <div class="row">
                            <div class="col-md-4 p2">
                                <div class="card bg-light">
                                    <div class="card-body">
                                        <span class="float-right summary_icon"> <i
                                                class="fa fa-book text-muted "></i></span>
                                        <h4><b>
                                                <?php echo $conn->query("SELECT * FROM books")->num_rows ?>
                                            </b></h4>
                                        <p><b>Total Libros</b></p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 p2">
                                <div class="card bg-light">
                                    <div class="card-body">
                                        <span class="float-right summary_icon"> <i
                                                class="fa fa-list-alt text-muted "></i></span>
                                        <h4><b>
                                                <?php echo $conn->query("SELECT * FROM categories")->num_rows ?>
                                            </b></h4>
                                        <p><b>Total Categorias</b></p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 p2">
                                <div class="card bg-light">
                                    <div class="card-body">
                                        <span class="float-right summary_icon"> <i
                                                class="fa fa-th-list text-muted "></i></span>
                                        <h4><b>
                                                <?php echo $conn->query("SELECT * FROM orders where status = 0")->num_rows ?>
                                            </b></h4>
                                        <p><b>Total Ordenes Pendientes</b></p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 p2">
                                <div class="card bg-light">
                                    <div class="card-body">
                                        <!-- Increase the column width to accommodate the chart -->
                                        <canvas id="myChart" width="200" height="200"></canvas>
                                        <!-- Add a canvas for the chart -->
                                    </div>
                                </div>
                            </div>
                            <script>
                            // Chart.js code to create the orders chart
                            <?php 
							include 'db_connect.php';
							// Retrieve order data from the database
							$result = $conn->query("SELECT date_created, COUNT(*) as total_orders FROM orders GROUP BY date_created");
							$order_dates = [];
							$order_counts = [];
							// Loop through the results and store the date and count in separate arrays
							while ($row = $result->fetch_assoc()) {
								$order_dates[] = $row['date_created'];
								$order_counts[] = $row['total_orders'];
							}
							?>
                            var ctx = document.getElementById('myChart').getContext('2d');
                            var myChart = new Chart(ctx, {
                                type: 'bar',
                                data: {
                                    labels: <?php echo json_encode($order_dates); ?>,
                                    datasets: [{
                                        label: 'Ordenes por fecha',
                                        data: <?php echo json_encode($order_counts); ?>,
                                        backgroundColor: 'rgba(54, 162, 235, 0.2)',
                                        borderColor: 'rgba(54, 162, 235, 1)',
                                        borderWidth: 1
                                    }]
                                },
                                options: {
                                    scales: {
                                        y: {
                                            beginAtZero: true
                                        }
                                    }
                                }
                            });
                            </script>
                            <div class="col-md-4 p2">
                                <div class="card bg-light">
                                    <div class="card-body">
                                        <!-- Increase the column width to accommodate the chart -->
                                        <canvas id="myChart2" width="200" height="200"></canvas>
                                        <!-- Add a canvas for the chart -->
                                    </div>
                                </div>
                            </div>
                            <script>
                            <?php 
							include 'db_connect.php';
							$result = $conn->query("SELECT date_format(date_created,'%M %Y') as fecha, sum(total_amount) as total_ventas from orders group by date_format(date_created,'%M %Y')");
							$labels = [];
							$data = [];
							while($row = $result->fetch_assoc()){
								$labels[] = $row['fecha'];
								$data[] = $row['total_ventas'];
							}
							?>
                            var ctx = document.getElementById('myChart2').getContext('2d');
                            var myChart = new Chart(ctx, {
                                type: 'line',
                                data: {
                                    labels: <?php echo json_encode($labels); ?>,
                                    datasets: [{
                                        label: 'Ventas Totales',
                                        data: <?php echo json_encode($data); ?>,
                                        backgroundColor: 'rgba(54, 162, 235, 0.2)',
                                        borderColor: 'rgba(54, 162, 235, 1)',
                                        borderWidth: 1
                                    }]
                                },
                                options: {
                                    scales: {
                                        y: {
                                            beginAtZero: true
                                        }
                                    }
                                }
                            });
                            </script>
                            <div class="col-md-4 p2">
                                <div class="card bg-light">
                                    <div class="card-body">
                                        <!-- Increase the column width to accommodate the chart -->
                                        <canvas id="myChart3" width="200" height="200"></canvas>
                                        <!-- Add a canvas for the chart -->
                                    </div>
                                </div>
                            </div>
                            <script>
                            <?php 
						include 'db_connect.php';
						$result_realizadas = $conn->query("SELECT date_format(date_created, '%M %Y') as fecha, COUNT(*) as total_realizadas FROM orders WHERE status = 1 GROUP BY date_format(date_created, '%M %Y')");
						$result_pendientes = $conn->query("SELECT date_format(date_created, '%M %Y') as fecha, COUNT(*) as total_pendientes FROM orders WHERE status = 0 GROUP BY date_format(date_created, '%M %Y')");
						$labels = [];
						$data_realizadas = [];
						$data_pendientes = [];
						while($row = $result_realizadas->fetch_assoc()){
							$labels[] = $row['fecha'];
							$data_realizadas[] = $row['total_realizadas'];
						}
						while($row = $result_pendientes->fetch_assoc()){
							$data_pendientes[] = $row['total_pendientes'];
						}
						?>
                            var ctx = document.getElementById('myChart3').getContext('2d');
                            var myChart = new Chart(ctx, {
                                type: 'line',
                                data: {
                                    labels: <?php echo json_encode($labels); ?>,
                                    datasets: [{
                                            label: 'Órdenes Realizadas',
                                            data: <?php echo json_encode($data_realizadas); ?>,
                                            borderColor: 'rgba(54, 162, 235, 1)',
                                            borderWidth: 1,
                                            fill: false
                                        },
                                        {
                                            label: 'Órdenes Pendientes',
                                            data: <?php echo json_encode($data_pendientes); ?>,
                                            borderColor: 'rgba(255, 99, 132, 1)',
                                            borderWidth: 1,
                                            fill: false
                                        }
                                    ]
                                },
                                options: {
                                    scales: {
                                        y: {
                                            beginAtZero: true
                                        }
                                    }
                                }
                            });
                            </script>
                            <div class="col-md-4 p2">
                                <div class="card bg-light">
                                    <div class="card-body">
                                        <!-- Increase the column width to accommodate the chart -->
                                        <canvas id="myChart5" width="200" height="200"></canvas>
                                        <!-- Add a canvas for the chart -->
                                    </div>
                                </div>
                            </div>
                            <script>
                            <?php 
							include 'db_connect.php';
							$result = $conn->query("SELECT date_format(date_created,'%M %Y') as fecha, sum(total_amount) as total_ventas, count(*) as total_ordenes from orders group by date_format(date_created,'%M %Y')");
							$labels = [];
							$data = [];
							while ($row = $result->fetch_assoc()) {
								$labels[] = $row['fecha'];
								$data[] = $row['total_ventas'] / $row['total_ordenes'];
							}
							?>
                            var ctx = document.getElementById('myChart5').getContext('2d');
                            var myChart = new Chart(ctx, {
                                type: 'line',
                                data: {
                                    labels: <?php echo json_encode($labels); ?>,
                                    datasets: [{
                                        label: 'Promedio de Importe por Orden',
                                        data: <?php echo json_encode($data); ?>,
                                        borderColor: 'rgba(54, 162, 235, 1)',
                                        borderWidth: 1,
                                        fill: false
                                    }]
                                },
                                options: {
                                    scales: {
                                        y: {
                                            beginAtZero: true
                                        }
                                    }
                                }
                            });
                            </script>
                            <div class="col-md-4 p2">
                                <div class="card bg-light">
                                    <div class="card-body">
                                        <!-- Increase the column width to accommodate the chart -->
                                        <canvas id="myChart6" width="200" height="200"></canvas>
                                        <!-- Add a canvas for the chart -->
                                    </div>
                                </div>
                            </div>

                            <script>
                            <?php 
							include 'db_connect.php';
							$result = $conn->query("SELECT count(id) as total_ordenes from orders");
							$total_ordenes = $result->fetch_assoc()['total_ordenes'];
							$result_confirmadas = $conn->query("SELECT count(id) as total_confirmadas from orders where status = 1");
							$total_confirmadas = $result_confirmadas->fetch_assoc()['total_confirmadas'];
							$indice_cumplimiento = ($total_confirmadas / $total_ordenes) * 100;
							$data = [
								['label' => 'Órdenes Confirmadas', 'value' => $total_confirmadas],
								['label' => 'Órdenes Pendientes', 'value' => $total_ordenes - $total_confirmadas]
							];
							?>
                            var ctx = document.getElementById('myChart6').getContext('2d');
                            var myChart = new Chart(ctx, {
                                type: 'pie',
                                data: {
                                    labels: ['Órdenes Confirmadas', 'Órdenes Pendientes'],
                                    datasets: [{
                                        label: 'Índice de Cumplimiento de Órdenes',
                                        data: [<?php echo $total_confirmadas; ?>,
                                            <?php echo $total_ordenes - $total_confirmadas; ?>
                                        ],
                                        backgroundColor: [
                                            'rgba(54, 162, 235, 0.2)',
                                            'rgba(255, 99, 132, 0.2)'
                                        ],
                                        borderColor: [
                                            'rgba(54, 162, 235, 1)',
                                            'rgba(255, 99, 132, 1)'
                                        ],
                                        borderWidth: 1
                                    }]
                                },
                                options: {
                                    responsive: true,
                                    plugins: {
                                        legend: {
                                            position: 'top',
                                        },
                                        title: {
                                            display: true,
                                            text: 'Índice de Cumplimiento de Órdenes'
                                        }
                                    }
                                }
                            });
                            </script>
                            <div class="col-md-4 p2">
                                <div class="card bg-light">
                                    <div class="card-body">
                                        <!-- Increase the column width to accommodate the chart -->
                                        <canvas id="myChart7" width="200" height="200"></canvas>
                                        <!-- Add a canvas for the chart -->
                                    </div>
                                </div>
                            </div>

                            <script>
                            <?php 
							include 'db_connect.php';
							$result = $conn->query("SELECT count(*) as total_clientes from customers");
							$total_clientes = $result->fetch_assoc()['total_clientes'];
							$result_recurrentes = $conn->query("SELECT count(customer_id) as total_recurrentes from orders group by customer_id having count(customer_id) > 1");
							$total_recurrentes = $result_recurrentes->num_rows;
							$porcentaje_recurrentes = ($total_recurrentes / $total_clientes) * 100;
							$data = [
								['label' => 'Clientes Recurrentes', 'value' => $total_recurrentes],
								['label' => 'Clientes No Recurrentes', 'value' => $total_clientes - $total_recurrentes]
							];
							?>
                            var ctx = document.getElementById('myChart7').getContext('2d');
                            var myChart = new Chart(ctx, {
                                type: 'pie',
                                data: {
                                    labels: ['Clientes Recurrentes', 'Clientes No Recurrentes'],
                                    datasets: [{
                                        label: 'Porcentaje de Clientes Recurrentes',
                                        data: [<?php echo $total_recurrentes; ?>,
                                            <?php echo $total_clientes - $total_recurrentes; ?>
                                        ],
                                        backgroundColor: [
                                            'rgba(54, 162, 235, 0.2)',
                                            'rgba(255, 99, 132, 0.2)'
                                        ],
                                        borderColor: [
                                            'rgba(54, 162, 235, 1)',
                                            'rgba(255, 99, 132, 1)'
                                        ],
                                        borderWidth: 1
                                    }]
                                },
                                options: {
                                    responsive: true,
                                    plugins: {
                                        legend: {
                                            position: 'top',
                                        },
                                        title: {
                                            display: true,
                                            text: 'Porcentaje de Clientes Recurrentes'
                                        }
                                    }
                                }
                            });
                            </script>
                            <div class="col-md-4 p2">
                                <div class="card bg-light">
                                    <div class="card-body">
                                        <!-- Increase the column width to accommodate the chart -->
                                        <canvas id="myChart8" width="200" height="200"></canvas>
                                        <!-- Add a canvas for the chart -->
                                    </div>
                                </div>
                            </div>
                            <?php 
include 'db_connect.php';
// Retrieve order list data from the database to get the most sold books
$result = $conn->query("SELECT book_id, COUNT(*) as total_sold FROM order_list GROUP BY book_id ORDER BY total_sold DESC LIMIT 5");
$book_ids = [];
$total_sold = [];
// Loop through the results and store the book IDs and total sold in separate arrays
while ($row = $result->fetch_assoc()) {
  $book_ids[] = $row['book_id'];
  $total_sold[] = $row['total_sold'];
}
?>
                            <!-- Add a canvas for the chart -->
                            <script>
                            // Chart.js code to create the most sold books chart
                            var ctx = document.getElementById('myChart8').getContext('2d');
                            var myChart = new Chart(ctx, {
                                type: 'bar',
                                data: {
                                    labels: <?php echo json_encode($book_ids); ?>, // Use the book IDs as labels
                                    datasets: [{
                                        label: 'Productos más vendidos',
                                        data: <?php echo json_encode($total_sold); ?>, // Use the total sold as data
                                        backgroundColor: 'rgba(54, 162, 235, 0.2)',
                                        borderColor: 'rgba(54, 162, 235, 1)',
                                        borderWidth: 1
                                    }]
                                },
                                options: {
                                    scales: {
                                        y: {
                                            beginAtZero: true
                                        }
                                    }
                                }
                            });
                            </script>
                            <div class="col-md-4 p2">
                                <div class="card bg-light">
                                    <div class="card-body">
                                        <!-- Increase the column width to accommodate the chart -->
                                        <canvas id="myChart9" width="200" height="200"></canvas>
                                        <!-- Add a canvas for the chart -->
                                    </div>
                                </div>
                            </div>
                            <?php 
include 'db_connect.php';
// Retrieve order list data from the database to get the least sold books
$result = $conn->query("SELECT book_id, COUNT(*) as total_sold FROM order_list GROUP BY book_id ORDER BY total_sold ASC LIMIT 5");
$book_ids = [];
$total_sold = [];
// Loop through the results and store the book IDs and total sold in separate arrays
while ($row = $result->fetch_assoc()) {
  $book_ids[] = $row['book_id'];
  $total_sold[] = $row['total_sold'];
}
?>
                            <!-- Add a canvas for the chart -->
                            <script>
                            // Chart.js code to create the least sold books chart
                            var ctx = document.getElementById('myChart9').getContext('2d');
                            var myChart = new Chart(ctx, {
                                type: 'bar',
                                data: {
                                    labels: <?php echo json_encode($book_ids); ?>, // Use the book IDs as labels
                                    datasets: [{
                                        label: 'Productos menos vendidos',
                                        data: <?php echo json_encode($total_sold); ?>, // Use the total sold as data
                                        backgroundColor: 'rgba(255, 99, 132, 0.2)',
                                        borderColor: 'rgba(255, 99, 132, 1)',
                                        borderWidth: 1
                                    }]
                                },
                                options: {
                                    scales: {
                                        y: {
                                            beginAtZero: true
                                        }
                                    }
                                }
                            });
                            </script>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>