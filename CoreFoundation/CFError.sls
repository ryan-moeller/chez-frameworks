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
;; Based on Apple's CoreFoundation/CFError.h
(library
  (CoreFoundation CFError)
  (export
    CFErrorRef
    CFErrorDomain
    kCFErrorDomainPOSIX
    kCFErrorDomainOSStatus
    kCFErrorDomainMach
    kCFErrorDomainCocoa
    kCFErrorLocalizedDescriptionKey
    kCFErrorLocalizedFailureKey
    kCFErrorLocalizedFailureReasonKey
    kCFErrorLocalizedRecoverySuggestionKey
    kCFErrorDescriptionKey
    kCFErrorUnderlyingErrorKey
    kCFErrorURLKey
    kCFErrorFilePathKey
    CFErrorCopyDescription
    CFErrorCopyFailureReason
    CFErrorCopyRecoverySuggestion
    CFErrorCopyUserInfo
    CFErrorCreate
    CFErrorCreateWithUserInfoKeysAndValues
    CFErrorGetCode
    CFErrorGetDomain
    CFErrorGetTypeID)
  (import
    (chezscheme)
    (CoreFoundation CFBase)
    (CoreFoundation CFDictionary))

  ;;---------;;
  ;; CFError ;;
  ;;=========;;

  (define init
    (load-shared-object "CoreFoundation.framework/CoreFoundation"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [CFErrorRef void*]
    [CFErrorDomain CFStringRef])

  ;;
  ;; Constants
  ;;

  (define kCFErrorDomainPOSIX
    (make-ftype-pointer CFErrorDomain
			(foreign-entry "kCFErrorDomainPOSIX")))
  (define kCFErrorDomainOSStatus
    (make-ftype-pointer CFErrorDomain
			(foreign-entry "kCFErrorDomainOSStatus")))
  (define kCFErrorDomainMach
    (make-ftype-pointer CFErrorDomain
			(foreign-entry "kCFErrorDomainMach")))
  (define kCFErrorDomainCocoa
    (make-ftype-pointer CFErrorDomain
			(foreign-entry "kCFErrorDomainCocoa")))

  (define kCFErrorLocalizedDescriptionKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFErrorLocalizedDescriptionKey")))
  (define kCFErrorLocalizedFailureKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFErrorLocalizedFailureKey")))
  (define kCFErrorLocalizedFailureReasonKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFErrorLocalizedFailureReasonKey")))
  (define kCFErrorLocalizedRecoverySuggestionKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFErrorLocalizedRecoverySuggestionKey")))
  (define kCFErrorDescriptionKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFErrorDescriptionKey")))
  (define kCFErrorUnderlyingErrorKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFErrorUnderlyingErrorKey")))
  (define kCFErrorURLKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFErrorURLKey")))
  (define kCFErrorFilePathKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFErrorFilePathKey")))

  ;;
  ;; Functions
  ;;

  ;; CFErrorCopyCallBackBlockForDomain "CF and Foundation internal"
  (define CFErrorCopyDescription
    (foreign-procedure "CFErrorCopyDescription"
		       (CFErrorRef) CFStringRef))
  (define CFErrorCopyFailureReason
    (foreign-procedure "CFErrorCopyFailureReason"
		       (CFErrorRef) CFStringRef))
  (define CFErrorCopyRecoverySuggestion
    (foreign-procedure "CFErrorCopyRecoverySuggestion"
		       (CFErrorRef) CFStringRef))
  (define CFErrorCopyUserInfo
    (foreign-procedure "CFErrorCopyUserInfo"
		       (CFErrorRef) CFDictionaryRef))
  (define CFErrorCreate
    (foreign-procedure "CFErrorCreate"
		       (CFAllocatorRef CFErrorDomain CFIndex CFDictionaryRef) CFErrorRef))
  (define CFErrorCreateWithUserInfoKeysAndValues
    (foreign-procedure "CFErrorCreateWithUserInfoKeysAndValues"
		       (CFAllocatorRef CFErrorDomain CFIndex (* void*) (* void*) CFIndex) CFErrorRef))
  ;; CFErrorGetCallBackBlockForDomain "CF and Foundation internal"
  ;; CFErrorGetCallBackForDomain "CF and Foundation internal"
  (define CFErrorGetCode
    (foreign-procedure "CFErrorGetCode"
		       (CFErrorRef) CFIndex))
  (define CFErrorGetDomain
    (foreign-procedure "CFErrorGetDomain"
		       (CFErrorRef) CFErrorDomain))
  (define CFErrorGetTypeID
    (foreign-procedure "CFErrorGetTypeID"
		       () CFTypeID))
  ;; CFErrorSetCallBackBlockForDomain "CF and Foundation internal"
  ;; CFErrorSetCallBackForDomain "CF and Foundation internal"
  )
