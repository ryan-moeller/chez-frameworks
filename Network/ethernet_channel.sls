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
;; Based on Apple's Network/ethernet_channel.h
(library
  (Network ethernet_channel)
  (export
    nw_ethernet_channel_t
    nw_ethernet_channel_state_t
    nw_ethernet_channel_state_invalid
    nw_ethernet_channel_state_waiting
    nw_ethernet_channel_state_preparing
    nw_ethernet_channel_state_ready
    nw_ethernet_channel_state_failed
    nw_ethernet_channel_state_cancelled
    nw_ethernet_channel_create
    nw_ethernet_channel_create_with_parameters
    nw_ethernet_channel_set_queue
    nw_ethernet_channel_get_maximum_payload_size
    nw_ethernet_channel_start
    nw_ethernet_channel_cancel)
  (import
    (chezscheme)
    (Network interface)
    (Network parameters))

  ;;---------------------;;
  ;; nw_ethernet_channel ;;
  ;;=====================;;

  (define init
    (load-shared-object "Network.framework/Network"))

  ;; XXX: Blocks APIs not exposed.

  ;;
  ;; Types
  ;;

  (define-ftype
    [nw_ethernet_channel_t void*]
    [nw_ethernet_channel_state_t int])

  ;;
  ;; Constants
  ;;

  (define nw_ethernet_channel_state_invalid   0)
  (define nw_ethernet_channel_state_waiting   1)
  (define nw_ethernet_channel_state_preparing 2)
  (define nw_ethernet_channel_state_ready     3)
  (define nw_ethernet_channel_state_failed    4)
  (define nw_ethernet_channel_state_cancelled 5)

  ;;
  ;; Functions
  ;;

  (define nw_ethernet_channel_create
    (foreign-procedure "nw_ethernet_channel_create"
		       (unsigned-16 nw_interface_t) nw_ethernet_channel_t))
  (define nw_ethernet_channel_create_with_parameters
    (foreign-procedure "nw_ethernet_channel_create_with_parameters"
		       (unsigned-16 nw_interface_t nw_parameters_t) nw_ethernet_channel_t))
  ;; TODO: dispatch FFI bindings
  (define nw_ethernet_channel_set_queue
    (foreign-procedure "nw_ethernet_channel_set_queue"
		       (nw_ethernet_channel_t void*) void))
  (define nw_ethernet_channel_get_maximum_payload_size
    (foreign-procedure "nw_ethernet_channel_get_maximum_payload_size"
		       (nw_ethernet_channel_t) unsigned-32))
  (define nw_ethernet_channel_start
    (foreign-procedure "nw_ethernet_channel_start"
		       (nw_ethernet_channel_t) void))
  (define nw_ethernet_channel_cancel
    (foreign-procedure "nw_ethernet_channel_cancel"
		       (nw_ethernet_channel_t) void))
  )
