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
;; Based on Apple's Network/listener.h
(library
  (Network listener)
  (export
    nw_listener_t
    nw_listener_state_t
    nw_listener_state_invalid
    nw_listener_state_waiting
    nw_listener_state_ready
    nw_listener_state_failed
    nw_listener_state_cancelled
    NW_LISTENER_INFINITE_CONNECTION_LIMIT
    nw_listener_create_with_port
    nw_listener_create
    nw_listener_create_with_connection
    nw_listener_set_queue
    nw_listener_get_new_connection_limit
    nw_listener_set_new_connection_limit
    nw_listener_set_advertise_descriptor
    nw_listener_get_port
    nw_listener_start
    nw_listener_cancel)
  (import
    (chezscheme)
    (Network connection)
    (Network connection_group)
    (Network advertise_descriptor)
    (Network parameters))

  ;;-------------;;
  ;; nw_listener ;;
  ;;=============;;

  (define init
    (load-shared-object "Network.framework/Network"))

  ;; XXX: Blocks APIs not exposed.

  ;;
  ;; Types
  ;;

  (define-ftype
    [nw_listener_t void*]
    [nw_listener_state_t int])

  ;;
  ;; Constants
  ;;

  (define nw_listener_state_invalid   0)
  (define nw_listener_state_waiting   1)
  (define nw_listener_state_ready     2)
  (define nw_listener_state_failed    3)
  (define nw_listener_state_cancelled 4)

  (define NW_LISTENER_INFINITE_CONNECTION_LIMIT #xffffffff)

  ;;
  ;; Functions
  ;;

  (define nw_listener_create_with_port
    (foreign-procedure "nw_listener_create_with_port"
		       (string nw_parameters_t) nw_listener_t))
  (define nw_listener_create
    (foreign-procedure "nw_listener_create"
		       (nw_parameters_t) nw_listener_t))
  (define nw_listener_create_with_connection
    (foreign-procedure "nw_listener_create_with_connection"
		       (nw_connection_t nw_parameters_t) nw_listener_t))
  ;; TODO: dispatch FFI bindings
  (define nw_listener_set_queue
    (foreign-procedure "nw_listener_set_queue"
		       (nw_listener_t void*) void))
  (define nw_listener_get_new_connection_limit
    (foreign-procedure "nw_listener_get_new_connection_limit"
		       (nw_listener_t) unsigned-32))
  (define nw_listener_set_new_connection_limit
    (foreign-procedure "nw_listener_set_new_connection_limit"
		       (nw_listener_t unsigned-32) void))
  (define nw_listener_set_advertise_descriptor
    (foreign-procedure "nw_listener_set_advertise_descriptor"
		       (nw_listener_t nw_advertise_descriptor_t) void))
  (define nw_listener_get_port
    (foreign-procedure "nw_listener_get_port"
		       (nw_listener_t) unsigned-16))
  (define nw_listener_start
    (foreign-procedure "nw_listener_start"
		       (nw_listener_t) void))
  (define nw_listener_cancel
    (foreign-procedure "nw_listener_cancel"
		       (nw_listener_t) void))
  )
