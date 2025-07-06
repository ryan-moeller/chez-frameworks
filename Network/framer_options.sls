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
;; Based on Apple's Network/framer_options.h
(library
  (Network framer_options)
  (export
    nw_framer_t
    nw_framer_message_t
    nw_framer_protocol_create_message
    nw_protocol_metadata_is_framer_message
    nw_framer_message_create
    nw_framer_copy_remote_endpoint
    nw_framer_copy_local_endpoint
    nw_framer_copy_parameters
    nw_framer_copy_options)
  (import
    (chezscheme)
    (Network protocol_options)
    (Network endpoint)
    (Network parameters))

  ;;-------------------;;
  ;; nw_framer_options ;;
  ;;===================;;

  (define init
    (load-shared-object "Network.framework/Network"))

  ;; XXX: Blocks APIs not exposed.
  ;; XXX: ObjC APIs not exposed.

  ;;
  ;; Types
  ;;

  (define-ftype
    [nw_framer_t void*]
    [nw_framer_message_t nw_protocol_metadata_t])

  ;;
  ;; Constants
  ;;

  ;; (none defined)

  ;;
  ;; Functions
  ;;

  (define nw_framer_protocol_create_message
    (foreign-procedure "nw_framer_protocol_create_message"
		       (nw_protocol_definition_t) nw_framer_message_t))
  (define nw_protocol_metadata_is_framer_message
    (foreign-procedure "nw_protocol_metadata_is_framer_message"
		       (nw_protocol_metadata_t) boolean))
  (define nw_framer_message_create
    (foreign-procedure "nw_framer_message_create"
		       (nw_framer_t) nw_framer_message_t))
  (define nw_framer_copy_remote_endpoint
    (foreign-procedure "nw_framer_copy_remote_endpoint"
		       (nw_framer_t) nw_endpoint_t))
  (define nw_framer_copy_local_endpoint
    (foreign-procedure "nw_framer_copy_local_endpoint"
		       (nw_framer_t) nw_endpoint_t))
  (define nw_framer_copy_parameters
    (foreign-procedure "nw_framer_copy_parameters"
		       (nw_framer_t) nw_parameters_t))
  (define nw_framer_copy_options
    (foreign-procedure "nw_framer_copy_options"
		       (nw_framer_t) nw_protocol_options_t))
  )
