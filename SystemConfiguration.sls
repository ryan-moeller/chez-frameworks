(library
  (SystemConfiguration)
  (export
    kSCStatusOK
    kSCStatusFailed
    kSCStatusInvalidArgument
    kSCStatusAccessError
    kSCStatusNoKey
    kSCStatusKeyExists
    kSCStatusLocked
    kSCStatusNeedLock
    kSCStatusNoStoreSession
    kSCStatusNoStoreServer
    kSCStatusNotifierActive
    kSCStatusNoPrefsSession
    kSCStatusPrefsBusy
    kSCStatusNoConfigFile
    kSCStatusNoLink
    kSCStatusStale
    kSCStatusMaxLink
    kSCStatusReachabilityUnknown
    kSCStatusConnectionNoService
    kSCStatusConnectionIgnore
    kCFErrorDomainSystemConfiguration
    SCCopyLastError
    SCError
    SCErrorString)
  (import
    (chezscheme)
    (CoreFoundation))

  ;;---------------------;;
  ;; SystemConfiguration ;;
  ;;=====================;;

  (define init
    (load-shared-object "SystemConfiguration.framework/SystemConfiguration"))

  (export
    (import (SystemConfiguration SCDynamicStore))
    (import (SystemConfiguration SCDynamicStoreKey))
    (import (SystemConfiguration SCDynamicStoreCopySpecific))

    (import (SystemConfiguration SCPreferences))
    (import (SystemConfiguration SCPreferencesPath))
    (import (SystemConfiguration SCPreferencesSetSpecific))

    (import (SystemConfiguration SCSchemaDefinitions))

    (import (SystemConfiguration SCNetworkConfiguration))

    ;;(import (SystemConfiguration SCNetwork)) deprecated
    (import (SystemConfiguration SCNetworkReachability))
    (import (SystemConfiguration SCNetworkConnection))
    )

  (define kSCStatusOK                     0)
  (define kSCStatusFailed              1001)
  (define kSCStatusInvalidArgument     1002)
  (define kSCStatusAccessError         1003)
  (define kSCStatusNoKey               1004)
  (define kSCStatusKeyExists           1005)
  (define kSCStatusLocked              1006)
  (define kSCStatusNeedLock            1007)
  (define kSCStatusNoStoreSession      2001)
  (define kSCStatusNoStoreServer       2002)
  (define kSCStatusNotifierActive      2003)
  (define kSCStatusNoPrefsSession      3001)
  (define kSCStatusPrefsBusy           3002)
  (define kSCStatusNoConfigFile        3003)
  (define kSCStatusNoLink              3004)
  (define kSCStatusStale               3005)
  (define kSCStatusMaxLink             3006)
  (define kSCStatusReachabilityUnknown 4001)
  (define kSCStatusConnectionNoService 5001)
  (define kSCStatusConnectionIgnore    5002)

  (define kCFErrorDomainSystemConfiguration
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFErrorDomainSystemConfiguration")))

  (define SCCopyLastError
    (foreign-procedure "SCCopyLastError"
		       () CFErrorRef))
  (define SCError
    (foreign-procedure "SCError"
		       () int))
  (define SCErrorString
    (foreign-procedure "SCErrorString"
		       (int) string))
  )
