#!/bin/bash
PRINTER=$1
shopt -s nullglob
service cups start
lpadmin -p default-printer -E -v ${PRINTER} -m everywhere -o media=letter -o PageSize=na-letter && lpoptions -d default-printer

while true
do
  for file in ${WATCHED_FOLDER}/*.pdf
  do
    echo "Printing ${file}"
    pdf2ps "${file}" output.ps && \
    lpr output.ps && \
    rm -f "${file}" output.ps
  done
  sleep 5
done
