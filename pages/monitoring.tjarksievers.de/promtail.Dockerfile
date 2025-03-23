FROM grafana/promtail:latest

COPY promtail/promtail-config.yaml /etc/promtail/promtail-config.yaml
