(library
  (CoreFoundation CFDictionary)
  (export
    CFDictionaryRef
    CFMutableDictionaryRef
    CFDictionaryApplierFunction
    CFDictionaryRetainCallBack
    CFDictionaryReleaseCallBack
    CFDictionaryCopyDescriptionCallBack
    CFDictionaryEqualCallBack
    CFDictionaryHashCallBack
    CFDictionaryKeyCallBacks
    CFDictionaryValueCallBacks
    kCFTypeDictionaryKeyCallBacks
    kCFCopyStringDictionaryKeyCallBacks
    kCFTypeDictionaryValueCallBacks
    CFDictionaryAddValue
    CFDictionaryApplyFunction
    CFDictionaryContainsKey
    CFDictionaryContainsValue
    CFDictionaryCreate
    CFDictionaryCreateCopy
    CFDictionaryCreateMutable
    CFDictionaryCreateMutableCopy
    CFDictionaryGetCount
    CFDictionaryGetCountOfKey
    CFDictionaryGetCountOfValue
    CFDictionaryGetKeysAndValues
    CFDictionaryGetTypeID
    CFDictionaryGetValue
    CFDictionaryGetValueIfPresent
    CFDictionaryRemoveAllValues
    CFDictionaryRemoveValue
    CFDictionaryReplaceValue
    CFDictionarySetValue)
  (import
    (chezscheme)
    (CoreFoundation CFBase))

  ;;--------------;;
  ;; CFDictionary ;;
  ;;==============;;

  (define init
    (load-shared-object "CoreFoundation.framework/CoreFoundation"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [CFDictionaryRef void*]
    [CFMutableDictionaryRef void*]
    [CFDictionaryApplierFunction (function (void* void* void*) void)]
    [CFDictionaryRetainCallBack (function (CFAllocatorRef void*) void*)]
    [CFDictionaryReleaseCallBack (function (CFAllocatorRef void*) void)]
    [CFDictionaryCopyDescriptionCallBack (function (void*) CFStringRef)]
    [CFDictionaryEqualCallBack (function (void* void*) Boolean)]
    [CFDictionaryHashCallBack (function (void*) CFHashCode)])
  (define-ftype
    [CFDictionaryKeyCallBacks (struct
				[version CFIndex]
				[retain (* CFDictionaryRetainCallBack)]
				[release (* CFDictionaryReleaseCallBack)]
				[copyDescription (* CFDictionaryCopyDescriptionCallBack)]
				[equal (* CFDictionaryEqualCallBack)]
				[hash (* CFDictionaryHashCallBack)])]
    [CFDictionaryValueCallBacks (struct
				  [version CFIndex]
				  [retain (* CFDictionaryRetainCallBack)]
				  [release (* CFDictionaryReleaseCallBack)]
				  [copyDescription (* CFDictionaryCopyDescriptionCallBack)]
				  [equal (* CFDictionaryEqualCallBack)])])

  ;;
  ;; Constants
  ;;

  (define kCFTypeDictionaryKeyCallBacks
    (make-ftype-pointer CFDictionaryKeyCallBacks
			(foreign-entry "kCFTypeDictionaryKeyCallBacks")))
  (define kCFCopyStringDictionaryKeyCallBacks
    (make-ftype-pointer CFDictionaryKeyCallBacks
			(foreign-entry "kCFCopyStringDictionaryKeyCallBacks")))
  (define kCFTypeDictionaryValueCallBacks
    (make-ftype-pointer CFDictionaryValueCallBacks
			(foreign-entry "kCFTypeDictionaryValueCallBacks")))

  ;;
  ;; Functions
  ;;

  (define CFDictionaryAddValue
    (foreign-procedure "CFDictionaryAddValue"
		       (CFMutableDictionaryRef void* void*) void))
  (define CFDictionaryApplyFunction
    (foreign-procedure "CFDictionaryApplyFunction"
		       (CFDictionaryRef (* CFDictionaryApplierFunction) void*) void))
  (define CFDictionaryContainsKey
    (foreign-procedure "CFDictionaryContainsKey"
		       (CFDictionaryRef void*) Boolean))
  (define CFDictionaryContainsValue
    (foreign-procedure "CFDictionaryContainsValue"
		       (CFDictionaryRef void*) Boolean))
  (define CFDictionaryCreate
    (foreign-procedure "CFDictionaryCreate"
		       (CFAllocatorRef (* void*) (* void*) CFIndex (* CFDictionaryKeyCallBacks) (* CFDictionaryValueCallBacks)) CFDictionaryRef))
  (define CFDictionaryCreateCopy
    (foreign-procedure "CFDictionaryCreateCopy"
		       (CFAllocatorRef CFDictionaryRef) CFDictionaryRef))
  (define CFDictionaryCreateMutable
    (foreign-procedure "CFDictionaryCreateMutable"
		       (CFAllocatorRef CFIndex (* CFDictionaryKeyCallBacks) (* CFDictionaryValueCallBacks)) CFMutableDictionaryRef))
  (define CFDictionaryCreateMutableCopy
    (foreign-procedure "CFDictionaryCreateMutableCopy"
		       (CFAllocatorRef CFIndex CFDictionaryRef) CFMutableDictionaryRef))
  (define CFDictionaryGetCount
    (foreign-procedure "CFDictionaryGetCount"
		       (CFDictionaryRef) CFIndex))
  (define CFDictionaryGetCountOfKey
    (foreign-procedure "CFDictionaryGetCountOfKey"
		       (CFDictionaryRef void*) CFIndex))
  (define CFDictionaryGetCountOfValue
    (foreign-procedure "CFDictionaryGetCountOfValue"
		       (CFDictionaryRef void*) CFIndex))
  ;; CFDictionaryGetKeyIfPresent "Apple private"
  (define CFDictionaryGetKeysAndValues
    (foreign-procedure "CFDictionaryGetKeysAndValues"
		       (CFDictionaryRef (* void*) (* void*)) void))
  (define CFDictionaryGetTypeID
    (foreign-procedure "CFDictionaryGetTypeID"
		       () CFTypeID))
  (define CFDictionaryGetValue
    (foreign-procedure "CFDictionaryGetValue"
		       (CFDictionaryRef void*) void*))
  (define CFDictionaryGetValueIfPresent
    (foreign-procedure "CFDictionaryGetValueIfPresent"
		       (CFDictionaryRef void* (* void*)) Boolean))
  (define CFDictionaryRemoveAllValues
    (foreign-procedure "CFDictionaryRemoveAllValues"
		       (CFMutableDictionaryRef) void))
  (define CFDictionaryRemoveValue
    (foreign-procedure "CFDictionaryRemoveValue"
		       (CFMutableDictionaryRef void*) void))
  (define CFDictionaryReplaceValue
    (foreign-procedure "CFDictionaryReplaceValue"
		       (CFMutableDictionaryRef void* void*) void))
  (define CFDictionarySetValue
    (foreign-procedure "CFDictionarySetValue"
		       (CFMutableDictionaryRef void* void*) void))
  )
