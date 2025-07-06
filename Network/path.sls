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
;; Based on Apple's Network/path.h
(library
  (Network path)
  (export
    nw_path_t
    nw_path_status_t
    nw_path_unsatisfied_reason_t
    nw_path_status_invalid
    nw_path_status_satisfied
    nw_path_status_unsatisfied
    nw_path_status_satisfiable
    nw_path_unsatisfied_reason_not_available
    nw_path_unsatisfied_reason_cellular_denied
    nw_path_unsatisfied_reason_wifi_denied
    nw_path_unsatisfied_reason_local_network_denied
    nw_path_get_status
    nw_path_get_unsatisfied_reason
    nw_path_is_equal
    nw_path_is_expensive
    nw_path_is_constrained
    nw_path_has_ipv4
    nw_path_has_ipv6
    nw_path_has_dns
    nw_path_uses_interface_type
    nw_path_copy_effective_local_endpoint
    nw_path_copy_effective_remote_endpoint)
  (import
    (chezscheme)
    (Network endpoint)
    (Network interface))

  ;;---------;;
  ;; nw_path ;;
  ;;=========;;

  (define init
    (load-shared-object "Network.framework/Network"))

  ;; XXX: Blocks APIs not exposed.

  ;;
  ;; Types
  ;;

  (define-ftype
    [nw_path_t void*]
    [nw_path_status_t int]
    [nw_path_unsatisfied_reason_t int])

  ;;
  ;; Constants
  ;;

  (define nw_path_status_invalid     0)
  (define nw_path_status_satisfied   1)
  (define nw_path_status_unsatisfied 2)
  (define nw_path_status_satisfiable 3)

  (define nw_path_unsatisfied_reason_not_available        0)
  (define nw_path_unsatisfied_reason_cellular_denied      1)
  (define nw_path_unsatisfied_reason_wifi_denied          2)
  (define nw_path_unsatisfied_reason_local_network_denied 3)

  ;;
  ;; Functions
  ;;

  (define nw_path_get_status
    (foreign-procedure "nw_path_get_status"
		       (nw_path_t) nw_path_status_t))
  (define nw_path_get_unsatisfied_reason
    (foreign-procedure "nw_path_get_unsatisfied_reason"
		       (nw_path_t) nw_path_unsatisfied_reason_t))
  (define nw_path_is_equal
    (foreign-procedure "nw_path_is_equal"
		       (nw_path_t nw_path_t) boolean))
  (define nw_path_is_expensive
    (foreign-procedure "nw_path_is_expensive"
		       (nw_path_t) boolean))
  (define nw_path_is_constrained
    (foreign-procedure "nw_path_is_constrained"
		       (nw_path_t) boolean))
  (define nw_path_has_ipv4
    (foreign-procedure "nw_path_has_ipv4"
		       (nw_path_t) boolean))
  (define nw_path_has_ipv6
    (foreign-procedure "nw_path_has_ipv6"
		       (nw_path_t) boolean))
  (define nw_path_has_dns
    (foreign-procedure "nw_path_has_dns"
		       (nw_path_t) boolean))
  (define nw_path_uses_interface_type
    (foreign-procedure "nw_path_uses_interface_type"
		       (nw_path_t nw_interface_type_t) boolean))
  (define nw_path_copy_effective_local_endpoint
    (foreign-procedure "nw_path_copy_effective_local_endpoint"
		       (nw_path_t) nw_endpoint_t))
  (define nw_path_copy_effective_remote_endpoint
    (foreign-procedure "nw_path_copy_effective_remote_endpoint"
		       (nw_path_t) nw_endpoint_t))
  )
