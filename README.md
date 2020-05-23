# Postgres Extended

This repo is meant to provide the recipe for building an image with
[MADlib](https://madlib.apache.org) and [PostGIS](https://postgis.net/).

These extensions require certain steps to happen post database initialization.
It is simpler to prepare an image with all the requirements and execute the
steps in the container. 

## Image

The Dockerfile uses the 'official' Postgres image.

The image created has MADlib and PostGIS installed.
The extensions need to be created within the container.

For example:

```sql
CREATE EXTENSION plpythonu;
CREATE EXTENSION plpython3u;
CREATE EXTENSION postgis;
                                
CREATE EXTENSION postgis_topology;
CREATE EXTENSION postgis_sfcgal;
```

```bash
/usr/local/madlib/bin/madpack -s madlib -p postgres -c [user[/password]@][host][:port][/database] install
```
