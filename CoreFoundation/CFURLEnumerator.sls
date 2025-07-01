(library
  (CoreFoundation CFURLEnumerator)
  (export
    CFURLEnumeratorRef
    CFURLEnumeratorOptions
    CFURLEnumeratorResult
    kCFURLEnumeratorDefaultBehavior
    kCFURLEnumeratorDescendRecursively
    kCFURLEnumeratorSkipInvisibles
    kCFURLEnumeratorGenerateFileReferenceURLs
    kCFURLEnumeratorSkipPackageContents
    kCFURLEnumeratorIncludeDirectoriesPreOrder
    kCFURLEnumeratorIncludeDirectoriesPostOrder
    kCFURLEnumeratorGenerateRelativePathURLs
    kCFURLEnumeratorSuccess
    kCFURLEnumeratorEnd
    kCFURLEnumeratorError
    kCFURLEnumeratorDirectoryPostOrderSuccess
    CFURLEnumeratorGetTypeID
    CFURLEnumeratorCreateForDirectoryURL
    CFURLEnumeratorCreateForMountedVolumes
    CFURLEnumeratorGetNextURL
    CFURLEnumeratorSkipDescendents
    CFURLEnumeratorGetDescendentLevel)
  (import
    (chezscheme)
    (CoreFoundation CFBase)
    (CoreFoundation CFArray)
    (CoreFoundation CFError)
    (CoreFoundation CFURL))

  ;;-----------------;;
  ;; CFURLEnumerator ;;
  ;;=================;;

  (define init
    (load-shared-object "CoreFoundation.framework/CFURLEnumerator"))

  ;; XXX: Deprecated APIs not exposed.

  ;;
  ;; Types
  ;;

  (define-ftype
    [CFURLEnumeratorRef void*]
    [CFURLEnumeratorOptions CFOptionFlags]
    [CFURLEnumeratorResult CFIndex])

  ;;
  ;; Constants
  ;;

  (define kCFURLEnumeratorDefaultBehavior             #x00)
  (define kCFURLEnumeratorDescendRecursively          #x01)
  (define kCFURLEnumeratorSkipInvisibles              #x02)
  (define kCFURLEnumeratorGenerateFileReferenceURLs   #x04)
  (define kCFURLEnumeratorSkipPackageContents         #x08)
  (define kCFURLEnumeratorIncludeDirectoriesPreOrder  #x10)
  (define kCFURLEnumeratorIncludeDirectoriesPostOrder #x20)
  (define kCFURLEnumeratorGenerateRelativePathURLs    #x40)

  (define kCFURLEnumeratorSuccess                   1)
  (define kCFURLEnumeratorEnd                       2)
  (define kCFURLEnumeratorError                     3)
  (define kCFURLEnumeratorDirectoryPostOrderSuccess 4)

  ;;
  ;; Functions
  ;;

  (define CFURLEnumeratorGetTypeID
    (foreign-procedure "CFURLEnumeratorGetTypeID"
		       () CFTypeID))
  (define CFURLEnumeratorCreateForDirectoryURL
    (foreign-procedure "CFURLEnumeratorCreateForDirectoryURL"
		       (CFAllocatorRef CFURLRef CFURLEnumeratorOptions CFArrayRef) CFURLEnumeratorRef))
  (define CFURLEnumeratorCreateForMountedVolumes
    (foreign-procedure "CFURLEnumeratorCreateForMountedVolumes"
		       (CFAllocatorRef CFURLEnumeratorOptions CFArrayRef) CFURLEnumeratorRef))
  (define CFURLEnumeratorGetNextURL
    (foreign-procedure "CFURLEnumeratorGetNextURL"
		       (CFURLEnumeratorRef (* CFURLRef) (* CFErrorRef)) CFURLEnumeratorResult))
  (define CFURLEnumeratorSkipDescendents
    (foreign-procedure "CFURLEnumeratorSkipDescendents"
		       (CFURLEnumeratorRef) void))
  (define CFURLEnumeratorGetDescendentLevel
    (foreign-procedure "CFURLEnumeratorGetDescendentLevel"
		       (CFURLEnumeratorRef) CFIndex))
  )
