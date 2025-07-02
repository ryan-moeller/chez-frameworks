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
;; Based on Apple's CoreFoundation/CFCharacterSet.h
(library
  (CoreFoundation CFCharacterSet)
  (export
    CFCharacterSetRef
    CFMutableCharacterSetRef
    CFCharacterSetPredefinedSet
    kCFCharacterSetControl
    kCFCharacterSetWhitespace
    kCFCharacterSetWhitespaceAndNewline
    kCFCharacterSetDecimalDigit
    kCFCharacterSetLetter
    kCFCharacterSetLowercaseLetter
    kCFCharacterSetUppercaseLetter
    kCFCharacterSetNonBase
    kCFCharacterSetDecomposable
    kCFCharacterSetAlphaNumeric
    kCFCharacterSetPunctuation
    kCFCharacterSetIllegal
    kCFCharacterSetCapitalizedLetter
    kCFCharacterSetSymbol
    kCFCharacterSetNewline
    CFCharacterSetAddCharactersInRange
    CFCharacterSetAddCharactersInString
    CFCharacterSetCreateBitmapRepresentation
    CFCharacterSetCreateCopy
    CFCharacterSetCreateInvertedSet
    CFCharacterSetCreateMutable
    CFCharacterSetCreateMutableCopy
    CFCharacterSetCreateWithBitmapRepresentation
    CFCharacterSetCreateWithCharactersInRange
    CFCharacterSetCreateWithCharactersInString
    CFCharacterSetGetPredefined
    CFCharacterSetGetTypeID
    CFCharacterSetHasMemberInPlane
    CFCharacterSetIntersect
    CFCharacterSetInvert
    CFCharacterSetIsCharacterMember
    CFCharacterSetIsLongCharacterMember
    CFCharacterSetIsSupersetOfSet
    CFCharacterSetRemoveCharactersInRange
    CFCharacterSetRemoveCharactersInString
    CFCharacterSetUnion)
  (import
    (chezscheme)
    (CoreFoundation CFBase)
    (CoreFoundation CFData))

  ;;----------------;;
  ;; CFCharacterSet ;;
  ;;================;;

  (define init
    (load-shared-object "CoreFoundation.framework/CoreFoundation"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [CFCharacterSetRef void*]
    [CFMutableCharacterSetRef void*]
    [CFCharacterSetPredefinedSet CFIndex])

  ;;
  ;; Constants
  ;;

  (define kCFCharacterSetControl              1)
  (define kCFCharacterSetWhitespace           2)
  (define kCFCharacterSetWhitespaceAndNewline 3)
  (define kCFCharacterSetDecimalDigit         4)
  (define kCFCharacterSetLetter               5)
  (define kCFCharacterSetLowercaseLetter      6)
  (define kCFCharacterSetUppercaseLetter      7)
  (define kCFCharacterSetNonBase              8)
  (define kCFCharacterSetDecomposable         9)
  (define kCFCharacterSetAlphaNumeric        10)
  (define kCFCharacterSetPunctuation         11)
  (define kCFCharacterSetIllegal             12)
  (define kCFCharacterSetCapitalizedLetter   13)
  (define kCFCharacterSetSymbol              14)
  (define kCFCharacterSetNewline             15)

  ;;
  ;; Functions
  ;;

  (define CFCharacterSetAddCharactersInRange
    (foreign-procedure "CFCharacterSetAddCharactersInRange"
		       (CFMutableCharacterSetRef (& CFRange)) void))
  (define CFCharacterSetAddCharactersInString
    (foreign-procedure "CFCharacterSetAddCharactersInString"
		       (CFMutableCharacterSetRef CFStringRef) void))
  (define CFCharacterSetCreateBitmapRepresentation
    (foreign-procedure "CFCharacterSetCreateBitmapRepresentation"
		       (CFAllocatorRef CFCharacterSetRef) CFDataRef))
  (define CFCharacterSetCreateCopy
    (foreign-procedure "CFCharacterSetCreateCopy"
		       (CFAllocatorRef CFCharacterSetRef) CFCharacterSetRef))
  (define CFCharacterSetCreateInvertedSet
    (foreign-procedure "CFCharacterSetCreateInvertedSet"
		       (CFAllocatorRef CFCharacterSetRef) CFCharacterSetRef))
  (define CFCharacterSetCreateMutable
    (foreign-procedure "CFCharacterSetCreateMutable"
		       (CFAllocatorRef) CFMutableCharacterSetRef))
  (define CFCharacterSetCreateMutableCopy
    (foreign-procedure "CFCharacterSetCreateMutableCopy"
		       (CFAllocatorRef CFCharacterSetRef) CFMutableCharacterSetRef))
  (define CFCharacterSetCreateWithBitmapRepresentation
    (foreign-procedure "CFCharacterSetCreateWithBitmapRepresentation"
		       (CFAllocatorRef CFDataRef) CFCharacterSetRef))
  (define CFCharacterSetCreateWithCharactersInRange
    (foreign-procedure "CFCharacterSetCreateWithCharactersInRange"
		       (CFAllocatorRef CFDataRef) CFCharacterSetRef))
  (define CFCharacterSetCreateWithCharactersInString
    (foreign-procedure "CFCharacterSetCreateWithCharactersInString"
		       (CFAllocatorRef CFStringRef) CFCharacterSetRef))
  (define CFCharacterSetGetPredefined
    (foreign-procedure "CFCharacterSetGetPredefined"
		       (CFCharacterSetPredefinedSet) CFCharacterSetRef))
  (define CFCharacterSetGetTypeID
    (foreign-procedure "CFCharacterSetGetTypeID"
		       () CFTypeID))
  (define CFCharacterSetHasMemberInPlane
    (foreign-procedure "CFCharacterSetHasMemberInPlane"
		       (CFCharacterSetRef CFIndex) Boolean))
  ;; CFCharacterSetInitInlineBuffer "Apple private"
  (define CFCharacterSetIntersect
    (foreign-procedure "CFCharacterSetIntersect"
		       (CFMutableCharacterSetRef CFCharacterSetRef) void))
  (define CFCharacterSetInvert
    (foreign-procedure "CFCharacterSetInvert"
		       (CFMutableCharacterSetRef) void))
  (define CFCharacterSetIsCharacterMember
    (foreign-procedure "CFCharacterSetIsCharacterMember"
		       (CFCharacterSetRef UniChar) Boolean))
  (define CFCharacterSetIsLongCharacterMember
    (foreign-procedure "CFCharacterSetIsLongCharacterMember"
		       (CFCharacterSetRef UTF32Char) Boolean))
  (define CFCharacterSetIsSupersetOfSet
    (foreign-procedure "CFCharacterSetIsSupersetOfSet"
		       (CFCharacterSetRef CFCharacterSetRef) Boolean))
  ;; CFCharacterSetIsSurrogatePairMember "CF private"
  (define CFCharacterSetRemoveCharactersInRange
    (foreign-procedure "CFCharacterSetRemoveCharactersInRange"
		       (CFMutableCharacterSetRef (& CFRange)) void))
  (define CFCharacterSetRemoveCharactersInString
    (foreign-procedure "CFCharacterSetRemoveCharactersInString"
		       (CFMutableCharacterSetRef CFStringRef) void))
  (define CFCharacterSetUnion
    (foreign-procedure "CFCharacterSetUnion"
		       (CFMutableCharacterSetRef CFCharacterSetRef) void))
  )
