<html>
<head>
<style>
div{margin:5px;}
</style>
<title>Gallery from Folder</title>
</head>

<body>

<div style="display:flex; flex-wrap:wrap; width=100%; height:100%">
    <?php
        $dirname = "images/";
        $pattern = "/(.*)\..*/";
        $images = scandir($dirname);
        shuffle($images);
        $ignore = Array(".", "..");
        foreach($images as $curimg){
        $cap=preg_replace($pattern, '$1',$curimg);
            if(!in_array($curimg, $ignore)) {
                echo "<div><a href='$dirname$curimg'><img crossorigin='anonymous' referrerpolicy='no-referrer' src='$dirname$curimg' alt='$cap' height=300px width=300px /><br>$cap</a></div>\n";
            }
        }
    ?>
</div>

</body>
</html>