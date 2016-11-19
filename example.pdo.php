<?php
return (function(){
    $hostname = 'msenterprise.waltoncollege.uark.edu';
    $database = 'tmawesome';
    $username = 'user';
    $password = 'P@55w0rd';
    // https://www.microsoft.com/en-us/download/details.aspx?id=50419
    $driver   = 'ODBC Driver 13 for SQL Server';

    $pdo = new PDO("odbc:Driver=$driver;
        Server=$hostname;
        Database=$database",
        $username,
        $password
    );
    $pdo->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );

    return $pdo;
})();
