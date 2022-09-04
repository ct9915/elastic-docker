docker run \
  --volume="$(pwd)/metricbeat.docker.yml:/usr/share/metricbeat/metricbeat.yml:ro" \
  --volume="/var/run/docker.sock:/var/run/docker.sock:ro" \
  docker.elastic.co/beats/metricbeat:8.4.1 \
  setup -E setup.kibana.host=https://10.0.1.112:25601 \
   -E output.elasticsearch.hosts=["https://10.0.1.112:29200"]
