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
;; Based on Apple's Network/privacy_context.h
(library
  (Network privacy_context)
  (export
    nw_privacy_context_t
    NW_DEFAULT_PRIVACY_CONTEXT
    nw_privacy_context_create
    nw_privacy_context_flush_cache
    nw_privacy_context_disable_logging
    nw_privacy_context_require_encrypted_name_resolution)
  (import
    (chezscheme)
    (Network resolver_config))

  ;;--------------------;;
  ;; nw_privacy_context ;;
  ;;====================;;

  (define init
    (load-shared-object "Network.framework/Network"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [nw_privacy_context_t void*])

  ;;
  ;; Constants
  ;;

  (define NW_DEFAULT_PRIVACY_CONTEXT
    (make-ftype-pointer nw_privacy_context_t
			(foreign-entry "_nw_privacy_context_default_context")))

  ;;
  ;; Functions
  ;;

  (define nw_privacy_context_create
    (foreign-procedure "nw_privacy_context_create"
		       (string) nw_privacy_context_t))
  (define nw_privacy_context_flush_cache
    (foreign-procedure "nw_privacy_context_flush_cache"
		       (nw_privacy_context_t) void))
  (define nw_privacy_context_disable_logging
    (foreign-procedure "nw_privacy_context_disable_logging"
		       (nw_privacy_context_t) void))
  (define nw_privacy_context_require_encrypted_name_resolution
    (foreign-procedure "nw_privacy_context_require_encrypted_name_resolution"
		       (nw_privacy_context_t boolean nw_resolver_config_t) void))
  )
