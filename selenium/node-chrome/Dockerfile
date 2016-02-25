FROM selenium/node-chrome-debug:2.47.1

COPY entry_point_dnat.sh /opt/bin/entry_point_dnat.sh
RUN chmod +x /opt/bin/entry_point_dnat.sh

ENTRYPOINT /opt/bin/entry_point_dnat.sh
