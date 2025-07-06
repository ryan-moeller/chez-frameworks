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
;; Based on Apple's Network/content_context.h
(library
  (Network content_context)
  (export
    nw_content_context_t
    nw_content_context_create
    nw_content_context_get_identifier
    nw_content_context_get_is_final
    nw_content_context_get_expiration_milliseconds
    nw_content_context_set_expiration_milliseconds
    nw_content_context_get_relative_priority
    nw_content_context_set_relative_priority
    nw_content_context_set_antecedent
    nw_content_context_copy_antecedent
    nw_content_context_set_metadata_for_protocol
    nw_content_context_copy_protocol_metadata)
  (import
    (chezscheme)
    (Network protocol_options))

  ;;--------------------;;
  ;; nw_content_context ;;
  ;;====================;;

  (define init
    (load-shared-object "Network.framework/Network"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [nw_content_context_t void*])

  ;;
  ;; Constants
  ;;

  ;; (none defined)

  ;;
  ;; Functions
  ;;

  (define nw_content_context_create
    (foreign-procedure "nw_content_context_create"
		       (string) nw_content_context_t))
  (define nw_content_context_get_identifier
    (foreign-procedure "nw_content_context_get_identifier"
		       (nw_content_context_t) string))
  (define nw_content_context_get_is_final
    (foreign-procedure "nw_content_context_get_is_final"
		       (nw_content_context_t) boolean))
  (define nw_content_context_set_is_final
    (foreign-procedure "nw_content_context_set_is_final"
		       (nw_content_context_t boolean) void))
  (define nw_content_context_get_expiration_milliseconds
    (foreign-procedure "nw_content_context_get_expiration_milliseconds"
		       (nw_content_context_t) unsigned-64))
  (define nw_content_context_set_expiration_milliseconds
    (foreign-procedure "nw_content_context_set_expiration_milliseconds"
		       (nw_content_context_t unsigned-64) void))
  (define nw_content_context_get_relative_priority
    (foreign-procedure "nw_content_context_get_relative_priority"
		       (nw_content_context_t) double))
  (define nw_content_context_set_relative_priority
    (foreign-procedure "nw_content_context_set_relative_priority"
		       (nw_content_context_t double) void))
  (define nw_content_context_set_antecedent
    (foreign-procedure "nw_content_context_set_antecedent"
		       (nw_content_context_t nw_content_context_t) void))
  (define nw_content_context_copy_antecedent
    (foreign-procedure "nw_content_context_copy_antecedent"
		       (nw_content_context_t) nw_content_context_t))
  (define nw_content_context_set_metadata_for_protocol
    (foreign-procedure "nw_content_context_set_metadata_for_protocol"
		       (nw_content_context_t nw_protocol_metadata_t) void))
  (define nw_content_context_copy_protocol_metadata
    (foreign-procedure "nw_content_context_copy_protocol_metadata"
		       (nw_content_context_t nw_protocol_definition_t) nw_protocol_metadata_t))
  ;; XXX: Blocks APIs not exposed.
  )
