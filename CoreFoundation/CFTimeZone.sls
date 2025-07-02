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
;; Based on Apple's CoreFoundation/CFTimeZone.h
(library
  (CoreFoundation CFTimeZone)
  (export
    CFTimeZoneNameStyle
    kCFTimeZoneNameStyleStandard
    kCFTimeZoneNameStyleShortStandard
    kCFTimeZoneNameStyleDaylightSaving
    kCFTimeZoneNameStyleShortDaylightSaving
    kCFTimeZoneNameStyleGeneric
    kCFTimeZoneNameStyleShortGeneric
    kCFTimeZoneSystemTimeZoneDidChangeNotification
    CFTimeZoneGetTypeID
    CFTimeZoneCopySystem
    CFTimeZoneResetSystem
    CFTimeZoneCopyDefault
    CFTimeZoneSetDefault
    CFTimeZoneCopyKnownNames
    CFTimeZoneCopyAbbreviationDictionary
    CFTimeZoneSetAbbreviationDictionary
    CFTimeZoneCreate
    CFTimeZoneCreateWithTimeIntervalFromGMT
    CFTimeZoneCreateWithName
    CFTimeZoneGetName
    CFTimeZoneGetData
    CFTimeZoneGetSecondsFromGMT
    CFTimeZoneCopyAbbreviation
    CFTimeZoneIsDaylightSavingTime
    CFTimeZoneGetDaylightSavingTimeOffset
    CFTimeZoneGetNextDaylightSavingTimeTransition
    CFTimeZoneCopyLocalizedName)
  (import
    (chezscheme)
    (CoreFoundation CFBase)
    (CoreFoundation CFArray)
    (CoreFoundation CFData)
    (CoreFoundation CFDate)
    (CoreFoundation CFDictionary)
    (CoreFoundation CFString)
    (CoreFoundation CFNotificationCenter)
    (CoreFoundation CFLocale))

  ;;------------;;
  ;; CFTimeZone ;;
  ;;============;;

  (define init
    (load-shared-object "CoreFoundation.framework/CoreFoundation"))

  ;;
  ;; Types
  ;;

  (define-ftype CFTimeZoneNameStyle CFIndex)

  ;;
  ;; Constants
  ;;

  (define kCFTimeZoneNameStyleStandard            0)
  (define kCFTimeZoneNameStyleShortStandard       1)
  (define kCFTimeZoneNameStyleDaylightSaving      2)
  (define kCFTimeZoneNameStyleShortDaylightSaving 3)
  (define kCFTimeZoneNameStyleGeneric             4)
  (define kCFTimeZoneNameStyleShortGeneric        5)

  (define kCFTimeZoneSystemTimeZoneDidChangeNotification
    (make-ftype-pointer CFNotificationName
			(foreign-entry "kCFTimeZoneSystemTimeZoneDidChangeNotification")))

  ;;
  ;; Functions
  ;;

  (define CFTimeZoneGetTypeID
    (foreign-procedure "CFTimeZoneGetTypeID"
		       () CFTypeID))
  (define CFTimeZoneCopySystem
    (foreign-procedure "CFTimeZoneCopySystem"
		       () CFTimeZoneRef))
  (define CFTimeZoneResetSystem
    (foreign-procedure "CFTimeZoneResetSystem"
		       () void))
  (define CFTimeZoneCopyDefault
    (foreign-procedure "CFTimeZoneCopyDefault"
		       () CFTimeZoneRef))
  (define CFTimeZoneSetDefault
    (foreign-procedure "CFTimeZoneSetDefault"
		       (CFTimeZoneRef) void))
  (define CFTimeZoneCopyKnownNames
    (foreign-procedure "CFTimeZoneCopyKnownNames"
		       () CFArrayRef))
  (define CFTimeZoneCopyAbbreviationDictionary
    (foreign-procedure "CFTimeZoneCopyAbbreviationDictionary"
		       () CFDictionaryRef))
  (define CFTimeZoneSetAbbreviationDictionary
    (foreign-procedure "CFTimeZoneSetAbbreviationDictionary"
		       (CFDictionaryRef) void))
  (define CFTimeZoneCreate
    (foreign-procedure "CFTimeZoneCreate"
		       (CFAllocatorRef CFStringRef CFDataRef) CFTimeZoneRef))
  (define CFTimeZoneCreateWithTimeIntervalFromGMT
    (foreign-procedure "CFTimeZoneCreateWithTimeIntervalFromGMT"
		       (CFAllocatorRef CFTimeInterval) CFTimeZoneRef))
  (define CFTimeZoneCreateWithName
    (foreign-procedure "CFTimeZoneCreateWithName"
		       (CFAllocatorRef CFStringRef Boolean) CFTimeZoneRef))
  (define CFTimeZoneGetName
    (foreign-procedure "CFTimeZoneGetName"
		       (CFTimeZoneRef) CFStringRef))
  (define CFTimeZoneGetData
    (foreign-procedure "CFTimeZoneGetData"
		       (CFTimeZoneRef) CFDataRef))
  (define CFTimeZoneGetSecondsFromGMT
    (foreign-procedure "CFTimeZoneGetSecondsFromGMT"
		       (CFTimeZoneRef CFAbsoluteTime) CFTimeInterval))
  (define CFTimeZoneCopyAbbreviation
    (foreign-procedure "CFTimeZoneCopyAbbreviation"
		       (CFTimeZoneRef CFAbsoluteTime) CFStringRef))
  (define CFTimeZoneIsDaylightSavingTime
    (foreign-procedure "CFTimeZoneIsDaylightSavingTime"
		       (CFTimeZoneRef CFAbsoluteTime) Boolean))
  (define CFTimeZoneGetDaylightSavingTimeOffset
    (foreign-procedure "CFTimeZoneGetDaylightSavingTimeOffset"
		       (CFTimeZoneRef CFAbsoluteTime) CFTimeInterval))
  (define CFTimeZoneGetNextDaylightSavingTimeTransition
    (foreign-procedure "CFTimeZoneGetNextDaylightSavingTimeTransition"
		       (CFTimeZoneRef CFAbsoluteTime) CFAbsoluteTime))
  (define CFTimeZoneCopyLocalizedName
    (foreign-procedure "CFTimeZoneCopyLocalizedName"
		       (CFTimeZoneRef CFTimeZoneNameStyle CFLocaleRef) CFStringRef))
  )
