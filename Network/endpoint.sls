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
;; Based on Apple's Network/endpoint.h
(library
  (Network endpoint)
  (export
    nw_endpoint_t
    nw_endpoint_type_t
    nw_endpoint_type_invalid
    nw_endpoint_type_address
    nw_endpoint_type_host
    nw_endpoint_type_bonjour_service
    nw_endpoint_type_url
    nw_endpoint_get_type
    nw_endpoint_create_host
    nw_endpoint_get_hostname
    nw_endpoint_copy_port_string
    nw_endpoint_get_port
    nw_endpoint_create_address
    nw_endpoint_copy_address_string
    nw_endpoint_get_address
    nw_endpoint_create_bonjour_service
    nw_endpoint_get_bonjour_service_name
    nw_endpoint_get_bonjour_service_type
    nw_endpoint_get_bonjour_service_domain
    nw_endpoint_create_url
    nw_endpoint_get_url
    ;nw_endpoint_copy_txt_record
    ;nw_endpoint_get_signature
    )
  (import
    (chezscheme)
    (Network interface)
    (Network txt_record))

  ;;-------------;;
  ;; nw_endpoint ;;
  ;;=============;;

  (define init
    (load-shared-object "Network.framework/Network"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [nw_endpoint_t void*]
    [nw_endpoint_type_t int])

  ;;
  ;; Constants
  ;;

  (define nw_endpoint_type_invalid         0)
  (define nw_endpoint_type_address         1)
  (define nw_endpoint_type_host            2)
  (define nw_endpoint_type_bonjour_service 3)
  (define nw_endpoint_type_url             4)

  ;;
  ;; Functions
  ;;

  (define nw_endpoint_get_type
    (foreign-procedure "nw_endpoint_get_type"
		       (nw_endpoint_t) nw_endpoint_type_t))
  (define nw_endpoint_create_host
    (foreign-procedure "nw_endpoint_create_host"
		       (string string) nw_endpoint_t))
  (define nw_endpoint_get_hostname
    (foreign-procedure "nw_endpoint_get_hostname"
		       (nw_endpoint_t) string))
  ;; TODO: free copy string
  (define nw_endpoint_copy_port_string
    (foreign-procedure "nw_endpoint_copy_port_string"
		       (nw_endpoint_t) string))
  (define nw_endpoint_get_port
    (foreign-procedure "nw_endpoint_get_port"
		       (nw_endpoint_t) unsigned-16))
  ;; TODO: sockaddr type
  (define nw_endpoint_create_address
    (foreign-procedure "nw_endpoint_create_address"
		       (void*) nw_endpoint_t))
  ;; TODO: free copy string
  (define nw_endpoint_copy_address_string
    (foreign-procedure "nw_endpoint_copy_address_string"
		       (nw_endpoint_t) string))
  ;; TODO: sockaddr type
  (define nw_endpoint_get_address
    (foreign-procedure "nw_endpoint_get_address"
		       (nw_endpoint_t) void*))
  (define nw_endpoint_create_bonjour_service
    (foreign-procedure "nw_endpoint_create_bonjour_service"
		       (string string string) nw_endpoint_t))
  (define nw_endpoint_get_bonjour_service_name
    (foreign-procedure "nw_endpoint_get_bonjour_service_name"
		       (nw_endpoint_t) string))
  (define nw_endpoint_get_bonjour_service_type
    (foreign-procedure "nw_endpoint_get_bonjour_service_type"
		       (nw_endpoint_t) string))
  (define nw_endpoint_get_bonjour_service_domain
    (foreign-procedure "nw_endpoint_get_bonjour_service_domain"
		       (nw_endpoint_t) string))
  (define nw_endpoint_create_url
    (foreign-procedure "nw_endpoint_create_url"
		       (string) nw_endpoint_t))
  (define nw_endpoint_get_url
    (foreign-procedure "nw_endpoint_get_url"
		       (nw_endpoint_t) string))
  #|
  (define nw_endpoint_copy_txt_record
    (foreign-procedure "nw_endpoint_copy_txt_record"
		       (nw_endpoint_t) nw_txt_record_t))
  (define nw_endpoint_get_signature
    (foreign-procedure "nw_endpoint_get_signature"
		       (nw_endpoint_t (* size_t)) (* unsigned-8)))
  |#
  )
