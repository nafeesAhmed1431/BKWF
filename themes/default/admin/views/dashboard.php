<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>

<?php
$proVal1 = '90';
$proVal2 = '80';
$proVal3 = '70';
$proVal4 = '60';
$proVal5 = '30';
?>

<style>
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
</style>

<section>
    <div class="cardRow">
        <div class="cardList">
            <a href="#" class="cardItem">
                <div class="cardItemIcon cardProfit">
                    <img src="<?= $assets ?>images/icon/pie-chart.svg" alt="" class="svg">
                </div>
                <div class="cardItemContent">
                    <div class="cardItemContentPara">
                        <p>Profit</p>
                    </div>
                    <div class="cardItemContentHeading">
                        <h3>Rs 12,628</h3>
                    </div>
                </div>
            </a>
            <a href="#" class="cardItem">
                <div class="cardItemIcon cardSale">
                    <img src="<?= $assets ?>images/icon/wallet.svg" alt="" class="svg">
                </div>
                <div class="cardItemContent">
                    <div class="cardItemContentPara">
                        <p>Sales</p>
                    </div>
                    <div class="cardItemContentHeading">
                        <h3>Rs 12,628</h3>
                    </div>
                </div>
            </a>
            <a href="#" class="cardItem">
                <div class="cardItemIcon cardCustomer">
                    <img src="<?= $assets ?>images/icon/people.svg" alt="" class="svg">
                </div>
                <div class="cardItemContent">
                    <div class="cardItemContentPara">
                        <p>Customers</p>
                    </div>
                    <div class="cardItemContentHeading">
                        <h3>128</h3>
                    </div>
                </div>
            </a>
            <a href="#" class="cardItem">
                <div class="cardItemIcon cardProduct">
                    <img src="<?= $assets ?>images/icon/products.svg" alt="" class="svg">
                </div>
                <div class="cardItemContent">
                    <div class="cardItemContentPara">
                        <p>Products</p>
                    </div>
                    <div class="cardItemContentHeading">
                        <h3>628</h3>
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
                        <span>2023</span>
                    </div>
                    <div class="cardItemContentRange">
                        <span><img src="<?= $assets ?>images/icon/top-arrow.svg" alt="" class="svg"></span>
                        <span>68.2%</span>
                    </div>
                    <div class="cardItemContentChartHeading">
                        <h2>Rs 84,628</h2>
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
                <div class="cardChartRowItemListItem">
                    <div class="cardChartRowItemListItemHeading">
                        <h4>Toori</h4>
                    </div>
                    <div class="cardChartRowItemListItemRange">
                        <progress value="<?= $proVal1; ?>" min="0" max="100"></progress>
                    </div>
                </div>
                <div class="cardChartRowItemListItem">
                    <div class="cardChartRowItemListItemHeading">
                        <h4>Khal Wanda</h4>
                    </div>
                    <div class="cardChartRowItemListItemRange">
                        <progress value="<?= $proVal2; ?>" min="0" max="100"></progress>
                    </div>
                </div>
                <div class="cardChartRowItemListItem">
                    <div class="cardChartRowItemListItemHeading">
                        <h4>Mix Seeds</h4>
                    </div>
                    <div class="cardChartRowItemListItemRange">
                        <progress value="<?= $proVal3; ?>" min="0" max="100"></progress>
                    </div>
                </div>
                <div class="cardChartRowItemListItem">
                    <div class="cardChartRowItemListItemHeading">
                        <h4>Chokhar</h4>
                    </div>
                    <div class="cardChartRowItemListItemRange">
                        <progress value="<?= $proVal4; ?>" min="0" max="100"></progress>
                    </div>
                </div>
                <div class="cardChartRowItemListItem">
                    <div class="cardChartRowItemListItemHeading">
                        <h4>Karra</h4>
                    </div>
                    <div class="cardChartRowItemListItemRange">
                        <progress value="<?= $proVal5; ?>" min="0" max="100"></progress>
                    </div>
                </div>
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
                                <th>Status</th>
                                <th>Total</th>
                                <th>Payment Status</th>
                                <th>Paid</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>15/11/2023 13:05</td>
                                <td>SALE/POS2023/11/0015</td>
                                <td>Nafees Gujjar</td>
                                <td><span class="tableComplete">Completed</span></td>
                                <td>Rs. 1122</td>
                                <td><span class="tableDue">Due</span></td>
                                <td>0.00</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>15/11/2023 13:05</td>
                                <td>SALE/POS2023/11/0015</td>
                                <td>Nafees Gujjar</td>
                                <td><span class="tableComplete">Completed</span></td>
                                <td>Rs. 1122</td>
                                <td><span class="tableDue">Due</span></td>
                                <td>0.00</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>15/11/2023 13:05</td>
                                <td>SALE/POS2023/11/0015</td>
                                <td>Nafees Gujjar</td>
                                <td><span class="tableComplete">Completed</span></td>
                                <td>Rs. 1122</td>
                                <td><span class="tableDue">Due</span></td>
                                <td>0.00</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>15/11/2023 13:05</td>
                                <td>SALE/POS2023/11/0015</td>
                                <td>Nafees Gujjar</td>
                                <td><span class="tableComplete">Completed</span></td>
                                <td>Rs. 1122</td>
                                <td><span class="tableDue">Due</span></td>
                                <td>0.00</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>15/11/2023 13:05</td>
                                <td>SALE/POS2023/11/0015</td>
                                <td>Nafees Gujjar</td>
                                <td><span class="tableComplete">Completed</span></td>
                                <td>Rs. 1122</td>
                                <td><span class="tableDue">Due</span></td>
                                <td>0.00</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>15/11/2023 13:05</td>
                                <td>SALE/POS2023/11/0015</td>
                                <td>Nafees Gujjar</td>
                                <td><span class="tableComplete">Completed</span></td>
                                <td>Rs. 1122</td>
                                <td><span class="tableDue">Due</span></td>
                                <td>0.00</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>15/11/2023 13:05</td>
                                <td>SALE/POS2023/11/0015</td>
                                <td>Nafees Gujjar</td>
                                <td><span class="tableComplete">Completed</span></td>
                                <td>Rs. 1122</td>
                                <td><span class="tableDue">Due</span></td>
                                <td>0.00</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>15/11/2023 13:05</td>
                                <td>SALE/POS2023/11/0015</td>
                                <td>Nafees Gujjar</td>
                                <td><span class="tableComplete">Completed</span></td>
                                <td>Rs. 1122</td>
                                <td><span class="tableDue">Due</span></td>
                                <td>0.00</td>
                            </tr>
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
                                <th>Customer</th>
                                <th>Status</th>
                                <th>Total</th>
                                <th>Payment Status</th>
                                <th>Paid</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>2</td>
                                <td>15/11/2023 13:05</td>
                                <td>SALE/POS2023/11/0015</td>
                                <td>Nafees Gujjar</td>
                                <td><span class="tableComplete">Completed</span></td>
                                <td>Rs. 1122</td>
                                <td><span class="tableDue">Due</span></td>
                                <td>0.00</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>15/11/2023 13:05</td>
                                <td>SALE/POS2023/11/0015</td>
                                <td>Nafees Gujjar</td>
                                <td><span class="tableComplete">Completed</span></td>
                                <td>Rs. 1122</td>
                                <td><span class="tableDue">Due</span></td>
                                <td>0.00</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>15/11/2023 13:05</td>
                                <td>SALE/POS2023/11/0015</td>
                                <td>Nafees Gujjar</td>
                                <td><span class="tableComplete">Completed</span></td>
                                <td>Rs. 1122</td>
                                <td><span class="tableDue">Due</span></td>
                                <td>0.00</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>15/11/2023 13:05</td>
                                <td>SALE/POS2023/11/0015</td>
                                <td>Nafees Gujjar</td>
                                <td><span class="tableComplete">Completed</span></td>
                                <td>Rs. 1122</td>
                                <td><span class="tableDue">Due</span></td>
                                <td>0.00</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>15/11/2023 13:05</td>
                                <td>SALE/POS2023/11/0015</td>
                                <td>Nafees Gujjar</td>
                                <td><span class="tableComplete">Completed</span></td>
                                <td>Rs. 1122</td>
                                <td><span class="tableDue">Due</span></td>
                                <td>0.00</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>15/11/2023 13:05</td>
                                <td>SALE/POS2023/11/0015</td>
                                <td>Nafees Gujjar</td>
                                <td><span class="tableComplete">Completed</span></td>
                                <td>Rs. 1122</td>
                                <td><span class="tableDue">Due</span></td>
                                <td>0.00</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>15/11/2023 13:05</td>
                                <td>SALE/POS2023/11/0015</td>
                                <td>Nafees Gujjar</td>
                                <td><span class="tableComplete">Completed</span></td>
                                <td>Rs. 1122</td>
                                <td><span class="tableDue">Due</span></td>
                                <td>0.00</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>15/11/2023 13:05</td>
                                <td>SALE/POS2023/11/0015</td>
                                <td>Nafees Gujjar</td>
                                <td><span class="tableComplete">Completed</span></td>
                                <td>Rs. 1122</td>
                                <td><span class="tableDue">Due</span></td>
                                <td>0.00</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="cardTabMenuDivContentItem" data-content="3">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Date</th>
                                <th>Reference No</th>
                                <th>Customer</th>
                                <th>Status</th>
                                <th>Total</th>
                                <th>Payment Status</th>
                                <th>Paid</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>3</td>
                                <td>15/11/2023 13:05</td>
                                <td>SALE/POS2023/11/0015</td>
                                <td>Nafees Gujjar</td>
                                <td><span class="tableComplete">Completed</span></td>
                                <td>Rs. 1122</td>
                                <td><span class="tableDue">Due</span></td>
                                <td>0.00</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>15/11/2023 13:05</td>
                                <td>SALE/POS2023/11/0015</td>
                                <td>Nafees Gujjar</td>
                                <td><span class="tableComplete">Completed</span></td>
                                <td>Rs. 1122</td>
                                <td><span class="tableDue">Due</span></td>
                                <td>0.00</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>15/11/2023 13:05</td>
                                <td>SALE/POS2023/11/0015</td>
                                <td>Nafees Gujjar</td>
                                <td><span class="tableComplete">Completed</span></td>
                                <td>Rs. 1122</td>
                                <td><span class="tableDue">Due</span></td>
                                <td>0.00</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>15/11/2023 13:05</td>
                                <td>SALE/POS2023/11/0015</td>
                                <td>Nafees Gujjar</td>
                                <td><span class="tableComplete">Completed</span></td>
                                <td>Rs. 1122</td>
                                <td><span class="tableDue">Due</span></td>
                                <td>0.00</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>15/11/2023 13:05</td>
                                <td>SALE/POS2023/11/0015</td>
                                <td>Nafees Gujjar</td>
                                <td><span class="tableComplete">Completed</span></td>
                                <td>Rs. 1122</td>
                                <td><span class="tableDue">Due</span></td>
                                <td>0.00</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>15/11/2023 13:05</td>
                                <td>SALE/POS2023/11/0015</td>
                                <td>Nafees Gujjar</td>
                                <td><span class="tableComplete">Completed</span></td>
                                <td>Rs. 1122</td>
                                <td><span class="tableDue">Due</span></td>
                                <td>0.00</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>15/11/2023 13:05</td>
                                <td>SALE/POS2023/11/0015</td>
                                <td>Nafees Gujjar</td>
                                <td><span class="tableComplete">Completed</span></td>
                                <td>Rs. 1122</td>
                                <td><span class="tableDue">Due</span></td>
                                <td>0.00</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>15/11/2023 13:05</td>
                                <td>SALE/POS2023/11/0015</td>
                                <td>Nafees Gujjar</td>
                                <td><span class="tableComplete">Completed</span></td>
                                <td>Rs. 1122</td>
                                <td><span class="tableDue">Due</span></td>
                                <td>0.00</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="cardTabMenuDivContentItem" data-content="4">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Date</th>
                                <th>Reference No</th>
                                <th>Customer</th>
                                <th>Status</th>
                                <th>Total</th>
                                <th>Payment Status</th>
                                <th>Paid</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>4</td>
                                <td>15/11/2023 13:05</td>
                                <td>SALE/POS2023/11/0015</td>
                                <td>Nafees Gujjar</td>
                                <td><span class="tableComplete">Completed</span></td>
                                <td>Rs. 1122</td>
                                <td><span class="tableDue">Due</span></td>
                                <td>0.00</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>15/11/2023 13:05</td>
                                <td>SALE/POS2023/11/0015</td>
                                <td>Nafees Gujjar</td>
                                <td><span class="tableComplete">Completed</span></td>
                                <td>Rs. 1122</td>
                                <td><span class="tableDue">Due</span></td>
                                <td>0.00</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>15/11/2023 13:05</td>
                                <td>SALE/POS2023/11/0015</td>
                                <td>Nafees Gujjar</td>
                                <td><span class="tableComplete">Completed</span></td>
                                <td>Rs. 1122</td>
                                <td><span class="tableDue">Due</span></td>
                                <td>0.00</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>15/11/2023 13:05</td>
                                <td>SALE/POS2023/11/0015</td>
                                <td>Nafees Gujjar</td>
                                <td><span class="tableComplete">Completed</span></td>
                                <td>Rs. 1122</td>
                                <td><span class="tableDue">Due</span></td>
                                <td>0.00</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>15/11/2023 13:05</td>
                                <td>SALE/POS2023/11/0015</td>
                                <td>Nafees Gujjar</td>
                                <td><span class="tableComplete">Completed</span></td>
                                <td>Rs. 1122</td>
                                <td><span class="tableDue">Due</span></td>
                                <td>0.00</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>15/11/2023 13:05</td>
                                <td>SALE/POS2023/11/0015</td>
                                <td>Nafees Gujjar</td>
                                <td><span class="tableComplete">Completed</span></td>
                                <td>Rs. 1122</td>
                                <td><span class="tableDue">Due</span></td>
                                <td>0.00</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>15/11/2023 13:05</td>
                                <td>SALE/POS2023/11/0015</td>
                                <td>Nafees Gujjar</td>
                                <td><span class="tableComplete">Completed</span></td>
                                <td>Rs. 1122</td>
                                <td><span class="tableDue">Due</span></td>
                                <td>0.00</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>15/11/2023 13:05</td>
                                <td>SALE/POS2023/11/0015</td>
                                <td>Nafees Gujjar</td>
                                <td><span class="tableComplete">Completed</span></td>
                                <td>Rs. 1122</td>
                                <td><span class="tableDue">Due</span></td>
                                <td>0.00</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="cardTabMenuDivContentItem" data-content="5">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Date</th>
                                <th>Reference No</th>
                                <th>Customer</th>
                                <th>Status</th>
                                <th>Total</th>
                                <th>Payment Status</th>
                                <th>Paid</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>5</td>
                                <td>15/11/2023 13:05</td>
                                <td>SALE/POS2023/11/0015</td>
                                <td>Nafees Gujjar</td>
                                <td><span class="tableComplete">Completed</span></td>
                                <td>Rs. 1122</td>
                                <td><span class="tableDue">Due</span></td>
                                <td>0.00</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>15/11/2023 13:05</td>
                                <td>SALE/POS2023/11/0015</td>
                                <td>Nafees Gujjar</td>
                                <td><span class="tableComplete">Completed</span></td>
                                <td>Rs. 1122</td>
                                <td><span class="tableDue">Due</span></td>
                                <td>0.00</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>15/11/2023 13:05</td>
                                <td>SALE/POS2023/11/0015</td>
                                <td>Nafees Gujjar</td>
                                <td><span class="tableComplete">Completed</span></td>
                                <td>Rs. 1122</td>
                                <td><span class="tableDue">Due</span></td>
                                <td>0.00</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>15/11/2023 13:05</td>
                                <td>SALE/POS2023/11/0015</td>
                                <td>Nafees Gujjar</td>
                                <td><span class="tableComplete">Completed</span></td>
                                <td>Rs. 1122</td>
                                <td><span class="tableDue">Due</span></td>
                                <td>0.00</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>15/11/2023 13:05</td>
                                <td>SALE/POS2023/11/0015</td>
                                <td>Nafees Gujjar</td>
                                <td><span class="tableComplete">Completed</span></td>
                                <td>Rs. 1122</td>
                                <td><span class="tableDue">Due</span></td>
                                <td>0.00</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>15/11/2023 13:05</td>
                                <td>SALE/POS2023/11/0015</td>
                                <td>Nafees Gujjar</td>
                                <td><span class="tableComplete">Completed</span></td>
                                <td>Rs. 1122</td>
                                <td><span class="tableDue">Due</span></td>
                                <td>0.00</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>15/11/2023 13:05</td>
                                <td>SALE/POS2023/11/0015</td>
                                <td>Nafees Gujjar</td>
                                <td><span class="tableComplete">Completed</span></td>
                                <td>Rs. 1122</td>
                                <td><span class="tableDue">Due</span></td>
                                <td>0.00</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>15/11/2023 13:05</td>
                                <td>SALE/POS2023/11/0015</td>
                                <td>Nafees Gujjar</td>
                                <td><span class="tableComplete">Completed</span></td>
                                <td>Rs. 1122</td>
                                <td><span class="tableDue">Due</span></td>
                                <td>0.00</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
    // Function to generate a static range of data with four specified points
    function generateStaticData() {
        return [{
                x: Date.now() - 5 * 60000,
                y: 20
            },
            {
                x: Date.now() - 4 * 60000,
                y: 70
            },
            {
                x: Date.now() - 3 * 60000,
                y: 50
            },
            {
                x: Date.now() - 2 * 60000,
                y: 90
            },
            {
                x: Date.now() - 1 * 60000,
                y: 50
            },
            {
                x: Date.now(),
                y: 60
            },
        ];
    }

    var options = {
        series: [{
            data: generateStaticData()
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
            type: 'datetime',
            labels: {
                show: false // This will hide the X-axis labels
            }
        },
        yaxis: {
            show: false, // This will hide the Y-axis
            max: 100,
            min: 0
        },
        legend: {
            show: false
        },
    };

    var chart = new ApexCharts(document.querySelector("#chart"), options);
    chart.render();
</script>

<script>
    var options = {
        colors: ['#71DD37', '#03C3EC'],
        series: [{
            name: 'Monthly',
            data: [250, 175, 330, 35, 100, 45, 425, 500, 7, 75, 250, 300],
        }, {
            name: 'Last Year',
            data: [90, 80, 175, 5, 90, 90, 300, 135, 90, 50, 135, 75]
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
            text: 'Best Selling',
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
            categories: ['Jan', 'Feb', 'Feb', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
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
    };

    var chart = new ApexCharts(document.querySelector("#culmnBar"), options);
    chart.render();
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