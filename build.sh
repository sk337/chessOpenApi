#!/bin/bash

echo "clearing Dist"
rm -rf dist && mkdir dist

echo "fetching swagger ui"
wget -q https://github.com/swagger-api/swagger-ui/archive/refs/tags/v5.10.3.zip

echo "Unzipping Swagger ui"
unzip -q ./v5.10.3.zip

echo "moving swagger to dist"
mv swagger-ui*/dist/* dist/


echo "moving openapi.json and LICENSE to dist"
cp openapi.json dist/
cp LICENSE dist/

echo "patching dist/swagger-initializer.js"
sed -i -e "s/url: \"https:\/\/petstore.swagger.io\/v2\/swagger.json\"/urls: [{url: \"\/\/sk337.github.io\/chessOpennApi\/openapi.json\", name:\"SwordBattle.io\"}]/g" dist/swagger-initializer.js

echo "cleaning"

rm -rf v5.*  swagger-ui*