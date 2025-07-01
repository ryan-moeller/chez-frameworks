(library
  (CoreFoundation CFDate)
  (export
    CFTimeInterval
    CFDateRef
    CFTimeZoneRef
    CFAbsoluteTime
    kCFAbsoluteTimeIntervalSince1970
    kCFAbsoluteTimeIntervalSince1904
    CFAbsoluteTimeGetCurrent
    CFDateGetTypeID
    CFDateCreate
    CFDateGetAbsoluteTime
    CFDateGetTimeIntervalSinceDate
    CFDateCompare)
  (import
    (chezscheme)
    (CoreFoundation CFBase))

  ;;--------;;
  ;; CFDate ;;
  ;;========;;

  (define init
    (load-shared-object "CoreFoundation.framework/CoreFoundation"))

  ;; XXX: Deprecated GregorianDate interfaces are not exposed.
  ;; XXX: Deprecated AbsoluteTime interfaces are not exposed.

  ;;
  ;; Types
  ;;

  (define-ftype
    [CFTimeInterval double]
    [CFDateRef void*]
    [CFTimeZoneRef void*])
  (define-ftype
    [CFAbsoluteTime CFTimeInterval])

  ;;
  ;; Constants
  ;;

  (define kCFAbsoluteTimeIntervalSince1970
    (make-ftype-pointer CFTimeInterval
			(foreign-entry "kCFAbsoluteTimeIntervalSince1970")))
  (define kCFAbsoluteTimeIntervalSince1904
    (make-ftype-pointer CFTimeInterval
			(foreign-entry "kCFAbsoluteTimeIntervalSince1904")))

  ;;
  ;; Functions
  ;;

  (define CFAbsoluteTimeGetCurrent
    (foreign-procedure "CFAbsoluteTimeGetCurrent"
		       () CFAbsoluteTime))
  (define CFDateGetTypeID
    (foreign-procedure "CFDateGetTypeID"
		       () CFTypeID))
  (define CFDateCreate
    (foreign-procedure "CFDateCreate"
		       (CFAllocatorRef CFAbsoluteTime) CFDateRef))
  (define CFDateGetAbsoluteTime
    (foreign-procedure "CFDateGetAbsoluteTime"
		       (CFDateRef) CFAbsoluteTime))
  (define CFDateGetTimeIntervalSinceDate
    (foreign-procedure "CFDateGetTimeIntervalSinceDate"
		       (CFDateRef CFDateRef) CFTimeInterval))
  (define CFDateCompare
    (foreign-procedure "CFDateCompare"
		       (CFDateRef CFDateRef) CFComparisonResult))
  )
