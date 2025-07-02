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
;; Based on Apple's SystemConfiguration/SCPreferences.h
(library
  (SystemConfiguration SCPreferences)
  (export
    SCPreferencesRef
    SCPreferencesNotification
    SCPreferencesContext
    SCPreferencesCallBack
    kSCPreferencesNotificationCommit
    kSCPreferencesNotificationApply
    SCPreferencesGetTypeID
    SCPreferencesCreate
    SCPreferencesCreateWithAuthorization
    SCPreferencesLock
    SCPreferencesCommitChanges
    SCPreferencesApplyChanges
    SCPreferencesUnlock
    SCPreferencesGetSignature
    SCPreferencesCopyKeyList
    SCPreferencesGetValue
    SCPreferencesAddValue
    SCPreferencesSetValue
    SCPreferencesRemoveValue
    SCPreferencesSetCallback
    SCPreferencesSynchronize)
  (import
    (chezscheme)
    (CoreFoundation)
    (Security)
    ;;(SystemConfiguration SCDynamicStore)
    )

  ;;---------------;;
  ;; SCPreferences ;;
  ;;===============;;

  (define init
    (load-shared-object "SystemConfiguration.framework/SystemConfiguration"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [SCPreferencesRef void*]
    [SCPreferencesNotification unsigned-32]
    [SCPreferencesContext (struct
			    [version CFIndex]
			    [info void*]
			    [retain (* (function (void*) void*))]
			    [release (* (function (void*) void))]
			    [copyDescription (* (function (void*) CFStringRef))])])
  (define-ftype
    [SCPreferencesCallBack (function (SCPreferencesRef SCPreferencesNotification void*) void)])

  ;;
  ;; Constants
  ;;

  (define kSCPreferencesNotificationCommit 1)
  (define kSCPreferencesNotificationApply  2)

  ;;
  ;; Functions
  ;;

  (define SCPreferencesGetTypeID
    (foreign-procedure "SCPreferencesGetTypeID"
		       () CFTypeID))
  (define SCPreferencesCreate
    (foreign-procedure "SCPreferencesCreate"
		       (CFAllocatorRef CFStringRef CFStringRef) SCPreferencesRef))
  (define SCPreferencesCreateWithAuthorization
    (foreign-procedure "SCPreferencesCreateWithAuthorization"
		       (CFAllocatorRef CFStringRef CFStringRef AuthorizationRef) SCPreferencesRef))
  (define SCPreferencesLock
    (foreign-procedure "SCPreferencesLock"
		       (SCPreferencesRef Boolean) Boolean))
  (define SCPreferencesCommitChanges
    (foreign-procedure "SCPreferencesCommitChanges"
		       (SCPreferencesRef) Boolean))
  (define SCPreferencesApplyChanges
    (foreign-procedure "SCPreferencesApplyChanges"
		       (SCPreferencesRef) Boolean))
  (define SCPreferencesUnlock
    (foreign-procedure "SCPreferencesUnlock"
		       (SCPreferencesRef) Boolean))
  (define SCPreferencesGetSignature
    (foreign-procedure "SCPreferencesGetSignature"
		       (SCPreferencesRef) CFDataRef))
  (define SCPreferencesCopyKeyList
    (foreign-procedure "SCPreferencesCopyKeyList"
		       (SCPreferencesRef) CFArrayRef))
  (define SCPreferencesGetValue
    (foreign-procedure "SCPreferencesGetValue"
		       (SCPreferencesRef CFStringRef) CFPropertyListRef))
  (define SCPreferencesAddValue
    (foreign-procedure "SCPreferencesAddValue"
		       (SCPreferencesRef CFStringRef CFPropertyListRef) Boolean))
  (define SCPreferencesSetValue
    (foreign-procedure "SCPreferencesSetValue"
		       (SCPreferencesRef CFStringRef CFPropertyListRef) Boolean))
  (define SCPreferencesRemoveValue
    (foreign-procedure "SCPreferencesRemoveValue"
		       (SCPreferencesRef CFStringRef) Boolean))
  (define SCPreferencesSetCallback
    (foreign-procedure "SCPreferencesSetCallback"
		       (SCPreferencesRef (* SCPreferencesCallBack) (* SCPreferencesContext)) Boolean))
  ;; SCPreferencesScheduleWithRunLoop
  ;; SCPreferencesUnscheduleFromRunLoop
  ;; SCPreferencesSetDispatchQueue
  (define SCPreferencesSynchronize
    (foreign-procedure "SCPreferencesSynchronize"
		       (SCPreferencesRef) void))
  )
