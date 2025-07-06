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
;; Based on Apple's Network/connection.h
(library
  (Network connection)
  (export
    nw_connection_t
    nw_connection_state_t
    nw_connection_state_invalid
    nw_connection_state_waiting
    nw_connection_state_preparing
    nw_connection_state_ready
    nw_connection_state_failed
    nw_connection_state_cancelled
    nw_connection_create
    nw_connection_copy_endpoint
    nw_connection_copy_parameters
    nw_connection_set_queue
    nw_connection_start
    nw_connection_restart
    nw_connection_cancel
    nw_connection_force_cancel
    nw_connection_copy_description
    nw_connection_copy_current_path
    nw_connection_copy_protocol_metadata
    nw_connection_get_maximum_datagram_size)
  (import
    (chezscheme)
    (Network endpoint)
    (Network parameters)
    (Network path)
    (Network protocol_options)
    (Network content_context)
    (Network error))

  ;;---------------;;
  ;; nw_connection ;;
  ;;===============;;

  (define init
    (load-shared-object "Network.framework/Network"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [nw_connection_t void*]
    [nw_connection_state_t int])

  ;;
  ;; Constants
  ;;

  (define nw_connection_state_invalid   0)
  (define nw_connection_state_waiting   1)
  (define nw_connection_state_preparing 2)
  (define nw_connection_state_ready     3)
  (define nw_connection_state_failed    4)
  (define nw_connection_state_cancelled 5)

  ;;
  ;; Functions
  ;;

  (define nw_connection_create
    (foreign-procedure "nw_connection_create"
		       (nw_endpoint_t nw_parameters_t) nw_connection_t))
  (define nw_connection_copy_endpoint
    (foreign-procedure "nw_connection_copy_endpoint"
		       (nw_connection_t) nw_endpoint_t))
  (define nw_connection_copy_parameters
    (foreign-procedure "nw_connection_copy_parameters"
		       (nw_connection_t) nw_parameters_t))
  ;; XXX: Blocks APIs not exposed.
  ;; TODO: dispatch FFI bindings
  (define nw_connection_set_queue
    (foreign-procedure "nw_connection_set_queue"
		       (nw_connection_t void*) void))
  (define nw_connection_start
    (foreign-procedure "nw_connection_start"
		       (nw_connection_t) void))
  (define nw_connection_restart
    (foreign-procedure "nw_connection_restart"
		       (nw_connection_t) void))
  (define nw_connection_cancel
    (foreign-procedure "nw_connection_cancel"
		       (nw_connection_t) void))
  (define nw_connection_force_cancel
    (foreign-procedure "nw_connection_force_cancel"
		       (nw_connection_t) void))
  ;; XXX: Blocks APIs not exposed.
  (define nw_connection_copy_description
    (foreign-procedure "nw_connection_copy_description"
		       (nw_connection_t) string))
  (define nw_connection_copy_current_path
    (foreign-procedure "nw_connection_copy_current_path"
		       (nw_connection_t) nw_path_t))
  (define nw_connection_copy_protocol_metadata
    (foreign-procedure "nw_connection_copy_protocol_metadata"
		       (nw_connection_t nw_protocol_definition_t) nw_protocol_metadata_t))
  (define nw_connection_get_maximum_datagram_size
    (foreign-procedure "nw_connection_get_maximum_datagram_size"
		       (nw_connection_t) unsigned-32))
  )
