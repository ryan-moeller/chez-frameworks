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
;; Based on Apple's Network/browse_result.h
(library
  (Network browse_result)
  (export
    nw_browse_result_t
    nw_browse_result_change_t
    nw_browse_result_change_invalid
    nw_browse_result_change_identical
    nw_browse_result_change_result_added
    nw_browse_result_change_interface_removed
    nw_browse_result_change_interface_added
    nw_browse_result_change_interface_removed
    nw_browse_result_change_txt_record_changed
    nw_browse_result_copy_endpoint
    nw_browse_result_get_changes
    nw_browse_result_get_interfaces_count
    nw_browse_result_copy_txt_record_object)
  (import
    (chezscheme)
    (Network endpoint)
    (Network interface)
    (Network txt_record))

  ;;------------------;;
  ;; nw_browse_result ;;
  ;;==================;;

  (define init
    (load-shared-object "Network.framework/Network"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [nw_browse_result_t void*]
    [nw_browse_result_change_t unsigned-64])

  ;;
  ;; Constants
  ;;

  (define nw_browse_result_change_invalid            #x00)
  (define nw_browse_result_change_identical          #x01)
  (define nw_browse_result_change_result_added       #x02)
  (define nw_browse_result_change_result_removed     #x04)
  (define nw_browse_result_change_interface_added    #x08)
  (define nw_browse_result_change_interface_removed  #x10)
  (define nw_browse_result_change_txt_record_changed #x20)

  ;;
  ;; Functions
  ;;

  (define nw_browse_result_copy_endpoint
    (foreign-procedure "nw_browse_result_copy_endpoint"
		       (nw_browse_result_t) nw_endpoint_t))
  (define nw_browse_result_get_changes
    (foreign-procedure "nw_browse_result_get_changes"
		       (nw_browse_result_t nw_browse_result_t) nw_browse_result_change_t))
  (define nw_browse_result_get_interfaces_count
    (foreign-procedure "nw_browse_result_get_interfaces_count"
		       (nw_browse_result_t) size_t))
  (define nw_browse_result_copy_txt_record_object
    (foreign-procedure "nw_browse_result_copy_txt_record_object"
		       (nw_browse_result_t) nw_txt_record_t))
  ;; XXX: Blocks APIs not exposed.
  )
