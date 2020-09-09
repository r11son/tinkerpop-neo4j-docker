# Build:
# 	docker build --build-arg TP_VER=3.x.y -t tp:TP_VER+suffix .	
# Run:
#	docker run -d --user $UID:$UID --name tinkerpop -p 8182:8182 --mount source=tinkerpop,target=/data tp:TP_VER+suffix
ARG TP_VER
FROM tinkerpop/gremlin-server:${TP_VER}

USER gremlin
WORKDIR /opt/gremlin-server

ARG TP_VER
RUN bin/gremlin-server.sh install org.apache.tinkerpop neo4j-gremlin ${TP_VER}
