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
;; Based on Apple's CoreFoundation/CFBinaryHeap.h
(library
  (CoreFoundation CFBinaryHeap)
  (export
    CFBinaryHeapCompareContext
    CFBinaryHeapCallBacks
    CFBinaryHeapApplierFunction
    CFBinaryHeapRef
    kCFStringBinaryHeapCallBacks
    CFBinaryHeapGetTypeID
    CFBinaryHeapCreate
    CFBinaryHeapCreateCopy
    CFBinaryHeapGetCount
    CFBinaryHeapGetCountOfValue
    CFBinaryHeapContainsValue
    CFBinaryHeapGetMinimum
    CFBinaryHeapGetMinimumIfPresent
    CFBinaryHeapGetValues
    CFBinaryHeapApplyFunction
    CFBinaryHeapAddValue
    CFBinaryHeapRemoveMinimumValue
    CFBinaryHeapRemoveAllValues)
  (import
    (chezscheme)
    (CoreFoundation CFBase))

  ;;--------------;;
  ;; CFBinaryHeap ;;
  ;;==============;;

  (define init
    (load-shared-object "CoreFoundation.framework/CoreFoundation"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [CFBinaryHeapCompareContext (struct
				  [version CFIndex]
				  [info void*]
				  [retain (* (function (void*) void*))]
				  [release (* (function (void*) void))]
				  [copyDescription (* (function (void*) CFStringRef))])]
    [CFBinaryHeapCallBacks (struct
			     [version CFIndex]
			     [retain (* (function (CFAllocatorRef void*) void*))]
			     [release (* (function (CFAllocatorRef void*) void))]
			     [copyDescription (* (function (void*) CFStringRef))]
			     [compare (* (function (void* void* void*) CFComparisonResult))])]
    [CFBinaryHeapApplierFunction (function (void* void*) void)]
    [CFBinaryHeapRef void*])

  ;;
  ;; Constants
  ;;

  (define kCFStringBinaryHeapCallBacks
    (make-ftype-pointer CFBinaryHeapCallBacks
			(foreign-entry "kCFStringBinaryHeapCallBacks")))

  ;;
  ;; Functions
  ;;

  (define CFBinaryHeapGetTypeID
    (foreign-procedure "CFBinaryHeapGetTypeID"
		       () CFTypeID))
  (define CFBinaryHeapCreate
    (foreign-procedure "CFBinaryHeapCreate"
		       (CFAllocatorRef CFIndex (* CFBinaryHeapCallBacks) (* CFBinaryHeapCompareContext)) CFBinaryHeapRef))
  (define CFBinaryHeapCreateCopy
    (foreign-procedure "CFBinaryHeapCreateCopy"
		       (CFAllocatorRef CFIndex CFBinaryHeapRef) CFBinaryHeapRef))
  (define CFBinaryHeapGetCount
    (foreign-procedure "CFBinaryHeapGetCount"
		       (CFBinaryHeapRef) CFIndex))
  (define CFBinaryHeapGetCountOfValue
    (foreign-procedure "CFBinaryHeapGetCountOfValue"
		       (CFBinaryHeapRef void*) CFIndex))
  (define CFBinaryHeapContainsValue
    (foreign-procedure "CFBinaryHeapContainsValue"
		       (CFBinaryHeapRef void*) Boolean))
  (define CFBinaryHeapGetMinimum
    (foreign-procedure "CFBinaryHeapGetMinimum"
		       (CFBinaryHeapRef) void*))
  (define CFBinaryHeapGetMinimumIfPresent
    (foreign-procedure "CFBinaryHeapGetMinimumIfPresent"
		       (CFBinaryHeapRef (* void*)) Boolean))
  (define CFBinaryHeapGetValues
    (foreign-procedure "CFBinaryHeapGetValues"
		       (CFBinaryHeapRef (* void*)) void))
  (define CFBinaryHeapApplyFunction
    (foreign-procedure "CFBinaryHeapApplyFunction"
		       (CFBinaryHeapRef (* CFBinaryHeapApplierFunction) void*) void))
  (define CFBinaryHeapAddValue
    (foreign-procedure "CFBinaryHeapAddValue"
		       (CFBinaryHeapRef void*) void))
  (define CFBinaryHeapRemoveMinimumValue
    (foreign-procedure "CFBinaryHeapRemoveMinimumValue"
		       (CFBinaryHeapRef) void))
  (define CFBinaryHeapRemoveAllValues
    (foreign-procedure "CFBinaryHeapRemoveAllValues"
		       (CFBinaryHeapRef) void))
  )
