<?php 

if (!Yii::$app->user->isGuest) {
    if (Yii::$app->user->identity->level == 1) {
    echo '<div class="sidemenu-area sidemenu-toggle default">
        <nav class="sidemenu navbar navbar-expand navbar-light hide-nav-title">
            <div class="navbar-collapse collapse">
                <div class="navbar-nav">
                    <a class="nav-link" href="/site/index">
                        <i data-feather="grid" class="icon"></i>
                        <span class="title">Dashboard</span>
                    </a>

                    <div class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <div class="dropdown-title">
                                <i data-feather="settings" class="icon"></i>
                                <span class="title">
                                    CONFIGURATION
                                    <i data-feather="chevron-right" class="icon fr"></i>
                                </span>
                            </div>
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="/index.php?r=client">
                                <i data-feather="chevron-right" class="icon"></i>
                                Clients
                            </a>    

                            <a class="dropdown-item" href="/index.php?r=manager">
                                <i data-feather="chevron-right" class="icon"></i>
                                Manager
                            </a> 

                            <a class="dropdown-item" href="/index.php?r=vendor">
                                <i data-feather="chevron-right" class="icon"></i>
                                Vendor
                            </a> 

                            <a class="dropdown-item" href="/index.php?r=users">
                                <i data-feather="chevron-right" class="icon"></i>
                                Users
                            </a> 
                        </div>
                    </div>

                    <div class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <div class="dropdown-title">
                                <i data-feather="users" class="icon"></i>
                                <span class="title">
                                    HR MANAGEMENT
                                    <i data-feather="chevron-right" class="icon fr"></i>
                                </span>
                            </div>
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="/index.php?r=departments">
                                <i data-feather="chevron-right" class="icon"></i>
                                Department
                            </a>
                            <a class="dropdown-item" href="/index.php?r=employee">
                                <i data-feather="chevron-right" class="icon"></i>
                                Employees
                            </a>
                            <a class="dropdown-item" href="/index.php?r=salary">
                                <i data-feather="chevron-right" class="icon"></i>
                                Salary Generation
                            </a>
                            <a class="dropdown-item" href="/index.php?r=leave-requests">
                                <i data-feather="chevron-right" class="icon"></i>
                                Leave Requests
                            </a> 
                            <a class="dropdown-item" href="/index.php?r=leave-types">
                                <i data-feather="chevron-right" class="icon"></i>
                                Leave Types
                            </a> 
                        </div>
                    </div>

                    <div class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <div class="dropdown-title">
                                <i data-feather="dollar-sign" class="icon"></i>
                                <span class="title">
                                    FINANCE
                                    <i data-feather="chevron-right" class="icon fr"></i>
                                </span>
                            </div>
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="/index.php?r=invoice">
                                <i data-feather="chevron-right" class="icon"></i>
                                Sales Order
                            </a> 
                            <a class="dropdown-item" href="/index.php?r=purchase">
                                <i data-feather="chevron-right" class="icon"></i>
                                Purchase
                            </a> 
                                <a class="dropdown-item" href="/index.php?r=quotation">
                                <i data-feather="chevron-right" class="icon"></i>
                                Quotation
                            </a>
                               <a class="dropdown-item" href="/index.php?r=purchase-order">
                                <i data-feather="chevron-right" class="icon"></i>
                                Purchase Order
                            </a>  
                        </div>
                    </div>

                      <div class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <div class="dropdown-title">
                                <i data-feather="dollar-sign" class="icon"></i>
                                <span class="title">
                                   ACCOUNTS
                                    <i data-feather="chevron-right" class="icon fr"></i>
                                </span>
                            </div>
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="/index.php?r=charts-of-accounts">
                                <i data-feather="chevron-right" class="icon"></i>
                                Account Categories
                            </a> 
                            <a class="dropdown-item" href="/index.php?r=charts-of-accounts/account-report">
                                <i data-feather="chevron-right" class="icon"></i>
                                Account Reports
                            </a> 
                               
                        </div>
                    </div>

                        <div class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <div class="dropdown-title">
                                <i data-feather="shopping-cart" class="icon"></i>
                                <span class="title">
                                    INVENTORY
                                    <i data-feather="chevron-right" class="icon fr"></i>
                                </span>
                            </div>
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="/index.php?r=items">
                                <i data-feather="chevron-right" class="icon"></i>
                                Items
                            </a> 
                               <a class="dropdown-item" href="/index.php?r=customer">
                                <i data-feather="chevron-right" class="icon"></i>
                                Customers
                            </a> 
                            <a class="dropdown-item" href="/index.php?r=inventory">
                                <i data-feather="chevron-right" class="icon"></i>
                                Inventory
                            </a>

                              <a class="dropdown-item" href="/index.php?r=units">
                                <i data-feather="chevron-right" class="icon"></i>
                                Units
                            </a>
                         
                        </div>
                    </div>


                    <div class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <div class="dropdown-title">
                                <i data-feather="bar-chart" class="icon"></i>
                                <span class="title">
                                    REPORTS
                                    <i data-feather="chevron-right" class="icon fr"></i>
                                </span>
                            </div>
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="/index.php?r=invoice/revenue">
                                <i data-feather="chevron-right" class="icon"></i>
                                Overview
                            </a> 
                               <a class="dropdown-item" href="/index.php?r=invoice/report">
                                <i data-feather="chevron-right" class="icon"></i>
                                Sales
                            </a> 
                            <a class="dropdown-item" href="/index.php?r=invoice/pl">
                                <i data-feather="chevron-right" class="icon"></i>
                                P/L Statement
                            </a> 
                        </div>
                    </div>
                </div>
            </div>
        </nav>
    </div>';
    }

    if (Yii::$app->user->identity->level == 2) {
        echo '<div class="sidemenu-area sidemenu-toggle default">
            <nav class="sidemenu navbar navbar-expand navbar-light hide-nav-title">
                <div class="navbar-collapse collapse">
                    <div class="navbar-nav">
                        <a class="nav-link" href="/site/index">
                            <i data-feather="grid" class="icon"></i>
                            <span class="title">Dashboard</span>
                        </a>
    
                        <div class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <div class="dropdown-title">
                                    <i data-feather="settings" class="icon"></i>
                                    <span class="title">
                                        CONFIGURATION
                                        <i data-feather="chevron-right" class="icon fr"></i>
                                    </span>
                                </div>
                            </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="/index.php?r=client">
                                    <i data-feather="chevron-right" class="icon"></i>
                                    Clients
                                </a>    
    
                                <a class="dropdown-item" href="/index.php?r=manager">
                                    <i data-feather="chevron-right" class="icon"></i>
                                    Manager
                                </a> 
    
                                <a class="dropdown-item" href="/index.php?r=vendor">
                                    <i data-feather="chevron-right" class="icon"></i>
                                    Vendor
                                </a> 
    
                               
                            </div>
                        </div>
    
                       
    
                        <div class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <div class="dropdown-title">
                                    <i data-feather="dollar-sign" class="icon"></i>
                                    <span class="title">
                                        CASH FLOW
                                        <i data-feather="chevron-right" class="icon fr"></i>
                                    </span>
                                </div>
                            </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="/index.php?r=invoice">
                                    <i data-feather="chevron-right" class="icon"></i>
                                    Invoice
                                </a> 
                                <a class="dropdown-item" href="/index.php?r=purchase">
                                    <i data-feather="chevron-right" class="icon"></i>
                                    Purchase
                                </a> 
                            </div>
                        </div>
    
                        <div class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <div class="dropdown-title">
                                    <i data-feather="bar-chart" class="icon"></i>
                                    <span class="title">
                                        REPORTS
                                        <i data-feather="chevron-right" class="icon fr"></i>
                                    </span>
                                </div>
                            </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="/index.php?r=invoice/report">
                                    <i data-feather="chevron-right" class="icon"></i>
                                    Invoice 
                                </a> 
                                <a class="dropdown-item" href="/index.php?r=invoice/pl">
                                    <i data-feather="chevron-right" class="icon"></i>
                                    P/L Statement
                                </a> 
                            </div>
                        </div>
                    </div>
                </div>
            </nav>
        </div>';
        }

        if (Yii::$app->user->identity->level == 3) {
            echo '<div class="sidemenu-area sidemenu-toggle default">
                <nav class="sidemenu navbar navbar-expand navbar-light hide-nav-title">
                      <div class="navbar-collapse collapse">
                    <div class="navbar-nav">
                        <a class="nav-link" href="/site/index">
                            <i data-feather="grid" class="icon"></i>
                            <span class="title">Dashboard</span>
                        </a>
    
    
                       
    
                     
    
                        <div class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <div class="dropdown-title">
                                    <i data-feather="bar-chart" class="icon"></i>
                                    <span class="title">
                                       lEAVE MANAGEMENT
                                        <i data-feather="chevron-right" class="icon fr"></i>
                                    </span>
                                </div>
                            </a>
                            <div class="dropdown-menu">
                               <a class="dropdown-item" href="/index.php?r=leave-requests/create">
                                    <i data-feather="chevron-right" class="icon"></i>
                                    Apply FOr LEave
                                </a> 
                              
                            </div>
                        </div>
                    </div>
                </div>
                </nav>
            </div>';
            }
}

?>
