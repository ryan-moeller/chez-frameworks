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
;; Based on Apple's Network/resolver_config.h
(library
  (Network resolver_config)
  (export
    nw_resolver_config_t
    nw_resolver_config_create_https
    nw_resolver_config_create_tls
    nw_resolver_config_add_name_server)
  (import
    (chezscheme)
    (Network endpoint))

  ;;--------------------;;
  ;; nw_resolver_config ;;
  ;;====================;;

  (define init
    (load-shared-object "Network.framework/Network"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [nw_resolver_config_t void*])

  ;;
  ;; Constants
  ;;

  ;; (none defined)

  ;;
  ;; Functions
  ;;

  (define nw_resolver_config_create_https
    (foreign-procedure "nw_resolver_config_create_https"
		       (nw_endpoint_t) nw_resolver_config_t))
  (define nw_resolver_config_create_tls
    (foreign-procedure "nw_resolver_config_create_tls"
		       (nw_endpoint_t) nw_resolver_config_t))
  (define nw_resolver_config_add_name_server
    (foreign-procedure "nw_resolver_config_add_name_server"
		       (nw_resolver_config_t nw_endpoint_t) void))
  )
