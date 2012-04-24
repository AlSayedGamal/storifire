<?php

//connect to database
//list Sowar in combo box
//onchange list ayat on another combobox
//add text box to add comment to aya
//save button
mysql_connect("localhost", "root","") or die("Wrong database information" . mysql_error());
mysql_select_db("quran_db");
$souar = mysql_query("select distinct(SuraId) from quran;");
while ($sura = mysql_fetch_array($souar)){
	$suraID = $sura['SuraID'];
	$suraName = $namesOfSouar[$suraID];
	$options .="<option value='$suraID'><$suraName/option>\n";
}
?>
<form action="?o=add">
	<input type="text" name="commentName" />
	<br />
	<selct name='sura'>
		<?php echo $options ?>
	</select>
	<br />
	<textarea name="comment">
	Write your comment here
	</textarea>
	<br />
<select name="sura">

</select>
</form>