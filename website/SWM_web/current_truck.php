<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
     <script type="text/javascript" src = "jquery/jquery.js"></script>
              <script type="text/javascript" >
               /* $(document).ready(function(){
                  setInterval(function(){
                    //alert("mah");
                    $('#show').load('#');
                  },15000);
                });*/
                setTimeout(function(){
                   window.location.reload(1);
                }, 5000);
              </script>   
</head>
<body>
  <h3 class="text-primary">bins Details</h3>
<div class=" col-lg-12 content-wrapper">
   
      <div class="row" id="show">
                     
                    <table class="table table-hover">
                       <thead>
                          <tr class="text-primary">
                             <th>#</th>
                             <th>truck_id</th>
                             <th>number_of_bins</th>
                             <th>bin_ids</th>
                             <th>bin_add</th> 
                             <th>Status</th>
                          </tr>
                       </thead>

<?php
include('config.php');
$sql1 = "SELECT bins_id from bins where t_id = 1 " ;
$sql = "SELECT t_id, COUNT(bins_id) as bpt FROM bins where bins_cap_fill > 80 GROUP BY t_id";

if (mysqli_query($db, $sql)) {
echo "";
} else {
echo "Error: " . $sql . "<br>" . mysqli_error($db);
}
$count=1;
$result = mysqli_query($db , $sql);
if (mysqli_num_rows($result) > 0) {

while($row = mysqli_fetch_assoc($result)) { ?>
                        <tbody>
                           <tr>
                              <th scope="row">
                              <?php echo $count; ?>
                              </th>
                              <td>
                              <?php echo $row['t_id']; ?><br><br>
                              <form method="POST"  action="dir.php">
                              <input type="hidden" name="store" value="<?= $row['t_id'] ?>" />
                              <input type="submit" id= "<?php echo $row['t_id']; ?>" name="submit" class="btn btn-info" value = "Map Route previews"></input>
                              </form> 
                              
                              </td>
                              <td>
                              <?php echo $row['bpt']; ?>
                              </td>
                              <td>
                              <?php

                              $sql1 = 'SELECT bins_cap_fill from bins where t_id ="'.$row['t_id'].'" and bins_cap_fill > 80 order by bins_cap_fill DESC';
                              if (mysqli_query($db, $sql1)) {
                              echo "";
                              } else {
                              echo "Error: " . $sql1 . "<br>" . mysqli_error($db);
                              }
                              $result1 = mysqli_query($db , $sql1);
                              if (mysqli_num_rows($result1) > 0) {
                              while($row1 = mysqli_fetch_assoc($result1)) { 
                              echo $row1['bins_cap_fill']."<br>"; 

                              }
                              }
                              ?>
                              </td>
                              <td>
                              <?php

                              $sql1 = 'SELECT bins_add from bins where t_id ="'.$row['t_id'].'" and bins_cap_fill > 80 order by bins_cap_fill DESC';
                              if (mysqli_query($db, $sql1)) {
                              echo "";
                              } else {
                              echo "Error: " . $sql1 . "<br>" . mysqli_error($db);
                              }
                              $result1 = mysqli_query($db , $sql1);
                              if (mysqli_num_rows($result1) > 0) {
                              while($row1 = mysqli_fetch_assoc($result1)) { 
                              echo $row1['bins_add']."<br>"; 
                              
                              }
                              }
                              ?>
                              </td>
                                <td>
                                  <button type="button" class="btn btn-danger">Ready to collect   </button>
                                 </td>
                              
                           </tr>
                        </tbody>
<?php
$count++;
}
}

?>
      </table>
           
       
</div>
</div>
</body>
</html>