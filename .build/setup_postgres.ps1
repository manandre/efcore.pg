# Acquire Postgres Package Manager by BigSQL
powershell -c "Invoke-Expression ((New-Object Net.WebClient).DownloadString('https://s3.amazonaws.com/pgcentral/install.ps1'))";

# Install PostgreSQL
bigsql/pgc list
bigsql/pgc install pg11

# Install PostGIS
bigsql/pgc list --extensions pg11
bigsql/pgc install postgis25-pg11

# Initialize PostgreSQL
bigsql/pg11/bin/initdb -D PGDATA -E UTF8 -U postgres

# Start PostgreSQL
bigsql/pg11/bin/pg_ctl -D PGDATA -l logfile start

# Configure test account
bigsql/pg11/bin/psql -U postgres -c "CREATE ROLE npgsql_tests SUPERUSER LOGIN PASSWORD 'npgsql_tests'";
