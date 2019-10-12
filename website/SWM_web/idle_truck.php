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
<h3 class="text-primary mt-5">Truck Details</h3>
   <div class="row mb-2">
      <div class="col-lg-12">
         
                
                 <table class="table table-hover">
                     <thead>
                         <tr class="text-primary">
                             <th>#</th>
                             <th>truck_id</th>
                             <th>truck_add</th>
                             <th>lat</th>
                             <th>lng</th>
                             <th>truck_cap</th>
                             <th>area_id</th>
                         </tr>
                     </thead>
<?php
include('config.php');
$sql = "select * from trucks";
if (mysqli_query($db, $sql)) {
echo "";
} else {
echo "Error: " . $sql . "<br>" . mysqli_error($db);
}
$count=1;
$result = mysqli_query($db, $sql);
if (mysqli_num_rows($result) > 0) {
  // output data of each row
  while($row = mysqli_fetch_assoc($result)) { ?>
                     <tbody>
                         <tr>
                            <th scope=”row”>
                            <?php echo $count; ?>
                            </th>
                            <td>
                               <?php echo $row['t_id']; ?>
                            </td>
                            <td>
                               <?php echo $row['t_cap']; ?>
                            </td>
                            <td>
                               <?php echo $row['lat']; ?>
                            </td>
                            <td>
                               <?php echo $row['lng']; ?>
                            </td>                            
                            <td>
                               <?php echo $row['t_add']; ?>
                            </td>
                            <td>
                               <?php echo $row['a_id']; ?>
                            </td>
                            </tr>
                          </tbody>
<?php
$count++;
}
} else {
echo "0 results";
}
mysqli_close($db);
?>
                   </table>
              </div>
          </div>
     </div>
</div>
</body>
</html>