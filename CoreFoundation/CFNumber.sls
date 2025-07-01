(library
  (CoreFoundation CFNumber)
  (export
    CFBooleanRef
    CFNumberRef
    CFNumberType
    kCFBooleanTrue
    kCFBooleanFalse
    kCFNumberSInt8Type
    kCFNumberSInt16Type
    kCFNumberSInt32Type
    kCFNumberSInt64Type
    kCFNumberFloat32Type
    kCFNumberFloat64Type
    kCFNumberCharType
    kCFNumberShortType
    kCFNumberIntType
    kCFNumberLongType
    kCFNumberLongLongType
    kCFNumberFloatType
    kCFNumberDoubleType
    kCFNumberCFIndexType
    kCFNumberNSIntegerType
    kCFNumberCGFloatType
    kCFNumberMaxType
    kCFNumberPositiveInfinity
    kCFNumberNegativeInfinity
    kCFNumberNaN
    CFBooleanGetTypeID
    CFBooleanGetValue
    CFNumberGetTypeID
    CFNumberCreate
    CFNumberGetType
    CFNumberGetByteSize
    CFNumberIsFloatType
    CFNumberGetValue
    CFNumberCompare)
  (import
    (chezscheme)
    (CoreFoundation CFBase))

  ;;----------;;
  ;; CFNumber ;;
  ;;==========;;

  (define init
    (load-shared-object "CoreFoundation.framework/CoreFoundation"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [CFBooleanRef void*]
    [CFNumberRef void*]
    [CFNumberType CFIndex])

  ;;
  ;; CFBoolean Constants
  ;;

  (define kCFBooleanTrue
    (make-ftype-pointer CFBooleanRef
			(foreign-entry "kCFBooleanTrue")))
  (define kCFBooleanFalse
    (make-ftype-pointer CFBooleanRef
			(foreign-entry "kCFBooleanFalse")))

  ;;
  ;; CFNumber Constants
  ;;

  (define kCFNumberSInt8Type      1)
  (define kCFNumberSInt16Type     2)
  (define kCFNumberSInt32Type     3)
  (define kCFNumberSInt64Type     4)
  (define kCFNumberFloat32Type    5)
  (define kCFNumberFloat64Type    6)
  (define kCFNumberCharType       7)
  (define kCFNumberShortType      8)
  (define kCFNumberIntType        9)
  (define kCFNumberLongType      10)
  (define kCFNumberLongLongType  11)
  (define kCFNumberFloatType     12)
  (define kCFNumberDoubleType    13)
  (define kCFNumberCFIndexType   14)
  (define kCFNumberNSIntegerType 15)
  (define kCFNumberCGFloatType   16)
  (define kCFNumberMaxType       16)

  (define kCFNumberPositiveInfinity
    (make-ftype-pointer CFNumberRef
			(foreign-entry "kCFNumberPositiveInfinity")))
  (define kCFNumberNegativeInfinity
    (make-ftype-pointer CFNumberRef
			(foreign-entry "kCFNumberNegativeInfinity")))
  (define kCFNumberNaN
    (make-ftype-pointer CFNumberRef
			(foreign-entry "kCFNumberNaN")))

  ;;
  ;; CFBoolean Functions
  ;;

  (define CFBooleanGetTypeID
    (foreign-procedure "CFBooleanGetTypeID"
		       () CFTypeID))
  (define CFBooleanGetValue
    (foreign-procedure "CFBooleanGetValue"
		       (CFBooleanRef) Boolean))

  ;;
  ;; CFNumber Functions
  ;;

  (define CFNumberGetTypeID
    (foreign-procedure "CFNumberGetTypeID"
		       () CFTypeID))
  (define CFNumberCreate
    (foreign-procedure "CFNumberCreate"
		       (CFAllocatorRef CFNumberType void*) CFNumberRef))
  (define CFNumberGetType
    (foreign-procedure "CFNumberGetType"
		       (CFNumberRef) CFNumberType))
  (define CFNumberGetByteSize
    (foreign-procedure "CFNumberGetByteSize"
		       (CFNumberRef) CFIndex))
  (define CFNumberIsFloatType
    (foreign-procedure "CFNumberIsFloatType"
		       (CFNumberRef) Boolean))
  (define CFNumberGetValue
    (foreign-procedure "CFNumberGetValue"
		       (CFNumberRef CFNumberType void*) Boolean))
  (define CFNumberCompare
    (foreign-procedure "CFNumberCompare"
		       (CFNumberRef CFNumberRef void*) CFComparisonResult))
  )
