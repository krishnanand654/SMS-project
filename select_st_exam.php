<?php
 include 'connection_test.php';
 include "layout/header.php";
?>
<style>
  .card{
    background:white;
    padding: 0 0 20px;
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

<?php
if(isset($_GET['submit'])){
  $name = $_GET['courseName'];




  $sql = "SELECT id FROM program where name='$name'";
  $result = mysqli_query($conn, $sql);
  $row = mysqli_num_rows($result);

  
while($res = mysqli_fetch_array($result)){
  $id = $res['id'];
}

  
  $a = "SELECT student.name from student JOIN admit_program on student.id = admit_program.student_id where admit_program.program_id='$id'";
  $result1 = mysqli_query($conn, $a);
    ?>
    <div style="display:flex; align-items:center; height:70vh; justify-content:center;">
    <div class="card">
    <div class="head">Select course</div>
<form method="GET" action="exam_list_test.php" class="form-group input1">
  <select required name="roll" class="form-control" >
   <option >Select Rollno</option>
  <?php 
  $qry = "SELECT student.id from student JOIN admit_program on student.id = admit_program.student_id where admit_program.program_id='$id'";
  $res = mysqli_query($conn,$qry);
  if($res->num_rows> 0){
    $options= mysqli_fetch_all($res, MYSQLI_ASSOC);
  }

  foreach ($options as $option) {
  ?>
  
    <option value='<?php echo $option['id'];?>'><?php
    echo $option['id']; ?> </option>
    <?php 
    }
   ?>
</select>
<div style="display:flex; justify-content:center; margin: 30px">
<input type="submit" name="submit" class="btn btn-primary"/>
  </div>
  </div>
  </div>
<?php
}
?>

<?php
	include "layout/footer.php";
?>