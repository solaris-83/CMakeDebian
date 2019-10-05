#!/bin/bash

set -e 

rm -rf /usr/share/dotnet/
rm -rf /usr/bin/dotnet

wget  https://download.visualstudio.microsoft.com/download/pr/228832ea-805f-45ab-8c88-fa36165701b9/16ce29a06031eeb09058dee94d6f5330/dotnet-sdk-2.2.401-linux-x64.tar.gz

mkdir -p /usr/share/dotnet/
tar zxfv  ./dotnet-sdk-2.2.401-linux-x64.tar.gz -C /usr/share/dotnet/

rm dotnet-sdk-2.2.401-linux-x64.tar.gz

ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet








