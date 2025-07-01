(library
  (CoreFoundation CFPropertyList)
  (export
    CFPropertyListMutabilityOptions
    CFPropertyListFormat
    kCFPropertyListImmutable
    kCFPropertyListMutableContainers
    kCFPropertyListMutableContainersAndLeaves
    kCFPropertyListOpenStepFormat
    kCFPropertyListXMLFormat_v1_0
    kCFPropertyListBinaryFormat_v1_0
    kCFPropertyListReadCorruptError
    kCFPropertyListReadUnknownVersionError
    kCFPropertyListReadStreamError
    kCFPropertyListWriteStreamError
    CFPropertyListCreateDeepCopy
    CFPropertyListIsValid
    CFPropertyListCreateWithData
    CFPropertyListCreateWithStream
    CFPropertyListWrite
    CFPropertyListCreateData)
  (import
    (chezscheme)
    (CoreFoundation CFBase)
    (CoreFoundation CFData)
    (CoreFoundation CFString)
    (CoreFoundation CFError)
    (CoreFoundation CFStream))

  ;;----------------;;
  ;; CFPropertyList ;;
  ;;================;;

  (define init
    (load-shared-object "CoreFoundation.framework/CoreFoundation"))

  ;; XXX: Deprecated interfaces are not exposed.

  ;;
  ;; Types
  ;;

  (define-ftype
    [CFPropertyListMutabilityOptions CFOptionFlags]
    [CFPropertyListFormat CFIndex])

  ;;
  ;; Constants
  ;;

  (define kCFPropertyListImmutable                  #x00)
  (define kCFPropertyListMutableContainers          #x01)
  (define kCFPropertyListMutableContainersAndLeaves #x02)

  (define kCFPropertyListOpenStepFormat      1)
  (define kCFPropertyListXMLFormat_v1_0    100)
  (define kCFPropertyListBinaryFormat_v1_0 200)

  (define kCFPropertyListReadCorruptError        3840)
  (define kCFPropertyListReadUnknownVersionError 3841)
  (define kCFPropertyListReadStreamError         3842)
  (define kCFPropertyListWriteStreamError        3851)

  ;;
  ;; Functions
  ;;

  (define CFPropertyListCreateDeepCopy
    (foreign-procedure "CFPropertyListCreateDeepCopy"
		       (CFAllocatorRef CFPropertyListRef CFPropertyListMutabilityOptions) CFPropertyListRef))
  (define CFPropertyListIsValid
    (foreign-procedure "CFPropertyListIsValid"
		       (CFPropertyListRef CFPropertyListFormat) Boolean))
  (define CFPropertyListCreateWithData
    (foreign-procedure "CFPropertyListCreateWithData"
		       (CFAllocatorRef CFDataRef CFPropertyListMutabilityOptions (* CFPropertyListFormat) (* CFErrorRef)) CFPropertyListRef))
  (define CFPropertyListCreateWithStream
    (foreign-procedure "CFPropertyListCreateWithStream"
		       (CFAllocatorRef CFReadStreamRef CFIndex CFPropertyListMutabilityOptions (* CFPropertyListFormat) (* CFErrorRef)) CFPropertyListRef))
  (define CFPropertyListWrite
    (foreign-procedure "CFPropertyListWrite"
		       (CFPropertyListRef CFWriteStreamRef CFPropertyListFormat CFOptionFlags (* CFErrorRef)) CFIndex))
  (define CFPropertyListCreateData
    (foreign-procedure "CFPropertyListCreateData"
		       (CFAllocatorRef CFPropertyListRef CFPropertyListFormat CFOptionFlags (* CFErrorRef)) CFDataRef))
  )
