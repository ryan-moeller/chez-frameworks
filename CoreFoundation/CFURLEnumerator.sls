#|
   Copyright 2025 Ryan Moeller

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
|#
;; Based on Apple's CoreFoundation/CFURLEnumerator.h
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
