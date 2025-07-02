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
;; Based on Apple's CoreFoundation/CFData.h
(library
  (CoreFoundation CFData)
  (export
    CFDataRef
    CFMutableDataRef
    CFDataSearchFlags
    kCFDataSearchBackwards
    kCFDataSearchAnchored
    CFDataAppendBytes
    CFDataCreate
    CFDataCreateCopy
    CFDataCreateMutable
    CFDataCreateMutableCopy
    CFDataCreateWithBytesNoCopy
    CFDataDeleteBytes
    CFDataFind
    CFDataGetBytePtr
    CFDataGetBytes
    CFDataGetLength
    CFDataGetMutableBytePtr
    CFDataGetTypeID
    CFDataIncreaseLength
    CFDataReplaceBytes
    CFDataSetLength)
  (import
    (chezscheme)
    (CoreFoundation CFBase))

  ;;--------;;
  ;; CFData ;;
  ;;========;;

  (define init
    (load-shared-object "CoreFoundation.framework/CoreFoundation"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [CFDataRef void*]
    [CFMutableDataRef void*]
    [CFDataSearchFlags CFOptionFlags])

  ;;
  ;; Constants
  ;;

  (define kCFDataSearchBackwards 1)
  (define kCFDataSearchAnchored  2)

  ;;
  ;; Functions
  ;;

  (define CFDataAppendBytes
    (foreign-procedure "CFDataAppendBytes"
		       (CFMutableDataRef u8* CFIndex) void))
  (define CFDataCreate
    (foreign-procedure "CFDataCreate"
		       (CFAllocatorRef u8* CFIndex) CFDataRef))
  (define CFDataCreateCopy
    (foreign-procedure "CFDataCreateCopy"
		       (CFAllocatorRef CFDataRef) CFDataRef))
  (define CFDataCreateMutable
    (foreign-procedure "CFDataCreateMutable"
		       (CFAllocatorRef CFIndex) CFMutableDataRef))
  (define CFDataCreateMutableCopy
    (foreign-procedure "CFDataCreateMutableCopy"
		       (CFAllocatorRef CFIndex CFDataRef) CFMutableDataRef))
  (define CFDataCreateWithBytesNoCopy
    (foreign-procedure "CFDataCreateWithBytesNoCopy"
		       (CFAllocatorRef u8* CFIndex CFAllocatorRef) CFDataRef))
  (define CFDataDeleteBytes
    (foreign-procedure "CFDataDeleteBytes"
		       (CFMutableDataRef (& CFRange)) void))
  (define CFDataFind
    (foreign-procedure "CFDataFind"
		       (CFDataRef CFDataRef (& CFRange) CFDataSearchFlags) (& CFRange)))
  (define CFDataGetBytePtr
    (foreign-procedure "CFDataGetBytePtr"
		       (CFDataRef) (* unsigned-8)))
  (define CFDataGetBytes
    (foreign-procedure "CFDataGetBytes"
		       (CFDataRef u8* CFIndex) void))
  (define CFDataGetLength
    (foreign-procedure "CFDataGetLength"
		       (CFDataRef) CFIndex))
  (define CFDataGetMutableBytePtr
    (foreign-procedure "CFDataGetMutableBytePtr"
		       (CFMutableDataRef) (* unsigned-8)))
  (define CFDataGetTypeID
    (foreign-procedure "CFDataGetTypeID"
		       () CFTypeID))
  (define CFDataIncreaseLength
    (foreign-procedure "CFDataIncreaseLength"
		       (CFMutableDataRef CFIndex) void))
  (define CFDataReplaceBytes
    (foreign-procedure "CFDataReplaceBytes"
		       (CFMutableDataRef (& CFRange) u8* CFIndex) void))
  (define CFDataSetLength
    (foreign-procedure "CFDataSetLength"
		       (CFMutableDataRef CFIndex) void))
  )
