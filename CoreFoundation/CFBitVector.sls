(library
  (CoreFoundation CFBitVector)
  (export
    CFBit
    CFBitVectorRef
    CFMutableBitVectorRef
    CFBitVectorGetTypeID
    CFBitVectorCreate
    CFBitVectorCreateCopy
    CFBitVectorCreateMutable
    CFBitVectorCreateMutableCopy
    CFBitVectorGetCount
    CFBitVectorGetCountOfBit
    CFBitVectorContainsBit
    CFBitVectorGetBitAtIndex
    CFBitVectorGetBits
    CFBitVectorGetFirstIndexOfBit
    CFBitVectorGetLastIndexOfBit
    CFBitVectorSetCount
    CFBitVectorFlipBitAtIndex
    CFBitVectorFlipBits
    CFBitVectorSetBitAtIndex
    CFBitVectorSetBits
    CFBitVectorSetAllBits)
  (import
    (chezscheme)
    (CoreFoundation CFBase))

  ;;-------------;;
  ;; CFBitVector ;;
  ;;=============;;

  (define init
    (load-shared-object "CoreFoundation.framework/CoreFoundation"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [CFBit unsigned-32]
    [CFBitVectorRef void*]
    [CFMutableBitVectorRef void*])

  ;;
  ;; Constants
  ;;

  ;; (none defined)

  ;;
  ;; Functions
  ;;

  (define CFBitVectorGetTypeID
    (foreign-procedure "CFBitVectorGetTypeID"
		       () CFTypeID))
  (define CFBitVectorCreate
    (foreign-procedure "CFBitVectorCreate"
		       (CFAllocatorRef u8* CFIndex) CFBitVectorRef))
  (define CFBitVectorCreateCopy
    (foreign-procedure "CFBitVectorCreateCopy"
		       (CFAllocatorRef CFBitVectorRef) CFBitVectorRef))
  (define CFBitVectorCreateMutable
    (foreign-procedure "CFBitVectorCreateMutable"
		       (CFAllocatorRef CFIndex) CFMutableBitVectorRef))
  (define CFBitVectorCreateMutableCopy
    (foreign-procedure "CFBitVectorCreateMutableCopy"
		       (CFAllocatorRef CFIndex CFBitVectorRef) CFMutableBitVectorRef))
  (define CFBitVectorGetCount
    (foreign-procedure "CFBitVectorGetCount"
		       (CFBitVectorRef) CFIndex))
  (define CFBitVectorGetCountOfBit
    (foreign-procedure "CFBitVectorGetCountOfBit"
		       (CFBitVectorRef (& CFRange) CFBit) CFIndex))
  (define CFBitVectorContainsBit
    (foreign-procedure "CFBitVectorContainsBit"
		       (CFBitVectorRef (& CFRange) CFBit) Boolean))
  (define CFBitVectorGetBitAtIndex
    (foreign-procedure "CFBitVectorGetBitAtIndex"
		       (CFBitVectorRef CFIndex) CFBit))
  (define CFBitVectorGetBits
    (foreign-procedure "CFBitVectorGetBits"
		       (CFBitVectorRef (& CFRange) u8*) void))
  (define CFBitVectorGetFirstIndexOfBit
    (foreign-procedure "CFBitVectorGetFirstIndexOfBit"
		       (CFBitVectorRef (& CFRange) CFBit) CFIndex))
  (define CFBitVectorGetLastIndexOfBit
    (foreign-procedure "CFBitVectorGetLastIndexOfBit"
		       (CFBitVectorRef (& CFRange) CFBit) CFIndex))
  (define CFBitVectorSetCount
    (foreign-procedure "CFBitVectorSetCount"
		       (CFMutableBitVectorRef CFIndex) void))
  (define CFBitVectorFlipBitAtIndex
    (foreign-procedure "CFBitVectorFlipBitAtIndex"
		       (CFMutableBitVectorRef CFIndex) void))
  (define CFBitVectorFlipBits
    (foreign-procedure "CFBitVectorFlipBits"
		       (CFMutableBitVectorRef (& CFRange)) void))
  (define CFBitVectorSetBitAtIndex
    (foreign-procedure "CFBitVectorSetBitAtIndex"
		       (CFMutableBitVectorRef CFIndex CFBit) void))
  (define CFBitVectorSetBits
    (foreign-procedure "CFBitVectorSetBits"
		       (CFMutableBitVectorRef (& CFRange) CFBit) void))
  (define CFBitVectorSetAllBits
    (foreign-procedure "CFBitVectorSetAllBits"
		       (CFMutableBitVectorRef CFBit) void))
  )
