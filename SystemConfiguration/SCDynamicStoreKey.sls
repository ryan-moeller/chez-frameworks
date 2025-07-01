(library
  (SystemConfiguration SCDynamicStoreKey)
  (export
    SCDynamicStoreKeyCreate
    SCDynamicStoreKeyCreateNetworkGlobalEntity
    SCDynamicStoreKeyCreateNetworkInterface
    SCDynamicStoreKeyCreateNetworkInterfaceEntity
    SCDynamicStoreKeyCreateNetworkServiceEntity
    SCDynamicStoreKeyCreateComputerName
    SCDynamicStoreKeyCreateConsoleUser
    SCDynamicStoreKeyCreateHostNames
    SCDynamicStoreKeyCreateLocation
    SCDynamicStoreKeyCreateProxies)
  (import
    (chezscheme)
    (CoreFoundation))

  ;;-------------------;;
  ;; SCDynamicStoreKey ;;
  ;;===================;;

  ;;
  ;; Types
  ;;

  ;; (none defined)

  ;;
  ;; Constants
  ;;

  ;; (none defined)

  ;;
  ;; Functions
  ;;

  (define SCDynamicStoreKeyCreate
    (foreign-procedure "SCDynamicStoreKeyCreate"
		       (CFAllocatorRef CFStringRef) CFStringRef))
  (define SCDynamicStoreKeyCreateNetworkGlobalEntity
    (foreign-procedure "SCDynamicStoreKeyCreateNetworkGlobalEntity"
		       (CFAllocatorRef CFStringRef CFStringRef) CFStringRef))
  (define SCDynamicStoreKeyCreateNetworkInterface
    (foreign-procedure "SCDynamicStoreKeyCreateNetworkInterface"
		       (CFAllocatorRef CFStringRef) CFStringRef))
  (define SCDynamicStoreKeyCreateNetworkInterfaceEntity
    (foreign-procedure "SCDynamicStoreKeyCreateNetworkInterfaceEntity"
		       (CFAllocatorRef CFStringRef CFStringRef CFStringRef) CFStringRef))
  (define SCDynamicStoreKeyCreateNetworkServiceEntity
    (foreign-procedure "SCDynamicStoreKeyCreateNetworkServiceEntity"
		       (CFAllocatorRef CFStringRef CFStringRef CFStringRef) CFStringRef))
  (define SCDynamicStoreKeyCreateComputerName
    (foreign-procedure "SCDynamicStoreKeyCreateComputerName"
		       (CFAllocatorRef) CFStringRef))
  (define SCDynamicStoreKeyCreateConsoleUser
    (foreign-procedure "SCDynamicStoreKeyCreateConsoleUser"
		       (CFAllocatorRef) CFStringRef))
  (define SCDynamicStoreKeyCreateHostNames
    (foreign-procedure "SCDynamicStoreKeyCreateHostNames"
		       (CFAllocatorRef) CFStringRef))
  (define SCDynamicStoreKeyCreateLocation
    (foreign-procedure "SCDynamicStoreKeyCreateLocation"
		       (CFAllocatorRef) CFStringRef))
  (define SCDynamicStoreKeyCreateProxies
    (foreign-procedure "SCDynamicStoreKeyCreateProxies"
		       (CFAllocatorRef) CFStringRef))
  )
