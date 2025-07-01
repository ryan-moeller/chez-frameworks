(library
  (CoreFoundation CFBase)
  (export
    CFAllocatorRef
    CFTypeID
    CFOptionFlags
    CFHashCode
    CFIndex
    CFTypeRef
    CFStringRef
    CFMutableStringRef
    CFAllocatorRetainCallBack
    CFAllocatorReleaseCallBack
    CFAllocatorCopyDescriptionCallBack
    CFAllocatorAllocateCallBack
    CFAllocatorReallocateCallBack
    CFAllocatorDeallocateCallBack
    CFAllocatorPreferredSizeCallBack
    CFComparisonResult
    CFPropertyListRef
    CFRange
    CFAllocatorContext
    CFComparatorFunction
    kCFAllocatorDefault
    kCFAllocatorSystemDefault
    kCFAllocatorMalloc
    kCFAllocatorMallocZone
    kCFAllocatorNull
    kCFAllocatorUseContext
    kCFCompareLessThan
    kCFCompareEqual
    kCFCompareGreaterThan
    CFAllocatorGetTypeID
    CFAllocatorSetDefault
    CFAllocatorGetDefault
    CFAllocatorCreate
    CFAllocatorAllocate
    CFAllocatorReallocate
    CFAllocatorDeallocate
    CFAllocatorGetPreferredSizeForSize
    CFAllocatorGetContext
    CFGetTypeID
    CFCopyTypeIDDescription
    CFRetain
    CFRelease
    CFAutorelease
    CFGetRetainCount
    CFEqual
    CFHash
    CFCopyDescription
    CFGetAllocator)
  (import
    (chezscheme)
    (MacTypes))

  ;;--------;;
  ;; CFBase ;;
  ;;========;;

  (define init
    (load-shared-object "CoreFoundation.framework/CoreFoundation"))

  ;;
  ;; Types
  ;;

  (export (import (MacTypes)))
  (define-ftype
    [CFAllocatorRef void*]
    [CFTypeID unsigned-long]
    [CFOptionFlags unsigned-long]
    [CFHashCode unsigned-long]
    [CFIndex long]
    [CFTypeRef void*]
    [CFStringRef void*]
    [CFMutableStringRef void*])
  (define-ftype
    [CFAllocatorRetainCallBack (function (void*) void*)]
    [CFAllocatorReleaseCallBack (function (void*) void)]
    [CFAllocatorCopyDescriptionCallBack (function (void*) CFStringRef)]
    [CFAllocatorAllocateCallBack (function (CFIndex CFOptionFlags void*) void*)]
    [CFAllocatorReallocateCallBack (function (void* CFIndex CFOptionFlags void*) void*)]
    [CFAllocatorDeallocateCallBack (function (void* void*) void)]
    [CFAllocatorPreferredSizeCallBack (function (CFIndex CFOptionFlags void*) CFIndex)]
    [CFComparisonResult CFIndex]
    [CFPropertyListRef CFTypeRef]
    [CFRange (struct
	       [location CFIndex]
	       [length CFIndex])])
  (define-ftype
    [CFAllocatorContext (struct
			  [version CFIndex]
			  [info void*]
			  [retain (* CFAllocatorRetainCallBack)]
			  [release (* CFAllocatorReleaseCallBack)]
			  [copyDescription (* CFAllocatorCopyDescriptionCallBack)]
			  [allocate (* CFAllocatorAllocateCallBack)]
			  [reallocate (* CFAllocatorReallocateCallBack)]
			  [deallocate (* CFAllocatorDeallocateCallBack)]
			  [preferredSize (* CFAllocatorPreferredSizeCallBack)])]
    [CFComparatorFunction (function (void* void* void*) CFComparisonResult)])

  ;;
  ;; Constants
  ;;

  (define kCFAllocatorDefault
    (make-ftype-pointer CFAllocatorRef
			(foreign-entry "kCFAllocatorDefault")))
  (define kCFAllocatorSystemDefault
    (make-ftype-pointer CFAllocatorRef
			(foreign-entry "kCFAllocatorSystemDefault")))
  (define kCFAllocatorMalloc
    (make-ftype-pointer CFAllocatorRef
			(foreign-entry "kCFAllocatorMalloc")))
  (define kCFAllocatorMallocZone
    (make-ftype-pointer CFAllocatorRef
			(foreign-entry "kCFAllocatorMallocZone")))
  (define kCFAllocatorNull
    (make-ftype-pointer CFAllocatorRef
			(foreign-entry "kCFAllocatorNull")))
  (define kCFAllocatorUseContext
    (make-ftype-pointer CFAllocatorRef
			(foreign-entry "kCFAllocatorUseContext")))

  (define kCFCompareLessThan   -1)
  (define kCFCompareEqual       0)
  (define kCFCompareGreaterThan 1)

  ;;
  ;; Functions
  ;;

  (define CFAllocatorGetTypeID
    (foreign-procedure "CFAllocatorGetTypeID"
		       () CFTypeID))
  (define CFAllocatorSetDefault
    (foreign-procedure "CFAllocatorSetDefault"
		       (CFAllocatorRef) void))
  (define CFAllocatorGetDefault
    (foreign-procedure "CFAllocatorGetDefault"
		       () CFAllocatorRef))
  (define CFAllocatorCreate
    (foreign-procedure "CFAllocatorCreate"
		       (CFAllocatorRef (* CFAllocatorContext)) CFAllocatorRef))
  (define CFAllocatorAllocate
    (foreign-procedure "CFAllocatorAllocate"
		       (CFAllocatorRef CFIndex CFOptionFlags) void*))
  (define CFAllocatorReallocate
    (foreign-procedure "CFAllocatorReallocate"
		       (CFAllocatorRef void* CFIndex CFOptionFlags) void*))
  (define CFAllocatorDeallocate
    (foreign-procedure "CFAllocatorDeallocate"
		       (CFAllocatorRef void*) void))
  (define CFAllocatorGetPreferredSizeForSize
    (foreign-procedure "CFAllocatorGetPreferredSizeForSize"
		       (CFAllocatorRef CFIndex CFOptionFlags) CFIndex))
  (define CFAllocatorGetContext
    (foreign-procedure "CFAllocatorGetContext"
		       (CFAllocatorRef (* CFAllocatorContext)) void))

  (define CFGetTypeID
    (foreign-procedure "CFGetTypeID"
		       (CFTypeRef) CFTypeID))
  (define CFCopyTypeIDDescription
    (foreign-procedure "CFCopyTypeIDDescription"
		       (CFTypeID) CFStringRef))
  (define CFRetain
    (foreign-procedure "CFRetain"
		       (CFTypeRef) CFTypeRef))
  (define CFRelease
    (foreign-procedure "CFRelease"
		       (CFTypeRef) void))
  (define CFAutorelease
    (foreign-procedure "CFAutorelease"
		       (CFTypeRef) CFTypeRef))
  (define CFGetRetainCount
    (foreign-procedure "CFGetRetainCount"
		       (CFTypeRef) CFIndex))
  (define CFEqual
    (foreign-procedure "CFEqual"
		       (CFTypeRef CFTypeRef) Boolean))
  (define CFHash
    (foreign-procedure "CFHash"
		       (CFTypeRef) CFHashCode))
  (define CFCopyDescription
    (foreign-procedure "CFCopyDescription"
		       (CFTypeRef) CFStringRef))
  (define CFGetAllocator
    (foreign-procedure "CFGetAllocator"
		       (CFTypeRef) CFAllocatorRef))
  )
