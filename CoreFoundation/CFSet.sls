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
;; Based on Apple's CoreFoundation/CFSet.h
(library
  (CoreFoundation CFSet)
  (export
    CFSetRetainCallBack
    CFSetReleaseCallBack
    CFSetCopyDescriptionCallBack
    CFSetEqualCallBack
    CFSetHashCallBack
    CFSetApplierFunction
    CFSetRef
    CFMutableSetRef
    CFSetCallBacks
    kCFTypeSetCallBacks
    kCFCopyStringSetCallBacks
    CFSetGetTypeID
    CFSetCreate
    CFSetCreateCopy
    CFSetCreateMutable
    CFSetCreateMutableCopy
    CFSetGetCount
    CFSetGetCountOfValue
    CFSetContainsValue
    CFSetGetValue
    CFSetGetValueIfPresent
    CFSetGetValues
    CFSetApplyFunction
    CFSetAddValue
    CFSetReplaceValue
    CFSetSetValue
    CFSetRemoveValue
    CFSetRemoveAllValues)
  (import
    (chezscheme)
    (CoreFoundation CFBase))

  ;;-------;;
  ;; CFSet ;;
  ;;=======;;

  (define init
    (load-shared-object "CoreFoundation.framework/CoreFoundation"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [CFSetRetainCallBack (function (CFAllocatorRef void*) void*)]
    [CFSetReleaseCallBack (function (CFAllocatorRef void*) void)]
    [CFSetCopyDescriptionCallBack (function (void*) CFStringRef)]
    [CFSetEqualCallBack (function (void* void*) Boolean)]
    [CFSetHashCallBack (function (void*) CFHashCode)]
    [CFSetApplierFunction (function (void* void*) void)]
    [CFSetRef void*]
    [CFMutableSetRef void*])
  (define-ftype
    [CFSetCallBacks (struct
		      [version CFIndex]
		      [retain (* CFSetRetainCallBack)]
		      [release (* CFSetReleaseCallBack)]
		      [copyDescription (* CFSetCopyDescriptionCallBack)]
		      [equal (* CFSetEqualCallBack)]
		      [hash (* CFSetHashCallBack)])])

  ;;
  ;; Constants
  ;;

  (define kCFTypeSetCallBacks
    (make-ftype-pointer CFSetCallBacks
			(foreign-entry "kCFTypeSetCallBacks")))
  (define kCFCopyStringSetCallBacks
    (make-ftype-pointer CFSetCallBacks
			(foreign-entry "kCFCopyStringSetCallBacks")))

  ;;
  ;; Functions
  ;;

  (define CFSetGetTypeID
    (foreign-procedure "CFSetGetTypeID"
		       () CFTypeID))
  (define CFSetCreate
    (foreign-procedure "CFSetCreate"
		       (CFAllocatorRef (* void*) CFIndex (* CFSetCallBacks)) CFSetRef))
  (define CFSetCreateCopy
    (foreign-procedure "CFSetCreateCopy"
		       (CFAllocatorRef CFSetRef) CFSetRef))
  (define CFSetCreateMutable
    (foreign-procedure "CFSetCreateMutable"
		       (CFAllocatorRef CFIndex (* CFSetCallBacks)) CFMutableSetRef))
  (define CFSetCreateMutableCopy
    (foreign-procedure "CFSetCreateMutableCopy"
		       (CFAllocatorRef CFIndex CFSetRef) CFMutableSetRef))
  (define CFSetGetCount
    (foreign-procedure "CFSetGetCount"
		       (CFSetRef) CFIndex))
  (define CFSetGetCountOfValue
    (foreign-procedure "CFSetGetCountOfValue"
		       (CFSetRef void*) CFIndex))
  (define CFSetContainsValue
    (foreign-procedure "CFSetContainsValue"
		       (CFSetRef void*) Boolean))
  (define CFSetGetValue
    (foreign-procedure "CFSetGetValue"
		       (CFSetRef void*) void*))
  (define CFSetGetValueIfPresent
    (foreign-procedure "CFSetGetValueIfPresent"
		       (CFSetRef void* (* void*)) Boolean))
  (define CFSetGetValues
    (foreign-procedure "CFSetGetValues"
		       (CFSetRef (* void*)) void))
  (define CFSetApplyFunction
    (foreign-procedure "CFSetApplyFunction"
		       (CFSetRef (* CFSetApplierFunction) void*) void))
  (define CFSetAddValue
    (foreign-procedure "CFSetAddValue"
		       (CFMutableSetRef void*) void))
  (define CFSetReplaceValue
    (foreign-procedure "CFSetReplaceValue"
		       (CFMutableSetRef void*) void))
  (define CFSetSetValue
    (foreign-procedure "CFSetSetValue"
		       (CFMutableSetRef void*) void))
  (define CFSetRemoveValue
    (foreign-procedure "CFSetRemoveValue"
		       (CFMutableSetRef void*) void))
  (define CFSetRemoveAllValues
    (foreign-procedure "CFSetRemoveAllValues"
		       (CFMutableSetRef) void))
  )
