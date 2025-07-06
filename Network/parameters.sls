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
;; Based on Apple's Network/parameters.h
(library
  (Network parameters)
  (export
    nw_parameters_t
    nw_protocol_stack_t
    nw_parameters_attribution_t
    nw_service_class_t
    nw_multipath_service_t
    nw_parameters_expired_dns_behavior_t
    nw_parameters_attribution_developer
    nw_parameters_attribution_user
    nw_service_class_best_effort
    nw_service_class_background
    nw_service_class_interactive_video
    nw_service_class_interactive_voice
    nw_service_class_data
    nw_service_class_signaling
    nw_multipath_service_disabled
    nw_multipath_service_handover
    nw_multipath_service_interactive
    nw_multipath_service_aggregate
    nw_parameters_expired_dns_behavior_default
    nw_parameters_expired_dns_behavior_allow
    nw_parameters_expired_dns_behavior_prohibit
    ;nw_parameters_create_application_service
    nw_parameters_create
    nw_parameters_copy
    nw_parameters_set_privacy_context
    nw_parameters_set_attribution
    nw_parameters_get_attribution
    nw_parameters_require_interface
    nw_parameters_copy_required_interface
    nw_parameters_prohibit_interface
    nw_parameters_clear_prohibited_interfaces
    nw_parameters_set_required_interface_type
    nw_parameters_get_required_interface_type
    nw_parameters_prohibit_interface_type
    nw_parameters_clear_prohibited_interface_types
    nw_parameters_set_prohibit_expensive
    nw_parameters_get_prohibit_expensive
    nw_parameters_set_prohibit_constrained
    nw_parameters_get_prohibit_constrained
    nw_parameters_set_reuse_local_address
    nw_parameters_get_reuse_local_address
    nw_parameters_set_local_endpoint
    nw_parameters_copy_local_endpoint
    nw_parameters_set_include_peer_to_peer
    nw_parameters_get_include_peer_to_peer
    nw_parameters_set_fast_open_enabled
    nw_parameters_get_fast_open_enabled
    nw_parameters_set_service_class
    nw_parameters_get_service_class
    nw_parameters_set_multipath_service
    nw_parameters_get_multipath_service
    nw_parameters_copy_default_protocol_stack
    nw_protocol_stack_prepend_application_protocol
    nw_protocol_stack_clear_application_protocols
    nw_protocol_stack_copy_transport_protocol
    nw_protocol_stack_set_transport_protocol
    nw_protocol_stack_copy_internet_protocol
    nw_parameters_set_local_only
    nw_parameters_get_local_only
    nw_parameters_set_prefer_no_proxy
    nw_parameters_get_prefer_no_proxy
    nw_parameters_set_expired_dns_behavior
    nw_parameters_get_expired_dns_behavior
    ;nw_parameters_set_requires_dnssec_validation
    ;nw_parameters_requires_dnssec_validation
    )
  (import
    (chezscheme)
    (Network protocol_options)
    (Network interface)
    (Network endpoint)
    (Network privacy_context))

  ;;---------------;;
  ;; nw_parameters ;;
  ;;===============;;

  (define init
    (load-shared-object "Network.framework/Network"))

  ;; XXX: Blocks APIs not exposed.

  ;;
  ;; Types
  ;;

  (define-ftype
    [nw_parameters_t void*]
    [nw_protocol_stack_t void*]
    [nw_parameters_attribution_t unsigned-8]
    [nw_service_class_t int]
    [nw_multipath_service_t int]
    [nw_parameters_expired_dns_behavior_t int])

  ;;
  ;; Constants
  ;;

  (define nw_parameters_attribution_developer 1)
  (define nw_parameters_attribution_user      2)

  (define nw_service_class_best_effort       0)
  (define nw_service_class_background        1)
  (define nw_service_class_interactive_video 2)
  (define nw_service_class_interactive_voice 3)
  (define nw_service_class_data              4)
  (define nw_service_class_signaling         5)

  (define nw_multipath_service_disabled    0)
  (define nw_multipath_service_handover    1)
  (define nw_multipath_service_interactive 2)
  (define nw_multipath_service_aggregate   3)

  (define nw_parameters_expired_dns_behavior_default  0)
  (define nw_parameters_expired_dns_behavior_allow    1)
  (define nw_parameters_expired_dns_behavior_prohibit 2)

  ;;
  ;; Functions
  ;;

  #|
  (define nw_parameters_create_application_service
    (foreign-procedure "nw_parameters_create_application_service"
		       () nw_parameters_t))
  |#
  (define nw_parameters_create
    (foreign-procedure "nw_parameters_create"
		       () nw_parameters_t))
  (define nw_parameters_copy
    (foreign-procedure "nw_parameters_copy"
		       (nw_parameters_t) nw_parameters_t))
  (define nw_parameters_set_privacy_context
    (foreign-procedure "nw_parameters_set_privacy_context"
		       (nw_parameters_t nw_privacy_context_t) void))
  (define nw_parameters_set_attribution
    (foreign-procedure "nw_parameters_set_attribution"
		       (nw_parameters_t nw_parameters_attribution_t) void))
  (define nw_parameters_get_attribution
    (foreign-procedure "nw_parameters_get_attribution"
		       (nw_parameters_t) nw_parameters_attribution_t))
  (define nw_parameters_require_interface
    (foreign-procedure "nw_parameters_require_interface"
		       (nw_parameters_t nw_interface_t) void))
  (define nw_parameters_copy_required_interface
    (foreign-procedure "nw_parameters_copy_required_interface"
		       (nw_parameters_t) nw_interface_t))
  (define nw_parameters_prohibit_interface
    (foreign-procedure "nw_parameters_prohibit_interface"
		       (nw_parameters_t nw_interface_t) void))
  (define nw_parameters_clear_prohibited_interfaces
    (foreign-procedure "nw_parameters_clear_prohibited_interfaces"
		       (nw_parameters_t) void))
  (define nw_parameters_set_required_interface_type
    (foreign-procedure "nw_parameters_set_required_interface_type"
		       (nw_parameters_t nw_interface_type_t) void))
  (define nw_parameters_get_required_interface_type
    (foreign-procedure "nw_parameters_get_required_interface_type"
		       (nw_parameters_t) nw_interface_type_t))
  (define nw_parameters_prohibit_interface_type
    (foreign-procedure "nw_parameters_prohibit_interface_type"
		       (nw_parameters_t nw_interface_type_t) void))
  (define nw_parameters_clear_prohibited_interface_types
    (foreign-procedure "nw_parameters_clear_prohibited_interface_types"
		       (nw_parameters_t) void))
  (define nw_parameters_set_prohibit_expensive
    (foreign-procedure "nw_parameters_set_prohibit_expensive"
		       (nw_parameters_t boolean) void))
  (define nw_parameters_get_prohibit_expensive
    (foreign-procedure "nw_parameters_get_prohibit_expensive"
		       (nw_parameters_t) boolean))
  (define nw_parameters_set_prohibit_constrained
    (foreign-procedure "nw_parameters_set_prohibit_constrained"
		       (nw_parameters_t boolean) void))
  (define nw_parameters_get_prohibit_constrained
    (foreign-procedure "nw_parameters_get_prohibit_constrained"
		       (nw_parameters_t) boolean))
  (define nw_parameters_set_reuse_local_address
    (foreign-procedure "nw_parameters_set_reuse_local_address"
		       (nw_parameters_t boolean) void))
  (define nw_parameters_get_reuse_local_address
    (foreign-procedure "nw_parameters_get_reuse_local_address"
		       (nw_parameters_t) boolean))
  (define nw_parameters_set_local_endpoint
    (foreign-procedure "nw_parameters_set_local_endpoint"
		       (nw_parameters_t nw_endpoint_t) void))
  (define nw_parameters_copy_local_endpoint
    (foreign-procedure "nw_parameters_copy_local_endpoint"
		       (nw_parameters_t) nw_endpoint_t))
  (define nw_parameters_set_include_peer_to_peer
    (foreign-procedure "nw_parameters_set_include_peer_to_peer"
		       (nw_parameters_t boolean) void))
  (define nw_parameters_get_include_peer_to_peer
    (foreign-procedure "nw_parameters_get_include_peer_to_peer"
		       (nw_parameters_t) boolean))
  (define nw_parameters_set_fast_open_enabled
    (foreign-procedure "nw_parameters_set_fast_open_enabled"
		       (nw_parameters_t boolean) void))
  (define nw_parameters_get_fast_open_enabled
    (foreign-procedure "nw_parameters_get_fast_open_enabled"
		       (nw_parameters_t) boolean))
  (define nw_parameters_set_service_class
    (foreign-procedure "nw_parameters_set_service_class"
		       (nw_parameters_t nw_service_class_t) void))
  (define nw_parameters_get_service_class
    (foreign-procedure "nw_parameters_get_service_class"
		       (nw_parameters_t) nw_service_class_t))
  (define nw_parameters_set_multipath_service
    (foreign-procedure "nw_parameters_set_multipath_service"
		       (nw_parameters_t nw_multipath_service_t) void))
  (define nw_parameters_get_multipath_service
    (foreign-procedure "nw_parameters_get_multipath_service"
		       (nw_parameters_t) nw_multipath_service_t))
  (define nw_parameters_copy_default_protocol_stack
    (foreign-procedure "nw_parameters_copy_default_protocol_stack"
		       (nw_parameters_t) nw_protocol_stack_t))
  (define nw_protocol_stack_prepend_application_protocol
    (foreign-procedure "nw_protocol_stack_prepend_application_protocol"
		       (nw_protocol_stack_t nw_protocol_options_t) void))
  (define nw_protocol_stack_clear_application_protocols
    (foreign-procedure "nw_protocol_stack_clear_application_protocols"
		       (nw_protocol_stack_t) void))
  (define nw_protocol_stack_copy_transport_protocol
    (foreign-procedure "nw_protocol_stack_copy_transport_protocol"
		       (nw_protocol_stack_t) nw_protocol_options_t))
  (define nw_protocol_stack_set_transport_protocol
    (foreign-procedure "nw_protocol_stack_set_transport_protocol"
		       (nw_protocol_stack_t nw_protocol_options_t) void))
  (define nw_protocol_stack_copy_internet_protocol
    (foreign-procedure "nw_protocol_stack_copy_internet_protocol"
		       (nw_protocol_stack_t) nw_protocol_options_t))
  (define nw_parameters_set_local_only
    (foreign-procedure "nw_parameters_set_local_only"
		       (nw_parameters_t boolean) void))
  (define nw_parameters_get_local_only
    (foreign-procedure "nw_parameters_get_local_only"
		       (nw_parameters_t) boolean))
  (define nw_parameters_set_prefer_no_proxy
    (foreign-procedure "nw_parameters_set_prefer_no_proxy"
		       (nw_parameters_t boolean) void))
  (define nw_parameters_get_prefer_no_proxy
    (foreign-procedure "nw_parameters_get_prefer_no_proxy"
		       (nw_parameters_t) boolean))
  (define nw_parameters_set_expired_dns_behavior
    (foreign-procedure "nw_parameters_set_expired_dns_behavior"
		       (nw_parameters_t nw_parameters_expired_dns_behavior_t) void))
  (define nw_parameters_get_expired_dns_behavior
    (foreign-procedure "nw_parameters_get_expired_dns_behavior"
		       (nw_parameters_t) nw_parameters_expired_dns_behavior_t))
  #|
  (define nw_parameters_set_requires_dnssec_validation
    (foreign-procedure "nw_parameters_set_requires_dnssec_validation"
		       (nw_parameters_t boolean) void))
  (define nw_parameters_requires_dnssec_validation
    (foreign-procedure "nw_parameters_requires_dnssec_validation"
		       (nw_parameters_t) boolean))
  |#
  )
