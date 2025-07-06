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
;; Based on Apple's Network/browser.h
(library
  (Network browser)
  (export
    nw_browser_t
    nw_browser_state_t
    nw_browser_state_invalid
    nw_browser_state_ready
    nw_browser_state_failed
    nw_browser_state_cancelled
    nw_browser_state_waiting
    nw_browser_create
    nw_browser_set_queue
    nw_browser_start
    nw_browser_cancel
    nw_browser_copy_parameters
    nw_browser_copy_browse_descriptor)
  (import
    (chezscheme)
    (Network parameters)
    (Network browse_descriptor)
    (Network browse_result)
    (Network error)
    ; TODO: (dispatch)
    )

  ;;------------;;
  ;; nw_browser ;;
  ;;============;;

  (define init
    (load-shared-object "Network.framework/Network"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [nw_browser_t void*]
    [nw_browser_state_t int])

  ;;
  ;; Constants
  ;;

  (define nw_browser_state_invalid   0)
  (define nw_browser_state_ready     1)
  (define nw_browser_state_failed    2)
  (define nw_browser_state_cancelled 3)
  (define nw_browser_state_waiting   4)

  ;;
  ;; Functions
  ;;

  (define nw_browser_create
    (foreign-procedure "nw_browser_create"
		       (nw_browse_descriptor_t nw_parameters_t) nw_browser_t))
  ;; TODO: dispatch_queue_t
  (define nw_browser_set_queue
    (foreign-procedure "nw_browser_set_queue"
		       (nw_browser_t void*) void))
  ;; XXX: Blocks APIs not exposed.
  (define nw_browser_start
    (foreign-procedure "nw_browser_start"
		       (nw_browser_t) void))
  (define nw_browser_cancel
    (foreign-procedure "nw_browser_cancel"
		       (nw_browser_t) void))
  (define nw_browser_copy_parameters
    (foreign-procedure "nw_browser_copy_parameters"
		       (nw_browser_t) nw_parameters_t))
  (define nw_browser_copy_browse_descriptor
    (foreign-procedure "nw_browser_copy_browse_descriptor"
		       (nw_browser_t) nw_browse_descriptor_t))
  )
