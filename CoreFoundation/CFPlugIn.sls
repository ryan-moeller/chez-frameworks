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
;; Based on Apple's CoreFoundation/CFPlugIn.h
(library
  (CoreFoundation CFPlugIn)
  (export
    )
  (import
    (chezscheme)
    (CoreFoundation CFBase)
    (CoreFoundation CFArray)
    (CoreFoundation CFBundle)
    (CoreFoundation CFString)
    (CoreFoundation CFURL)
    (CoreFoundation CFUUID))

  ;;----------;;
  ;; CFPlugIn ;;
  ;;==========;;

  (define init
    (load-shared-object "CoreFoundation.framework/CoreFoundation"))

  ;;
  ;; Types
  ;;

  (define-ftype
    )

  ;;
  ;; Constants
  ;;

  ;;
  ;; Functions
  ;;
  )
