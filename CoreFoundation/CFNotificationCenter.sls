(library
  (CoreFoundation CFNotificationCenter)
  (export
    CFNotificationName
    CFNotificationCenterRef
    CFNotificationSuspensionBehavior
    CFNotificationCallback
    CFNotificationSuspensionBehaviorDrop
    CFNotificationSuspensionBehaviorCoalesce
    CFNotificationSuspensionBehaviorHold
    CFNotificationSuspensionBehaviorDeliverImmediately
    CFNotificationCenterGetTypeID
    CFNotificationCenterGetLocalCenter
    CFNotificationCenterGetDistributedCenter
    CFNotificationCenterGetDarwinNotifyCenter
    CFNotificationCenterAddObserver
    CFNotificationCenterRemoveObserver
    CFNotificationCenterRemoveEveryObserver
    CFNotificationCenterPostNotification
    CFNotificationCenterPostNotificationWithOptions)
  (import
    (chezscheme)
    (CoreFoundation CFBase)
    (CoreFoundation CFDictionary))

  ;;----------------------;;
  ;; CFNotificationCenter ;;
  ;;======================;;

  (define init
    (load-shared-object "CoreFoundation.framework/CoreFoundation"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [CFNotificationName CFStringRef]
    [CFNotificationCenterRef void*]
    [CFNotificationSuspensionBehavior CFIndex])
  (define-ftype
    [CFNotificationCallback (function (CFNotificationCenterRef void* CFNotificationName void* CFDictionaryRef) void)])

  ;;
  ;; Constants
  ;;

  ;; XXX: Apple forgot the k prefix on these names.
  (define CFNotificationSuspensionBehaviorDrop               1)
  (define CFNotificationSuspensionBehaviorCoalesce           2)
  (define CFNotificationSuspensionBehaviorHold               3)
  (define CFNotificationSuspensionBehaviorDeliverImmediately 4)

  ;;
  ;; Functions
  ;;

  (define CFNotificationCenterGetTypeID
    (foreign-procedure "CFNotificationCenterGetTypeID"
		       () CFTypeID))
  (define CFNotificationCenterGetLocalCenter
    (foreign-procedure "CFNotificationCenterGetLocalCenter"
		       () CFNotificationCenterRef))
  (define CFNotificationCenterGetDistributedCenter
    (foreign-procedure "CFNotificationCenterGetDistributedCenter"
		       () CFNotificationCenterRef))
  (define CFNotificationCenterGetDarwinNotifyCenter
    (foreign-procedure "CFNotificationCenterGetDarwinNotifyCenter"
		       () CFNotificationCenterRef))
  ;; XXX: Apple typed CFStringRef instead of CFNotificationName here.
  (define CFNotificationCenterAddObserver
    (foreign-procedure "CFNotificationCenterAddObserver"
		       (CFNotificationCenterRef void* (* CFNotificationCallback) CFStringRef void* CFNotificationSuspensionBehavior) void))
  (define CFNotificationCenterRemoveObserver
    (foreign-procedure "CFNotificationCenterRemoveObserver"
		       (CFNotificationCenterRef void* CFNotificationName void*) void))
  (define CFNotificationCenterRemoveEveryObserver
    (foreign-procedure "CFNotificationCenterRemoveEveryObserver"
		       (CFNotificationCenterRef void*) void))
  (define CFNotificationCenterPostNotification
    (foreign-procedure "CFNotificationCenterPostNotification"
		       (CFNotificationCenterRef CFNotificationName void* CFDictionaryRef Boolean) void))
  (define CFNotificationCenterPostNotificationWithOptions
    (foreign-procedure "CFNotificationCenterPostNotificationWithOptions"
		       (CFNotificationCenterRef CFNotificationName void* CFDictionaryRef CFOptionFlags) void))
  )
