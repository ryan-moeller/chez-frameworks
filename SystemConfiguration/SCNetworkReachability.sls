(library
  (SystemConfiguration SCNetworkReachability)
  (export
    SCNetworkReachabilityRef
    SCNetworkReachabilityContext
    SCNetworkReachabilityFlags
    SCNetworkReachabilityCallBack
    kSCNetworkReachabilityFlagsTransientConnection
    kSCNetworkReachabilityFlagsReachable
    kSCNetworkReachabilityFlagsConnectionRequired
    kSCNetworkReachabilityFlagsConnectionOnTraffic
    kSCNetworkReachabilityFlagsInterventionRequired
    kSCNetworkReachabilityFlagsConnectionOnDemand
    kSCNetworkReachabilityFlagsIsLocalAddress
    kSCNetworkReachabilityFlagsIsDirect
    kSCNetworkReachabilityFlagsIsWWAN
    kSCNetworkReachabilityFlagsConnectionAutomatic
    SCNetworkReachabilityCreateWithAddress
    SCNetworkReachabilityCreateWithAddressPair
    SCNetworkReachabilityCreateWithName
    SCNetworkReachabilityGetTypeID
    SCNetworkReachabilityGetFlags
    SCNetworkReachabilitySetCallBack
    SCNetworkReachabilityScheduleWithRunLoop
    SCNetworkReachabilityUnscheduleFromRunLoop)
  (import
    (chezscheme)
    (CoreFoundation))

  ;;-----------------------;;
  ;; SCNetworkReachability ;;
  ;;=======================;;

  (define init
    (load-shared-object "SystemConfiguration.framework/SystemConfiguration"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [SCNetworkReachabilityRef void*]
    [SCNetworkReachabilityContext (struct
				    [version CFIndex]
				    [info void*]
				    [retain (* (function (void*) void*))]
				    [release (* (function (void*) void))]
				    [copyDescription (* (function (void*) CFStringRef))])]
    [SCNetworkReachabilityFlags unsigned-32])
  (define-ftype
    [SCNetworkReachabilityCallBack (function (SCNetworkReachabilityRef SCNetworkReachabilityFlags void*) void)])

  ;;
  ;; Constants
  ;;

  (define kSCNetworkReachabilityFlagsTransientConnection  #x00000001)
  (define kSCNetworkReachabilityFlagsReachable            #x00000002)
  (define kSCNetworkReachabilityFlagsConnectionRequired   #x00000004)
  (define kSCNetworkReachabilityFlagsConnectionOnTraffic  #x00000008)
  (define kSCNetworkReachabilityFlagsInterventionRequired #x00000010)
  (define kSCNetworkReachabilityFlagsConnectionOnDemand   #x00000020)
  (define kSCNetworkReachabilityFlagsIsLocalAddress       #x00010000)
  (define kSCNetworkReachabilityFlagsIsDirect             #x00020000)
  (define kSCNetworkReachabilityFlagsIsWWAN               #x00040000)
  (define kSCNetworkReachabilityFlagsConnectionAutomatic
    kSCNetworkReachabilityFlagsConnectionOnTraffic)

  ;;
  ;; Functions
  ;;

  ;; TODO: sockaddr
  (define SCNetworkReachabilityCreateWithAddress
    (foreign-procedure "SCNetworkReachabilityCreateWithAddress"
		       (CFAllocatorRef void*) SCNetworkReachabilityRef))
  (define SCNetworkReachabilityCreateWithAddressPair
    (foreign-procedure "SCNetworkReachabilityCreateWithAddressPair"
		       (CFAllocatorRef void* void*) SCNetworkReachabilityRef))
  (define SCNetworkReachabilityCreateWithName
    (foreign-procedure "SCNetworkReachabilityCreateWithName"
		       (CFAllocatorRef string) SCNetworkReachabilityRef)) ; XXX
  (define SCNetworkReachabilityGetTypeID
    (foreign-procedure "SCNetworkReachabilityGetTypeID"
		       () CFTypeID))
  (define SCNetworkReachabilityGetFlags
    (foreign-procedure "SCNetworkReachabilityGetFlags"
		       (SCNetworkReachabilityRef (* SCNetworkReachabilityFlags)) Boolean))
  (define SCNetworkReachabilitySetCallBack
    (foreign-procedure "SCNetworkReachabilitySetCallBack"
		       (SCNetworkReachabilityRef (* SCNetworkReachabilityCallBack) (* SCNetworkReachabilityContext)) Boolean))
  (define SCNetworkReachabilityScheduleWithRunLoop
    (foreign-procedure "SCNetworkReachabilityScheduleWithRunLoop"
		       (SCNetworkReachabilityRef CFRunLoopRef CFStringRef) Boolean))
  (define SCNetworkReachabilityUnscheduleFromRunLoop
    (foreign-procedure "SCNetworkReachabilityUnscheduleFromRunLoop"
		       (SCNetworkReachabilityRef CFRunLoopRef CFStringRef) Boolean))
  )
