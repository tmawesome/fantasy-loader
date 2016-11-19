<?php

require __DIR__.'/vendor/autoload.php';
use jpuck\etl\Data\JSON;

$credentials = [
	'db' => [
		'server'   => 'msenterprise.waltoncollege.uark.edu',
		'database' => 'teamawesome',
		'username' => 'teamawesomeapi',
		'password' => 'P@55w0rd',
	],
	'rest' => [
		'url' => 'https://api.fantasydata.net/v3/nfl/stats/JSON/',
		'key' => 'api_key',
		'username' => 'user',
		'password' => 'P@55',
	],
];

// overwrite with real
require __DIR__.'/credentials.php';

// $source = new REST($credentials['rest']);
// 
// $endpoint = 'SeasonLeagueLeaders/2015/ALL/FantasyPoints';
// 
// $json = $source->fetch($endpoint, JSON::class);
// 
// file_put_contents('data.json', $json->raw());
// file_put_contents('data.schema.json', $json->schema());

$dir = __DIR__.'/data/SeasonLeagueLeaders-2015-ALL-FantasyPoints';

$data = "$dir/data.json";

$json = json_decode(file_get_contents($data));

$json = new JSON(json_encode($json[0]));

file_put_contents("$dir/schema.json", $json->schema());

// $json = file_get_contents(__DIR__.'/data/SeasonLeagueLeaders-2015-ALL-FantasyPoints/raw.txt');

