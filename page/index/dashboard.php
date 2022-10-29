
<script type="text/javascript" src="page/index/js/dashboard.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
            $(document).ready(function() {
                 $('table.display').DataTable();
            } );
        </script>




<?php

$total_student=count($student);
$total_notice=count($notice_info);
$info=$sms->sms_balance();

?>

<?php
/**
* Show user information like IP address, useragent
**/

?>

<?php


?>


<style>
    .td_info1,.td_info2{
  border-width: 1px;
  border-color: #DDDDDD;
  border-style: solid;
  padding: 10px;
}
.td_info1{
  width: 150px; 
  background-color: var(--bg-color);
  color: var(--font-color);
}
 
 .card{
    width:300px;
    margin: -5px 50px 0 ;
 }
 </style>

 <div class="row" style="margin-bottom: 10px;">
<div style="display:flex; justify-content:center" >

<div class="row" >

<div class=" card">
    <div class="circle-tile">
        <a href="">
            <div class="circle-tile-heading dark-blue">
                <i class="fa fa-users fa-fw fa-3x"></i>
            </div>
        </a>
        <div class="circle-tile-content dark-blue">
            <div class="circle-tile-description text-faded">
                Total Students
            </div>
            <div class="circle-tile-number text-faded">
                <?php echo "$total_student"; ?>
                <span id="sparklineA"></span>
            </div>
           
        </div>
    </div>
</div>


</div>

 <div class="col-lg-6">
        <center><font style="font-weight: bold;text-align: center; font-size: 18px"> 
        	<?php
        	$uname=$login_user['uname'];
        	$date=date("d M Y h:i:A", strtotime($db->date()));
        	$day=date("l", strtotime($db->date()));
          $user_permission=$user_ob->get_user_permission($role);
         	
         ?>
         	<marquee style='color: var(--bg-color)' behavior="scroll" direction="left"><?php echo $site->welcome_time($uname); ?></marquee>

         </font></center>
                <table width="100%">
                    <tr>
                        <td class="td_info1">Today Date: </td>
                        <td class="td_info2"><?php echo $date; ?></td>
                    </tr>
                    <tr>
                        <td class="td_info1">Today Day: </td>
                        <td class="td_info2"><?php echo $day; ?></td>
                    </tr>                    
                </table>
                           
    </div>
    <?php// include 'dashboard_info.php'; ?>
    


</div>

<div>
    <div class="row" style="margin: 0 20px 0 ;">
    
    <script src="tool/chart_api/canvas_api.js"></script>


        <?php 
       
       if($user_permit<8){
       // include "student_admit_graph.php"; 
        include "site_activity.php"; 
        
       }
        ?>

    </div>    

<link rel="stylesheet" type="text/css" href="page/index/style.css">
<style type="text/css">
    thead{
        background-color: #EFF0F2;
        border-width: 0px;
    }
    .td_list1{
        background-color: #EFF0F2;
        color: #000000;
        padding: 10px;
        font-weight: bold;
        border: 1px solid #C6C9D1;
        text-align: center;
    }
    .td_list2{
        background-color: #ffffff;
        color: #000000;
        padding: 8px;
        border: 1px solid #C6C9D1;
        text-align: center;
    }
</style>

<script type="text/javascript">
    live_site_action();
</script>