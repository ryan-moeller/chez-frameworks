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
;; Based on Apple's Network/browse_descriptor.h
(library
  (Network browse_descriptor)
  (export
    nw_browse_descriptor_t
    nw_browse_descriptor_create_bonjour_service
    nw_browse_descriptor_get_bonjour_service_type
    nw_browse_descriptor_get_bonjour_service_domain
    nw_browse_descriptor_set_include_txt_record
    nw_browse_descriptor_get_include_txt_record
    nw_browse_descriptor_create_application_service
    nw_browse_descriptor_get_application_service_name)
  (import (chezscheme))

  ;;----------------------;;
  ;; nw_browse_descriptor ;;
  ;;======================;;

  (define init
    (load-shared-object "Network.framework/Network"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [nw_browse_descriptor_t void*])

  ;;
  ;; Constants
  ;;

  ;; (none defined)

  ;;
  ;; Functions
  ;;

  (define nw_browse_descriptor_create_bonjour_service
    (foreign-procedure "nw_browse_descriptor_create_bonjour_service"
		       (string string) nw_browse_descriptor_t))
  (define nw_browse_descriptor_get_bonjour_service_type
    (foreign-procedure "nw_browse_descriptor_get_bonjour_service_type"
		       (nw_browse_descriptor_t) string))
  (define nw_browse_descriptor_get_bonjour_service_domain
    (foreign-procedure "nw_browse_descriptor_get_bonjour_service_domain"
		       (nw_browse_descriptor_t) string))
  (define nw_browse_descriptor_set_include_txt_record
    (foreign-procedure "nw_browse_descriptor_set_include_txt_record"
		       (nw_browse_descriptor_t boolean) void))
  (define nw_browse_descriptor_get_include_txt_record
    (foreign-procedure "nw_browse_descriptor_get_include_txt_record"
		       (nw_browse_descriptor_t) boolean))
  (define nw_browse_descriptor_create_application_service
    (foreign-procedure "nw_browse_descriptor_create_application_service"
		       (string) nw_browse_descriptor_t))
  (define nw_browse_descriptor_get_application_service_name
    (foreign-procedure "nw_browse_descriptor_get_application_service_name"
		       (nw_browse_descriptor_t) string))
  )
