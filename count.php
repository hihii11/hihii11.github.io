 <?php 
 mysql_connect('localhost','root','');
  mysql_selectdb('click'); 
  $rs=mysql_query("UPDATE click SET num = num +1 WHERE name = '".$_GET['a']."'");
   if(mysql_affected_rows()==1){ $rs=mysql_query("select * from click where name='".$_GET['a']."'");
    $row=mysql_fetch_array($rs); echo $row['num']; }
	?>