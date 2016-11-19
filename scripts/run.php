<?php
require __DIR__.'/../vendor/autoload.php';

use jpuck\etl\Sources\REST;
use jpuck\etl\Data\XML;
use jpuck\phpdev\Functions as jp;

$credentials = [
	'rest' => [
		'url' => 'https://api.fantasydata.net/v3/nfl/stats/XML/',
		'headers' => [
			'Ocp-Apim-Subscription-Key' => 'super secret access key',
		],
	],
];

// overwrite with real
require __DIR__.'/../credentials/credentials.php';

$data = realpath(__DIR__.'/../data');

$source = new REST($credentials['rest']);

$endpoint = 'SeasonLeagueLeaders/2015/ALL/FantasyPoints';

$xml = $source->fetch($endpoint, XML::class);

jp::file_put_contents("$data/$endpoint/data.xml", $xml->raw());
jp::file_put_contents("$data/$endpoint/schema.json", $xml->schema());
