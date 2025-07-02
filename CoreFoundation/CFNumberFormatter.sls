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
;; Based on Apple's CoreFoundation/CFNumberFormatter.h
(library
  (CoreFoundation CFNumberFormatter)
  (export
    CFNumberFormatterKey
    CFNumberFormatterRef
    CFNumberFormatterStyle
    CFNumberFormatterOptionFlags
    CFNumberFormatterRoundingMode
    CFNumberFormatterPadPosition
    kCFNumberFormatterNoStyle
    kCFNumberFormatterDecimalStyle
    kCFNumberFormatterCurrencyStyle
    kCFNumberFormatterPercentStyle
    kCFNumberFormatterScientificStyle
    kCFNumberFormatterSpellOutStyle
    kCFNumberFormatterOrdinalStyle
    kCFNumberFormatterCurrencyISOCodeStyle
    kCFNumberFormatterCurrencyPluralStyle
    kCFNumberFormatterCurrencyAccountingStyle
    kCFNumberFormatterParseIntegersOnly
    kCFNumberFormatterCurrencyCode
    kCFNumberFormatterDecimalSeparator
    kCFNumberFormatterCurrencyDecimalSeparator
    kCFNumberFormatterAlwaysShowDecimalSeparator
    kCFNumberFormatterGroupingSeparator
    kCFNumberFormatterUseGroupingSeparator
    kCFNumberFormatterPercentSymbol
    kCFNumberFormatterZeroSymbol
    kCFNumberFormatterNaNSymbol
    kCFNumberFormatterInfinitySymbol
    kCFNumberFormatterMinusSign
    kCFNumberFormatterPlusSign
    kCFNumberFormatterCurrencySymbol
    kCFNumberFormatterExponentSymbol
    kCFNumberFormatterMinIntegerDigits
    kCFNumberFormatterMaxIntegerDigits
    kCFNumberFormatterMinFractionDigits
    kCFNumberFormatterMaxFractionDigits
    kCFNumberFormatterGroupingSize
    kCFNumberFormatterSecondaryGroupingSize
    kCFNumberFormatterRoundingMode
    kCFNumberFormatterRoundingIncrement
    kCFNumberFormatterFormatWidth
    kCFNumberFormatterPaddingPosition
    kCFNumberFormatterPaddingCharacter
    kCFNumberFormatterDefaultFormat
    kCFNumberFormatterMultiplier
    kCFNumberFormatterPositivePrefix
    kCFNumberFormatterPositiveSuffix
    kCFNumberFormatterNegativePrefix
    kCFNumberFormatterNegativeSuffix
    kCFNumberFormatterPerMillSymbol
    kCFNumberFormatterInternationalCurrencySymbol
    kCFNumberFormatterCurrencyGroupingSeparator
    kCFNumberFormatterIsLenient
    kCFNumberFormatterUseSignificantDigits
    kCFNumberFormatterMinSignificantDigits
    kCFNumberFormatterMaxSignificantDigits
    kCFNumberFormatterRoundCeiling
    kCFNumberFormatterRoundFloor
    kCFNumberFormatterRoundDown
    kCFNumberFormatterRoundUp
    kCFNumberFormatterRoundHalfEven
    kCFNumberFormatterRoundHalfDown
    kCFNumberFormatterRoundHalfUp
    kCFNumberFormatterPadBeforePrefix
    kCFNumberFormatterPadAfterPrefix
    kCFNumberFormatterPadBeforeSuffix
    kCFNumberFormatterPadAfterSuffix
    CFNumberFormatterGetTypeID
    CFNumberFormatterCreate
    CFNumberFormatterGetLocale
    CFNumberFormatterGetStyle
    CFNumberFormatterGetFormat
    CFNumberFormatterSetFormat
    CFNumberFormatterCreateStringWithNumber
    CFNumberFormatterCreateStringWithValue
    CFNumberFormatterCreateNumberFromString
    CFNumberFormatterGetValueFromString
    CFNumberFormatterSetProperty
    CFNumberFormatterCopyProperty
    CFNumberFormatterGetDecimalInfoForCurrencyCode)
  (import
    (chezscheme)
    (CoreFoundation CFBase)
    (CoreFoundation CFNumber)
    (CoreFoundation CFLocale))

  ;;-------------------;;
  ;; CFNumberFormatter ;;
  ;;===================;;

  (define init
    (load-shared-object "CoreFoundation.framework/CoreFoundation"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [CFNumberFormatterKey CFStringRef]
    [CFNumberFormatterRef void*]
    [CFNumberFormatterStyle CFIndex]
    [CFNumberFormatterOptionFlags CFOptionFlags]
    [CFNumberFormatterRoundingMode CFIndex]
    [CFNumberFormatterPadPosition CFIndex])

  ;;
  ;; Constants
  ;;

  (define kCFNumberFormatterNoStyle                  0)
  (define kCFNumberFormatterDecimalStyle             1)
  (define kCFNumberFormatterCurrencyStyle            2)
  (define kCFNumberFormatterPercentStyle             3)
  (define kCFNumberFormatterScientificStyle          4)
  (define kCFNumberFormatterSpellOutStyle            5)
  (define kCFNumberFormatterOrdinalStyle             6)
  (define kCFNumberFormatterCurrencyISOCodeStyle     8)
  (define kCFNumberFormatterCurrencyPluralStyle      9)
  (define kCFNumberFormatterCurrencyAccountingStyle 10)

  (define kCFNumberFormatterParseIntegersOnly 1)

  (define kCFNumberFormatterCurrencyCode
    (make-ftype-pointer CFNumberFormatterKey
			(foreign-entry "kCFNumberFormatterCurrencyCode")))
  (define kCFNumberFormatterDecimalSeparator
    (make-ftype-pointer CFNumberFormatterKey
			(foreign-entry "kCFNumberFormatterDecimalSeparator")))
  (define kCFNumberFormatterCurrencyDecimalSeparator
    (make-ftype-pointer CFNumberFormatterKey
			(foreign-entry "kCFNumberFormatterCurrencyDecimalSeparator")))
  (define kCFNumberFormatterAlwaysShowDecimalSeparator
    (make-ftype-pointer CFNumberFormatterKey
			(foreign-entry "kCFNumberFormatterAlwaysShowDecimalSeparator")))
  (define kCFNumberFormatterGroupingSeparator
    (make-ftype-pointer CFNumberFormatterKey
			(foreign-entry "kCFNumberFormatterGroupingSeparator")))
  (define kCFNumberFormatterUseGroupingSeparator
    (make-ftype-pointer CFNumberFormatterKey
			(foreign-entry "kCFNumberFormatterUseGroupingSeparator")))
  (define kCFNumberFormatterPercentSymbol
    (make-ftype-pointer CFNumberFormatterKey
			(foreign-entry "kCFNumberFormatterPercentSymbol")))
  (define kCFNumberFormatterZeroSymbol
    (make-ftype-pointer CFNumberFormatterKey
			(foreign-entry "kCFNumberFormatterZeroSymbol")))
  (define kCFNumberFormatterNaNSymbol
    (make-ftype-pointer CFNumberFormatterKey
			(foreign-entry "kCFNumberFormatterNaNSymbol")))
  (define kCFNumberFormatterInfinitySymbol
    (make-ftype-pointer CFNumberFormatterKey
			(foreign-entry "kCFNumberFormatterInfinitySymbol")))
  (define kCFNumberFormatterMinusSign
    (make-ftype-pointer CFNumberFormatterKey
			(foreign-entry "kCFNumberFormatterMinusSign")))
  (define kCFNumberFormatterPlusSign
    (make-ftype-pointer CFNumberFormatterKey
			(foreign-entry "kCFNumberFormatterPlusSign")))
  (define kCFNumberFormatterCurrencySymbol
    (make-ftype-pointer CFNumberFormatterKey
			(foreign-entry "kCFNumberFormatterCurrencySymbol")))
  (define kCFNumberFormatterExponentSymbol
    (make-ftype-pointer CFNumberFormatterKey
			(foreign-entry "kCFNumberFormatterExponentSymbol")))
  (define kCFNumberFormatterMinIntegerDigits
    (make-ftype-pointer CFNumberFormatterKey
			(foreign-entry "kCFNumberFormatterMinIntegerDigits")))
  (define kCFNumberFormatterMaxIntegerDigits
    (make-ftype-pointer CFNumberFormatterKey
			(foreign-entry "kCFNumberFormatterMaxIntegerDigits")))
  (define kCFNumberFormatterMinFractionDigits
    (make-ftype-pointer CFNumberFormatterKey
			(foreign-entry "kCFNumberFormatterMinFractionDigits")))
  (define kCFNumberFormatterMaxFractionDigits
    (make-ftype-pointer CFNumberFormatterKey
			(foreign-entry "kCFNumberFormatterMaxFractionDigits")))
  (define kCFNumberFormatterGroupingSize
    (make-ftype-pointer CFNumberFormatterKey
			(foreign-entry "kCFNumberFormatterGroupingSize")))
  (define kCFNumberFormatterSecondaryGroupingSize
    (make-ftype-pointer CFNumberFormatterKey
			(foreign-entry "kCFNumberFormatterSecondaryGroupingSize")))
  (define kCFNumberFormatterRoundingMode
    (make-ftype-pointer CFNumberFormatterKey
			(foreign-entry "kCFNumberFormatterRoundingMode")))
  (define kCFNumberFormatterRoundingIncrement
    (make-ftype-pointer CFNumberFormatterKey
			(foreign-entry "kCFNumberFormatterRoundingIncrement")))
  (define kCFNumberFormatterFormatWidth
    (make-ftype-pointer CFNumberFormatterKey
			(foreign-entry "kCFNumberFormatterFormatWidth")))
  (define kCFNumberFormatterPaddingPosition
    (make-ftype-pointer CFNumberFormatterKey
			(foreign-entry "kCFNumberFormatterPaddingPosition")))
  (define kCFNumberFormatterPaddingCharacter
    (make-ftype-pointer CFNumberFormatterKey
			(foreign-entry "kCFNumberFormatterPaddingCharacter")))
  (define kCFNumberFormatterDefaultFormat
    (make-ftype-pointer CFNumberFormatterKey
			(foreign-entry "kCFNumberFormatterDefaultFormat")))
  (define kCFNumberFormatterMultiplier
    (make-ftype-pointer CFNumberFormatterKey
			(foreign-entry "kCFNumberFormatterMultiplier")))
  (define kCFNumberFormatterPositivePrefix
    (make-ftype-pointer CFNumberFormatterKey
			(foreign-entry "kCFNumberFormatterPositivePrefix")))
  (define kCFNumberFormatterPositiveSuffix
    (make-ftype-pointer CFNumberFormatterKey
			(foreign-entry "kCFNumberFormatterPositiveSuffix")))
  (define kCFNumberFormatterNegativePrefix
    (make-ftype-pointer CFNumberFormatterKey
			(foreign-entry "kCFNumberFormatterNegativePrefix")))
  (define kCFNumberFormatterNegativeSuffix
    (make-ftype-pointer CFNumberFormatterKey
			(foreign-entry "kCFNumberFormatterNegativeSuffix")))
  (define kCFNumberFormatterPerMillSymbol
    (make-ftype-pointer CFNumberFormatterKey
			(foreign-entry "kCFNumberFormatterPerMillSymbol")))
  (define kCFNumberFormatterInternationalCurrencySymbol
    (make-ftype-pointer CFNumberFormatterKey
			(foreign-entry "kCFNumberFormatterInternationalCurrencySymbol")))
  (define kCFNumberFormatterCurrencyGroupingSeparator
    (make-ftype-pointer CFNumberFormatterKey
			(foreign-entry "kCFNumberFormatterCurrencyGroupingSeparator")))
  (define kCFNumberFormatterIsLenient
    (make-ftype-pointer CFNumberFormatterKey
			(foreign-entry "kCFNumberFormatterIsLenient")))
  (define kCFNumberFormatterUseSignificantDigits
    (make-ftype-pointer CFNumberFormatterKey
			(foreign-entry "kCFNumberFormatterUseSignificantDigits")))
  (define kCFNumberFormatterMinSignificantDigits
    (make-ftype-pointer CFNumberFormatterKey
			(foreign-entry "kCFNumberFormatterMinSignificantDigits")))
  (define kCFNumberFormatterMaxSignificantDigits
    (make-ftype-pointer CFNumberFormatterKey
			(foreign-entry "kCFNumberFormatterMaxSignificantDigits")))

  (define kCFNumberFormatterRoundCeiling  0)
  (define kCFNumberFormatterRoundFloor    1)
  (define kCFNumberFormatterRoundDown     2)
  (define kCFNumberFormatterRoundUp       3)
  (define kCFNumberFormatterRoundHalfEven 4)
  (define kCFNumberFormatterRoundHalfDown 5)
  (define kCFNumberFormatterRoundHalfUp   6)

  (define kCFNumberFormatterPadBeforePrefix 0)
  (define kCFNumberFormatterPadAfterPrefix  1)
  (define kCFNumberFormatterPadBeforeSuffix 2)
  (define kCFNumberFormatterPadAfterSuffix  3)

  ;;
  ;; Functions
  ;;

  (define CFNumberFormatterGetTypeID
    (foreign-procedure "CFNumberFormatterGetTypeID"
		       () CFTypeID))
  (define CFNumberFormatterCreate
    (foreign-procedure "CFNumberFormatterCreate"
		       (CFAllocatorRef CFLocaleRef CFNumberFormatterStyle) CFNumberFormatterRef))
  (define CFNumberFormatterGetLocale
    (foreign-procedure "CFNumberFormatterGetLocale"
		       (CFNumberFormatterRef) CFLocaleRef))
  (define CFNumberFormatterGetStyle
    (foreign-procedure "CFNumberFormatterGetStyle"
		       (CFNumberFormatterRef) CFNumberFormatterStyle))
  (define CFNumberFormatterGetFormat
    (foreign-procedure "CFNumberFormatterGetFormat"
		       (CFNumberFormatterRef) CFStringRef))
  (define CFNumberFormatterSetFormat
    (foreign-procedure "CFNumberFormatterSetFormat"
		       (CFNumberFormatterRef CFStringRef) void))
  (define CFNumberFormatterCreateStringWithNumber
    (foreign-procedure "CFNumberFormatterCreateStringWithNumber"
		       (CFAllocatorRef CFNumberFormatterRef CFNumberRef) CFStringRef))
  (define CFNumberFormatterCreateStringWithValue
    (foreign-procedure "CFNumberFormatterCreateStringWithValue"
		       (CFAllocatorRef CFNumberFormatterRef CFNumberType void*) CFStringRef))
  (define CFNumberFormatterCreateNumberFromString
    (foreign-procedure "CFNumberFormatterCreateNumberFromString"
		       (CFAllocatorRef CFNumberFormatterRef CFStringRef (* CFRange) CFNumberFormatterOptionFlags) CFNumberRef))
  (define CFNumberFormatterGetValueFromString
    (foreign-procedure "CFNumberFormatterGetValueFromString"
		       (CFNumberFormatterRef CFStringRef (* CFRange) CFNumberType void*) Boolean))
  (define CFNumberFormatterSetProperty
    (foreign-procedure "CFNumberFormatterSetProperty"
		       (CFNumberFormatterRef CFNumberFormatterKey CFTypeRef) void))
  (define CFNumberFormatterCopyProperty
    (foreign-procedure "CFNumberFormatterCopyProperty"
		       (CFNumberFormatterRef CFNumberFormatterKey) CFTypeRef))
  (define CFNumberFormatterGetDecimalInfoForCurrencyCode
    (foreign-procedure "CFNumberFormatterGetDecimalInfoForCurrencyCode"
		       (CFStringRef (* integer-32) (* double)) Boolean))
  )
