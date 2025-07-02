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
;; Based on Apple's CoreFoundation/CFBag.h
(library
  (CoreFoundation CFBag)
  (export
    CFBagRetainCallBack
    CFBagReleaseCallBack
    CFBagCopyDescriptionCallBack
    CFBagEqualCallBack
    CFBagHashCallBack
    CFBagApplierFunction
    CFBagRef
    CFMutableBagRef
    CFBagCallBacks
    kCFTypeBagCallBacks
    kCFCopyStringBagCallBacks
    CFBagGetTypeID
    CFBagCreate
    CFBagCreateCopy
    CFBagCreateMutable
    CFBagCreateMutableCopy
    CFBagGetCount
    CFBagGetCountOfValue
    CFBagContainsValue
    CFBagGetValue
    CFBagGetValueIfPresent
    CFBagGetValues
    CFBagApplyFunction
    CFBagAddValue
    CFBagReplaceValue
    CFBagSetValue
    CFBagRemoveValue
    CFBagRemoveAllValues)
  (import
    (chezscheme)
    (CoreFoundation CFBase))

  ;;-------;;
  ;; CFBag ;;
  ;;=======;;

  (define init
    (load-shared-object "CoreFoundation.framework/CoreFoundation"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [CFBagRetainCallBack (function (CFAllocatorRef void*) void*)]
    [CFBagReleaseCallBack (function (CFAllocatorRef void*) void)]
    [CFBagCopyDescriptionCallBack (function (void*) CFStringRef)]
    [CFBagEqualCallBack (function (void* void*) Boolean)]
    [CFBagHashCallBack (function (void*) CFHashCode)]
    [CFBagApplierFunction (function (void* void*) void)]
    [CFBagRef void*]
    [CFMutableBagRef void*])
  (define-ftype
    [CFBagCallBacks (struct
		      [version CFIndex]
		      [retain (* CFBagRetainCallBack)]
		      [release (* CFBagReleaseCallBack)]
		      [copyDescription (* CFBagCopyDescriptionCallBack)]
		      [equal (* CFBagEqualCallBack)]
		      [hash (* CFBagHashCallBack)])])

  ;;
  ;; Constants
  ;;

  (define kCFTypeBagCallBacks
    (make-ftype-pointer CFBagCallBacks
			(foreign-entry "kCFTypeBagCallBacks")))
  (define kCFCopyStringBagCallBacks
    (make-ftype-pointer CFBagCallBacks
			(foreign-entry "kCFCopyStringBagCallBacks")))

  ;;
  ;; Functions
  ;;

  (define CFBagGetTypeID
    (foreign-procedure "CFBagGetTypeID"
		       () CFTypeID))
  (define CFBagCreate
    (foreign-procedure "CFBagCreate"
		       (CFAllocatorRef (* void*) CFIndex (* CFBagCallBacks)) CFBagRef))
  (define CFBagCreateCopy
    (foreign-procedure "CFBagCreateCopy"
		       (CFAllocatorRef CFBagRef) CFBagRef))
  (define CFBagCreateMutable
    (foreign-procedure "CFBagCreateMutable"
		       (CFAllocatorRef CFIndex (* CFBagCallBacks)) CFMutableBagRef))
  (define CFBagCreateMutableCopy
    (foreign-procedure "CFBagCreateMutableCopy"
		       (CFAllocatorRef CFIndex CFBagRef) CFMutableBagRef))
  (define CFBagGetCount
    (foreign-procedure "CFBagGetCount"
		       (CFBagRef) CFIndex))
  (define CFBagGetCountOfValue
    (foreign-procedure "CFBagGetCountOfValue"
		       (CFBagRef void*) CFIndex))
  (define CFBagContainsValue
    (foreign-procedure "CFBagContainsValue"
		       (CFBagRef void*) Boolean))
  (define CFBagGetValue
    (foreign-procedure "CFBagGetValue"
		       (CFBagRef void*) void*))
  (define CFBagGetValueIfPresent
    (foreign-procedure "CFBagGetValueIfPresent"
		       (CFBagRef void* (* void*)) Boolean))
  (define CFBagGetValues
    (foreign-procedure "CFBagGetValues"
		       (CFBagRef (* void*)) void))
  (define CFBagApplyFunction
    (foreign-procedure "CFBagApplyFunction"
		       (CFBagRef (* CFBagApplierFunction) void*) void))
  (define CFBagAddValue
    (foreign-procedure "CFBagAddValue"
		       (CFMutableBagRef void*) void))
  (define CFBagReplaceValue
    (foreign-procedure "CFBagReplaceValue"
		       (CFMutableBagRef void*) void))
  (define CFBagSetValue
    (foreign-procedure "CFBagSetValue"
		       (CFMutableBagRef void*) void))
  (define CFBagRemoveValue
    (foreign-procedure "CFBagRemoveValue"
		       (CFMutableBagRef void*) void))
  (define CFBagRemoveAllValues
    (foreign-procedure "CFBagRemoveAll"
		       (CFMutableBagRef) void))
  )
