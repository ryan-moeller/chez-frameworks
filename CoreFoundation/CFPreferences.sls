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
;; Based on Apple's CoreFoundation/CFPreferences.h
(library
  (CoreFoundation CFPreferences)
  (export
    kCFPreferencesAnyApplication
    kCFPreferencesCurrentApplication
    kCFPreferencesAnyHost
    kCFPreferencesCurrentHost
    kCFPreferencesAnyUser
    kCFPreferencesCurrentUser
    CFPreferencesCopyAppValue
    CFPreferencesGetAppBooleanValue
    CFPreferencesGetAppIntegerValue
    CFPreferencesSetAppValue
    CFPreferencesAddSuitePreferencesToApp
    CFPreferencesRemoveSuitePreferencesFromApp
    CFPreferencesAppSynchronize
    CFPreferencesCopyValue
    CFPreferencesCopyMultiple
    CFPreferencesSetValue
    CFPreferencesSetMultiple
    CFPreferencesSynchronize
    CFPreferencesCopyKeyList)
  (import
    (chezscheme)
    (CoreFoundation CFBase)
    (CoreFoundation CFArray)
    (CoreFoundation CFDictionary)
    (CoreFoundation CFString))

  ;;---------------;;
  ;; CFPreferences ;;
  ;;===============;;

  (define init
    (load-shared-object "CoreFoundation.framework/CoreFoundation"))

  ;;
  ;; Types
  ;;

  ;; (none defined)

  ;;
  ;; Constants
  ;;

  (define kCFPreferencesAnyApplication
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFPreferencesAnyApplication")))
  (define kCFPreferencesCurrentApplication
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFPreferencesCurrentApplication")))
  (define kCFPreferencesAnyHost
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFPreferencesAnyHost")))
  (define kCFPreferencesCurrentHost
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFPreferencesCurrentHost")))
  (define kCFPreferencesAnyUser
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFPreferencesAnyUser")))
  (define kCFPreferencesCurrentUser
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFPreferencesCurrentUser")))

  ;;
  ;; Functions
  ;;

  (define CFPreferencesCopyAppValue
    (foreign-procedure "CFPreferencesCopyAppValue"
		       (CFStringRef CFStringRef) CFPropertyListRef))
  (define CFPreferencesGetAppBooleanValue
    (foreign-procedure "CFPreferencesGetAppBooleanValue"
		       (CFStringRef CFStringRef (* Boolean)) Boolean))
  (define CFPreferencesGetAppIntegerValue
    (foreign-procedure "CFPreferencesGetAppIntegerValue"
		       (CFStringRef CFStringRef (* Boolean)) CFIndex))
  (define CFPreferencesSetAppValue
    (foreign-procedure "CFPreferencesSetAppValue"
		       (CFStringRef CFPropertyListRef CFStringRef) void))
  (define CFPreferencesAddSuitePreferencesToApp
    (foreign-procedure "CFPreferencesAddSuitePreferencesToApp"
		       (CFStringRef CFStringRef) void))
  (define CFPreferencesRemoveSuitePreferencesFromApp
    (foreign-procedure "CFPreferencesRemoveSuitePreferencesFromApp"
		       (CFStringRef CFStringRef) void))
  (define CFPreferencesAppSynchronize
    (foreign-procedure "CFPreferencesAppSynchronize"
		       (CFStringRef) Boolean))
  (define CFPreferencesCopyValue
    (foreign-procedure "CFPreferencesCopyValue"
		       (CFStringRef CFStringRef CFStringRef CFStringRef) CFPropertyListRef))
  (define CFPreferencesCopyMultiple
    (foreign-procedure "CFPreferencesCopyMultiple"
		       (CFArrayRef CFStringRef CFStringRef CFStringRef) CFDictionaryRef))
  (define CFPreferencesSetValue
    (foreign-procedure "CFPreferencesSetValue"
		       (CFStringRef CFPropertyListRef CFStringRef CFStringRef CFStringRef) void))
  (define CFPreferencesSetMultiple
    (foreign-procedure "CFPreferencesSetMultiple"
		       (CFDictionaryRef CFArrayRef CFStringRef CFStringRef CFStringRef) void))
  (define CFPreferencesSynchronize
    (foreign-procedure "CFPreferencesSynchronize"
		       (CFStringRef CFStringRef CFStringRef) Boolean))
  ;; CFPreferencesCopyApplicationList "Unsupported API"
  (define CFPreferencesCopyKeyList
    (foreign-procedure "CFPreferencesCopyKeyList"
		       (CFStringRef CFStringRef CFStringRef) CFArrayRef))
  ;; CFPreferencesAppValueIsForced "Closed source"
  )
