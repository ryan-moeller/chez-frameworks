(library
  (SystemConfiguration SCDynamicStoreCopySpecific)
  (export
    SCDynamicStoreCopyComputerName
    SCDynamicStoreCopyConsoleUser
    SCDynamicStoreCopyLocalHostName
    SCDynamicStoreCopyLocation
    SCDynamicStoreCopyProxies)
  (import
    (chezscheme)
    (CoreFoundation)
    (SystemConfiguration SCDynamicStore))

  ;;----------------------------;;
  ;; SCDynamicStoreCopySpecific ;;
  ;;============================;;

  (define init
    (load-shared-object "SystemConfiguration.framework/SystemConfiguration"))

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

  (define SCDynamicStoreCopyComputerName
    (foreign-procedure "SCDynamicStoreCopyComputerName"
		       (SCDynamicStoreRef (* CFStringEncoding)) CFStringRef))
  ;; XXX: punting uid_t and gid_t
  (define SCDynamicStoreCopyConsoleUser
    (foreign-procedure "SCDynamicStoreCopyConsoleUser"
		       (SCDynamicStoreRef (* unsigned-32) (* unsigned-32)) CFStringRef))
  (define SCDynamicStoreCopyLocalHostName
    (foreign-procedure "SCDynamicStoreCopyLocalHostName"
		       (SCDynamicStoreRef) CFStringRef))
  (define SCDynamicStoreCopyLocation
    (foreign-procedure "SCDynamicStoreCopyLocation"
		       (SCDynamicStoreRef) CFStringRef))
  (define SCDynamicStoreCopyProxies
    (foreign-procedure "SCDynamicStoreCopyProxies"
		       (SCDynamicStoreRef) CFDictionaryRef))
  )
