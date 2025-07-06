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
;; Based on Apple's Network/connection_group.h
(library
  (Network connection_group)
  (export
    nw_connection_group_t
    nw_connection_group_state_t
    nw_connection_group_state_invalid
    nw_connection_group_state_waiting
    nw_connection_group_state_ready
    nw_connection_group_state_failed
    nw_connection_group_state_cancelled
    nw_connection_group_create
    nw_connection_group_copy_descriptor
    nw_connection_group_copy_parameters
    nw_connection_group_set_queue
    nw_connection_group_start
    nw_connection_group_cancel
    nw_connection_group_copy_remote_endpoint_for_message
    nw_connection_group_copy_local_endpoint_for_message
    nw_connection_group_copy_path_for_message
    nw_connection_group_copy_protocol_metadata_for_message
    nw_connection_group_extract_connection_for_message
    nw_connection_group_reply
    nw_connection_group_extract_connection
    nw_connection_group_reinsert_extracted_connection)
  (import
    (chezscheme)
    (Network content_context)
    (Network connection)
    (Network endpoint)
    (Network group_descriptor)
    (Network parameters)
    (Network path)
    (Network protocol_options))

  ;;---------------------;;
  ;; nw_connection_group ;;
  ;;=====================;;

  (define init
    (load-shared-object "Network.framework/Network"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [nw_connection_group_t void*]
    [nw_connection_group_state_t int])

  ;;
  ;; Constants
  ;;

  (define nw_connection_group_state_invalid   0)
  (define nw_connection_group_state_waiting   1)
  (define nw_connection_group_state_ready     2)
  (define nw_connection_group_state_failed    3)
  (define nw_connection_group_state_cancelled 4)

  ;;
  ;; Functions
  ;;

  (define nw_connection_group_create
    (foreign-procedure "nw_connection_group_create"
		       (nw_group_descriptor_t nw_parameters_t) nw_connection_group_t))
  (define nw_connection_group_copy_descriptor
    (foreign-procedure "nw_connection_group_copy_descriptor"
		       (nw_connection_group_t) nw_group_descriptor_t))
  (define nw_connection_group_copy_parameters
    (foreign-procedure "nw_connection_group_copy_parameters"
		       (nw_connection_group_t) nw_parameters_t))
  ;; TODO: dispatch FFI bindings
  (define nw_connection_group_set_queue
    (foreign-procedure "nw_connection_group_set_queue"
		       (nw_connection_group_t void*) void))
  ;; XXX: Blocks APIs not exposed.
  (define nw_connection_group_start
    (foreign-procedure "nw_connection_group_start"
		       (nw_connection_group_t) void))
  (define nw_connection_group_cancel
    (foreign-procedure "nw_connection_group_cancel"
		       (nw_connection_group_t) void))
  (define nw_connection_group_copy_remote_endpoint_for_message
    (foreign-procedure "nw_connection_group_copy_remote_endpoint_for_message"
		       (nw_connection_group_t nw_content_context_t) nw_endpoint_t))
  (define nw_connection_group_copy_local_endpoint_for_message
    (foreign-procedure "nw_connection_group_copy_local_endpoint_for_message"
		       (nw_connection_group_t nw_content_context_t) nw_endpoint_t))
  (define nw_connection_group_copy_path_for_message
    (foreign-procedure "nw_connection_group_copy_path_for_message"
		       (nw_connection_group_t nw_content_context_t) nw_path_t))
  (define nw_connection_group_copy_protocol_metadata_for_message
    (foreign-procedure "nw_connection_group_copy_protocol_metadata_for_message"
		       (nw_connection_group_t nw_content_context_t nw_protocol_definition_t) nw_protocol_metadata_t))
  (define nw_connection_group_extract_connection_for_message
    (foreign-procedure "nw_connection_group_extract_connection_for_message"
		       (nw_connection_group_t nw_content_context_t) nw_connection_t))
  ;; TODO: dispatch FFI bindings
  (define nw_connection_group_reply
    (foreign-procedure "nw_connection_group_reply"
		       (nw_connection_group_t nw_content_context_t nw_content_context_t
  void*) void))
  (define nw_connection_group_extract_connection
    (foreign-procedure "nw_connection_group_extract_connection"
		       (nw_connection_group_t nw_endpoint_t nw_protocol_options_t) nw_connection_t))
  (define nw_connection_group_reinsert_extracted_connection
    (foreign-procedure "nw_connection_group_reinsert_extracted_connection"
		       (nw_connection_group_t nw_connection_t) boolean))
  ;; XXX: Blocks APIs not exposed.
  )
