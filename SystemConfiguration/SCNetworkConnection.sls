(library
  (SystemConfiguration SCNetworkConnection)
  (export
    SCNetworkConnectionRef
    SCNetworkConnectionContext
    SCNetworkConnectionStatus
    SCNetworkConnectionPPPStatus
    SCNetworkConnectionCallBack
    kSCNetworkConnectionInvalid
    kSCNetworkConnectionDisconnected
    kSCNetworkConnectionConnecting
    kSCNetworkConnectionConnected
    kSCNetworkConnectionDisconnecting
    kSCNetworkConnectionPPPDisconnected
    kSCNetworkConnectionPPPInitializing
    kSCNetworkConnectionPPPConnectingLink
    kSCNetworkConnectionPPPDialOnTraffic
    kSCNetworkConnectionPPPNegotiatingLink
    kSCNetworkConnectionPPPAuthenticating
    kSCNetworkConnectionPPPWaitingForCallBack
    kSCNetworkConnectionPPPNegotiatingNetwork
    kSCNetworkConnectionPPPConnected
    kSCNetworkConnectionPPPTerminating
    kSCNetworkConnectionPPPDisconnectingLink
    kSCNetworkConnectionPPPHoldingLinkOff
    kSCNetworkConnectionPPPSuspended
    kSCNetworkConnectionPPPWaitingForRedial
    kSCNetworkConnectionBytesIn
    kSCNetworkConnectionBytesOut
    kSCNetworkConnectionPacketsIn
    kSCNetworkConnectionPacketsOut
    kSCNetworkConnectionErrorsIn
    kSCNetworkConnectionErrorsOut
    kSCNetworkConnectionSelectionOptionOnDemandHostName
    kSCNetworkConnectionSelectionOptionOnDemandRetry
    SCNetworkConnectionGetTypeID
    SCNetworkConnectionCopyUserPreferences
    SCNetworkConnectionCreateWithServiceID
    SCNetworkConnectionCopyServiceID
    SCNetworkConnectionGetStatus
    SCNetworkConnectionCopyExtendedStatus
    SCNetworkConnectionCopyStatistics
    SCNetworkConnectionStart
    SCNetworkConnectionStop
    SCNetworkConnectionCopyUserOptions
    SCNetworkConnectionScheduleWithRunLoop
    SCNetworkConnectionUnscheduleFromRunLoop)
  (import
    (chezscheme)
    (CoreFoundation))

  ;;---------------------;;
  ;; SCNetworkConnection ;;
  ;;=====================;;

  (define init
    (load-shared-object "SystemConfiguration.framework/SystemConfiguration"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [SCNetworkConnectionRef void*]
    [SCNetworkConnectionContext (struct
				  [version CFIndex]
				  [info void*]
				  [retain (* (function (void*) void*))]
				  [release (* (function (void*) void))]
				  [copyDescription (* (function (void*) CFStringRef))])]
    [SCNetworkConnectionStatus integer-32]
    [SCNetworkConnectionPPPStatus integer-32])
  (define-ftype
    [SCNetworkConnectionCallBack (function (SCNetworkConnectionRef SCNetworkConnectionStatus void*) void)])

  ;;
  ;; Constants
  ;;

  (define kSCNetworkConnectionInvalid      -1)
  (define kSCNetworkConnectionDisconnected  0)
  (define kSCNetworkConnectionConnecting    1)
  (define kSCNetworkConnectionConnected     2)
  (define kSCNetworkConnectionDisconnecting 3)

  (define kSCNetworkConnectionPPPDisconnected       0)
  (define kSCNetworkConnectionPPPInitializing       1)
  (define kSCNetworkConnectionPPPConnectingLink     2)
  (define kSCNetworkConnectionPPPDialOnTraffic      3)
  (define kSCNetworkConnectionPPPNegotiatingLink    4)
  (define kSCNetworkConnectionPPPAuthenticating     5)
  (define kSCNetworkConnectionPPPWaitingForCallBack 6)
  (define kSCNetworkConnectionPPPNegotiatingNetwork 7)
  (define kSCNetworkConnectionPPPConnected          8)
  (define kSCNetworkConnectionPPPTerminating        9)
  (define kSCNetworkConnectionPPPDisconnectingLink 10)
  (define kSCNetworkConnectionPPPHoldingLinkOff    11)
  (define kSCNetworkConnectionPPPSuspended         12)
  (define kSCNetworkConnectionPPPWaitingForRedial  13)

  (define kSCNetworkConnectionBytesIn (CFSTR "BytesIn"))
  (define kSCNetworkConnectionBytesOut (CFSTR "BytesOut"))
  (define kSCNetworkConnectionPacketsIn (CFSTR "PacketsIn"))
  (define kSCNetworkConnectionPacketsOut (CFSTR "PacketsOut"))
  (define kSCNetworkConnectionErrorsIn (CFSTR "ErrorsIn"))
  (define kSCNetworkConnectionErrorsOut (CFSTR "ErrorsOut"))

  (define kSCNetworkConnectionSelectionOptionOnDemandHostName (CFSTR "OnDemandHostName"))
  (define kSCNetworkConnectionSelectionOptionOnDemandRetry (CFSTR "OnDemandRetry"))

  ;;
  ;; Functions
  ;;

  (define SCNetworkConnectionGetTypeID
    (foreign-procedure "SCNetworkConnectionGetTypeID"
		       () CFTypeID))
  (define SCNetworkConnectionCopyUserPreferences
    (foreign-procedure "SCNetworkConnectionCopyUserPreferences"
		       (CFDictionaryRef CFStringRef CFDictionaryRef) Boolean))
  (define SCNetworkConnectionCreateWithServiceID
    (foreign-procedure "SCNetworkConnectionCreateWithServiceID"
		       (CFAllocatorRef CFStringRef (* SCNetworkConnectionCallBack) (* SCNetworkConnectionContext)) SCNetworkConnectionRef))
  (define SCNetworkConnectionCopyServiceID
    (foreign-procedure "SCNetworkConnectionCopyServiceID"
		       (SCNetworkConnectionRef) CFStringRef))
  (define SCNetworkConnectionGetStatus
    (foreign-procedure "SCNetworkConnectionGetStatus"
		       (SCNetworkConnectionRef) SCNetworkConnectionStatus))
  (define SCNetworkConnectionCopyExtendedStatus
    (foreign-procedure "SCNetworkConnectionCopyExtendedStatus"
		       (SCNetworkConnectionRef) CFDictionaryRef))
  (define SCNetworkConnectionCopyStatistics
    (foreign-procedure "SCNetworkConnectionCopyStatistics"
		       (SCNetworkConnectionRef) CFDictionaryRef))
  (define SCNetworkConnectionStart
    (foreign-procedure "SCNetworkConnectionStart"
		       (SCNetworkConnectionRef CFDictionaryRef Boolean) Boolean))
  (define SCNetworkConnectionStop
    (foreign-procedure "SCNetworkConnectionStop"
		       (SCNetworkConnectionRef Boolean) Boolean))
  (define SCNetworkConnectionCopyUserOptions
    (foreign-procedure "SCNetworkConnectionCopyUserOptions"
		       (SCNetworkConnectionRef) CFDictionaryRef))
  (define SCNetworkConnectionScheduleWithRunLoop
    (foreign-procedure "SCNetworkConnectionScheduleWithRunLoop"
		       (SCNetworkConnectionRef CFRunLoopRef CFStringRef) Boolean))
  (define SCNetworkConnectionUnscheduleFromRunLoop
    (foreign-procedure "SCNetworkConnectionUnscheduleFromRunLoop"
		       (SCNetworkConnectionRef CFRunLoopRef CFStringRef) Boolean))
  )
