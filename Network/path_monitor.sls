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
;; Based on Apple's Network/path_monitor.h
(library
  (Network path_monitor)
  (export
    nw_path_monitor_t
    nw_path_monitor_create
    nw_path_monitor_create_with_type
    nw_path_monitor_create_for_ethernet_channel
    nw_path_monitor_prohibit_interface_type
    nw_path_monitor_set_queue
    nw_path_monitor_start
    nw_path_monitor_cancel)
  (import
    (chezscheme)
    (Network path)
    (Network interface))

  ;;-----------------;;
  ;; nw_path_monitor ;;
  ;;=================;;

  (define init
    (load-shared-object "Network.framework/Network"))

  ;; XXX: Blocks APIs not exposed.

  ;;
  ;; Types
  ;;

  (define-ftype
    [nw_path_monitor_t void*])

  ;;
  ;; Constants
  ;;

  ;; (none defined)

  ;;
  ;; Functions
  ;;

  (define nw_path_monitor_create
    (foreign-procedure "nw_path_monitor_create"
		       () nw_path_monitor_t))
  (define nw_path_monitor_create_with_type
    (foreign-procedure "nw_path_monitor_create_with_type"
		       (nw_interface_type_t) nw_path_monitor_t))
  (define nw_path_monitor_create_for_ethernet_channel
    (foreign-procedure "nw_path_monitor_create_for_ethernet_channel"
		       () nw_path_monitor_t))
  (define nw_path_monitor_prohibit_interface_type
    (foreign-procedure "nw_path_monitor_prohibit_interface_type"
		       (nw_path_monitor_t nw_interface_type_t) void))
  ;; TODO: dispatch FFI bindings
  (define nw_path_monitor_set_queue
    (foreign-procedure "nw_path_monitor_set_queue"
		       (nw_path_monitor_t void*) void))
  (define nw_path_monitor_start
    (foreign-procedure "nw_path_monitor_start"
		       (nw_path_monitor_t) void))
  (define nw_path_monitor_cancel
    (foreign-procedure "nw_path_monitor_cancel"
		       (nw_path_monitor_t) void))
  )
