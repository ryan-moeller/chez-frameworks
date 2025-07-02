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
;; Based on Apple's CoreFoundation/CFDateFormatter.h
(library
  (CoreFoundation CFDateFormatter)
  (export
    CFDateFormatterKey
    CFDateFormatterRef
    CFDateFormatterStyle
    CFISO8601DateFormatOptions
    kCFDateFormatterNoStyle
    kCFDateFormatterShortStyle
    kCFDateFormatterMediumStyle
    kCFDateFormatterLongStyle
    kCFDateFormatterFullStyle
    kCFISO8601DateFormatWithYear
    kCFISO8601DateFormatWithMonth
    kCFISO8601DateFormatWithWeekOfYear
    kCFISO8601DateFormatWithDay
    kCFISO8601DateFormatWithTime
    kCFISO8601DateFormatWithTimeZone
    kCFISO8601DateFormatterWithSpaceBetweenDateAndTime
    kCFISO8601DateFormatWithDashSeparatorInDate
    kCFISO8601DateFormatWithColonSeparatorInTime
    kCFISO8601DateFormatWithColonSeparatorInTimeZone
    kCFISO8601DateFormatWithFractionalSeconds
    kCFISO8601DateFormatWithFullDate
    kCFISO8601DateFormatWithFullTime
    kCFISO8601DateFormatWithInternetDateTime
    kCFDateFormatterIsLenient
    kCFDateFormatterTimeZone
    kCFDateFormatterCalendarName
    kCFDateFormatterDefaultFormat
    kCFDateFormatterTwoDigitStartDate
    kCFDateFormatterDefaultDate
    kCFDateFormatterCalendar
    kCFDateFormatterEraSymbols
    kCFDateFormatterMonthSymbols
    kCFDateFormatterShortMonthSymbols
    kCFDateFormatterWeekdaySymbols
    kCFDateFormatterAMSymbol
    kCFDateFormatterPMSymbol
    kCFDateFormatterLongEraSymbols
    kCFDateFormatterVeryShortMonthSymbols
    kCFDateFormatterStandaloneMonthSymbols
    kCFDateFormatterShortStandaloneMonthSymbols
    kCFDateFormatterVeryShortStandaloneMonthSymbols
    kCFDateFormatterVeryShortWeekdaySymbols
    kCFDateFormatterStandaloneWeekdaySymbols
    kCFDateFormatterShortStandaloneWeekdaySymbols
    kCFDateFormatterVeryShortStandaloneWeekdaySymbols
    kCFDateFormatterQuarterSymbols
    kCFDateFormatterShortQuarterSymbols
    kCFDateFormatterStandaloneQuarterSymbols
    kCFDateFormatterShortStandaloneQuarterSymbols
    kCFDateFormatterGregorianStartDate
    kCFDateFormatterDoesRelativeDateFormattingKey
    CFDateFormatterCreateDateFormatFromTemplate
    CFDateFormatterGetTypeID
    CFDateFormatterCreateISO8601Formatter
    CFDateFormatterCreate
    CFDateFormatterGetLocale
    CFDateFormatterGetDateStyle
    CFDateFormatterGetTimeStyle
    CFDateFormatterGetFormat
    CFDateFormatterSetFormat
    CFDateFormatterCreateStringWithDate
    CFDateFormatterCreateStringWithAbsoluteTime
    CFDateFormatterCreateDateFromString
    CFDateFormatterGetAbsoluteTimeFromString
    CFDateFormatterSetProperty
    CFDateFormatterCopyProperty)
  (import
    (chezscheme)
    (CoreFoundation CFBase)
    (CoreFoundation CFDate)
    (CoreFoundation CFLocale))

  ;;-----------------;;
  ;; CFDateFormatter ;;
  ;;=================;;

  (define init
    (load-shared-object "CoreFoundation.framework/CoreFoundation"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [CFDateFormatterKey CFStringRef]
    [CFDateFormatterRef void*]
    [CFDateFormatterStyle CFIndex]
    [CFISO8601DateFormatOptions CFOptionFlags])

  ;;
  ;; Constants
  ;;

  (define kCFDateFormatterNoStyle     0)
  (define kCFDateFormatterShortStyle  1)
  (define kCFDateFormatterMediumStyle 2)
  (define kCFDateFormatterLongStyle   3)
  (define kCFDateFormatterFullStyle   4)

  (define kCFISO8601DateFormatWithYear                       #x0001)
  (define kCFISO8601DateFormatWithMonth                      #x0002)
  (define kCFISO8601DateFormatWithWeekOfYear                 #x0004)
  (define kCFISO8601DateFormatWithDay                        #x0010)
  (define kCFISO8601DateFormatWithTime                       #x0020)
  (define kCFISO8601DateFormatWithTimeZone                   #x0040)
  (define kCFISO8601DateFormatterWithSpaceBetweenDateAndTime #x0080)
  (define kCFISO8601DateFormatWithDashSeparatorInDate        #x0100)
  (define kCFISO8601DateFormatWithColonSeparatorInTime       #x0200)
  (define kCFISO8601DateFormatWithColonSeparatorInTimeZone   #x0400)
  (define kCFISO8601DateFormatWithFractionalSeconds          #x0800)
  (define kCFISO8601DateFormatWithFullDate
    (bitwise-ior kCFISO8601DateFormatWithYear kCFISO8601DateFormatWithMonth kCFISO8601DateFormatWithDay kCFISO8601DateFormatWithDashSeparatorInDate))
  (define kCFISO8601DateFormatWithFullTime
    (bitwise-ior kCFISO8601DateFormatWithTime kCFISO8601DateFormatWithColonSeparatorInTime kCFISO8601DateFormatWithTimeZone kCFISO8601DateFormatWithColonSeparatorInTimeZone))
  (define kCFISO8601DateFormatWithInternetDateTime
    (bitwise-ior kCFISO8601DateFormatWithFullDate kCFISO8601DateFormatWithFullTime))

  (define kCFDateFormatterIsLenient
    (make-ftype-pointer CFDateFormatterKey
			(foreign-entry "kCFDateFormatterIsLenient")))
  (define kCFDateFormatterTimeZone
    (make-ftype-pointer CFDateFormatterKey
			(foreign-entry "kCFDateFormatterTimeZone")))
  (define kCFDateFormatterCalendarName
    (make-ftype-pointer CFDateFormatterKey
			(foreign-entry "kCFDateFormatterCalendarName")))
  (define kCFDateFormatterDefaultFormat
    (make-ftype-pointer CFDateFormatterKey
			(foreign-entry "kCFDateFormatterDefaultFormat")))
  (define kCFDateFormatterTwoDigitStartDate
    (make-ftype-pointer CFDateFormatterKey
			(foreign-entry "kCFDateFormatterTwoDigitStartDate")))
  (define kCFDateFormatterDefaultDate
    (make-ftype-pointer CFDateFormatterKey
			(foreign-entry "kCFDateFormatterDefaultDate")))
  (define kCFDateFormatterCalendar
    (make-ftype-pointer CFDateFormatterKey
			(foreign-entry "kCFDateFormatterCalendar")))
  (define kCFDateFormatterEraSymbols
    (make-ftype-pointer CFDateFormatterKey
			(foreign-entry "kCFDateFormatterEraSymbols")))
  (define kCFDateFormatterMonthSymbols
    (make-ftype-pointer CFDateFormatterKey
			(foreign-entry "kCFDateFormatterMonthSymbols")))
  (define kCFDateFormatterShortMonthSymbols
    (make-ftype-pointer CFDateFormatterKey
			(foreign-entry "kCFDateFormatterShortMonthSymbols")))
  (define kCFDateFormatterWeekdaySymbols
    (make-ftype-pointer CFDateFormatterKey
			(foreign-entry "kCFDateFormatterWeekdaySymbols")))
  (define kCFDateFormatterShortWeekdaySymbols
    (make-ftype-pointer CFDateFormatterKey
			(foreign-entry "kCFDateFormatterShortWeekdaySymbols")))
  (define kCFDateFormatterAMSymbol
    (make-ftype-pointer CFDateFormatterKey
			(foreign-entry "kCFDateFormatterAMSymbol")))
  (define kCFDateFormatterPMSymbol
    (make-ftype-pointer CFDateFormatterKey
			(foreign-entry "kCFDateFormatterPMSymbol")))
  (define kCFDateFormatterLongEraSymbols
    (make-ftype-pointer CFDateFormatterKey
			(foreign-entry "kCFDateFormatterLongEraSymbols")))
  (define kCFDateFormatterVeryShortMonthSymbols
    (make-ftype-pointer CFDateFormatterKey
			(foreign-entry "kCFDateFormatterVeryShortMonthSymbols")))
  (define kCFDateFormatterStandaloneMonthSymbols
    (make-ftype-pointer CFDateFormatterKey
			(foreign-entry "kCFDateFormatterStandaloneMonthSymbols")))
  (define kCFDateFormatterShortStandaloneMonthSymbols
    (make-ftype-pointer CFDateFormatterKey
			(foreign-entry "kCFDateFormatterShortStandaloneMonthSymbols")))
  (define kCFDateFormatterVeryShortStandaloneMonthSymbols
    (make-ftype-pointer CFDateFormatterKey
			(foreign-entry "kCFDateFormatterVeryShortStandaloneMonthSymbols")))
  (define kCFDateFormatterVeryShortWeekdaySymbols
    (make-ftype-pointer CFDateFormatterKey
			(foreign-entry "kCFDateFormatterVeryShortWeekdaySymbols")))
  (define kCFDateFormatterStandaloneWeekdaySymbols
    (make-ftype-pointer CFDateFormatterKey
			(foreign-entry "kCFDateFormatterStandaloneWeekdaySymbols")))
  (define kCFDateFormatterShortStandaloneWeekdaySymbols
    (make-ftype-pointer CFDateFormatterKey
			(foreign-entry "kCFDateFormatterShortStandaloneWeekdaySymbols")))
  (define kCFDateFormatterVeryShortStandaloneWeekdaySymbols
    (make-ftype-pointer CFDateFormatterKey
			(foreign-entry "kCFDateFormatterVeryShortStandaloneWeekdaySymbols")))
  (define kCFDateFormatterQuarterSymbols
    (make-ftype-pointer CFDateFormatterKey
			(foreign-entry "kCFDateFormatterQuarterSymbols")))
  (define kCFDateFormatterShortQuarterSymbols
    (make-ftype-pointer CFDateFormatterKey
			(foreign-entry "kCFDateFormatterShortQuarterSymbols")))
  (define kCFDateFormatterStandaloneQuarterSymbols
    (make-ftype-pointer CFDateFormatterKey
			(foreign-entry "kCFDateFormatterStandaloneQuarterSymbols")))
  (define kCFDateFormatterShortStandaloneQuarterSymbols
    (make-ftype-pointer CFDateFormatterKey
			(foreign-entry "kCFDateFormatterShortStandaloneQuarterSymbols")))
  (define kCFDateFormatterGregorianStartDate
    (make-ftype-pointer CFDateFormatterKey
			(foreign-entry "kCFDateFormatterGregorianStartDate")))
  (define kCFDateFormatterDoesRelativeDateFormattingKey
    (make-ftype-pointer CFDateFormatterKey
			(foreign-entry "kCFDateFormatterDoesRelativeDateFormattingKey")))

  ;;
  ;; Functions
  ;;

  (define CFDateFormatterCreateDateFormatFromTemplate
    (foreign-procedure "CFDateFormatterCreateDateFormatFromTemplate"
		       (CFAllocatorRef CFStringRef CFOptionFlags CFLocaleRef) CFStringRef))
  (define CFDateFormatterGetTypeID
    (foreign-procedure "CFDateFormatterGetTypeID"
		       () CFTypeID))
  (define CFDateFormatterCreateISO8601Formatter
    (foreign-procedure "CFDateFormatterCreateISO8601Formatter"
		       (CFAllocatorRef CFISO8601DateFormatOptions) CFDateFormatterRef))
  (define CFDateFormatterCreate
    (foreign-procedure "CFDateFormatterCreate"
		       (CFAllocatorRef CFLocaleRef CFDateFormatterStyle CFDateFormatterStyle) CFDateFormatterRef))
  (define CFDateFormatterGetLocale
    (foreign-procedure "CFDateFormatterGetLocale"
		       (CFDateFormatterRef) CFLocaleRef))
  (define CFDateFormatterGetDateStyle
    (foreign-procedure "CFDateFormatterGetDateStyle"
		       (CFDateFormatterRef) CFDateFormatterStyle))
  (define CFDateFormatterGetTimeStyle
    (foreign-procedure "CFDateFormatterGetTimeStyle"
		       (CFDateFormatterRef) CFDateFormatterStyle))
  (define CFDateFormatterGetFormat
    (foreign-procedure "CFDateFormatterGetFormat"
		       (CFDateFormatterRef) CFStringRef))
  (define CFDateFormatterSetFormat
    (foreign-procedure "CFDateFormatterSetFormat"
		       (CFDateFormatterRef CFStringRef) void))
  (define CFDateFormatterCreateStringWithDate
    (foreign-procedure "CFDateFormatterCreateStringWithDate"
		       (CFAllocatorRef CFDateFormatterRef CFDateRef) CFStringRef))
  (define CFDateFormatterCreateStringWithAbsoluteTime
    (foreign-procedure "CFDateFormatterCreateStringWithAbsoluteTime"
		       (CFAllocatorRef CFDateFormatterRef CFAbsoluteTime) CFStringRef))
  (define CFDateFormatterCreateDateFromString
    (foreign-procedure "CFDateFormatterCreateDateFromString"
		       (CFAllocatorRef CFDateFormatterRef CFStringRef (* CFRange)) CFDateRef))
  (define CFDateFormatterGetAbsoluteTimeFromString
    (foreign-procedure "CFDateFormatterGetAbsoluteTimeFromString"
		       (CFDateFormatterRef CFStringRef (* CFRange) (* CFAbsoluteTime)) Boolean))
  (define CFDateFormatterSetProperty
    (foreign-procedure "CFDateFormatterSetProperty"
		       (CFDateFormatterRef CFDateFormatterKey CFTypeRef) void))
  (define CFDateFormatterCopyProperty
    (foreign-procedure "CFDateFormatterCopyProperty"
		       (CFDateFormatterRef CFDateFormatterKey) CFTypeRef))
  )
