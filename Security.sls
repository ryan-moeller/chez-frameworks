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
;; Based on Apple's Security/Security.h
(library
  (Security)
  (export
    AuthorizationRef
    sec_protocol_options_t
    sec_protocol_metadata_t)
  (import (chezscheme))

  ;;----------;;
  ;; Security ;;
  ;;==========;;

  ;; XXX: This is just a minimal collection of types required elsewhere for now.

  ;;
  ;; Types
  ;;

  (define-ftype
    [AuthorizationRef void*]
    [sec_protocol_options_t void*]
    [sec_protocol_metadata_t void*])
  )
