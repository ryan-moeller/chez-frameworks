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
;; Based on Apple's Network/txt_record.h
(library
  (Network txt_record)
  (export
    nw_txt_record_t
    nw_txt_record_find_key_t
    nw_txt_record_find_key_invalid
    nw_txt_record_find_key_not_present
    nw_txt_record_find_key_no_value
    nw_txt_record_find_key_empty_value
    nw_txt_record_find_key_non_empty_value
    nw_txt_record_create_with_bytes
    nw_txt_record_create_dictionary
    nw_txt_record_copy
    nw_txt_record_find_key
    nw_txt_record_set_key
    nw_txt_record_remove_key
    nw_txt_record_get_key_count
    nw_txt_record_is_equal
    nw_txt_record_is_dictionary)
  (import (chezscheme))

  ;;---------------;;
  ;; nw_txt_record ;;
  ;;===============;;

  (define init
    (load-shared-object "Network.framework/Network"))

  ;; XXX: Blocks APIs not exposed.

  ;;
  ;; Types
  ;;

  (define-ftype
    [nw_txt_record_t void*]
    [nw_txt_record_find_key_t int])

  ;;
  ;; Constants
  ;;

  (define nw_txt_record_find_key_invalid         0)
  (define nw_txt_record_find_key_not_present     1)
  (define nw_txt_record_find_key_no_value        2)
  (define nw_txt_record_find_key_empty_value     3)
  (define nw_txt_record_find_key_non_empty_value 4)

  ;;
  ;; Functions
  ;;

  (define nw_txt_record_create_with_bytes
    (foreign-procedure "nw_txt_record_create_with_bytes"
		       (u8* size_t) nw_txt_record_t))
  (define nw_txt_record_create_dictionary
    (foreign-procedure "nw_txt_record_create_dictionary"
		       () nw_txt_record_t))
  (define nw_txt_record_copy
    (foreign-procedure "nw_txt_record_copy"
		       (nw_txt_record_t) nw_txt_record_t))
  (define nw_txt_record_find_key
    (foreign-procedure "nw_txt_record_find_key"
		       (nw_txt_record_t string) nw_txt_record_find_key_t))
  (define nw_txt_record_set_key
    (foreign-procedure "nw_txt_record_set_key"
		       (nw_txt_record_t string u8* size_t) boolean))
  (define nw_txt_record_remove_key
    (foreign-procedure "nw_txt_record_remove_key"
		       (nw_txt_record_t string) boolean))
  (define nw_txt_record_get_key_count
    (foreign-procedure "nw_txt_record_get_key_count"
		       (nw_txt_record_t) size_t))
  (define nw_txt_record_is_equal
    (foreign-procedure "nw_txt_record_is_equal"
		       (nw_txt_record_t nw_txt_record_t) boolean))
  (define nw_txt_record_is_dictionary
    (foreign-procedure "nw_txt_record_is_dictionary"
		       (nw_txt_record_t) boolean))
  )
