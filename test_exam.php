<?php
 include 'connection_test.php';
?>
<style>
  .card{
    background:white;
    
    border-radius:10px;
  }

  .head{
    text-align:center;
    background:#564c9e;
    color:white;
    font-size:16px;
    height:30px;
    display:flex;
    align-items:center;
    justify-content:center;
    
  }

  .input1{
    padding:50px;
  }
  </style>
<div style="display:flex; align-items:center; height:70vh; justify-content:center;">

<div class="card" >
  <div class="head">Select course</div>
<form method="POST" action="test2.php" class="form-group input1" >
<select required name="courseName" class="form-control" style="width:300px">
   
  <?php 
  $qry = "SELECT name from program";
  $res = mysqli_query($conn,$qry);
  if($res->num_rows> 0){
    $options= mysqli_fetch_all($res, MYSQLI_ASSOC);
  }

  foreach ($options as $option) {
  ?>
    <option ><?php echo $option['name']; ?> </option>
    <?php 
    }
   ?>
</select>
<div style="display:flex; justify-content:center; margin: 30px">
<input type="submit" name="submit" class="btn btn-primary"/>
  </div>
  </form>
  </div>
  </div>