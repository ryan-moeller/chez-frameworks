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
;; Based on Apple's Network/advertise_descriptor.h
(library
  (Network advertise_descriptor)
  (export
    nw_advertise_descriptor_t
    nw_advertise_descriptor_create_bonjour_service
    nw_advertise_descriptor_set_txt_record
    nw_advertise_descriptor_set_no_auto_rename
    nw_advertise_descriptor_get_no_auto_rename
    nw_advertise_descriptor_set_txt_record_object
    nw_advertise_descriptor_copy_txt_record_object
    nw_advertise_descriptor_create_application_service
    nw_advertise_descriptor_get_application_service_name)
  (import
    (chezscheme)
    (Network txt_record))

  ;;-------------------------;;
  ;; nw_advertise_descriptor ;;
  ;;=========================;;

  (define init
    (load-shared-object "Network.framework/Network"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [nw_advertise_descriptor_t void*])

  ;;
  ;; Constants
  ;;

  ;; (none defined)

  ;;
  ;; Functions
  ;;

  (define nw_advertise_descriptor_create_bonjour_service
    (foreign-procedure "nw_advertise_descriptor_create_bonjour_service"
		       (string string string) nw_advertise_descriptor_t))
  (define nw_advertise_descriptor_set_txt_record
    (foreign-procedure "nw_advertise_descriptor_set_txt_record"
		       (nw_advertise_descriptor_t void* size_t) void))
  (define nw_advertise_descriptor_set_no_auto_rename
    (foreign-procedure "nw_advertise_descriptor_set_no_auto_rename"
		       (nw_advertise_descriptor_t boolean) void))
  (define nw_advertise_descriptor_get_no_auto_rename
    (foreign-procedure "nw_advertise_descriptor_get_no_auto_rename"
		       (nw_advertise_descriptor_t) boolean))
  (define nw_advertise_descriptor_set_txt_record_object
    (foreign-procedure "nw_advertise_descriptor_set_txt_record_object"
		       (nw_advertise_descriptor_t nw_txt_record_t) void))
  (define nw_advertise_descriptor_copy_txt_record_object
    (foreign-procedure "nw_advertise_descriptor_copy_txt_record_object"
		       (nw_advertise_descriptor_t) nw_txt_record_t))
  (define nw_advertise_descriptor_create_application_service
    (foreign-procedure "nw_advertise_descriptor_create_application_service"
		       (string) nw_advertise_descriptor_t))
  (define nw_advertise_descriptor_get_application_service_name
    (foreign-procedure "nw_advertise_descriptor_get_application_service_name"
		       (nw_advertise_descriptor_t) string))
  )
