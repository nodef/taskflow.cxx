#!/usr/bin/env bash
# Fetch the latest version of the library
fetch() {
if [ -f "httplib.h" ]; then return; fi
URL="https://github.com/yhirose/cpp-httplib/raw/refs/heads/master/httplib.h"
FILE="httplib.h"

# Download the release
if [ ! -f "$FILE" ]; then
  echo "Downloading $FILE from $URL ..."
  curl -L "$URL" -o "$FILE"
  echo ""
fi
}


# Test the project
test() {
echo "Running 01-hello.cxx ..."
clang++ -std=c++17 -I. -o 01.exe examples/01-hello.cxx             && ./01.exe && echo -e "\n"
echo "Running 02-server_and_client.cxx ..."
clang++ -std=c++17 -I. -o 02.exe examples/02-server_and_client.cxx && ./02.exe && echo -e "\n"
}


# Main script
if [[ "$1" == "test" ]]; then test
elif [[ "$1" == "fetch" ]]; then fetch
else echo "Usage: $0 {fetch|test}"; fi
