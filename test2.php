<?php
 include 'connection_test.php';
 
include 'layout/header.php';

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
if(isset($_POST['submit'])){
  $name = $_POST['courseName'];



  $sql = "SELECT id FROM program where name='$name'";
  $result = mysqli_query($conn, $sql);
  $row = mysqli_num_rows($result);

  
while($res = mysqli_fetch_array($result)){
  $id = $res['id'];
}

  
  $a = "SELECT student.name from student JOIN admit_program on student.id = admit_program.student_id where admit_program.program_id='$id'";
  $result1 = mysqli_query($conn, $a);
    ?>

<div style="display:flex; flex-direction:column; align-items:center; height:80vh; justify-content:center;">

<div class="card">
<div class="head">Enter details</div>
<form method="post" class="form-group">
  <select required name="roll" class="form-control input1">
   <option>Select Rollno</option>
  <?php 
  $qry = "SELECT student.id from student JOIN admit_program on student.id = admit_program.student_id where admit_program.program_id='$id'";
  $res = mysqli_query($conn,$qry);
  if($res->num_rows> 0){
    $options= mysqli_fetch_all($res, MYSQLI_ASSOC);
  }

  foreach ($options as $option) {
  ?>
    <option><?php echo $option['id']; ?> </option>
    <?php 
    }
   ?>
</select>

<?php

}



?>

<select required name="test" class="form-control input1">
<option >Select test</option>
  <?php 
  $qry2 = "SELECT exam_name from exam where program_id=$id";
  $res2 = mysqli_query($conn,$qry2);
  if($res2->num_rows> 0){
    $options2= mysqli_fetch_all($res2, MYSQLI_ASSOC);
  }

  foreach ($options2 as $option2) {
  ?>
    <option   ><?php echo $option2['exam_name']; ?> </option>
    <?php 
    }
   ?>
</select>
</select>
<div class="input1">
<label>Enter Mark of MCQ *</label>
<input required class="form-control " required name="mcq" type="number">
</div>
<div class="input1">
<label>Enter Mark of Written Test</label>
<input required class="form-control " name="wrtn" type="number">
  </div>

  <div style="display:flex; justify-content:center; margin: 30px">
    <input class="btn btn-primary" type="submit" name="sub"/>
  </div>

</form>
<?php
if(isset($_POST['sub'])){
  $id = "";  
  $st_id = $_POST['roll'];
  $test = $_POST['test'];
  $mcq = $_POST['mcq'];
  $wrtn = $_POST['wrtn'];

  $que = "SELECT exam_name FROM exam_test where student_id = $st_id and exam_name = '$test'";
  $check = mysqli_query($conn, $que);
  $checkrows = mysqli_num_rows($check);

  if($checkrows>0){
    echo '<script>alert("Result already exist");
    window.location.href="add_result.php";
    </script>';
  }else{
  
$sql = "INSERT INTO exam_test VALUES('$id','$st_id','$test','$mcq','$wrtn')";
  $result=mysqli_query($conn, $sql);
  if($result){
    echo '<script>alert("Result added successfully");
    window.location.href = "add_result.php";</script>';
  }
    else{
      echo '<script>alert("Result not added : Unsuccessfull");</script>';
    }
}
}



?>
</div>
</div>
<?php
include "layout/footer.php";
?>
