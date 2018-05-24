1. Build the Tutorial VM from the ONOS repository:
https://github.com/opennetworkinglab/onos/tree/master/tools/dev/p4vm

$ P4_VM_TYPE=tutorial vagrant up


2. Run the Prometheus: 

$ sudo docker run -p 9090:9090 -v ~/prometheus_int_exporter/src/test/resources/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus

You should be able to see the Prometheus in a web browser: 
http://localhost:9090/metrics


3. Run the Gatepushway in a different terminal:

$ sudo docker run -d -p 9091:9091 prom/pushgateway

You should be able to see the Gatepushway in a web browser: 
http://localhost:9091/metrics

Check here for more detailed information about the Prometheus and Pushgateway: 
https://github.com/serkantul/prometheus_int_exporter


4. Start the Prometheus Exporter in a different terminal:

$ java -jar ~/prometheus_int_exporter/target/int_collector-1.0-SNAPSHOT.jar


5. Run the Mininet topology in a different terminal:

$ cd ~/p4tools/tutorials/P4D2_2017_Fall/exercises/INT
$ make run

Start the terminals of Host1, Host3 and Host4
mininet> xterm h1, h3, h4

The Host4 is running on local of the VM

From the terminal of Host4 start the Wireshark with the P4_INT Dissector
# su sdn
$ wireshark -X lua_script:int_telemetry-report.lua

If any permission issues are faced use:
$ sudo chmod 755 /usr/bin/dumpcap

And restart the wireshark:
$ wireshark -X lua_script:int_telemetry-report.lua

Then sniff h4-eth0 port

From the terminal of Host3 start the Sniffing on h3-eth0 port:
# ./receive.py

From the terminal of Host1 send a packet to the Host3 (10.0.3.3)
# ./send.py 10.0.3.3 "Payload"

From the terminal of Host1 send many packets to the Host3 (10.0.3.3)
# python sendMany.py 10.0.3.3 "Payload"


Observe the packet information (Telemetry Report Header) in a wireshark and 
check the metrics from the web browser.





















