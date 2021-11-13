<?php
include_once "markdown.php";

$editting=true;
$backup=true;
$wikiName="coding notes";
$exceptions=array("markdown.php","notes.php","index.html");
//
//$exceptions=array("scripts");
$css=array("/styles/home.css");
#$favicon="webroot/path/to/favicon.jpg"; //find an icon dum
#$hackerImage="webroot/path/to/image/hackers/see.jpg"; //for notes
$user_nav=array(
/*
place more header entries here to come after HOME and EDIT
"link"=>"url"
*/
"Markdown Manual"=>"http://daringfireball.net/projects/markdown/syntax",
);
	$nav=array(
		"HOME"=>"./notes.php",
	);
if(isset($_GET['entry'])){
	if(!isset($_GET['edit'])&&$editting){
		$nav+=array("EDIT"=>curPageURL()."&edit=true");
	}
	else if(!isset($_GET['edit'])&&!$editting){
		$nav+=array("SOURCE"=>curPageURL()."&edit=true");
	}
}
$nav=array_merge($nav,$user_nav);
function curPageURL() {
 $pageURL = 'http';
 if ($_SERVER["HTTPS"] == "on") {$pageURL .= "s";}
 $pageURL .= "://";
 if ($_SERVER["SERVER_PORT"] != "80") {
  $pageURL .= $_SERVER["SERVER_NAME"].":".$_SERVER["SERVER_PORT"].$_SERVER["REQUEST_URI"];
 } else {
  $pageURL .= $_SERVER["SERVER_NAME"].$_SERVER["REQUEST_URI"];
 }
 return $pageURL;
}

function readDirectory($dir,$exceptions,$level=0){
	$notDirs=array();
	if($dir!='.'){echo "<ul class='flexnone' id='$level'>\n";}
	else{echo"<div class='flex'>\n";}
	if ($handle = opendir($dir)) {
	    while (false !== ($entry = readdir($handle))) {
		if(!preg_match('/^\..*/',$entry)){
			if (is_dir("$dir/$entry") and !in_array($entry,$exceptions)){
				$level+=1;
				echo "<div><details>";
				echo "<summary>$entry</summary>\n";
				readDirectory("$dir/$entry",$exceptions,$level);
				echo "</details></div>";
			}
		}
		if (preg_match('/^.*\.(md|MD|markdown|MarkDown|text|Text|TEXT|txt|TXT|HTML|html|htm|HTM)$/',$entry)) {
			if (preg_match('/index\.html/i',$entry)==0){
			$entryURL='entry='.urlencode($dir).'/'.urlencode($entry);
		    array_push($notDirs, "<li class='point'><h><a href=$url?".htmlentities($entryURL).">$entry</a><h></li>\n");
		    }
		}
	    }
		sort($notDirs);
		$notDirs=array_reverse($notDirs);
		while($entryExt=array_pop($notDirs)){
			echo $entryExt;
		}
	    closedir($handle);
	}
	if($dir!='.'){echo "</ul>\n";}
	else{echo "</div>\n";}
}

function readDirFile($dir,$exceptions){

	$validEntry = $_GET['entry'];
	if (strpos($validEntry, '..') !== false) {
	// entry is invalid, let's show them the main page
		readDirectory('.',$exceptions);
	} else {
	// entry is valid, carry on
		$file = $dir."/".$validEntry;
		$mark = fopen($file,"r");
		$markContents = fread($mark,filesize("$file"));
		echo Markdown($markContents);
		fclose($mark);
	}
}

function readDirFileRAW($dir){
	$file = "$dir"."/".$_GET['entry'];
	$mark = fopen($file,"r");
	$markContents = fread($mark,filesize("$file"));
	echo $markContents;
	fclose($mark);
}

function updateArticle($article,$update){
	if($backup){
	$file = fopen($article,"r");
	$fileContents = fread($file,filesize("$article"));
	$new_file = fopen("$article".date("dmYHi"),"w");
	if(is_writeable("$article".date("dmYHi"))){
		if(fwrite($new_file,$fileContents) === FALSE){
			echo "Could not write $article backup.<br>";
			exit;
		}
		else{echo "$article has been backed up.<br>";}
	}
	else{echo "Could not write to $article".date("dmYHi").".<br>";}
	fclose($file);
	fclose($new_file);
	}
	$file = fopen($article,"w");
	if(is_writeable("$article")){
		if(fwrite($file,$update) === FALSE){
			echo "Could not update $article.<br>";
			exit;
		}
		else{echo "$article has been updated.<br>";}
	}
	else{echo "Could not write to $article.<br>";}
	fclose($file);
}
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
<?php
echo "<title>$wikiName</title>";
if(isset($css)){
  if(is_array($css)){
    foreach($css as $css_sheet){
    	print "<link rel='stylesheet' href='$css_sheet'>\n";
    }
	} else {
  	print "<link rel='stylesheet' href='$css'>";
	}
}
?>
<style type="text/css">
.content{width:100%;}
body{width:90%;flex-wrap:wrap;}
details{width:200px; padding:10px;border:dotted;border-width:0.3px;margin:15px;}
summary{font-size:16px; font-family:Monospace;text-shadow: 0 0 5px #ddd;}
details[open]{
width:800px; padding:10px;border:dotted;border-width:0.3px;margin:15px
}
ul.flexnone{margin:0px;padding:5px;}
ul.flexnone li {margin:2px;width:230px;}
</style>
<?php
if(isset($favicon)){
	echo "<link rel='icon' href='$favicon' type='image/x-icon' />";
	echo "<link rel='shortcut icon' href='$favicon' type='image/x-icon' />";
}
?>
</head>
<body>

<div class="navbar navbar-inverse navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container">
      <header><h1><a class="brand" href="notes.php"><?php echo $wikiName; ?></a></h1></header>
      <ul class="nav">
<?php
foreach($nav as $show=>$html){
	echo "<li><a href=$html>$show</a></li>";
}
?>
      </ul>
    </div>
    <hr>
  </div>
</div>
<div class="content">
<?php
$url = curPageURL();

if($_POST['article']){
	if($_POST['update']){
		$article=$_POST['article'];
		$update=$_POST['update'];
		updateArticle($article,$update);
	}
}

if (!$_GET['edit']){
	if (empty($_GET['entry'])){
		readDirectory('.',$exceptions);
	}
	if ( isset($_GET['entry'])){
		if ( strpos($_GET['entry'], 'notes.php') === false ){
			readDirFile('.',$exceptions);
		}
		else{
			echo "<img src='$hackerImage'>";
		}
	}
}
if ($_GET['edit']){
	$validEntry = $_GET['entry'];
	if (strpos($validEntry, '..') !== false) {
	// entry is invalid, let's show them the main page
		readDirectory('.',$exceptions);
	} else {
?>
	<form action="./notes.php" method="post">
		<input type="hidden" name="article" value="<?php echo $_GET['entry']; ?>" >
		<textarea name="update" rows="25" cols="100" class="field span12" <?php if(!$editting) echo "disabled";?>><?php readDirFileRAW('.');?></textarea>
		<br/>
		<?php if($editting){?>
		<input type="submit" value="Submit">
		<?php } ?>
	</form>
<?php
	}
}
?>
</div>
<footer><a href="./">back to notes folder</a></footer>
</body>
</html>
