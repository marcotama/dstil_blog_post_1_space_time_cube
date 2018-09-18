#!/usr/bin/env bash

DOCUMENT=blog_post


echo -n "Generating HTML..."
asciidoctor -r asciidoctor-bibtex -a stylesheet=asciidoctor.css -a stylesdir=styles/ "${DOCUMENT}.adoc" -o "${DOCUMENT}.html"
echo " Done"


echo -n "Generating DOCX..."
pandoc -f html -s "${DOCUMENT}.html" -t docx -o "${DOCUMENT}.docx"
echo " Done"

zip -r "${DOCUMENT}.zip" "${DOCUMENT}.html" "${DOCUMENT}.docx" images/ fonts/