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
;; Based on Apple's CoreFoundation/CFUUID.h
(library
  (CoreFoundation CFUUID)
  (export
    CFUUIDRef
    CFUUIDBytes
    CFUUIDGetTypeID
    CFUUIDCreate
    CFUUIDCreateWithBytes
    CFUUIDCreateFromString
    CFUUIDCreateString
    CFUUIDGetConstantUUIDWithBytes
    CFUUIDGetUUIDBytes
    CFUUIDCreateFromUUIDBytes)
  (import
    (chezscheme)
    (CoreFoundation CFBase)
    (CoreFoundation CFString))

  ;;--------;;
  ;; CFUUID ;;
  ;;========;;

  (define init
    (load-shared-object "CoreFoundation.framework/CoreFoundation"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [CFUUIDRef void*]
    [CFUUIDBytes (struct
		   [byte0 unsigned-8]
		   [byte1 unsigned-8]
		   [byte2 unsigned-8]
		   [byte3 unsigned-8]
		   [byte4 unsigned-8]
		   [byte5 unsigned-8]
		   [byte6 unsigned-8]
		   [byte7 unsigned-8]
		   [byte8 unsigned-8]
		   [byte9 unsigned-8]
		   [byte10 unsigned-8]
		   [byte11 unsigned-8]
		   [byte12 unsigned-8]
		   [byte13 unsigned-8]
		   [byte14 unsigned-8]
		   [byte15 unsigned-8])])

  ;;
  ;; Constants
  ;;

  ;; (none defined)

  ;;
  ;; Functions
  ;;

  (define CFUUIDGetTypeID
    (foreign-procedure "CFUUIDGetTypeID"
		       () CFTypeID))
  (define CFUUIDCreate
    (foreign-procedure "CFUUIDCreate"
		       (CFAllocatorRef) CFUUIDRef))
  (define CFUUIDCreateWithBytes
    (foreign-procedure "CFUUIDCreateWithBytes"
		       (CFAllocatorRef unsigned-8 unsigned-8 unsigned-8 unsigned-8 unsigned-8 unsigned-8 unsigned-8 unsigned-8 unsigned-8 unsigned-8 unsigned-8 unsigned-8 unsigned-8 unsigned-8 unsigned-8 unsigned-8) CFUUIDRef))
  (define CFUUIDCreateFromString
    (foreign-procedure "CFUUIDCreateFromString"
		       (CFAllocatorRef CFStringRef) CFUUIDRef))
  (define CFUUIDCreateString
    (foreign-procedure "CFUUIDCreateString"
		       (CFAllocatorRef CFUUIDRef) CFStringRef))
  (define CFUUIDGetConstantUUIDWithBytes
    (foreign-procedure "CFUUIDGetConstantUUIDWithBytes"
		       (CFAllocatorRef unsigned-8 unsigned-8 unsigned-8 unsigned-8 unsigned-8 unsigned-8 unsigned-8 unsigned-8 unsigned-8 unsigned-8 unsigned-8 unsigned-8 unsigned-8 unsigned-8 unsigned-8 unsigned-8) CFUUIDRef))
  (define CFUUIDGetUUIDBytes
    (foreign-procedure "CFUUIDGetUUIDBytes"
		       (CFUUIDRef) (& CFUUIDBytes)))
  (define CFUUIDCreateFromUUIDBytes
    (foreign-procedure "CFUUIDCreateFromUUIDBytes"
		       (CFAllocatorRef (& CFUUIDBytes)) CFUUIDRef))
  )
