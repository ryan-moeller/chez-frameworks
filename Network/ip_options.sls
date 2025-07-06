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
;; Based on Apple's Network/ip_options.h
(library
  (Network ip_options)
  (export
    nw_ip_version_t
    nw_ip_local_address_preference_t
    nw_ip_ecn_flag_t
    nw_ip_version_any
    nw_ip_version_4
    nw_ip_version_6
    nw_ip_local_address_preference_default
    nw_ip_local_address_preference_temporary
    nw_ip_local_address_preference_stable
    nw_ip_ecn_flag_non_ect
    nw_ip_ecn_flag_ect_0
    nw_ip_ecn_flag_ect_1
    nw_ip_ecn_flag_ce
    nw_protocol_copy_ip_definition
    nw_ip_options_set_version
    nw_ip_options_set_hop_limit
    nw_ip_options_set_use_minimum_mtu
    nw_ip_options_set_disable_fragmentation
    nw_ip_options_set_calculate_receive_time
    nw_ip_options_set_local_address_preference
    nw_ip_options_set_disable_multicast_loopback
    nw_ip_create_metadata
    nw_protocol_metadata_is_ip
    nw_ip_metadata_set_ecn_flag
    nw_ip_metadata_get_ecn_flag
    nw_ip_metadata_set_service_class
    nw_ip_metadata_get_service_class
    nw_ip_metadata_get_receive_time)
  (import
    (chezscheme)
    (Network protocol_options)
    (Network parameters))

  ;;---------------;;
  ;; nw_ip_options ;;
  ;;===============;;

  (define init
    (load-shared-object "Network.framework/Network"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [nw_ip_version_t int]
    [nw_ip_local_address_preference_t int]
    [nw_ip_ecn_flag_t int])

  ;;
  ;; Constants
  ;;

  (define nw_ip_version_any 0)
  (define nw_ip_version_4   4)
  (define nw_ip_version_6   6)

  (define nw_ip_local_address_preference_default   0)
  (define nw_ip_local_address_preference_temporary 1)
  (define nw_ip_local_address_preference_stable    2)

  (define nw_ip_ecn_flag_non_ect 0)
  (define nw_ip_ecn_flag_ect_0   1)
  (define nw_ip_ecn_flag_ect_1   2)
  (define nw_ip_ecn_flag_ce      3)

  ;;
  ;; Functions
  ;;

  (define nw_protocol_copy_ip_definition
    (foreign-procedure "nw_protocol_copy_ip_definition"
		       () nw_protocol_definition_t))
  (define nw_ip_options_set_version
    (foreign-procedure "nw_ip_options_set_version"
		       (nw_protocol_options_t nw_ip_version_t) void))
  (define nw_ip_options_set_hop_limit
    (foreign-procedure "nw_ip_options_set_hop_limit"
		       (nw_protocol_options_t unsigned-8) void))
  (define nw_ip_options_set_use_minimum_mtu
    (foreign-procedure "nw_ip_options_set_use_minimum_mtu"
		       (nw_protocol_options_t boolean) void))
  (define nw_ip_options_set_disable_fragmentation
    (foreign-procedure "nw_ip_options_set_disable_fragmentation"
		       (nw_protocol_options_t boolean) void))
  (define nw_ip_options_set_calculate_receive_time
    (foreign-procedure "nw_ip_options_set_calculate_receive_time"
		       (nw_protocol_options_t boolean) void))
  (define nw_ip_options_set_local_address_preference
    (foreign-procedure "nw_ip_options_set_local_address_preference"
		       (nw_protocol_options_t nw_ip_local_address_preference_t) void))
  (define nw_ip_options_set_disable_multicast_loopback
    (foreign-procedure "nw_ip_options_set_disable_multicast_loopback"
		       (nw_protocol_options_t boolean) void))
  (define nw_ip_create_metadata
    (foreign-procedure "nw_ip_create_metadata"
		       () nw_protocol_metadata_t))
  (define nw_protocol_metadata_is_ip
    (foreign-procedure "nw_protocol_metadata_is_ip"
		       (nw_protocol_metadata_t) boolean))
  (define nw_ip_metadata_set_ecn_flag
    (foreign-procedure "nw_ip_metadata_set_ecn_flag"
		       (nw_protocol_metadata_t nw_ip_ecn_flag_t) void))
  (define nw_ip_metadata_get_ecn_flag
    (foreign-procedure "nw_ip_metadata_get_ecn_flag"
		       (nw_protocol_metadata_t) nw_ip_ecn_flag_t))
  (define nw_ip_metadata_set_service_class
    (foreign-procedure "nw_ip_metadata_set_service_class"
		       (nw_protocol_metadata_t nw_service_class_t) void))
  (define nw_ip_metadata_get_service_class
    (foreign-procedure "nw_ip_metadata_get_service_class"
		       (nw_protocol_metadata_t) nw_service_class_t))
  (define nw_ip_metadata_get_receive_time
    (foreign-procedure "nw_ip_metadata_get_receive_time"
		       (nw_protocol_metadata_t) unsigned-64))
  )
