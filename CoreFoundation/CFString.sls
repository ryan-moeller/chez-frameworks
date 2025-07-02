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
;; Based on Apple's CoreFoundation/CFString.h
(library
  (CoreFoundation CFString)
  (export
    CFStringEncoding
    CFStringCompareFlags
    CFStringNormalizationForm
    CFStringBuiltInEncodings
    kCFStringEncodingInvalidId
    kCFStringEncodingMacRoman
    kCFStringEncodingWindowsLatin1
    kCFStringEncodingISOLatin1
    kCFStringEncodingNextStepLatin
    kCFStringEncodingASCII
    kCFStringEncodingUnicode
    kCFStringEncodingUTF8
    kCFStringEncodingNonLossyASCII
    kCFStringEncodingUTF16
    kCFStringEncodingUTF16BE
    kCFStringEncodingUTF16LE
    kCFStringEncodingUTF32
    kCFStringEncodingUTF32BE
    kCFStringEncodingUTF32LE
    kCFCompareCaseInsensitive
    kCFCompareBackwards
    kCFCompareAnchored
    kCFCompareNonliteral
    kCFCompareLocalized
    kCFCompareNumerically
    kCFCompareDiacriticInsensitive
    kCFCompareWidthInsensitive
    kCFCompareForcedOrdering
    kCFStringNormalizationFormD
    kCFStringNormalizationFormKD
    kCFStringNormalizationFormC
    kCFStringNormalizationFormKC
    kCFStringTransformStripCombiningMarks
    kCFStringTransformToLatin
    kCFStringTransformFullwidthHalfwidth
    kCFStringTransformLatinKatakana
    kCFStringTransformLatinHiragana
    kCFStringTransformHiraganaKatakana
    kCFStringTransformMandarinLatin
    kCFStringTransformLatinHangul
    kCFStringTransformLatinArabic
    kCFStringTransformLatinHebrew
    kCFStringTransformLatinThai
    kCFStringTransformLatinCyrillic
    kCFStringTransformLatinGreek
    kCFStringTransformToXMLHex
    kCFStringTransformToUnicodeName
    kCFStringTransformStripDiacritics
    CFStringAppend
    CFStringAppendCString
    CFStringAppendCharacters
    CFStringAppendFormat
    CFStringAppendPascalString
    CFStringCapitalize
    CFStringCompare
    CFStringCompareWithOptions
    CFStringCompareWithOptionsAndLocale
    CFStringConvertEncodingToIANACharSetName
    CFStringConvertEncodingToNSStringEncoding
    CFStringConvertEncodingToWindowsCodepage
    CFStringConvertIANACharSetNameToEncoding
    CFStringConvertNSStringEncodingToEncoding
    CFStringConvertWindowsCodepageToEncoding
    CFStringCreateArrayBySeparatingStrings
    CFStringCreateArrayWithFindResults
    CFStringCreateByCombiningStrings
    CFStringCreateCopy
    CFStringCreateExternalRepresentation
    CFStringCreateFromExternalRepresentation
    CFStringCreateMutable
    CFStringCreateMutableCopy
    CFStringCreateMutableWithExternalCharactersNoCopy
    CFStringCreateStringWithValidatedFormat
    CFStringCreateWithBytes
    CFStringCreateWithBytesNoCopy
    CFStringCreateWithCString
    CFStringCreateWithCStringNoCopy
    CFStringCreateWithCharacters
    CFStringCreateWithCharactersNoCopy
    CFStringCreateWithFileSystemRepresentation
    CFStringCreateWithFormat
    CFStringCreateWithPascalString
    CFStringCreateWithPascalStringNoCopy
    CFStringCreateWithSubstring
    CFStringDelete
    CFStringFind
    CFStringFindAndReplace
    CFStringFindCharacterFromSet
    CFStringFindWithOptions
    CFStringFindWithOptionsAndLocale
    CFStringFold
    CFStringGetBytes
    CFStringGetCString
    CFStringGetCStringPtr
    CFStringGetCharacterAtIndex
    CFStringGetCharacters
    CFStringGetCharactersPtr
    CFStringGetDoubleValue
    CFStringGetFastestEncoding
    CFStringGetFileSystemRepresentation
    CFStringGetHyphenationLocationBeforeIndex
    CFStringGetIntValue
    CFStringGetLength
    CFStringGetLineBounds
    CFStringGetListOfAvailableEncodings
    CFStringGetMaximumSizeForEncoding
    CFStringGetMaximumSizeOfFileSystemRepresentation
    CFStringGetMostCompatibleMacStringEncoding
    CFStringGetNameOfEncoding
    CFStringGetParagraphBounds
    CFStringGetPascalString
    CFStringGetPascalStringPtr
    CFStringGetRangeOfComposedCharactersAtIndex
    CFStringGetSmallestEncoding
    CFStringGetSystemEncoding
    CFStringGetTypeID
    CFStringHasPrefix
    CFStringHasSuffix
    CFStringInsert
    CFStringIsEncodingAvailable
    CFStringIsHyphenationAvailableForLocale
    CFStringLowercase
    CFStringNormalize
    CFStringPad
    CFStringReplace
    CFStringReplaceAll
    CFStringSetExternalCharactersNoCopy
    CFStringTransform
    CFStringTrim
    CFStringTrimWhitespace
    CFStringUppercase
    CFSTR)
  (import
    (chezscheme)
    (CoreFoundation CFBase)
    (CoreFoundation CFArray)
    (CoreFoundation CFData)
    (CoreFoundation CFDictionary)
    (CoreFoundation CFCharacterSet)
    (CoreFoundation CFLocale)
    (CoreFoundation CFError))

  ;;----------;;
  ;; CFString ;;
  ;;==========;;

  (define init
    (load-shared-object "CoreFoundation.framework/CoreFoundation"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [CFStringEncoding unsigned-32]
    [CFStringCompareFlags CFOptionFlags]
    [CFStringNormalizationForm CFIndex])
  (define-ftype
    [CFStringBuiltInEncodings CFStringEncoding])

  ;;
  ;; Constants
  ;;

  (define kCFStringEncodingInvalidId               #xffffffff)
  (define kCFStringEncodingMacRoman                #x00000000)
  (define kCFStringEncodingWindowsLatin1           #x00000500)
  (define kCFStringEncodingISOLatin1               #x00000201)
  (define kCFStringEncodingNextStepLatin           #x00000b01)
  (define kCFStringEncodingASCII                   #x00000600)
  (define kCFStringEncodingUnicode                 #x00000100)
  (define kCFStringEncodingUTF8                    #x08000100)
  (define kCFStringEncodingNonLossyASCII           #x00000bff)
  (define kCFStringEncodingUTF16 kCFStringEncodingUnicode)
  (define kCFStringEncodingUTF16BE                 #x10000100)
  (define kCFStringEncodingUTF16LE                 #x14000100)
  (define kCFStringEncodingUTF32                   #x0c000100)
  (define kCFStringEncodingUTF32BE                 #x18000100)
  (define kCFStringEncodingUTF32LE                 #x1c000100)

  (define kCFCompareCaseInsensitive        1)
  (define kCFCompareBackwards              4)
  (define kCFCompareAnchored               8)
  (define kCFCompareNonliteral            16)
  (define kCFCompareLocalized             32)
  (define kCFCompareNumerically           64)
  (define kCFCompareDiacriticInsensitive 128)
  (define kCFCompareWidthInsensitive     256)
  (define kCFCompareForcedOrdering       512)

  (define kCFStringNormalizationFormD  0)
  (define kCFStringNormalizationFormKD 1)
  (define kCFStringNormalizationFormC  2)
  (define kCFStringNormalizationFormKC 3)

  (define kCFStringTransformStripCombiningMarks
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFStringTransformStripCombiningMarks")))
  (define kCFStringTransformToLatin
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFStringTransformToLatin")))
  (define kCFStringTransformFullwidthHalfwidth
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFStringTransformFullwidthHalfwidth")))
  (define kCFStringTransformLatinKatakana
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFStringTransformLatinKatakana")))
  (define kCFStringTransformLatinHiragana
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFStringTransformLatinHiragana")))
  (define kCFStringTransformHiraganaKatakana
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFStringTransformHiraganaKatakana")))
  (define kCFStringTransformMandarinLatin
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFStringTransformMandarinLatin")))
  (define kCFStringTransformLatinHangul
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFStringTransformLatinHangul")))
  (define kCFStringTransformLatinArabic
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFStringTransformLatinArabic")))
  (define kCFStringTransformLatinHebrew
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFStringTransformLatinHebrew")))
  (define kCFStringTransformLatinThai
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFStringTransformLatinThai")))
  (define kCFStringTransformLatinCyrillic
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFStringTransformLatinCyrillic")))
  (define kCFStringTransformLatinGreek
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFStringTransformLatinGreek")))
  (define kCFStringTransformToXMLHex
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFStringTransformToXMLHex")))
  (define kCFStringTransformToUnicodeName
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFStringTransformToUnicodeName")))
  (define kCFStringTransformStripDiacritics
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFStringTransformStripDiacritics")))

  ;;
  ;; Functions
  ;;

  (define CFStringAppend
    (foreign-procedure "CFStringAppend"
		       (CFMutableStringRef CFStringRef) void))
  (define CFStringAppendCString
    (foreign-procedure "CFStringAppendCString"
		       (CFMutableStringRef string CFStringEncoding) void)) ; XXX
  (define CFStringAppendCharacters
    (foreign-procedure "CFStringAppendCharacters"
		       (CFMutableStringRef (* UniChar) CFIndex) void))
  (define CFStringAppendFormat
    (foreign-procedure (__varargs_after 3) "CFStringAppendFormat"
		       (CFMutableStringRef CFDictionaryRef CFStringRef) void))
  ;(define CFStringAppendFormatAndArguments
  ;  (foreign-procedure "CFStringAppendFormatAndArguments"
  ; XXX no va_list FFI type
  (define CFStringAppendPascalString
    (foreign-procedure "CFStringAppendPascalString"
		       (CFMutableStringRef ConstStr255Param CFStringEncoding) void))
  (define CFStringCapitalize
    (foreign-procedure "CFStringCapitalize"
		       (CFMutableStringRef CFLocaleRef) void))
  (define CFStringCompare
    (foreign-procedure "CFStringCompare"
		       (CFStringRef CFStringRef CFStringCompareFlags) CFComparisonResult))
  (define CFStringCompareWithOptions
    (foreign-procedure "CFStringCompareWithOptions"
		       (CFStringRef CFStringRef (& CFRange) CFStringCompareFlags) CFComparisonResult))
  (define CFStringCompareWithOptionsAndLocale
    (foreign-procedure "CFStringCompareWithOptionsAndLocale"
		       (CFStringRef CFStringRef (& CFRange) CFStringCompareFlags CFLocaleRef) CFComparisonResult))
  (define CFStringConvertEncodingToIANACharSetName
    (foreign-procedure "CFStringConvertEncodingToIANACharSetName"
		       (CFStringEncoding) CFStringRef))
  (define CFStringConvertEncodingToNSStringEncoding
    (foreign-procedure "CFStringConvertEncodingToNSStringEncoding"
		       (CFStringEncoding) unsigned-long))
  (define CFStringConvertEncodingToWindowsCodepage
    (foreign-procedure "CFStringConvertEncodingToWindowsCodepage"
		       (CFStringEncoding) unsigned-32))
  (define CFStringConvertIANACharSetNameToEncoding
    (foreign-procedure "CFStringConvertIANACharSetNameToEncoding"
		       (CFStringRef) CFStringEncoding))
  (define CFStringConvertNSStringEncodingToEncoding
    (foreign-procedure "CFStringConvertNSStringEncodingToEncoding"
		       (unsigned-long) CFStringEncoding))
  (define CFStringConvertWindowsCodepageToEncoding
    (foreign-procedure "CFStringConvertWindowsCodepageToEncoding"
		       (unsigned-32) CFStringEncoding))
  (define CFStringCreateArrayBySeparatingStrings
    (foreign-procedure "CFStringCreateArrayBySeparatingStrings"
		       (CFAllocatorRef CFStringRef CFStringRef) CFArrayRef))
  (define CFStringCreateArrayWithFindResults
    (foreign-procedure "CFStringCreateArrayWithFindResults"
		       (CFAllocatorRef CFStringRef CFStringRef (& CFRange) CFStringCompareFlags) CFArrayRef))
  (define CFStringCreateByCombiningStrings
    (foreign-procedure "CFStringCreateByCombiningStrings"
		       (CFAllocatorRef CFArrayRef CFStringRef) CFStringRef))
  (define CFStringCreateCopy
    (foreign-procedure "CFStringCreateCopy"
		       (CFAllocatorRef CFStringRef) CFStringRef))
  (define CFStringCreateExternalRepresentation
    (foreign-procedure "CFStringCreateExternalRepresentation"
		       (CFAllocatorRef CFStringRef CFStringEncoding unsigned-8) CFDataRef))
  (define CFStringCreateFromExternalRepresentation
    (foreign-procedure "CFStringCreateFromExternalRepresentation"
		       (CFAllocatorRef CFDataRef CFStringEncoding) CFStringRef))
  (define CFStringCreateMutable
    (foreign-procedure "CFStringCreateMutable"
		       (CFAllocatorRef CFIndex) CFMutableStringRef))
  (define CFStringCreateMutableCopy
    (foreign-procedure "CFStringCreateMutableCopy"
		       (CFAllocatorRef CFIndex CFStringRef) CFMutableStringRef))
  (define CFStringCreateMutableWithExternalCharactersNoCopy
    (foreign-procedure "CFStringCreateMutableWithExternalCharactersNoCopy"
		       (CFAllocatorRef (* UniChar) CFIndex CFIndex CFAllocatorRef) CFMutableStringRef))
  (define CFStringCreateStringWithValidatedFormat
    (foreign-procedure (__varargs_after 5) "CFStringCreateStringWithValidatedFormat"
		       (CFAllocatorRef CFDictionaryRef CFStringRef CFStringRef (* CFErrorRef)) CFStringRef))
  ;(define CFStringCreateStringWithValidatefFormatAndArguments
  ;  (foreign-procedure "CFStringCreateStringWithValidatedFormatAndArguments"
  ; XXX no va_list FFI type
  (define CFStringCreateWithBytes
    (foreign-procedure "CFStringCreateWithBytes"
		       (CFAllocatorRef u8* CFIndex CFStringEncoding Boolean) CFStringRef))
  (define CFStringCreateWithBytesNoCopy
    (foreign-procedure "CFStringCreateWithBytesNoCopy"
		       (CFAllocatorRef u8* CFIndex CFStringEncoding Boolean CFAllocatorRef) CFStringRef))
  (define CFStringCreateWithCString
    (foreign-procedure "CFStringCreateWithCString"
		       (CFAllocatorRef string CFStringEncoding) CFStringRef)) ; XXX
  (define CFStringCreateWithCStringNoCopy
    (foreign-procedure "CFStringCreateWithCStringNoCopy"
		       (CFAllocatorRef string CFStringEncoding CFAllocatorRef) CFStringRef)) ; XXX
  (define CFStringCreateWithCharacters
    (foreign-procedure "CFStringCreateWithCharacters"
		       (CFAllocatorRef (* UniChar) CFIndex) CFStringRef))
  (define CFStringCreateWithCharactersNoCopy
    (foreign-procedure "CFStringCreateWithCharactersNoCopy"
		       (CFAllocatorRef (* UniChar) CFIndex CFAllocatorRef) CFStringRef))
  (define CFStringCreateWithFileSystemRepresentation
    (foreign-procedure "CFStringCreateWithFileSystemRepresentation"
		       (CFAllocatorRef string) CFStringRef)) ; XXX
  (define CFStringCreateWithFormat
    (foreign-procedure (__varargs_after 3) "CFStringCreateWithFormat"
		       (CFAllocatorRef CFDictionaryRef CFStringRef) CFStringRef))
  ;(define CFStringCreateWithFormatAndArguments
  ;  (foreign-procedure "CFStringCreateWithFormatAndArguments"
  ; XXX no va_list FFI type
  (define CFStringCreateWithPascalString
    (foreign-procedure "CFStringCreateWithPascalString"
		       (CFAllocatorRef ConstStr255Param CFStringEncoding) CFStringRef))
  (define CFStringCreateWithPascalStringNoCopy
    (foreign-procedure "CFStringCreateWithPascalStringNoCopy"
		       (CFAllocatorRef ConstStr255Param CFStringEncoding CFAllocatorRef) CFStringRef))
  (define CFStringCreateWithSubstring
    (foreign-procedure "CFStringCreateWithSubstring"
		       (CFAllocatorRef CFStringRef (& CFRange)) CFStringRef))
  (define CFStringDelete
    (foreign-procedure "CFStringDelete"
		       (CFMutableStringRef (& CFRange)) void))
  ;; CFStringFileSystemEncoding "CF internal"
  (define CFStringFind
    (foreign-procedure "CFStringFind"
		       (CFStringRef CFStringRef CFStringCompareFlags) (& CFRange)))
  (define CFStringFindAndReplace
    (foreign-procedure "CFStringFindAndReplace"
		       (CFMutableStringRef CFStringRef CFStringRef (& CFRange) CFStringCompareFlags) CFIndex))
  (define CFStringFindCharacterFromSet
    (foreign-procedure "CFStringFindCharacterFromSet"
		       (CFStringRef CFCharacterSetRef (& CFRange) CFStringCompareFlags (* CFRange)) Boolean))
  (define CFStringFindWithOptions
    (foreign-procedure "CFStringFindWithOptions"
		       (CFStringRef CFStringRef (& CFRange) CFStringCompareFlags (* CFRange)) Boolean))
  (define CFStringFindWithOptionsAndLocale
    (foreign-procedure "CFStringFindWithOptionsAndLocale"
		       (CFStringRef CFStringRef (& CFRange) CFStringCompareFlags CFLocaleRef (* CFRange)) Boolean))
  (define CFStringFold
    (foreign-procedure "CFStringFold"
		       (CFMutableStringRef CFStringCompareFlags CFLocaleRef) void))
  (define CFStringGetBytes
    (foreign-procedure "CFStringGetBytes"
		       (CFStringRef (& CFRange) CFStringEncoding unsigned-8 Boolean u8* CFIndex (* CFIndex)) CFIndex))
  (define CFStringGetCString
    (foreign-procedure "CFStringGetCString"
		       (CFStringRef u8* CFIndex CFStringEncoding) Boolean))
  (define CFStringGetCStringPtr
    (foreign-procedure "CFStringGetCStringPtr"
		       (CFStringRef CFStringEncoding) string))
  (define CFStringGetCharacterAtIndex
    (foreign-procedure "CFStringGetCharacterAtIndex"
		       (CFStringRef CFIndex) UniChar))
  (define CFStringGetCharacters
    (foreign-procedure "CFStringGetCharacters"
		       (CFStringRef (& CFRange) (* UniChar)) void))
  (define CFStringGetCharactersPtr
    (foreign-procedure "CFStringGetCharactersPtr"
		       (CFStringRef) (* UniChar)))
  (define CFStringGetDoubleValue
    (foreign-procedure "CFStringGetDoubleValue"
		       (CFStringRef) double))
  (define CFStringGetFastestEncoding
    (foreign-procedure "CFStringGetFastestEncoding"
		       (CFStringRef) CFStringEncoding))
  (define CFStringGetFileSystemRepresentation
    (foreign-procedure "CFStringGetFileSystemRepresentation"
		       (CFStringRef u8* CFIndex) Boolean))
  (define CFStringGetHyphenationLocationBeforeIndex
    (foreign-procedure "CFStringGetHyphenationLocationBeforeIndex"
		       (CFStringRef CFIndex (& CFRange) CFOptionFlags CFLocaleRef (* UTF32Char)) CFIndex))
  (define CFStringGetIntValue
    (foreign-procedure "CFStringGetIntValue"
		       (CFStringRef) integer-32)) ; TODO: MacTypes integer types?
  (define CFStringGetLength
    (foreign-procedure "CFStringGetLength"
		       (CFStringRef) CFIndex))
  (define CFStringGetLineBounds
    (foreign-procedure "CFStringGetLineBounds"
		       (CFStringRef (& CFRange) (* CFIndex) (* CFIndex) (* CFIndex)) void))
  (define CFStringGetListOfAvailableEncodings
    (foreign-procedure "CFStringGetListOfAvailableEncodings"
		       () (* CFStringEncoding)))
  (define CFStringGetMaximumSizeForEncoding
    (foreign-procedure "CFStringGetMaximumSizeForEncoding"
		       (CFIndex CFStringEncoding) CFIndex))
  (define CFStringGetMaximumSizeOfFileSystemRepresentation
    (foreign-procedure "CFStringGetMaximumSizeOfFileSystemRepresentation"
		       (CFStringRef) CFIndex))
  (define CFStringGetMostCompatibleMacStringEncoding
    (foreign-procedure "CFStringGetMostCompatibleMacStringEncoding"
		       (CFStringEncoding) CFStringEncoding))
  (define CFStringGetNameOfEncoding
    (foreign-procedure "CFStringGetNameOfEncoding"
		       (CFStringEncoding) CFStringRef))
  (define CFStringGetParagraphBounds
    (foreign-procedure "CFStringGetParagraphBounds"
		       (CFStringRef (& CFRange) (* CFIndex) (* CFIndex) (* CFIndex)) void))
  (define CFStringGetPascalString
    (foreign-procedure "CFStringGetPascalString"
		       (CFStringRef StringPtr CFIndex CFStringEncoding) Boolean))
  (define CFStringGetPascalStringPtr
    (foreign-procedure "CFStringGetPascalStringPtr"
		       (CFStringRef CFStringEncoding) ConstStringPtr))
  ;; CFStringGetRangeOfCharacterClusterAtIndex "Apple private"
  (define CFStringGetRangeOfComposedCharactersAtIndex
    (foreign-procedure "CFStringGetRangeOfComposedCharactersAtIndex"
		       (CFStringRef CFIndex) (& CFRange)))
  (define CFStringGetSmallestEncoding
    (foreign-procedure "CFStringGetSmallestEncoding"
		       (CFStringRef) CFStringEncoding))
  (define CFStringGetSystemEncoding
    (foreign-procedure "CFStringGetSystemEncoding"
		       () CFStringEncoding))
  (define CFStringGetTypeID
    (foreign-procedure "CFStringGetTypeID"
		       () CFTypeID))
  (define CFStringHasPrefix
    (foreign-procedure "CFStringHasPrefix"
		       (CFStringRef CFStringRef) Boolean))
  (define CFStringHasSuffix
    (foreign-procedure "CFStringHasSuffix"
		       (CFStringRef CFStringRef) Boolean))
  ;; CFStringHashCString "CF and Foundation internal"
  ;; CFStringHashCharacters "CF and Foundation internal"
  ;; CFStringHashISOLatin1String "CF and Foundation internal"
  ;; CFStringHashNSString "CF and Foundation internal"
  (define CFStringInsert
    (foreign-procedure "CFStringInsert"
		       (CFMutableStringRef CFIndex CFStringRef) void))
  (define CFStringIsEncodingAvailable
    (foreign-procedure "CFStringIsEncodingAvailable"
		       (CFStringEncoding) Boolean))
  (define CFStringIsHyphenationAvailableForLocale
    (foreign-procedure "CFStringIsHyphenationAvailableForLocale"
		       (CFLocaleRef) Boolean))
  (define CFStringLowercase
    (foreign-procedure "CFStringLowercase"
		       (CFMutableStringRef CFLocaleRef) void))
  (define CFStringNormalize
    (foreign-procedure "CFStringNormalize"
		       (CFMutableStringRef CFStringNormalizationForm) void))
  ;; CFStringOpenUText "Apple private"
  (define CFStringPad
    (foreign-procedure "CFStringPad"
		       (CFMutableStringRef CFStringRef CFIndex CFIndex) void))
  (define CFStringReplace
    (foreign-procedure "CFStringReplace"
		       (CFMutableStringRef (& CFRange) CFStringRef) void))
  (define CFStringReplaceAll
    (foreign-procedure "CFStringReplaceAll"
		       (CFMutableStringRef CFStringRef) void))
  (define CFStringSetExternalCharactersNoCopy
    (foreign-procedure "CFStringSetExternalCharactersNoCopy"
		       (CFMutableStringRef (* UniChar) CFIndex CFIndex) void))
  (define CFStringTransform
    (foreign-procedure "CFStringTransform"
		       (CFMutableStringRef (* CFRange) CFStringRef Boolean) Boolean))
  (define CFStringTrim
    (foreign-procedure "CFStringTrim"
		       (CFMutableStringRef CFStringRef) void))
  (define CFStringTrimWhitespace
    (foreign-procedure "CFStringTrimWhitespace"
		       (CFMutableStringRef) void))
  (define CFStringUppercase
    (foreign-procedure "CFStringUppercase"
		       (CFMutableStringRef CFLocaleRef) void))
  (define CFSTR
    (foreign-procedure "__CFStringMakeConstantString"
		       (string) CFStringRef))
  )
