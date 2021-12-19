<?php

//This file is autogenerated. See modules.json and autogenerator.py for details

/*
    get_imageusage.php

    MediaWiki API Demos
    Demo of `Imageusage` module: List the first 3 pages that use a given image title

    MIT License
*/

$endPoint = "https://en.wikipedia.org/w/api.php";
$params = [
    "action" => "query",
    "format" => "json",
    "list" => "imageusage",
    "iutitle" => "File:Wiki_logo_Nupedia.jpg",
    "iulimit" => "3"
];

$url = $endPoint . "?" . http_build_query( $params );

$ch = curl_init( $url );
curl_setopt( $ch, CURLOPT_RETURNTRANSFER, true );
$output = curl_exec( $ch );
curl_close( $ch );

$result = json_decode( $output, true );

foreach( $result["query"]["imageusage"] as $k => $v ) {
    echo( $v["title"] . "\n" );
}