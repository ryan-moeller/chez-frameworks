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
;; Based on Apple's Network/protocol_options.h
(library
  (Network protocol_options)
  (export
    nw_protocol_definition_t
    nw_protocol_options_t
    nw_protocol_metadata_t
    nw_protocol_definition_is_equal
    nw_protocol_options_copy_definition
    nw_protocol_metadata_copy_definition)
  (import (chezscheme))

  ;;---------------------;;
  ;; nw_protocol_options ;;
  ;;=====================;;

  (define init
    (load-shared-object "Network.framework/Network"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [nw_protocol_definition_t void*]
    [nw_protocol_options_t void*]
    [nw_protocol_metadata_t void*])

  ;;
  ;; Constants
  ;;

  ;; (none defined)

  ;;
  ;; Functions
  ;;

  (define nw_protocol_definition_is_equal
    (foreign-procedure "nw_protocol_definition_is_equal"
		       (nw_protocol_definition_t nw_protocol_definition_t) boolean))
  (define nw_protocol_options_copy_definition
    (foreign-procedure "nw_protocol_options_copy_definition"
		       (nw_protocol_options_t) nw_protocol_definition_t))
  (define nw_protocol_metadata_copy_definition
    (foreign-procedure "nw_protocol_metadata_copy_definition"
		       (nw_protocol_metadata_t) nw_protocol_definition_t))
  )
