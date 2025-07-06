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
;; Based on Apple's Network/udp_options.h
(library
  (Network udp_options)
  (export
    nw_protocol_copy_udp_definition
    nw_udp_create_options
    nw_udp_options_set_prefer_no_checksum
    nw_udp_create_metadata
    nw_protocol_metadata_is_udp)
  (import
    (chezscheme)
    (Network protocol_options))

  ;;----------------;;
  ;; nw_udp_options ;;
  ;;================;;

  (define init
    (load-shared-object "Network.framework/Network"))

  ;;
  ;; Types
  ;;

  ;; (none defined)

  ;;
  ;; Constants
  ;;

  ;; (none defined)

  ;;
  ;; Functions
  ;;

  (define nw_protocol_copy_udp_definition
    (foreign-procedure "nw_protocol_copy_udp_definition"
		       () nw_protocol_definition_t))
  (define nw_udp_create_options
    (foreign-procedure "nw_udp_create_options"
		       () nw_protocol_options_t))
  (define nw_udp_options_set_prefer_no_checksum
    (foreign-procedure "nw_udp_options_set_prefer_no_checksum"
		       (nw_protocol_options_t boolean) void))
  (define nw_udp_create_metadata
    (foreign-procedure "nw_udp_create_metadata"
		       () nw_protocol_metadata_t))
  (define nw_protocol_metadata_is_udp
    (foreign-procedure "nw_protocol_metadata_is_udp"
		       (nw_protocol_metadata_t) boolean))
  )
