(library
  (CoreFoundation CFFileDescriptor)
  (export
    CFFileDescriptorNativeDescriptor
    CFFileDescriptorRef
    CFFileDescriptorContext
    CFFileDescriptorCallBack
    kCFFileDescriptorReadCallBack
    kCFFileDescriptorWriteCallBack
    CFFileDescriptorGetTypeID
    CFFileDescriptorCreate
    CFFileDescriptorGetNativeDescriptor
    CFFileDescriptorGetContext
    CFFileDescriptorEnableCallBacks
    CFFileDescriptorDisableCallBacks
    CFFileDescriptorInvalidate
    CFFileDescriptorIsValid
    CFFileDescriptorCreateRunLoopSource)
  (import
    (chezscheme)
    (CoreFoundation CFBase)
    (CoreFoundation CFRunLoop))

  ;;------------------;;
  ;; CFFileDescriptor ;;
  ;;==================;;

  (define init
    (load-shared-object "CoreFoundation.framework/CoreFoundation"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [CFFileDescriptorNativeDescriptor int]
    [CFFileDescriptorRef void*]
    [CFFileDescriptorContext (struct
			       [version CFIndex]
			       [info void*]
			       [retain (* (function (void*) void*))]
			       [release (* (function (void*) void))]
			       [copyDescription (* (function (void*) CFStringRef))])])
  (define-ftype
    [CFFileDescriptorCallBack (function (CFFileDescriptorRef CFOptionFlags void*) void)])

  ;;
  ;; Constants
  ;;

  (define kCFFileDescriptorReadCallBack  #x1)
  (define kCFFileDescriptorWriteCallBack #x2)

  ;;
  ;; Functions
  ;;

  (define CFFileDescriptorGetTypeID
    (foreign-procedure "CFFileDescriptorGetTypeID"
		       () CFTypeID))
  (define CFFileDescriptorCreate
    (foreign-procedure "CFFileDescriptorCreate"
		       (CFAllocatorRef CFFileDescriptorNativeDescriptor Boolean (* CFFileDescriptorCallBack) (* CFFileDescriptorContext)) CFFileDescriptorRef))
  (define CFFileDescriptorGetNativeDescriptor
    (foreign-procedure "CFFileDescriptorGetNativeDescriptor"
		       (CFFileDescriptorRef) CFFileDescriptorNativeDescriptor))
  (define CFFileDescriptorGetContext
    (foreign-procedure "CFFileDescriptorGetContext"
		       (CFFileDescriptorRef (* CFFileDescriptorContext)) void))
  (define CFFileDescriptorEnableCallBacks
    (foreign-procedure "CFFileDescriptorEnableCallBacks"
		       (CFFileDescriptorRef CFOptionFlags) void))
  (define CFFileDescriptorDisableCallBacks
    (foreign-procedure "CFFileDescriptorDisableCallBacks"
		       (CFFileDescriptorRef CFOptionFlags) void))
  (define CFFileDescriptorInvalidate
    (foreign-procedure "CFFileDescriptorInvalidate"
		       (CFFileDescriptorRef) void))
  (define CFFileDescriptorIsValid
    (foreign-procedure "CFFileDescriptorIsValid"
		       (CFFileDescriptorRef) Boolean))
  (define CFFileDescriptorCreateRunLoopSource
    (foreign-procedure "CFFileDescriptorCreateRunLoopSource"
		       (CFAllocatorRef CFFileDescriptorRef CFIndex) CFRunLoopSourceRef))
  )
