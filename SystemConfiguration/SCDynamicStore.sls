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
;; Based on Apple's SystemConfiguration/SCDynamicStore.h
(library
  (SystemConfiguration SCDynamicStore)
  (export
    SCDynamicStoreRef
    SCDynamicStoreContext
    SCDynamicStoreCallBack
    kSCDynamicStoreUseSessionKeys
    SCDynamicStoreGetTypeID
    SCDynamicStoreCreate
    SCDynamicStoreCreateWithOptions
    SCDynamicStoreCreateRunLoopSource
    SCDynamicStoreCopyKeyList
    SCDynamicStoreAddValue
    SCDynamicStoreAddTemporaryValue
    SCDynamicStoreCopyValue
    SCDynamicStoreCopyMultiple
    SCDynamicStoreSetValue
    SCDynamicStoreSetMultiple
    SCDynamicStoreRemoveValue
    SCDynamicStoreNotifyValue
    SCDynamicStoreSetNotificationKeys
    SCDynamicStoreCopyNotifiedKeys)
  (import
    (chezscheme)
    (CoreFoundation))

  ;;----------------;;
  ;; SCDynamicStore ;;
  ;;================;;

  (define init
    (load-shared-object "SystemConfiguration.framework/SystemConfiguration"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [SCDynamicStoreRef void*]
    [SCDynamicStoreContext (struct
			     [version CFIndex]
			     [info void*]
			     [retain (* (function (void*) void*))]
			     [release (* (function (void*) void))]
			     [copyDescription (* (function (void*) CFStringRef))])])
  (define-ftype
    [SCDynamicStoreCallBack (function (SCDynamicStoreRef CFArrayRef void*) void)])

  ;;
  ;; Constants
  ;;

  (define kSCDynamicStoreUseSessionKeys
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCDynamicStoreUseSessionKeys")))

  ;;
  ;; Functions
  ;;

  (define SCDynamicStoreGetTypeID
    (foreign-procedure "SCDynamicStoreGetTypeID"
		       () CFTypeID))
  (define SCDynamicStoreCreate
    (foreign-procedure "SCDynamicStoreCreate"
		       (CFAllocatorRef CFStringRef (* SCDynamicStoreCallBack) (* SCDynamicStoreContext)) SCDynamicStoreRef))
  (define SCDynamicStoreCreateWithOptions
    (foreign-procedure "SCDynamicStoreCreateWithOptions"
		       (CFAllocatorRef CFStringRef CFDictionaryRef (* SCDynamicStoreCallBack) (* SCDynamicStoreContext)) SCDynamicStoreRef))
  (define SCDynamicStoreCreateRunLoopSource
    (foreign-procedure "SCDynamicStoreCreateRunLoopSource"
		       (CFAllocatorRef SCDynamicStoreRef CFIndex) CFRunLoopSourceRef))
  (define SCDynamicStoreCopyKeyList
    (foreign-procedure "SCDynamicStoreCopyKeyList"
		       (SCDynamicStoreRef CFStringRef) CFArrayRef))
  (define SCDynamicStoreAddValue
    (foreign-procedure "SCDynamicStoreAddValue"
		       (SCDynamicStoreRef CFStringRef CFPropertyListRef) Boolean))
  (define SCDynamicStoreAddTemporaryValue
    (foreign-procedure "SCDynamicStoreAddTemporaryValue"
		       (SCDynamicStoreRef CFStringRef CFPropertyListRef) Boolean))
  (define SCDynamicStoreCopyValue
    (foreign-procedure "SCDynamicStoreCopyValue"
		       (SCDynamicStoreRef CFStringRef) CFPropertyListRef))
  (define SCDynamicStoreCopyMultiple
    (foreign-procedure "SCDynamicStoreCopyMultiple"
		       (SCDynamicStoreRef CFArrayRef CFArrayRef) CFDictionaryRef))
  (define SCDynamicStoreSetValue
    (foreign-procedure "SCDynamicStoreSetValue"
		       (SCDynamicStoreRef CFStringRef CFPropertyListRef) Boolean))
  (define SCDynamicStoreSetMultiple
    (foreign-procedure "SCDynamicStoreSetMultiple"
		       (SCDynamicStoreRef CFDictionaryRef CFArrayRef CFArrayRef) Boolean))
  (define SCDynamicStoreRemoveValue
    (foreign-procedure "SCDynamicStoreRemoveValue"
		       (SCDynamicStoreRef CFStringRef) Boolean))
  (define SCDynamicStoreNotifyValue
    (foreign-procedure "SCDynamicStoreNotifyValue"
		       (SCDynamicStoreRef CFStringRef) Boolean))
  (define SCDynamicStoreSetNotificationKeys
    (foreign-procedure "SCDynamicStoreSetNotificationKeys"
		       (SCDynamicStoreRef CFArrayRef CFArrayRef) Boolean))
  (define SCDynamicStoreCopyNotifiedKeys
    (foreign-procedure "SCDynamicStoreCopyNotifiedKeys"
		       (SCDynamicStoreRef) CFArrayRef))
  )
