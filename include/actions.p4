/*
 * Copyright 2017-present Open Networking Foundation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef __ACTIONS__
#define __ACTIONS__

#include "headers.p4"
#include "defines.p4"

action send_to_cpu(inout standard_metadata_t standard_metadata) {
    standard_metadata.egress_spec = CPU_PORT;
}

action set_egress_port(inout standard_metadata_t standard_metadata, port_t port) {
    standard_metadata.egress_spec = port;
}

action _drop() {
    mark_to_drop();
}



#endif
