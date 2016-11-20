<?php

$endpoint = 'PlayerGameStatsByWeek/2015';
$weeks = 17;

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

use jpuck\etl\Sources\Folder;
use jpuck\etl\Sources\REST;
use jpuck\etl\Data\XML;
use jpuck\etl\Schemata\Merger;
use jpuck\etl\Sources\DBMS\MicrosoftSQLServer;
use jpuck\phpdev\Functions as jp;

$data = realpath(__DIR__.'/../data');

$source = new REST($credentials['rest']);
$merger = new Merger;
$db = new MicrosoftSQLServer($pdo,['stage' => false]);

// fetch xml and generate schema
for($week = 1; $week <= $weeks; $week++){
	echo "fetching week $week\n";
	$xml = $source->fetch("$endpoint/$week", XML::class);

	jp::file_put_contents("$data/$endpoint/$week.data.xml", $xml->raw());

	// merge schemas
	if(empty($schema)){
		$schema = $xml->schema();
	} else {
		$schema = $merger->merge($schema, $xml->schema());
	}
}
jp::file_put_contents("$data/$endpoint/schema.json", $schema);

// create database tables
$ddl = $db->generate($schema);
jp::file_put_contents("$data/$endpoint/ddl.sql", $ddl);
$pdo->exec($ddl);

// insert data
$folder = new Folder(['path'=>"$data/$endpoint"]);
for($week = 1; $week <= $weeks; $week++){
	// get from folder applying merged aggregate schema
	$xml = $folder->fetch("$week.data.xml", XML::class, $schema);

	echo "inserting week $week\n";
	$db->insert($xml);
}
