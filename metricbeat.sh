#!/bin/bash
docker run -d \
  --name=metricbeat \
  --user=root \
  --restart=on-failure:3	 \
  --volume="$(pwd)/metricbeat.docker.yml:/usr/share/metricbeat/metricbeat.yml:ro" \
  --volume="/var/run/docker.sock:/var/run/docker.sock:ro" \
  --volume="/sys/fs/cgroup:/hostfs/sys/fs/cgroup:ro" \
  --volume="/proc:/hostfs/proc:ro" \
  --volume="/:/hostfs:ro" \
  docker.elastic.co/beats/metricbeat:8.4.1 metricbeat -e \
  -E output.elasticsearch.hosts=["https://10.0.1.112:29200"] 
