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
;; Based on Apple's CoreFoundation/CFCalendar.h
(library
  (CoreFoundation CFCalendar)
  (export
    CFCalendarRef
    CFCalendarUnit
    kCFCalendarUnitEra
    kCFCalendarUnitYear
    kCFCalendarUnitMonth
    kCFCalendarUnitDay
    kCFCalendarUnitHour
    kCFCalendarUnitMinute
    kCFCalendarUnitSecond
    kCFCalendarUnitWeek
    kCFCalendarUnitWeekday
    kCFCalendarUnitWeekdayOrdinal
    kCFCalendarUnitQuarter
    kCFCalendarUnitWeekOfMonth
    kCFCalendarUnitWeekOfYear
    kCFCalendarUnitYearForWeekOfYear
    kCFCalendarComponentsWrap
    CFCalendarGetTypeID
    CFCalendarCopyCurrent
    CFCalendarCreateWithIdentifier
    CFCalendarGetIdentifier
    CFCalendarCopyLocale
    CFCalendarSetLocale
    CFCalendarCopyTimeZone
    CFCalendarSetTimeZone
    CFCalendarGetFirstWeekday
    CFCalendarSetFirstWeekday
    CFCalendarGetMinimumDaysInFirstWeek
    CFCalendarSetMinimumDaysInFirstWeek
    CFCalendarGetMinimumRangeOfUnit
    CFCalendarGetMaximumRangeOfUnit
    CFCalendarGetRangeOfUnit
    CFCalendarGetOrdinalityOfUnit
    CFCalendarGetTimeRangeOfUnit
    CFCalendarComposeAbsoluteTime
    CFCalendarDecomposeAbsoluteTime
    CFCalendarAddComponents
    CFCalendarGetComponentDifference)
  (import
    (chezscheme)
    (CoreFoundation CFBase)
    (CoreFoundation CFLocale)
    (CoreFoundation CFDate)
    (CoreFoundation CFTimeZone))

  ;;------------;;
  ;; CFCalendar ;;
  ;;============;;

  (define init
    (load-shared-object "CoreFoundation.framework/CoreFoundation"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [CFCalendarRef void*]
    [CFCalendarUnit CFOptionFlags])

  ;;
  ;; Constants
  ;;

  (define kCFCalendarUnitEra               #x0001)
  (define kCFCalendarUnitYear              #x0002)
  (define kCFCalendarUnitMonth             #x0004)
  (define kCFCalendarUnitDay               #x0008)
  (define kCFCalendarUnitHour              #x0010)
  (define kCFCalendarUnitMinute            #x0020)
  (define kCFCalendarUnitSecond            #x0040)
  (define kCFCalendarUnitWeek              #x0080)
  (define kCFCalendarUnitWeekday           #x0100)
  (define kCFCalendarUnitWeekdayOrdinal    #x0200)
  (define kCFCalendarUnitQuarter           #x0400)
  (define kCFCalendarUnitWeekOfMonth       #x0800)
  (define kCFCalendarUnitWeekOfYear        #x1000)
  (define kCFCalendarUnitYearForWeekOfYear #x2000)

  (define kCFCalendarComponentsWrap 1)

  ;;
  ;; Functions
  ;;

  (define CFCalendarGetTypeID
    (foreign-procedure "CFCalendarGetTypeID"
		       () CFTypeID))
  (define CFCalendarCopyCurrent
    (foreign-procedure "CFCalendarCopyCurrent"
		       () CFCalendarRef))
  (define CFCalendarCreateWithIdentifier
    (foreign-procedure "CFCalendarCreateWithIdentifier"
		       (CFAllocatorRef CFCalendarIdentifier) CFCalendarRef))
  (define CFCalendarGetIdentifier
    (foreign-procedure "CFCalendarGetIdentifier"
		       (CFCalendarRef) CFCalendarIdentifier))
  (define CFCalendarCopyLocale
    (foreign-procedure "CFCalendarCopyLocale"
		       (CFCalendarRef) CFLocaleRef))
  (define CFCalendarSetLocale
    (foreign-procedure "CFCalendarSetLocale"
		       (CFCalendarRef CFLocaleRef) void))
  (define CFCalendarCopyTimeZone
    (foreign-procedure "CFCalendarCopyTimeZone"
		       (CFCalendarRef) CFTimeZoneRef))
  (define CFCalendarSetTimeZone
    (foreign-procedure "CFCalendarSetTimeZone"
		       (CFCalendarRef CFTimeZoneRef) void))
  (define CFCalendarGetFirstWeekday
    (foreign-procedure "CFCalendarGetFirstWeekday"
		       (CFCalendarRef) CFIndex))
  (define CFCalendarSetFirstWeekday
    (foreign-procedure "CFCalendarSetFirstWeekday"
		       (CFCalendarRef CFIndex) void))
  (define CFCalendarGetMinimumDaysInFirstWeek
    (foreign-procedure "CFCalendarGetMinimumDaysInFirstWeek"
		       (CFCalendarRef) CFIndex))
  (define CFCalendarSetMinimumDaysInFirstWeek
    (foreign-procedure "CFCalendarSetMinimumDaysInFirstWeek"
		       (CFCalendarRef CFIndex) void))
  (define CFCalendarGetMinimumRangeOfUnit
    (foreign-procedure "CFCalendarGetMinimumRangeOfUnit"
		       (CFCalendarRef CFCalendarUnit) (& CFRange)))
  (define CFCalendarGetMaximumRangeOfUnit
    (foreign-procedure "CFCalendarGetMaximumRangeOfUnit"
		       (CFCalendarRef CFCalendarUnit) (& CFRange)))
  (define CFCalendarGetRangeOfUnit
    (foreign-procedure "CFCalendarGetRangeOfUnit"
		       (CFCalendarRef CFCalendarUnit CFCalendarUnit CFAbsoluteTime) (& CFRange)))
  (define CFCalendarGetOrdinalityOfUnit
    (foreign-procedure "CFCalendarGetOrdinalityOfUnit"
		       (CFCalendarRef CFCalendarUnit CFCalendarUnit CFAbsoluteTime) CFIndex))
  (define CFCalendarGetTimeRangeOfUnit
    (foreign-procedure "CFCalendarGetTimeRangeOfUnit"
		       (CFCalendarRef CFCalendarUnit CFAbsoluteTime (* CFAbsoluteTime) (* CFAbsoluteTime)) Boolean))
  ;; The functions below are variadic.  The types of the variadic parameters
  ;; must be given before the variadic arguments begin, for example:
  ;;   (CFCalendarComposeAbsoluteTime gregorian at "yMdHms" (int int int int int int) 1965 1 6 14 10 0)
  ;; All types must be int.
  ;; TODO: infer the variadic type list from the format string
  (define-syntax CFCalendarComposeAbsoluteTime
    (syntax-rules ()
      [(_ calendar at componentDesc)
       (CFCalendarComposeAbsoluteTime calendar at componentDesc ())]
      [(_ calendar at componentDesc (t ...) e ...)
       ((foreign-procedure (__varargs_after 3) "CFCalendarComposeAbsoluteTime"
			   (CFCalendarRef (* CFAbsoluteTime) string t ...) Boolean)
	calendar at componentDesc e ...)]))
  (define-syntax CFCalendarDecomposeAbsoluteTime
    (syntax-rules ()
      [(_ calendar at componentDesc)
       (CFCalendarDecomposeAbsoluteTime calendar at componentDesc ())]
      [(_ calendar at componentDesc (t ...) e ...)
       ((foreign-procedure (__varargs_after 3) "CFCalendarDecomposeAbsoluteTime"
			   (CFCalendarRef CFAbsoluteTime string (* t) ...) Boolean)
	calendar at componentDesc e ...)]))
  (define-syntax CFCalendarAddComponents
    (syntax-rules ()
      [(_ calendar at options componentDesc)
       (CFCalendarAddComponents calendar at options componentDesc ())]
      [(_ calendar at options componentDesc (t ...) e ...)
       ((foreign-procedure (__varargs_after 4) "CFCalendarAddComponents"
			   (CFCalendarRef (* CFAbsoluteTime) CFOptionFlags string t ...) Boolean)
	calendar at options componentDesc e ...)]))
  (define-syntax CFCalendarGetComponentDifference
    (syntax-rules ()
      [(_ calendar start result options componentDesc)
       (CFCalendarGetComponentDifference calendar start result options componentDesc ())]
      [(_ calendar start result options componentDesc (t ...) e ...)
       ((foreign-procedure (__varargs_after 5) "CFCalendarGetComponentDifference"
			   (CFCalendarRef CFAbsoluteTime CFAbsoluteTime CFOptionFlags string (* t) ...) Boolean)
	calendar start result options componentDesc e ...)]))
  )
