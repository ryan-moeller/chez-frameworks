(library
  (CoreFoundation CFArray)
  (export
    CFArrayRef
    CFMutableArrayRef
    CFArrayApplierFunction
    CFArrayRetainCallBack
    CFArrayReleaseCallBack
    CFArrayCopyDescriptionCallBack
    CFArrayEqualCallBack
    CFArrayCallBacks
    kCFTypeArrayCallBacks
    CFArrayAppendArray
    CFArrayAppendValue
    CFArrayApplyFunction
    CFArrayBSearchValues
    CFArrayContainsValue
    CFArrayCreate
    CFArrayCreateCopy
    CFArrayCreateMutable
    CFArrayCreateMutableCopy
    CFArrayExchangeValuesAtIndices
    CFArrayGetCount
    CFArrayGetCountOfValue
    CFArrayGetFirstIndexOfValue
    CFArrayGetLastIndexOfValue
    CFArrayGetTypeID
    CFArrayGetValueAtIndex
    CFArrayGetValues
    CFArrayInsertValueAtIndex
    CFArrayRemoveAllValues
    CFArrayRemoveValueAtIndex
    CFArrayReplaceValues
    CFArraySetValueAtIndex
    CFArraySortValues)
  (import
    (chezscheme)
    (CoreFoundation CFBase))

  ;;---------;;
  ;; CFArray ;;
  ;;=========;;

  (define init
    (load-shared-object "CoreFoundation.framework/CoreFoundation"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [CFArrayRef void*]
    [CFMutableArrayRef void*]
    [CFArrayApplierFunction (function (void* void*) void)]
    [CFArrayRetainCallBack (function (CFAllocatorRef void*) void*)]
    [CFArrayReleaseCallBack (function (CFAllocatorRef void*) void)]
    [CFArrayCopyDescriptionCallBack (function (void*) CFStringRef)]
    [CFArrayEqualCallBack (function (void* void*) Boolean)])
  (define-ftype
    [CFArrayCallBacks (struct
			[version CFIndex]
			[retain (* CFArrayRetainCallBack)]
			[release (* CFArrayReleaseCallBack)]
			[copyDescription (* CFArrayCopyDescriptionCallBack)]
			[equal (* CFArrayEqualCallBack)])])

  ;;
  ;; Constants
  ;;

  (define kCFTypeArrayCallBacks
    (make-ftype-pointer CFArrayCallBacks
			(foreign-entry "kCFTypeArrayCallBacks")))

  ;;
  ;; Functions
  ;;

  (define CFArrayAppendArray
    (foreign-procedure "CFArrayAppendArray"
		       (CFMutableArrayRef CFArrayRef (& CFRange)) void))
  (define CFArrayAppendValue
    (foreign-procedure "CFArrayAppendValue"
		       (CFMutableArrayRef void*) void))
  (define CFArrayApplyFunction
    (foreign-procedure "CFArrayApplyFunction"
		       (CFArrayRef (& CFRange) (* CFArrayApplierFunction) void*) void))
  (define CFArrayBSearchValues
    (foreign-procedure "CFArrayBSearchValues"
		       (CFArrayRef (& CFRange) void* (* CFComparatorFunction) void*) CFIndex))
  (define CFArrayContainsValue
    (foreign-procedure "CFArrayContainsValue"
		       (CFArrayRef (& CFRange) void*) Boolean))
  (define CFArrayCreate
    (foreign-procedure "CFArrayCreate"
		       (CFAllocatorRef (* void*) CFIndex (* CFArrayCallBacks)) CFArrayRef))
  (define CFArrayCreateCopy
    (foreign-procedure "CFArrayCreateCopy"
		       (CFAllocatorRef CFArrayRef) CFArrayRef))
  (define CFArrayCreateMutable
    (foreign-procedure "CFArrayCreateMutable"
		       (CFAllocatorRef CFIndex (* CFArrayCallBacks)) CFMutableArrayRef))
  (define CFArrayCreateMutableCopy
    (foreign-procedure "CFArrayCreateMutableCopy"
		       (CFAllocatorRef CFIndex CFArrayRef) CFMutableArrayRef))
  (define CFArrayExchangeValuesAtIndices
    (foreign-procedure "CFArrayExchangeValuesAtIndices"
		       (CFMutableArrayRef CFIndex CFIndex) void))
  (define CFArrayGetCount
    (foreign-procedure "CFArrayGetCount"
		       (CFArrayRef) CFIndex))
  (define CFArrayGetCountOfValue
    (foreign-procedure "CFArrayGetCountOfValue"
		       (CFArrayRef (& CFRange) void*) CFIndex))
  (define CFArrayGetFirstIndexOfValue
    (foreign-procedure "CFArrayGetFirstIndexOfValue"
		       (CFArrayRef (& CFRange) void*) CFIndex))
  (define CFArrayGetLastIndexOfValue
    (foreign-procedure "CFArrayGetLastIndexOfValue"
		       (CFArrayRef (& CFRange) void*) CFIndex))
  (define CFArrayGetTypeID
    (foreign-procedure "CFArrayGetTypeID"
		       () CFTypeID))
  (define CFArrayGetValueAtIndex
    (foreign-procedure "CFArrayGetValueAtIndex"
		       (CFArrayRef CFIndex) void*))
  (define CFArrayGetValues
    (foreign-procedure "CFArrayGetValues"
		       (CFArrayRef (& CFRange) (* void*)) void))
  (define CFArrayInsertValueAtIndex
    (foreign-procedure "CFArrayInsertValueAtIndex"
		       (CFMutableArrayRef CFIndex void*) void))
  (define CFArrayRemoveAllValues
    (foreign-procedure "CFArrayRemoveAllValues"
		       (CFMutableArrayRef) void))
  (define CFArrayRemoveValueAtIndex
    (foreign-procedure "CFArrayRemoveValueAtIndex"
		       (CFMutableArrayRef CFIndex) void))
  (define CFArrayReplaceValues
    (foreign-procedure "CFArrayReplaceValues"
		       (CFMutableArrayRef (& CFRange) (* void*) CFIndex) void))
  (define CFArraySetValueAtIndex
    (foreign-procedure "CFArraySetValueAtIndex"
		       (CFMutableArrayRef CFIndex void*) void))
  (define CFArraySortValues
    (foreign-procedure "CFArraySortValues"
		       (CFMutableArrayRef (& CFRange) (* CFComparatorFunction) void*) void))
  )
