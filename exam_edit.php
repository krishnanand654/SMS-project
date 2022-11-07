<?php
include 'connection_test.php';
include "layout/header.php";

?>
<style>
.card{
    background:white;
    border-radius:10px;
    
    display:flex;
    flex-direction:column;
    justify-content:center;
    
  }
  .input1{
    margin:20px 30px 20px;
    width:400px;
  }
  .head{
    text-align:center;
    background:#564c9e;
    color:white;
    font-size:16px;
    height:30px;
    margin: 0 0 30px;
    display:flex;
    align-items:center;
    justify-content:center;
    
  }
</style>




<?php 

$query  = "SELECT * from admit_program ";
$result = mysqli_query($conn, $query);
$row = mysqli_num_rows($result);



$options= mysqli_fetch_all($result, MYSQLI_ASSOC);

$exam_id = $_GET['edit']; 




$query = "SELECT * FROM exam_test WHERE id = '$exam_id'"; 
$result = mysqli_query($conn,$query);
while($res = mysqli_fetch_array($result)):
?>





<?php
?>

<div style="display:flex; flex-direction:column; align-items:center; height:80vh; justify-content:center;">

<div class="card">
<div class="head">Update details</div>

<form method="POST" class="form-group">
    <h3 style="text-align:center;">Rollno : <?php echo $res['student_id']; ?></h3>
  


<select required name="test" class="form-control input1">

  <?php 
  $qry2 = "SELECT exam_name from exam ";
  $res2 = mysqli_query($conn,$qry2);
  if($res2->num_rows> 0){
    $options2= mysqli_fetch_all($res2, MYSQLI_ASSOC);
  }
  ?>
  
  <option><?php echo $res['exam_name']; ?> </option>
  <?php
  foreach ($options2 as $option2) {
  ?>
    <option ><?php echo $option2['exam_name']; ?> </option>
    <?php 
    }
   ?>
</select>

<div class="input1">
<label>Enter Mark of MCQ *</label>
<input required class="form-control" value='<?php echo $res['mcq']?>' required name="mcq" type="number">
</div>
<div class="input1">
<label>Enter Mark of Written Test</label>
<input required class="form-control "  value='<?php echo $res['written']?>' name="wrtn" type="number">
  </div>

  <div style="display:flex; justify-content:center; margin: 30px">
    <input class="btn btn-primary" type="submit" name="update"/>
  </div>

</form>

<?php

if(isset($_POST['update'])){
  $id = "";  
 
  $test = $_POST['test'];
  $mcq = $_POST['mcq'];
  $wrtn = $_POST['wrtn'];

 
$sql = "UPDATE exam_test set  `exam_name` = '$test', `mcq` = '$mcq', `written` = '$wrtn' WHERE `id` = $exam_id";
  $result=mysqli_query($conn, $sql);
  if($result){
    echo '<script>alert("Result updated successfully");
   
    </script>';
    echo '<script> window.location.href="exam_list_test.php?roll='. $res['student_id'].'&submit=Submit" </script>';
  }
    else{
      echo '<script>alert("Result not updated");</script>';
    }
}

?>



<?php endwhile; ?>

<?php
include "layout/footer.php";
?>