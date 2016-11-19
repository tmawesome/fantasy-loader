<?php

$endpoint = 'SeasonLeagueLeaders/2015/ALL/FantasyPoints';

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

$pdo = require __DIR__.'/../credentials/pdo.php';

require __DIR__.'/../vendor/autoload.php';

use jpuck\etl\Sources\REST;
use jpuck\etl\Data\XML;
use jpuck\etl\Sources\DBMS\MicrosoftSQLServer;
use jpuck\phpdev\Functions as jp;

$data = realpath(__DIR__.'/../data');

$source = new REST($credentials['rest']);
$db = new MicrosoftSQLServer($pdo,['stage' => false]);

$xml = $source->fetch($endpoint, XML::class);

$output = [
	'data.xml'    => $xml->raw(),
	'schema.json' => $xml->schema(),
	'ddl.sql'     => $db->generate($xml->schema()),
];

foreach($output as $file => $content){
	jp::file_put_contents("$data/$endpoint/$file", $content);
}

$pdo->exec($output['ddl.sql']);
$db->insert($xml);
