#!/bin/bash
APPHOST=localhost

echo "curl -s -H \"1.2.3.4\" http://$APPHOST"
curl -s -H "1.2.3.4" http://$APPHOST > /dev/null

echo "curl -s http://$APPHOST/%09"
curl -s http://$APPHOST/%09 > /dev/null

echo "curl -s http://$APPHOST/index.bak "
curl -s http://$APPHOST/index.bak > /dev/null

echo "curl -s http://i$APPHOST?a=%3Cscript%3E"
curl -s http://i$APPHOST?a=%3Cscript%3E > /dev/null

echo "curl -s http://$APPHOST"
curl -s http://$APPHOST > /dev/null

echo "curl -s http://$APPHOST/\<script\>"
curl -s http://$APPHOST/\<script\> > /dev/null

echo "curl -s -H "Content-Length: -26" http://$APPHOST/ "
curl -s -H "Content-Length: -26" http://$APPHOST/ > /dev/null

echo "curl -s http://$APPHOST/index.php"
curl -s http://$APPHOST/index.php > /dev/null

echo "curl -s http://$APPHOST/test.exe"
curl -s http://$APPHOST/test.exe > /dev/null

echo "curl -s http://$APPHOST/index.html"
curl -s http://$APPHOST/index.html > /dev/null

echo "curl -s http://$APPHOST/basic/index.php"
curl -s http://$APPHOST/basic/index.php > /dev/null
