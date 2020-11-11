#!/bin/bash

# Start postgres.
service postgresql start

# Initialize the database.
msfdb init

# Keep alive.
tail -f /dev/null