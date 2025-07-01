(library
  (CoreFoundation CFLocale)
  (export
    CFLocaleRef
    CFLocaleIdentifier
    CFLocaleKey
    CFLocaleLanguageDirection
    CFCalendarIdentifier
    kCFLocaleLanguageDirectionUnknown
    kCFLocaleLanguageDirectionLeftToRight
    kCFLocaleLanguageDirectionRightToLeft
    kCFLocaleLanguageDirectionTopToBottom
    kCFLocaleLanguageDirectionBottomToTop
    kCFLocaleCurrentLocaleDidChangeNotification
    kCFLocaleIdentifier
    kCFLocaleLanguageCode
    kCFLocaleCountryCode
    kCFLocaleScriptCode
    kCFLocaleVariantCode
    kCFLocaleExemplarCharacterSet
    kCFLocaleCalendarIdentifier
    kCFLocaleCalendar
    kCFLocaleCollationIdentifier
    kCFLocaleUsesMetricSystem
    kCFLocaleMeasurementSystem
    kCFLocaleDecimalSeparator
    kCFLocaleGroupingSeparator
    kCFLocaleCurrencySymbol
    kCFLocaleCurrencyCode
    kCFLocaleCollatorIdentifier
    kCFLocaleQuotationBeginDelimiterKey
    kCFLocaleQuotationEndDelimiterKey
    kCFLocaleAlternateQuotationBeginDelimiterKey
    kCFLocaleAlternateQuotationEndDelimiterKey
    kCFGregorianCalendar
    kCFBuddhistCalendar
    kCFChineseCalendar
    kCFHebrewCalendar
    kCFIslamicCalendar
    kCFIslamicCivilCalendar
    kCFJapaneseCalendar
    kCFRepublicOfChinaCalendar
    kCFPersianCalendar
    kCFIndianCalendar
    kCFISO8601Calendar
    kCFIslamicTabularCalendar
    kCFIslamicUmmAlQuraCalendar
    CFLocaleCopyAvailableLocaleIdentifiers
    CFLocaleCopyCommonISOCurrencyCodes
    CFLocaleCopyCurrent
    CFLocaleCopyDisplayNameForPropertyValue
    CFLocaleCopyISOCountryCodes
    CFLocaleCopyISOCurrencyCodes
    CFLocaleCopyISOLanguageCodes
    CFLocaleCopyPreferredLanguages
    CFLocaleCreate
    CFLocaleCreateCanonicalLanguageIdentifierFromString
    CFLocaleCreateCanonicalLocaleIdentifierFromScriptManagerCodes
    CFLocaleCreateCanonicalLocaleIdentifierFromString
    CFLocaleCreateComponentsFromLocaleIdentifier
    CFLocaleCreateCopy
    CFLocaleCreateLocaleIdentifierFromComponents
    CFLocaleCreateLocaleIdentifierFromWindowsLocaleCode
    CFLocaleGetIdentifier
    CFLocaleGetLanguageCharacterDirection
    CFLocaleGetLanguageLineDirection
    CFLocaleGetSystem
    CFLocaleGetTypeID
    CFLocaleGetValue
    CFLocaleGetWindowsLocaleCodeFromLocaleIdentifier)
  (import
    (chezscheme)
    (CoreFoundation CFBase)
    (CoreFoundation CFArray)
    (CoreFoundation CFDictionary)
    (CoreFoundation CFNotificationCenter))

  ;;----------;;
  ;; CFLocale ;;
  ;;==========;;

  (define init
    (load-shared-object "CoreFoundation.framework/CoreFoundation"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [CFLocaleRef void*]
    [CFLocaleIdentifier CFStringRef]
    [CFLocaleKey CFStringRef]
    [CFLocaleLanguageDirection CFIndex]
    [CFCalendarIdentifier CFStringRef])

  ;;
  ;; Constants
  ;;

  (define kCFLocaleLanguageDirectionUnknown     0)
  (define kCFLocaleLanguageDirectionLeftToRight 1)
  (define kCFLocaleLanguageDirectionRightToLeft 2)
  (define kCFLocaleLanguageDirectionTopToBottom 3)
  (define kCFLocaleLanguageDirectionBottomToTop 4)

  (define kCFLocaleCurrentLocaleDidChangeNotification
    (make-ftype-pointer CFNotificationName
			(foreign-entry "kCFLocaleCurrentLocaleDidChangeNotification")))

  (define kCFLocaleIdentifier
    (make-ftype-pointer CFLocaleKey
			(foreign-entry "kCFLocaleIdentifier")))
  (define kCFLocaleLanguageCode
    (make-ftype-pointer CFLocaleKey
			(foreign-entry "kCFLocaleLanguageCode")))
  (define kCFLocaleCountryCode
    (make-ftype-pointer CFLocaleKey
			(foreign-entry "kCFLocaleCountryCode")))
  (define kCFLocaleScriptCode
    (make-ftype-pointer CFLocaleKey
			(foreign-entry "kCFLocaleScriptCode")))
  (define kCFLocaleVariantCode
    (make-ftype-pointer CFLocaleKey
			(foreign-entry "kCFLocaleVariantCode")))

  (define kCFLocaleExemplarCharacterSet
    (make-ftype-pointer CFLocaleKey
			(foreign-entry "kCFLocaleExemplarCharacterSet")))
  (define kCFLocaleCalendarIdentifier
    (make-ftype-pointer CFLocaleKey
			(foreign-entry "kCFLocaleCalendarIdentifier")))
  (define kCFLocaleCalendar
    (make-ftype-pointer CFLocaleKey
			(foreign-entry "kCFLocaleCalendar")))
  (define kCFLocaleCollationIdentifier
    (make-ftype-pointer CFLocaleKey
			(foreign-entry "kCFLocaleCollationIdentifier")))
  (define kCFLocaleUsesMetricSystem
    (make-ftype-pointer CFLocaleKey
			(foreign-entry "kCFLocaleUsesMetricSystem")))
  (define kCFLocaleMeasurementSystem
    (make-ftype-pointer CFLocaleKey
			(foreign-entry "kCFLocaleMeasurementSystem")))
  (define kCFLocaleDecimalSeparator
    (make-ftype-pointer CFLocaleKey
			(foreign-entry "kCFLocaleDecimalSeparator")))
  (define kCFLocaleGroupingSeparator
    (make-ftype-pointer CFLocaleKey
			(foreign-entry "kCFLocaleGroupingSeparator")))
  (define kCFLocaleCurrencySymbol
    (make-ftype-pointer CFLocaleKey
			(foreign-entry "kCFLocaleCurrencySymbol")))
  (define kCFLocaleCurrencyCode
    (make-ftype-pointer CFLocaleKey
			(foreign-entry "kCFLocaleCurrencyCode")))
  (define kCFLocaleCollatorIdentifier
    (make-ftype-pointer CFLocaleKey
			(foreign-entry "kCFLocaleCollatorIdentifier")))
  (define kCFLocaleQuotationBeginDelimiterKey
    (make-ftype-pointer CFLocaleKey
			(foreign-entry "kCFLocaleQuotationBeginDelimiterKey")))
  (define kCFLocaleQuotationEndDelimiterKey
    (make-ftype-pointer CFLocaleKey
			(foreign-entry "kCFLocaleQuotationEndDelimiterKey")))
  (define kCFLocaleAlternateQuotationBeginDelimiterKey
    (make-ftype-pointer CFLocaleKey
			(foreign-entry "kCFLocaleAlternateQuotationBeginDelimiterKey")))
  (define kCFLocaleAlternateQuotationEndDelimiterKey
    (make-ftype-pointer CFLocaleKey
			(foreign-entry "kCFLocaleAlternateQuotationEndDelimiterKey")))

  (define kCFGregorianCalendar
    (make-ftype-pointer CFCalendarIdentifier
			(foreign-entry "kCFGregorianCalendar")))
  (define kCFBuddhistCalendar
    (make-ftype-pointer CFCalendarIdentifier
			(foreign-entry "kCFBuddhistCalendar")))
  (define kCFChineseCalendar
    (make-ftype-pointer CFCalendarIdentifier
			(foreign-entry "kCFChineseCalendar")))
  (define kCFHebrewCalendar
    (make-ftype-pointer CFCalendarIdentifier
			(foreign-entry "kCFHebrewCalendar")))
  (define kCFIslamicCalendar
    (make-ftype-pointer CFCalendarIdentifier
			(foreign-entry "kCFIslamicCalendar")))
  (define kCFIslamicCivilCalendar
    (make-ftype-pointer CFCalendarIdentifier
			(foreign-entry "kCFIslamicCivilCalendar")))
  (define kCFJapaneseCalendar
    (make-ftype-pointer CFCalendarIdentifier
			(foreign-entry "kCFJapaneseCalendar")))
  (define kCFRepublicOfChinaCalendar
    (make-ftype-pointer CFCalendarIdentifier
			(foreign-entry "kCFRepublicOfChinaCalendar")))
  (define kCFPersianCalendar
    (make-ftype-pointer CFCalendarIdentifier
			(foreign-entry "kCFPersianCalendar")))
  (define kCFIndianCalendar
    (make-ftype-pointer CFCalendarIdentifier
			(foreign-entry "kCFIndianCalendar")))
  (define kCFISO8601Calendar
    (make-ftype-pointer CFCalendarIdentifier
			(foreign-entry "kCFISO8601Calendar")))
  (define kCFIslamicTabularCalendar
    (make-ftype-pointer CFCalendarIdentifier
			(foreign-entry "kCFIslamicTabularCalendar")))
  (define kCFIslamicUmmAlQuraCalendar
    (make-ftype-pointer CFCalendarIdentifier
			(foreign-entry "kCFIslamicUmmAlQuraCalendar")))

  ;;
  ;; Functions
  ;;

  (define CFLocaleCopyAvailableLocaleIdentifiers
    (foreign-procedure "CFLocaleCopyAvailableLocaleIdentifiers"
		       () CFArrayRef))
  (define CFLocaleCopyCommonISOCurrencyCodes
    (foreign-procedure "CFLocaleCopyCommonISOCurrencyCodes"
		       () CFArrayRef))
  (define CFLocaleCopyCurrent
    (foreign-procedure "CFLocaleCopyCurrent"
		       () CFLocaleRef))
  (define CFLocaleCopyDisplayNameForPropertyValue
    (foreign-procedure "CFLocaleCopyDisplayNameForPropertyValue"
		       (CFLocaleRef CFLocaleKey CFStringRef) CFStringRef))
  (define CFLocaleCopyISOCountryCodes
    (foreign-procedure "CFLocaleCopyISOCountryCodes"
		       () CFArrayRef))
  (define CFLocaleCopyISOCurrencyCodes
    (foreign-procedure "CFLocaleCopyISOCurrencyCodes"
		       () CFArrayRef))
  (define CFLocaleCopyISOLanguageCodes
    (foreign-procedure "CFLocaleCopyISOLanguageCodes"
		       () CFArrayRef))
  (define CFLocaleCopyPreferredLanguages
    (foreign-procedure "CFLocaleCopyPreferredLanguages"
		       () CFArrayRef))
  (define CFLocaleCreate
    (foreign-procedure "CFLocaleCreate"
		       (CFAllocatorRef CFLocaleIdentifier) CFLocaleRef))
  (define CFLocaleCreateCanonicalLanguageIdentifierFromString
    (foreign-procedure "CFLocaleCreateCanonicalLanguageIdentifierFromString"
		       (CFAllocatorRef CFStringRef) CFLocaleIdentifier))
  (define CFLocaleCreateCanonicalLocaleIdentifierFromScriptManagerCodes
    (foreign-procedure "CFLocaleCreateCanonicalLocaleIdentifierFromScriptManagerCodes"
		       (CFAllocatorRef LangCode RegionCode) CFLocaleIdentifier))
  (define CFLocaleCreateCanonicalLocaleIdentifierFromString
    (foreign-procedure "CFLocaleCreateCanonicalLocaleIdentifierFromString"
		       (CFAllocatorRef CFStringRef) CFLocaleIdentifier))
  (define CFLocaleCreateComponentsFromLocaleIdentifier
    (foreign-procedure "CFLocaleCreateComponentsFromLocaleIdentifier"
		       (CFAllocatorRef CFLocaleIdentifier) CFDictionaryRef))
  (define CFLocaleCreateCopy
    (foreign-procedure "CFLocaleCreateCopy"
		       (CFAllocatorRef CFLocaleRef) CFLocaleRef))
  (define CFLocaleCreateLocaleIdentifierFromComponents
    (foreign-procedure "CFLocaleCreateLocaleIdentifierFromComponents"
		       (CFAllocatorRef CFDictionaryRef) CFLocaleIdentifier))
  (define CFLocaleCreateLocaleIdentifierFromWindowsLocaleCode
    (foreign-procedure "CFLocaleCreateLocaleIdentifierFromWindowsLocaleCode"
		       (CFAllocatorRef unsigned-32) CFLocaleIdentifier))
  (define CFLocaleGetIdentifier
    (foreign-procedure "CFLocaleGetIdentifier"
		       (CFLocaleRef) CFLocaleIdentifier))
  (define CFLocaleGetLanguageCharacterDirection
    (foreign-procedure "CFLocaleGetLanguageCharacterDirection"
		       (CFStringRef) CFLocaleLanguageDirection))
  (define CFLocaleGetLanguageLineDirection
    (foreign-procedure "CFLocaleGetLanguageLineDirection"
		       (CFStringRef) CFLocaleLanguageDirection))
  ;; CFLocaleGetLanguageRegionEncodingForLocaleIdentifier "Apple private"
  (define CFLocaleGetSystem
    (foreign-procedure "CFLocaleGetSystem"
		       () CFLocaleRef))
  (define CFLocaleGetTypeID
    (foreign-procedure "CFLocaleGetTypeID"
		       () CFTypeID))
  (define CFLocaleGetValue
    (foreign-procedure "CFLocaleGetValue"
		       (CFLocaleRef CFLocaleKey) CFTypeRef))
  (define CFLocaleGetWindowsLocaleCodeFromLocaleIdentifier
    (foreign-procedure "CFLocaleGetWindowsLocaleCodeFromLocaleIdentifier"
		       (CFLocaleIdentifier) unsigned-32))
  )
