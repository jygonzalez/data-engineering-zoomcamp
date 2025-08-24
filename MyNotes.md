When running the docker image for the data ingestion pipeline, we need to make it run in the same network of our postgres db container. If we run `docker network ls` we will enlist all networks used by docker, then there's one, in my case, called `2_docker_sql_default`. We need to feed that name to our `docker run command`. Note that when the db is in prod it will have a URL which you will need to use in `host`

So, the final command looks like so:
```
URL="https://github.com/DataTalksClub/nyc-tlc-data/releases/download/yellow/yellow_tripdata_2021-01.csv.gz"

docker run -it --network=2_docker_sql_default taxi_ingest:v001 \
    --user=root \
    --password=root \
    --host=pgdatabase \
    --port=5432 \
    --db=ny_taxi \
    --table_name=yellow_taxi_trips \
    --url=${URL}
```


Green Taxi:
```
URL="https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green/green_tripdata_2019-10.csv.gz"

docker run -it --network=2_docker_sql_default taxi_ingest:v001 \
    --user=root \
    --password=root \
    --host=pgdatabase \
    --port=5432 \
    --db=ny_taxi \
    --table_name=green_taxi_trips \
    --url=${URL}
```

python ingest_data.py \
    --user=root \
    --password=root \
    --host=localhost \
    --port=5432 \
    --db=ny_taxi \
    --table_name=green_taxi_trips \
    --url=${URL}