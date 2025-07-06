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
;; Based on Apple's Network/connection_report.h
(library
  (Network connection_report)
  (export
    nw_establishment_report_t
    nw_resolution_report_t
    nw_report_resolution_source_t
    nw_report_resolution_protocol_t
    nw_data_transfer_report_t
    nw_data_transfer_report_state_t
    nw_report_resolution_source_query
    nw_report_resolution_source_cache
    nw_report_resolution_source_expired_cache
    nw_report_resolution_protocol_unknown
    nw_report_resolution_protocol_udp
    nw_report_resolution_protocol_tcp
    nw_report_resolution_protocol_tls
    nw_report_resolution_protocol_https
    nw_data_transfer_report_state_collecting
    nw_data_transfer_report_state_collected
    NW_ALL_PATHS
    nw_establishment_report_get_duration_milliseconds
    nw_establishment_report_get_attempt_started_after_milliseconds
    nw_establishment_report_get_previous_attempt_count
    nw_establishment_report_get_used_proxy
    nw_establishment_report_get_proxy_configured
    nw_establishment_report_copy_proxy_endpoint
    nw_resolution_report_get_source
    nw_resolution_report_get_milliseconds
    nw_resolution_report_get_endpoint_count
    nw_resolution_report_copy_successful_endpoint
    nw_resolution_report_copy_preferred_endpoint
    nw_resolution_report_get_protocol
    nw_connection_create_new_data_transfer_report
    nw_data_transfer_report_get_state
    nw_data_transfer_report_get_duration_milliseconds
    nw_data_transfer_report_get_path_count
    nw_data_transfer_report_get_received_ip_packet_count
    nw_data_transfer_report_get_sent_ip_packet_count
    nw_data_transfer_report_get_received_transport_byte_count
    nw_data_transfer_report_get_received_transport_duplicate_byte_count
    nw_data_transfer_report_get_received_transport_out_of_order_byte_count
    nw_data_transfer_report_get_sent_transport_byte_count
    nw_data_transfer_report_get_sent_transport_retransmitted_byte_count
    nw_data_transfer_report_get_transport_smoothed_rtt_milliseconds
    nw_data_transfer_report_get_transport_minimum_rtt_milliseconds
    nw_data_transfer_report_get_transport_rtt_variance
    nw_data_transfer_report_get_received_application_byte_count
    nw_data_transfer_report_get_sent_application_byte_count
    nw_data_transfer_report_copy_path_interface
    nw_data_transfer_report_get_path_radio_type)
  (import
    (chezscheme)
    (Network connection)
    (Network endpoint)
    (Network interface))

  ;;----------------------;;
  ;; nw_connection_report ;;
  ;;======================;;

  (define init
    (load-shared-object "Network.framework/Network"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [nw_establishment_report_t void*]
    [nw_resolution_report_t void*]
    [nw_report_resolution_source_t int]
    [nw_report_resolution_protocol_t int]
    [nw_data_transfer_report_t void*]
    [nw_data_transfer_report_state_t int])

  ;;
  ;; Constants
  ;;

  (define nw_report_resolution_source_query         1)
  (define nw_report_resolution_source_cache         2)
  (define nw_report_resolution_source_expired_cache 3)

  (define nw_report_resolution_protocol_unknown 0)
  (define nw_report_resolution_protocol_udp     1)
  (define nw_report_resolution_protocol_tcp     2)
  (define nw_report_resolution_protocol_tls     3)
  (define nw_report_resolution_protocol_https   4)

  (define nw_data_transfer_report_state_collecting 1)
  (define nw_data_transfer_report_state_collected  2)

  (define NW_ALL_PATHS
    (ftype-ref unsigned-32 () (foreign-entry "_nw_data_transfer_report_all_paths")))

  ;;
  ;; Functions
  ;;

  ;; XXX: Blocks APIs not exposed.
  (define nw_establishment_report_get_duration_milliseconds
    (foreign-procedure "nw_establishment_report_get_duration_milliseconds"
		       (nw_establishment_report_t) unsigned-64))
  (define nw_establishment_report_get_attempt_started_after_milliseconds
    (foreign-procedure "nw_establishment_report_get_attempt_started_after_milliseconds"
		       (nw_establishment_report_t) unsigned-64))
  (define nw_establishment_report_get_previous_attempt_count
    (foreign-procedure "nw_establishment_report_get_previous_attempt_count"
		       (nw_establishment_report_t) unsigned-32))
  (define nw_establishment_report_get_used_proxy
    (foreign-procedure "nw_establishment_report_get_used_proxy"
		       (nw_establishment_report_t) boolean))
  (define nw_establishment_report_get_proxy_configured
    (foreign-procedure "nw_establishment_report_get_proxy_configured"
		       (nw_establishment_report_t) boolean))
  (define nw_establishment_report_copy_proxy_endpoint
    (foreign-procedure "nw_establishment_report_copy_proxy_endpoint"
		       (nw_establishment_report_t) nw_endpoint_t))
  (define nw_resolution_report_get_source
    (foreign-procedure "nw_resolution_report_get_source"
		       (nw_resolution_report_t) nw_report_resolution_source_t))
  (define nw_resolution_report_get_milliseconds
    (foreign-procedure "nw_resolution_report_get_milliseconds"
		       (nw_resolution_report_t) unsigned-64))
  (define nw_resolution_report_get_endpoint_count
    (foreign-procedure "nw_resolution_report_get_endpoint_count"
		       (nw_resolution_report_t) unsigned-32))
  (define nw_resolution_report_copy_successful_endpoint
    (foreign-procedure "nw_resolution_report_copy_successful_endpoint"
		       (nw_resolution_report_t) nw_endpoint_t))
  (define nw_resolution_report_copy_preferred_endpoint
    (foreign-procedure "nw_resolution_report_copy_preferred_endpoint"
		       (nw_resolution_report_t) nw_endpoint_t))
  (define nw_resolution_report_get_protocol
    (foreign-procedure "nw_resolution_report_get_protocol"
		       (nw_resolution_report_t) nw_report_resolution_protocol_t))
  (define nw_connection_create_new_data_transfer_report
    (foreign-procedure "nw_connection_create_new_data_transfer_report"
		       (nw_connection_t) nw_data_transfer_report_t))
  (define nw_data_transfer_report_get_state
    (foreign-procedure "nw_data_transfer_report_get_state"
		       (nw_data_transfer_report_t) nw_data_transfer_report_state_t))
  (define nw_data_transfer_report_get_duration_milliseconds
    (foreign-procedure "nw_data_transfer_report_get_duration_milliseconds"
		       (nw_data_transfer_report_t) unsigned-64))
  (define nw_data_transfer_report_get_path_count
    (foreign-procedure "nw_data_transfer_report_get_path_count"
		       (nw_data_transfer_report_t) unsigned-32))
  (define nw_data_transfer_report_get_received_ip_packet_count
    (foreign-procedure "nw_data_transfer_report_get_received_ip_packet_count"
		       (nw_data_transfer_report_t unsigned-32) unsigned-64))
  (define nw_data_transfer_report_get_sent_ip_packet_count
    (foreign-procedure "nw_data_transfer_report_get_sent_ip_packet_count"
		       (nw_data_transfer_report_t unsigned-32) unsigned-64))
  (define nw_data_transfer_report_get_received_transport_byte_count
    (foreign-procedure "nw_data_transfer_report_get_received_transport_byte_count"
		       (nw_data_transfer_report_t unsigned-32) unsigned-64))
  (define nw_data_transfer_report_get_received_transport_duplicate_byte_count
    (foreign-procedure "nw_data_transfer_report_get_received_transport_duplicate_byte_count"
		       (nw_data_transfer_report_t unsigned-32) unsigned-64))
  (define nw_data_transfer_report_get_received_transport_out_of_order_byte_count
    (foreign-procedure "nw_data_transfer_report_get_received_transport_out_of_order_byte_count"
		       (nw_data_transfer_report_t unsigned-32) unsigned-64))
  (define nw_data_transfer_report_get_sent_transport_byte_count
    (foreign-procedure "nw_data_transfer_report_get_sent_transport_byte_count"
		       (nw_data_transfer_report_t unsigned-32) unsigned-64))
  (define nw_data_transfer_report_get_sent_transport_retransmitted_byte_count
    (foreign-procedure "nw_data_transfer_report_get_sent_transport_retransmitted_byte_count"
		       (nw_data_transfer_report_t unsigned-32) unsigned-64))
  (define nw_data_transfer_report_get_transport_smoothed_rtt_milliseconds
    (foreign-procedure "nw_data_transfer_report_get_transport_smoothed_rtt_milliseconds"
		       (nw_data_transfer_report_t unsigned-32) unsigned-64))
  (define nw_data_transfer_report_get_transport_minimum_rtt_milliseconds
    (foreign-procedure "nw_data_transfer_report_get_transport_minimum_rtt_milliseconds"
		       (nw_data_transfer_report_t unsigned-32) unsigned-64))
  (define nw_data_transfer_report_get_transport_rtt_variance
    (foreign-procedure "nw_data_transfer_report_get_transport_rtt_variance"
		       (nw_data_transfer_report_t unsigned-32) unsigned-64))
  (define nw_data_transfer_report_get_received_application_byte_count
    (foreign-procedure "nw_data_transfer_report_get_received_application_byte_count"
		       (nw_data_transfer_report_t unsigned-32) unsigned-64))
  (define nw_data_transfer_report_get_sent_application_byte_count
    (foreign-procedure "nw_data_transfer_report_get_sent_application_byte_count"
		       (nw_data_transfer_report_t unsigned-32) unsigned-64))
  (define nw_data_transfer_report_copy_path_interface
    (foreign-procedure "nw_data_transfer_report_copy_path_interface"
		       (nw_data_transfer_report_t unsigned-32) nw_interface_t))
  (define nw_data_transfer_report_get_path_radio_type
    (foreign-procedure "nw_data_transfer_report_get_path_radio_type"
		       (nw_data_transfer_report_t unsigned-32) nw_interface_radio_type_t))
  )
