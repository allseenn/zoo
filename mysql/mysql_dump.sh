#!/bin/bash
mysqldump -uroot --skip-comments "Друзья человека" | grep -v "LOCK TABLES" | grep -v '^[[:space:]]*\/\*' | grep -v '^[[:space:]]*\*\/$' > dump.sql

