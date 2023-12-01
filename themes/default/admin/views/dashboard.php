<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<?php
// $proVal1 = '90';
// $proVal2 = '80';
// $proVal3 = '70';
// $proVal4 = '60';
// $proVal5 = '30';

function row_status($x)
{
    return [
        'pending' => "<div class='text-center'><span class='tablePending'>$x</span></div>",
        'completed' => "<div class='text-center'><span class='tableComplete'>$x</span></div>",
        'paid' => "<div class='text-center'><span class='tablePaid'>$x</span></div>",
        'sent' => "<div class='text-center'><span class='tableSent'>$x</span></div>",
        'received' => "<div class='text-center'><span class='tableComplete'>$x</span></div>",
        'partial' => "<div class='text-center'><span class='tablePartial'>$x</span></div>",
        'transfering' => "<div class='text-center'><span class='tableTransfering'>$x</span></div>",
        'due' => "<div class='text-center'><span class='tableDue'>$x</span></div>",
    ][$x];
}
?>

<!-- <style>
    .cardChartRowItemList>.cardChartRowItemListItem:nth-child(1)>.cardChartRowItemListItemRange>progress::before {
        left: <?= $proVal1; ?>%;
    }

    .cardChartRowItemList>.cardChartRowItemListItem:nth-child(2)>.cardChartRowItemListItemRange>progress::before {
        left: <?= $proVal2; ?>%;
    }

    .cardChartRowItemList>.cardChartRowItemListItem:nth-child(3)>.cardChartRowItemListItemRange>progress::before {
        left: <?= $proVal3; ?>%;
    }

    .cardChartRowItemList>.cardChartRowItemListItem:nth-child(4)>.cardChartRowItemListItemRange>progress::before {
        left: <?= $proVal4; ?>%;
    }

    .cardChartRowItemList>.cardChartRowItemListItem:nth-child(5)>.cardChartRowItemListItemRange>progress::before {
        left: <?= $proVal5; ?>%;
    }
</style> -->



<section>
    <div class="cardRow">
        <div class="cardList">
            <a href="<?= admin_url('purchases') ?>" class="cardItem">
                <div class="cardItemIcon cardProfit">
                    <img src="<?= $assets ?>images/icon/pie-chart.svg" alt="" class="svg">
                </div>
                <div class="cardItemContent">
                    <div class="cardItemContentPara">
                        <p>Purchases</p>
                    </div>
                    <div class="cardItemContentHeading">
                        <h3><?= $this->sma->formatMoney($total_purchases) ?></h3>
                    </div>
                </div>
            </a>
            <a href="<?= admin_url('sales') ?>" class="cardItem">
                <div class="cardItemIcon cardSale">
                    <img src="<?= $assets ?>images/icon/wallet.svg" alt="" class="svg">
                </div>
                <div class="cardItemContent">
                    <div class="cardItemContentPara">
                        <p>Sales</p>
                    </div>
                    <div class="cardItemContentHeading">
                        <h3><?= $this->sma->formatMoney($total_sales) ?></h3>
                    </div>
                </div>
            </a>
            <a href="<?= admin_url('customers') ?>" class="cardItem">
                <div class="cardItemIcon cardCustomer">
                    <img src="<?= $assets ?>images/icon/people.svg" alt="" class="svg">
                </div>
                <div class="cardItemContent">
                    <div class="cardItemContentPara">
                        <p>Customers</p>
                    </div>
                    <div class="cardItemContentHeading">
                        <h3><?= $total_customers ?? 0 ?></h3>
                    </div>
                </div>
            </a>
            <a href="<?= admin_url('products') ?>" class="cardItem">
                <div class="cardItemIcon cardProduct">
                    <img src="<?= $assets ?>images/icon/products.svg" alt="" class="svg">
                </div>
                <div class="cardItemContent">
                    <div class="cardItemContentPara">
                        <p>Products</p>
                    </div>
                    <div class="cardItemContentHeading">
                        <h3><?= $total_products ?? 0 ?></h3>
                    </div>
                </div>
            </a>
        </div>
        <div class="cardList">
            <div class="cardItem cardItemChart">
                <div class="cardItemContent">
                    <div class="cardItemContentPara">
                        <p>Year Report</p>
                    </div>
                    <div class="cardItemContentBtn">
                        <span><?= date('Y') ?></span>
                    </div>
                    <div class="cardItemContentRange">
                        <span><img src="<?= $assets ?>images/icon/top-arrow.svg" alt="" class="svg"></span>
                        <span>99.2%</span>
                    </div>
                    <div class="cardItemContentChartHeading">
                        <h2><?= $this->sma->formatMoney($total_sales) ?></h2>
                    </div>
                </div>
                <div class="cardItemChart">
                    <div id="chart"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="cardChartRow">
        <div class="cardChartRowItem">
            <div id="culmnBar"></div>
        </div>
        <div class="cardChartRowItem">
            <div class="cardChartRowItemHeading">
                <h3>Top Products</h3>
            </div>
            <div class="cardChartRowItemList">
                <?php foreach ($bs as $bestSelling) : ?>
                    <div class="cardChartRowItemListItem">
                        <div class="cardChartRowItemListItemHeading">
                            <h4><?= $bestSelling->product_name ?></h4>
                        </div>
                        <div class="cardChartRowItemListItemRange">
                            <progress value="<?= $bestSelling->quantity ?>" min="0" max="1000"></progress>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>
    </div>
    <div class="cardTabMenu">
        <div class="cardTabMenuDiv">
            <div class="cardTabMenuDivLink">
                <ul>
                    <li data-tab="1">Sales</li>
                    <li data-tab="2">Purchases</li>
                    <li data-tab="3">Transfers</li>
                    <li data-tab="4">Customers</li>
                    <li data-tab="5">Suppliers</li>
                </ul>
            </div>
            <div class="cardTabMenuDivContent">
                <div class="cardTabMenuDivContentItem" data-content="1">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Date</th>
                                <th>Reference No</th>
                                <th>Customer</th>
                                <th class="text-center">Status</th>
                                <th>Total</th>
                                <th>Payment Status</th>
                                <th>Paid</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($sales as $sale) : ?>
                                <tr id="<?= $sale->id ?>" class="receipt_link">
                                    <td><?= $sale->id ?></td>
                                    <td><?= $this->sma->hrld($sale->date) ?></td>
                                    <td><?= $sale->reference_no ?></td>
                                    <td><?= $sale->customer ?></td>
                                    <td> <?= row_status($sale->sale_status) ?></td>
                                    <td><?= $this->sma->formatMoney($sale->grand_total) ?></td>
                                    <td><?= row_status($sale->payment_status) ?></td>
                                    <td><?= $this->sma->formatMoney($sale->paid) ?></td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
                <div class="cardTabMenuDivContentItem" data-content="2">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Date</th>
                                <th>Reference No</th>
                                <th>Supplier</th>
                                <th class="text-center">Status</th>
                                <th>Amount</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($purchases as $purchase) : ?>
                                <tr id="<?= $sale->id ?>" class="purchase_link">
                                    <td><?= $purchase->id ?></td>
                                    <td><?= $this->sma->hrld($purchase->date) ?></td>
                                    <td><?= $purchase->reference_no ?></td>
                                    <td><?= $purchase->supplier ?></td>
                                    <td><?= row_status($purchase->status) ?></td>
                                    <td><?= $this->sma->formatMoney($purchase->paid) ?></td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
                <div class="cardTabMenuDivContentItem" data-content="3">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Date</th>
                                <th>Transfer No</th>
                                <th>From</th>
                                <th>To</th>
                                <th class="text-center">Status</th>
                                <th>Amount</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($transfers as $transfer) : ?>
                                <tr>
                                    <td><?= $transfer->id ?></td>
                                    <td><?= $this->sma->hrld($transfer->date) ?></td>
                                    <td><?= $transfer->transfer_no ?></td>
                                    <td><?= $transfer->from_warehouse_name ?></td>
                                    <td><?= $transfer->to_warehouse_name ?></td>
                                    <td><?= row_status($transfer->status) ?></td>
                                    <td><?= $this->sma->formatMoney($transfer->grand_total) ?></td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
                <div class="cardTabMenuDivContentItem" data-content="4">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Company</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Address</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($customers as $customer) : ?>
                                <tr>
                                    <td><?= $customer->id ?></td>
                                    <td><?= $customer->company ?></td>
                                    <td><?= $customer->name ?></td>
                                    <td><?= $customer->email ?></td>
                                    <td><?= $customer->phone ?></td>
                                    <td><?= $customer->address ?></td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
                <div class="cardTabMenuDivContentItem" data-content="5">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Company</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Address</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($suppliers as $supplier) : ?>
                                <tr>
                                    <td><?= $supplier->id ?></td>
                                    <td><?= $supplier->company ?></td>
                                    <td><?= $supplier->name ?></td>
                                    <td><?= $supplier->email ?></td>
                                    <td><?= $supplier->phone ?></td>
                                    <td><?= $supplier->address ?></td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>



<script>
    // Function to generate a static range of data with four specified points
    var chart = new ApexCharts(document.querySelector("#chart"), {
        series: [{
            data: <?= $monthly_sale_chart ?>
        }],
        chart: {
            foreColor: '#000',
            id: 'static',
            height: 200,
            type: 'line',
            animations: {
                enabled: true,
                easing: 'linear',
                dynamicAnimation: {
                    speed: 1000
                }
            },
            toolbar: {
                show: false
            },
            zoom: {
                enabled: false
            },
            dropShadow: {
                enabled: true,
                top: 3,
                left: 0,
                blur: 6,
                opacity: 5,
                color: '#c5c6ff'
            },
            sparkline: {
                enabled: true // This will hide the axes and labels
            }
        },
        dataLabels: {
            enabled: false
        },
        stroke: {
            curve: 'smooth',
            lineCap: 'butt',
            colors: '#2E83F0',
            width: 7,
            radius: '125px',
            // dropShadow: '0px 6px 6px 0px #C5C6FF80',
        },
        title: {
            text: '',
            align: 'left'
        },
        markers: {
            size: 0,
            strokeWidth: 0,
            hover: {
                size: 0
            }
        },
        xaxis: {
            type: 'string',
            labels: {
                show: true // This will hide the X-axis labels
            }
        },
        yaxis: {
            show: true, // This will hide the Y-axis
        },
        legend: {
            show: true
        },
    });
    chart.render();
</script>

<script>
    let results = <?= $yearly_sale ?>;
    new ApexCharts(document.querySelector("#culmnBar"), {
        colors: ['#71DD37', '#03C3EC'],
        series: [{
                name: 'Last Year',
                data: results.map(item => item.last_year_sales),
            },
            {
                name: 'This Year',
                data: results.map(item => item.current_year_sales),
            }],
        chart: {
            type: 'bar',
            height: 350,
            toolbar: {
                show: false
            }
        },
        plotOptions: {
            bar: {
                horizontal: false,
                columnWidth: 12,
                endingShape: 'rounded',
                borderRadius: 4,
            },
        },
        title: {
            text: 'Yearly Sales',
            align: 'left',
            offsetY: -6.5,
            style: {
                color: '#7E828A',
                fontSize: '14px',
                lineHeight: '21px',
                fontWeight: '700',
            }
        },
        dataLabels: {
            enabled: false
        },
        stroke: {
            show: true,
            width: 4,
            colors: ['transparent']
        },
        xaxis: {
            categories: results.map(item => item.month),
            labels: {
                style: {
                    colors: '#7E828A',
                    fontSize: '14px',
                    fontWeight: 400,
                    lineHeight: '21px',
                }
            }
        },
        yaxis: {
            labels: {
                style: {
                    colors: '#7E828A',
                    fontSize: '14px',
                    fontWeight: 400,
                    lineHeight: '21px',
                }
            },
        },
        fill: {
            opacity: 1
        },
        tooltip: {
            show: false
        },
        legend: {
            position: 'top',
            horizontalAlign: 'left',
            offsetY: -10,
            markers: {
                radius: 12,
            },
            labels: {
                colors: '#7E828A',
                fontSize: '14px',
                lineHeight: '1',
            },
            style: {
                fill: '#7E828A',
                colors: '#7E828A',
            }
        }
    }).render();
</script>

<script>
    $(document).ready(function() {
        $('.cardTabMenuDivLink li:first').addClass('activeTab');
        $('.cardTabMenuDivContentItem:first').show();
        $('.cardTabMenuDivLink li').on('click', function() {
            var tabVal = $(this).data('tab');
            $('.cardTabMenuDivContentItem').hide();
            $('.cardTabMenuDivLink li').removeClass('activeTab');
            $(".cardTabMenuDivContentItem[data-content='" + tabVal + "']").show();
            $(this).addClass('activeTab');
        });
    });
</script>