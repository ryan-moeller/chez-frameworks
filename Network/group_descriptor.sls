#|
   Copyright 2025 Ryan Moeller

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
|#
;; Based on Apple's Network/group_descriptor.h
(library
  (Network group_descriptor)
  (export
    nw_group_descriptor_t
    nw_group_descriptor_create_multiplex
    nw_group_descriptor_create_multicast
    nw_group_descriptor_add_endpoint
    nw_multicast_group_descriptor_set_specific_source
    nw_multicast_group_descriptor_set_disable_unicast_traffic
    nw_multicast_group_descriptor_get_disable_unicast_traffic)
  (import
    (chezscheme)
    (Network endpoint))

  ;;---------------------;;
  ;; nw_group_descriptor ;;
  ;;=====================;;

  (define init
    (load-shared-object "Network.framework/Network"))

  ;; XXX: Blocks APIs not exposed.

  ;;
  ;; Types
  ;;

  (define-ftype
    [nw_group_descriptor_t void*])

  ;;
  ;; Constants
  ;;

  ;; (none defined)

  ;;
  ;; Functions
  ;;

  (define nw_group_descriptor_create_multiplex
    (foreign-procedure "nw_group_descriptor_create_multiplex"
		       (nw_endpoint_t) nw_group_descriptor_t))
  (define nw_group_descriptor_create_multicast
    (foreign-procedure "nw_group_descriptor_create_multicast"
		       (nw_endpoint_t) nw_group_descriptor_t))
  (define nw_group_descriptor_add_endpoint
    (foreign-procedure "nw_group_descriptor_add_endpoint"
		       (nw_group_descriptor_t nw_endpoint_t) boolean))
  (define nw_multicast_group_descriptor_set_specific_source
    (foreign-procedure "nw_multicast_group_descriptor_set_specific_source"
		       (nw_group_descriptor_t nw_endpoint_t) void))
  (define nw_multicast_group_descriptor_set_disable_unicast_traffic
    (foreign-procedure "nw_multicast_group_descriptor_set_disable_unicast_traffic"
		       (nw_group_descriptor_t boolean) void))
  (define nw_multicast_group_descriptor_get_disable_unicast_traffic
    (foreign-procedure "nw_multicast_group_descriptor_get_disable_unicast_traffic"
		       (nw_group_descriptor_t) boolean))
  )
