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
;; Based on Apple's Network/ws_options.h
(library
  (Network ws_options)
  (export
    nw_ws_opcode_t
    nw_ws_close_code_t
    nw_ws_version_t
    nw_ws_request_t
    nw_ws_response_t
    nw_ws_response_status_t
    nw_ws_opcode_invalid
    nw_ws_opcode_cont
    nw_ws_opcode_text
    nw_ws_opcode_binary
    nw_ws_opcode_close
    nw_ws_opcode_ping
    nw_ws_opcode_pong
    nw_ws_close_code_normal_closure
    nw_ws_close_code_going_away
    nw_ws_close_code_protocol_error
    nw_ws_close_code_unsupported_data
    nw_ws_close_code_no_status_received
    nw_ws_close_code_abnormal_closure
    nw_ws_close_code_invalid_frame_payload_data
    nw_ws_close_code_policy_violation
    nw_ws_close_code_message_too_big
    nw_ws_close_code_mandatory_extension
    nw_ws_close_code_internal_server_error
    nw_ws_close_code_tls_handshake
    nw_ws_version_invalid
    nw_ws_version_13
    nw_ws_response_status_invalid
    nw_ws_response_status_accept
    nw_ws_response_status_reject
    nw_protocol_copy_ws_definition
    nw_ws_create_options
    nw_ws_options_add_additional_header
    nw_ws_options_add_subprotocol
    nw_ws_options_set_auto_reply_ping
    nw_ws_options_set_skip_handshake
    nw_ws_options_set_maximum_message_size
    nw_protocol_metadata_is_ws
    nw_ws_create_metadata
    nw_ws_metadata_get_opcode
    nw_ws_metadata_set_close_code
    nw_ws_metadata_get_close_code
    nw_ws_response_create
    nw_ws_response_get_status
    nw_ws_response_get_selected_subprotocol
    nw_ws_response_add_additional_header
    nw_ws_metadata_copy_server_response)
  (import
    (chezscheme)
    (Network protocol_options))

  ;;---------------;;
  ;; nw_ws_options ;;
  ;;===============;;

  (define init
    (load-shared-object "Network.framework/Network"))

  ;; XXX: Blocks APIs not exposed.

  ;;
  ;; Types
  ;;

  (define-ftype
    [nw_ws_opcode_t int]
    [nw_ws_close_code_t int]
    [nw_ws_version_t int]
    [nw_ws_request_t void*]
    [nw_ws_response_t void*]
    [nw_ws_response_status_t int])

  ;;
  ;; Constants
  ;;

  (define nw_ws_opcode_invalid -1)
  (define nw_ws_opcode_cont   #x0)
  (define nw_ws_opcode_text   #x1)
  (define nw_ws_opcode_binary #x2)
  (define nw_ws_opcode_close  #x8)
  (define nw_ws_opcode_ping   #x9)
  (define nw_ws_opcode_pong   #xa)

  (define nw_ws_close_code_normal_closure             1000)
  (define nw_ws_close_code_going_away                 1001)
  (define nw_ws_close_code_protocol_error             1002)
  (define nw_ws_close_code_unsupported_data           1003)
  (define nw_ws_close_code_no_status_received         1005)
  (define nw_ws_close_code_abnormal_closure           1006)
  (define nw_ws_close_code_invalid_frame_payload_data 1007)
  (define nw_ws_close_code_policy_violation           1008)
  (define nw_ws_close_code_message_too_big            1009)
  (define nw_ws_close_code_mandatory_extension        1010)
  (define nw_ws_close_code_internal_server_error      1011)
  (define nw_ws_close_code_tls_handshake              1015)

  (define nw_ws_version_invalid 0)
  (define nw_ws_version_13      1)

  (define nw_ws_response_status_invalid 0)
  (define nw_ws_response_status_accept  1)
  (define nw_ws_response_status_reject  2)

  ;;
  ;; Functions
  ;;

  (define nw_protocol_copy_ws_definition
    (foreign-procedure "nw_protocol_copy_ws_definition"
		       () nw_protocol_definition_t))
  (define nw_ws_create_options
    (foreign-procedure "nw_ws_create_options"
		       (nw_ws_version_t) nw_protocol_options_t))
  (define nw_ws_options_add_additional_header
    (foreign-procedure "nw_ws_options_add_additional_header"
		       (nw_protocol_options_t string string) void))
  (define nw_ws_options_add_subprotocol
    (foreign-procedure "nw_ws_options_add_subprotocol"
		       (nw_protocol_options_t string) void))
  (define nw_ws_options_set_auto_reply_ping
    (foreign-procedure "nw_ws_options_set_auto_reply_ping"
		       (nw_protocol_options_t boolean) void))
  (define nw_ws_options_set_skip_handshake
    (foreign-procedure "nw_ws_options_set_skip_handshake"
		       (nw_protocol_options_t boolean) void))
  (define nw_ws_options_set_maximum_message_size
    (foreign-procedure "nw_ws_options_set_maximum_message_size"
		       (nw_protocol_options_t size_t) void))
  (define nw_protocol_metadata_is_ws
    (foreign-procedure "nw_protocol_metadata_is_ws"
		       (nw_protocol_metadata_t) boolean))
  (define nw_ws_create_metadata
    (foreign-procedure "nw_ws_create_metadata"
		       (nw_ws_opcode_t) nw_protocol_metadata_t))
  (define nw_ws_metadata_get_opcode
    (foreign-procedure "nw_ws_metadata_get_opcode"
		       (nw_protocol_metadata_t) nw_ws_opcode_t))
  (define nw_ws_metadata_set_close_code
    (foreign-procedure "nw_ws_metadata_set_close_code"
		       (nw_protocol_metadata_t nw_ws_close_code_t) void))
  (define nw_ws_metadata_get_close_code
    (foreign-procedure "nw_ws_metadata_get_close_code"
		       (nw_protocol_metadata_t) nw_ws_close_code_t))
  (define nw_ws_response_create
    (foreign-procedure "nw_ws_response_create"
		       (nw_ws_response_status_t string) nw_ws_response_t))
  (define nw_ws_response_get_status
    (foreign-procedure "nw_ws_response_get_status"
		       (nw_ws_response_t) nw_ws_response_status_t))
  (define nw_ws_response_get_selected_subprotocol
    (foreign-procedure "nw_ws_response_get_selected_subprotocol"
		       (nw_ws_response_t) string))
  (define nw_ws_response_add_additional_header
    (foreign-procedure "nw_ws_response_add_additional_header"
		       (nw_ws_response_t string string) void))
  (define nw_ws_metadata_copy_server_response
    (foreign-procedure "nw_ws_metadata_copy_server_response"
		       (nw_protocol_metadata_t) nw_ws_response_t))
  )
