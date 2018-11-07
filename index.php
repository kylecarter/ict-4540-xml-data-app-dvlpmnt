<?php

// Load the XML source
$xml = new DOMDocument;
$xml->load('xml/index.xml');

$xsl = new DOMDocument;
$xsl->load('xml/index.xsl');

// Configure the transformer
$proc = new XSLTProcessor;
$proc->importStyleSheet($xsl); // attach the xsl rules
$proc->setParameter('', 'q', $_GET['q']);

echo $proc->transformToXML($xml);