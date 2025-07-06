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
;; Based on Apple's Network/quic_options.h
(library
  (Network quic_options)
  (export
    nw_quic_stream_type_t
    nw_quic_stream_type_unknown
    nw_quic_stream_type_bidirectional
    nw_quic_stream_type_unidirectional
    nw_protocol_copy_quic_definition
    nw_quic_create_options
    nw_protocol_options_is_quic
    nw_quic_add_tls_application_protocol
    nw_quic_copy_sec_protocol_options
    nw_quic_get_stream_is_unidirectional
    nw_quic_set_stream_is_unidirectional
    nw_quic_get_stream_is_datagram
    nw_quic_set_stream_is_datagram
    nw_quic_get_initial_max_data
    nw_quic_set_initial_max_data
    nw_quic_get_max_udp_payload_size
    nw_quic_set_max_udp_payload_size
    nw_quic_get_idle_timeout
    nw_quic_set_idle_timeout
    nw_quic_get_initial_max_streams_bidirectional
    nw_quic_set_initial_max_streams_bidirectional
    nw_quic_get_initial_max_streams_unidirectional
    nw_quic_set_initial_max_streams_unidirectional
    nw_quic_get_initial_max_stream_data_bidirectional_local
    nw_quic_set_initial_max_stream_data_bidirectional_local
    nw_quic_get_initial_max_stream_data_bidirectional_remote
    nw_quic_set_initial_max_stream_data_bidirectional_remote
    nw_quic_get_initial_max_stream_data_unidirectional
    nw_quic_set_initial_max_stream_data_unidirectional
    nw_quic_get_max_datagram_frame_size
    nw_quic_set_max_datagram_frame_size
    nw_protocol_metadata_is_quic
    nw_quic_copy_sec_protocol_metadata
    nw_quic_get_stream_id
    nw_quic_get_stream_type
    nw_quic_get_stream_application_error
    nw_quic_set_stream_application_error
    nw_quic_get_local_max_streams_bidirectional
    nw_quic_set_local_max_streams_bidirectional
    nw_quic_get_local_max_streams_unidirectional
    nw_quic_set_local_max_streams_unidirectional
    nw_quic_get_remote_max_streams_bidirectional
    nw_quic_get_remote_max_streams_unidirectional
    nw_quic_get_stream_usable_datagram_frame_size
    nw_quic_get_application_error
    nw_quic_get_application_error_reason
    nw_quic_set_application_error
    nw_quic_get_keepalive_interval
    nw_quic_set_keepalive_interval
    nw_quic_get_remote_idle_timeout)
  (import
    (chezscheme)
    (Network protocol_options)
    (Security))

  ;;-----------------;;
  ;; nw_quic_options ;;
  ;;=================;;

  (define init
    (load-shared-object "Network.framework/Network"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [nw_quic_stream_type_t int])

  ;;
  ;; Constants
  ;;

  (define nw_quic_stream_type_unknown        0)
  (define nw_quic_stream_type_bidirectional  1)
  (define nw_quic_stream_type_unidirectional 2)

  ;;
  ;; Functions
  ;;

  (define nw_protocol_copy_quic_definition
    (foreign-procedure "nw_protocol_copy_quic_definition"
		       () nw_protocol_definition_t))
  (define nw_quic_create_options
    (foreign-procedure "nw_quic_create_options"
		       () nw_protocol_options_t))
  (define nw_protocol_options_is_quic
    (foreign-procedure "nw_protocol_options_is_quic"
		       (nw_protocol_options_t) boolean))
  (define nw_quic_add_tls_application_protocol
    (foreign-procedure "nw_quic_add_tls_application_protocol"
		       (nw_protocol_options_t string) void))
  (define nw_quic_copy_sec_protocol_options
    (foreign-procedure "nw_quic_copy_sec_protocol_options"
		       (nw_protocol_options_t) sec_protocol_options_t))
  (define nw_quic_get_stream_is_unidirectional
    (foreign-procedure "nw_quic_get_stream_is_unidirectional"
		       (nw_protocol_options_t) boolean))
  (define nw_quic_set_stream_is_unidirectional
    (foreign-procedure "nw_quic_set_stream_is_unidirectional"
		       (nw_protocol_options_t boolean) void))
  (define nw_quic_get_stream_is_datagram
    (foreign-procedure "nw_quic_get_stream_is_datagram"
		       (nw_protocol_options_t) boolean))
  (define nw_quic_set_stream_is_datagram
    (foreign-procedure "nw_quic_set_stream_is_datagram"
		       (nw_protocol_options_t boolean) void))
  (define nw_quic_get_initial_max_data
    (foreign-procedure "nw_quic_get_initial_max_data"
		       (nw_protocol_options_t) unsigned-64))
  (define nw_quic_set_initial_max_data
    (foreign-procedure "nw_quic_set_initial_max_data"
		       (nw_protocol_options_t unsigned-64) void))
  (define nw_quic_get_max_udp_payload_size
    (foreign-procedure "nw_quic_get_max_udp_payload_size"
		       (nw_protocol_options_t) unsigned-16))
  (define nw_quic_set_max_udp_payload_size
    (foreign-procedure "nw_quic_set_max_udp_payload_size"
		       (nw_protocol_options_t unsigned-16) void))
  (define nw_quic_get_idle_timeout
    (foreign-procedure "nw_quic_get_idle_timeout"
		       (nw_protocol_options_t) unsigned-32))
  (define nw_quic_set_idle_timeout
    (foreign-procedure "nw_quic_set_idle_timeout"
		       (nw_protocol_options_t unsigned-32) void))
  (define nw_quic_get_initial_max_streams_bidirectional
    (foreign-procedure "nw_quic_get_initial_max_streams_bidirectional"
		       (nw_protocol_options_t) unsigned-64))
  (define nw_quic_set_initial_max_streams_bidirectional
    (foreign-procedure "nw_quic_set_initial_max_streams_bidirectional"
		       (nw_protocol_options_t unsigned-64) void))
  (define nw_quic_get_initial_max_streams_unidirectional
    (foreign-procedure "nw_quic_get_initial_max_streams_unidirectional"
		       (nw_protocol_options_t) unsigned-64))
  (define nw_quic_set_initial_max_streams_unidirectional
    (foreign-procedure "nw_quic_set_initial_max_streams_unidirectional"
		       (nw_protocol_options_t unsigned-64) void))
  (define nw_quic_get_initial_max_stream_data_bidirectional_local
    (foreign-procedure "nw_quic_get_initial_max_stream_data_bidirectional_local"
		       (nw_protocol_options_t) unsigned-64))
  (define nw_quic_set_initial_max_stream_data_bidirectional_local
    (foreign-procedure "nw_quic_set_initial_max_stream_data_bidirectional_local"
		       (nw_protocol_options_t unsigned-64) void))
  (define nw_quic_get_initial_max_stream_data_bidirectional_remote
    (foreign-procedure "nw_quic_get_initial_max_stream_data_bidirectional_remote"
		       (nw_protocol_options_t) unsigned-64))
  (define nw_quic_set_initial_max_stream_data_bidirectional_remote
    (foreign-procedure "nw_quic_set_initial_max_stream_data_bidirectional_remote"
		       (nw_protocol_options_t unsigned-64) void))
  (define nw_quic_get_initial_max_stream_data_unidirectional
    (foreign-procedure "nw_quic_get_initial_max_stream_data_unidirectional"
		       (nw_protocol_options_t) unsigned-64))
  (define nw_quic_set_initial_max_stream_data_unidirectional
    (foreign-procedure "nw_quic_set_initial_max_stream_data_unidirectional"
		       (nw_protocol_options_t unsigned-64) void))
  (define nw_quic_get_max_datagram_frame_size
    (foreign-procedure "nw_quic_get_max_datagram_frame_size"
		       (nw_protocol_options_t) unsigned-16))
  (define nw_quic_set_max_datagram_frame_size
    (foreign-procedure "nw_quic_set_max_datagram_frame_size"
		       (nw_protocol_options_t unsigned-16) void))
  (define nw_protocol_metadata_is_quic
    (foreign-procedure "nw_protocol_metadata_is_quic"
		       (nw_protocol_metadata_t) boolean))
  (define nw_quic_copy_sec_protocol_metadata
    (foreign-procedure "nw_quic_copy_sec_protocol_metadata"
		       (nw_protocol_metadata_t) sec_protocol_metadata_t))
  (define nw_quic_get_stream_id
    (foreign-procedure "nw_quic_get_stream_id"
		       (nw_protocol_metadata_t) unsigned-64))
  ;; XXX: Returns nw_quic_stream_type_t in 8 bits.
  (define nw_quic_get_stream_type
    (foreign-procedure "nw_quic_get_stream_type"
		       (nw_protocol_metadata_t) unsigned-8))
  (define nw_quic_get_stream_application_error
    (foreign-procedure "nw_quic_get_stream_application_error"
		       (nw_protocol_metadata_t) unsigned-64))
  (define nw_quic_set_stream_application_error
    (foreign-procedure "nw_quic_set_stream_application_error"
		       (nw_protocol_metadata_t unsigned-64) void))
  (define nw_quic_get_local_max_streams_bidirectional
    (foreign-procedure "nw_quic_get_local_max_streams_bidirectional"
		       (nw_protocol_metadata_t) unsigned-64))
  (define nw_quic_set_local_max_streams_bidirectional
    (foreign-procedure "nw_quic_set_local_max_streams_bidirectional"
		       (nw_protocol_metadata_t unsigned-64) void))
  (define nw_quic_get_local_max_streams_unidirectional
    (foreign-procedure "nw_quic_get_local_max_streams_unidirectional"
		       (nw_protocol_metadata_t) unsigned-64))
  (define nw_quic_set_local_max_streams_unidirectional
    (foreign-procedure "nw_quic_set_local_max_streams_unidirectional"
		       (nw_protocol_metadata_t unsigned-64) void))
  (define nw_quic_get_remote_max_streams_bidirectional
    (foreign-procedure "nw_quic_get_remote_max_streams_bidirectional"
		       (nw_protocol_metadata_t) unsigned-64))
  (define nw_quic_get_remote_max_streams_unidirectional
    (foreign-procedure "nw_quic_get_remote_max_streams_unidirectional"
		       (nw_protocol_metadata_t) unsigned-64))
  (define nw_quic_get_stream_usable_datagram_frame_size
    (foreign-procedure "nw_quic_get_stream_usable_datagram_frame_size"
		       (nw_protocol_metadata_t) unsigned-16))
  (define nw_quic_get_application_error
    (foreign-procedure "nw_quic_get_application_error"
		       (nw_protocol_metadata_t) unsigned-64))
  (define nw_quic_get_application_error_reason
    (foreign-procedure "nw_quic_get_application_error_reason"
		       (nw_protocol_metadata_t) string))
  (define nw_quic_set_application_error
    (foreign-procedure "nw_quic_set_application_error"
		       (nw_protocol_metadata_t unsigned-64 string) void))
  (define nw_quic_get_keepalive_interval
    (foreign-procedure "nw_quic_get_keepalive_interval"
		       (nw_protocol_metadata_t) unsigned-16))
  (define nw_quic_set_keepalive_interval
    (foreign-procedure "nw_quic_set_keepalive_interval"
		       (nw_protocol_metadata_t unsigned-16) void))
  (define nw_quic_get_remote_idle_timeout
    (foreign-procedure "nw_quic_get_remote_idle_timeout"
		       (nw_protocol_metadata_t) unsigned-64))
  )
