<?php
include 'connection_test.php';
include "layout/header.php";
?>
<style>
   .table{
    width:800px;
    
   }

   .thead th, td{
    text-align:center;
   }

   .thead{
    background:#564c9e;
    color:white;
   }

   .tab_con{
    display:flex;
    justify-content:center;
   }

   .edit_btn{
      border:none;
      background:#198754;
      color:white;
      font-size:14px;
      padding:5px 10px 5px;
      border-radius:5px;
   }

   .dlt{
      border:none;
      background:#dc3545;
      color:white;
      font-size:14px;
      padding:5px 10px 5px;
      border-radius:5px;
   }

   .result_id{
      font-weight:800;
      text-align:center;
      margin: 10px 0 40px;
      color:black;
   }
</style>



          
<?php

 if(isset($_GET['delete'])){

               $del_id =  $_GET['delete'];

               $query = "SELECT * FROM exam_test WHERE id = '$del_id'"; 
               $result = mysqli_query($conn,$query);
               while($res = mysqli_fetch_array($result)):
               ?>

               <?php

               $qty = "DELETE from exam_test where `id` = $del_id ";
               $del_res = mysqli_query($conn, $qty);


             
               
               if($del_res){
                  echo '<script>alert("data deleted")
                  </script>';
                  echo '<script> window.location.href="exam_list_test.php?roll='. $res['student_id'].'&submit=Submit" </script>';          
                }
              else{
                echo '<script>alert("data not deleted")
                </script>';
                echo '<script> window.location.href="exam_list_test.php?roll='. $res['student_id'].'&submit=Submit" </script>';
              }
            
            
 
  ?>
  <?php endwhile; }?>



<?php

if(isset($_GET['submit'])){
    $name_id = $_GET['roll']; 
    function name()
         {
            global $name_id; 
         
         }
         name();
    $sql = "SELECT * FROM exam_test where student_id = $name_id";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_num_rows($result);
    ?>

  <?php
  if($row > 0){?>
  
  
  <div class="tab_con">

   <table  class="table " style="align-items:center;">
   <caption><h2 class="result_id">Exam result of Rollno : <?php echo $name_id ?></h2>   </caption>
    <tr class="thead-dark thead">
        <th>Exam name</th>
        <th>MCQ</th>
        <th>Written</th>
        <th>Total</th>
        <th colspan="2" >Action</th>
        

  <?php
   while($res = mysqli_fetch_array($result)):?>
  
   </tr>
            <tr class="tbody" >
               
            <td><b><?php echo $res['exam_name']; ?></b></td>
            <td><?php echo $res['mcq']; ?></td>
            <td><?php echo $res['written']; ?></td>
            <td><?php echo $res['mcq']+$res['written']; ?></td>
            <td><a class="bg-success edit_btn" name="up" href="exam_edit.php?edit=<?php echo $res['id']?>" >Edit</a>
            <a name="dlt" class="bg-warning dlt" href="exam_list_test.php?delete=<?php echo $res['id'];?>">Delete</a></td>
  

    <?php endwhile; }else{
      echo '<h1> No result Uploaded</h1>';
    }}?>
   </tr>
   </table>
   </div>
   <?php
include "layout/footer.php";
?>