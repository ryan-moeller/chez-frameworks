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
;; Based on Apple's Network/tcp_options.h
(library
  (Network tcp_options)
  (export
    nw_multipath_version_t
    nw_multipath_version_unspecified
    nw_multipath_version_0
    nw_multipath_version_1
    nw_protocol_copy_tcp_definition
    nw_tcp_create_options
    nw_tcp_options_set_no_delay
    nw_tcp_options_set_no_push
    nw_tcp_options_set_no_options
    nw_tcp_options_set_enable_keepalive
    nw_tcp_options_set_keepalive_count
    nw_tcp_options_set_keepalive_idle_time
    nw_tcp_options_set_keepalive_interval
    nw_tcp_options_set_maximum_segment_size
    nw_tcp_options_set_connection_timeout
    nw_tcp_options_set_persist_timeout
    nw_tcp_options_set_retransmit_connection_drop_time
    nw_tcp_options_set_retransmit_fin_drop
    nw_tcp_options_set_disable_ack_stretching
    nw_tcp_options_set_enable_fast_open
    nw_tcp_options_set_disable_ecn
    nw_tcp_options_set_multipath_force_version
    nw_protocol_metadata_is_tcp
    nw_tcp_get_available_receive_buffer
    nw_tcp_get_available_send_buffer)
  (import
    (chezscheme)
    (Network protocol_options))

  ;;----------------;;
  ;; nw_tcp_options ;;
  ;;================;;

  (define init
    (load-shared-object "Network.framework/Network"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [nw_multipath_version_t int])

  ;;
  ;; Constants
  ;;

  (define nw_multipath_version_unspecified -1)
  (define nw_multipath_version_0            0)
  (define nw_multipath_version_1            1)


  ;; Functions
  ;;

  (define nw_protocol_copy_tcp_definition
    (foreign-procedure "nw_protocol_copy_tcp_definition"
		       () nw_protocol_definition_t))
  (define nw_tcp_create_options
    (foreign-procedure "nw_tcp_create_options"
		       () nw_protocol_options_t))
  (define nw_tcp_options_set_no_delay
    (foreign-procedure "nw_tcp_options_set_no_delay"
		       (nw_protocol_options_t boolean) void))
  (define nw_tcp_options_set_no_push
    (foreign-procedure "nw_tcp_options_set_no_push"
		       (nw_protocol_options_t boolean) void))
  (define nw_tcp_options_set_no_options
    (foreign-procedure "nw_tcp_options_set_no_options"
		       (nw_protocol_options_t boolean) void))
  (define nw_tcp_options_set_enable_keepalive
    (foreign-procedure "nw_tcp_options_set_enable_keepalive"
		       (nw_protocol_options_t boolean) void))
  (define nw_tcp_options_set_keepalive_count
    (foreign-procedure "nw_tcp_options_set_keepalive_count"
		       (nw_protocol_options_t unsigned-32) void))
  (define nw_tcp_options_set_keepalive_idle_time
    (foreign-procedure "nw_tcp_options_set_keepalive_idle_time"
		       (nw_protocol_options_t unsigned-32) void))
  (define nw_tcp_options_set_keepalive_interval
    (foreign-procedure "nw_tcp_options_set_keepalive_interval"
		       (nw_protocol_options_t unsigned-32) void))
  (define nw_tcp_options_set_maximum_segment_size
    (foreign-procedure "nw_tcp_options_set_maximum_segment_size"
		       (nw_protocol_options_t unsigned-32) void))
  (define nw_tcp_options_set_connection_timeout
    (foreign-procedure "nw_tcp_options_set_connection_timeout"
		       (nw_protocol_options_t unsigned-32) void))
  (define nw_tcp_options_set_persist_timeout
    (foreign-procedure "nw_tcp_options_set_persist_timeout"
		       (nw_protocol_options_t unsigned-32) void))
  (define nw_tcp_options_set_retransmit_connection_drop_time
    (foreign-procedure "nw_tcp_options_set_retransmit_connection_drop_time"
		       (nw_protocol_options_t unsigned-32) void))
  (define nw_tcp_options_set_retransmit_fin_drop
    (foreign-procedure "nw_tcp_options_set_retransmit_fin_drop"
		       (nw_protocol_options_t boolean) void))
  (define nw_tcp_options_set_disable_ack_stretching
    (foreign-procedure "nw_tcp_options_set_disable_ack_stretching"
		       (nw_protocol_options_t boolean) void))
  (define nw_tcp_options_set_enable_fast_open
    (foreign-procedure "nw_tcp_options_set_enable_fast_open"
		       (nw_protocol_options_t boolean) void))
  (define nw_tcp_options_set_disable_ecn
    (foreign-procedure "nw_tcp_options_set_disable_ecn"
		       (nw_protocol_options_t boolean) void))
  (define nw_tcp_options_set_multipath_force_version
    (foreign-procedure "nw_tcp_options_set_multipath_force_version"
		       (nw_protocol_options_t nw_multipath_version_t) void))
  (define nw_protocol_metadata_is_tcp
    (foreign-procedure "nw_protocol_metadata_is_tcp"
		       (nw_protocol_metadata_t) boolean))
  (define nw_tcp_get_available_receive_buffer
    (foreign-procedure "nw_tcp_get_available_receive_buffer"
		       (nw_protocol_metadata_t) unsigned-32))
  (define nw_tcp_get_available_send_buffer
    (foreign-procedure "nw_tcp_get_available_send_buffer"
		       (nw_protocol_metadata_t) unsigned-32))
  )
