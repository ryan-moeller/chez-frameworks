(library
  (CoreFoundation CFUserNotification)
  (export
    CFUserNotificationRef
    CFUserNotificationCallBack
    kCFUserNotificationStopAlertLevel
    kCFUserNotificationNoteAlertLevel
    kCFUserNotificationCautionAlertLevel
    kCFUserNotificationPlainAlertLevel
    kCFUserNotificationDefaultResponse
    kCFUserNotificationAlternateResponse
    kCFUserNotificationOtherResponse
    kCFUserNotificationCancelResponse
    kCFUserNotificationNoDefaultButtonFlag
    kCFUserNotificationUseRadioButtonsFlag
    kCFUserNotificationIconURLKey
    kCFUserNotificationSoundURLKey
    kCFUserNotificationLocalizationURLKey
    kCFUserNotificationAlertHeaderKey
    kCFUserNotificationAlertMessageKey
    kCFUserNotificationDefaultButtonTitleKey
    kCFUserNotificationAlternateButtonTitleKey
    kCFUserNotificationOtherButtonTitleKey
    kCFUserNotificationProgressIndicatorValueKey
    kCFUserNotificationPopUpTitlesKey
    kCFUserNotificationTextFieldTitlesKey
    kCFUserNotificationCheckBoxTitlesKey
    kCFUserNotificationTextFieldValuesKey
    kCFUserNotificationPopUpSelectionKey
    kCFUserNotificationAlertTopMostKey
    kCFUserNotificationKeyboardTypesKey
    CFUserNotificationGetTypeID
    CFUserNotificationCreate
    CFUserNotificationReceiveResponse
    CFUserNotificationGetResponseValue
    CFUserNotificationGetResponseDictionary
    CFUserNotificationUpdate
    CFUserNotificationCancel
    CFUserNotificationCreateRunLoopSource
    CFUserNotificationDisplayNotice
    CFUserNotificationDisplayAlert
    CFUserNotificationCheckBoxChecked
    CFUserNotificationSecureTextField
    CFUserNotificationPopUpSelection)
  (import
    (chezscheme)
    (CoreFoundation CFBase)
    (CoreFoundation CFDate)
    (CoreFoundation CFDictionary)
    (CoreFoundation CFString)
    (CoreFoundation CFURL)
    (CoreFoundation CFRunLoop))

  ;;--------------------;;
  ;; CFUserNotification ;;
  ;;====================;;

  (define init
    (load-shared-object "CoreFoundation.framework/CoreFoundation"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [CFUserNotificationRef void*])
  (define-ftype
    [CFUserNotificationCallBack (function (CFUserNotificationRef CFOptionFlags) void)])

  ;;
  ;; Constants
  ;;

  (define kCFUserNotificationStopAlertLevel    0)
  (define kCFUserNotificationNoteAlertLevel    1)
  (define kCFUserNotificationCautionAlertLevel 2)
  (define kCFUserNotificationPlainAlertLevel   3)

  (define kCFUserNotificationDefaultResponse   0)
  (define kCFUserNotificationAlternateResponse 1)
  (define kCFUserNotificationOtherResponse     2)
  (define kCFUserNotificationCancelResponse    3)

  (define kCFUserNotificationNoDefaultButtonFlag #x20)
  (define kCFUserNotificationUseRadioButtonsFlag #x40)

  (define kCFUserNotificationIconURLKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFUserNotificationIconURLKey")))
  (define kCFUserNotificationSoundURLKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFUserNotificationSoundURLKey")))
  (define kCFUserNotificationLocalizationURLKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFUserNotificationLocalizationURLKey")))
  (define kCFUserNotificationAlertHeaderKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFUserNotificationAlertHeaderKey")))
  (define kCFUserNotificationAlertMessageKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFUserNotificationAlertMessageKey")))
  (define kCFUserNotificationDefaultButtonTitleKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFUserNotificationDefaultButtonTitleKey")))
  (define kCFUserNotificationAlternateButtonTitleKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFUserNotificationAlternateButtonTitleKey")))
  (define kCFUserNotificationOtherButtonTitleKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFUserNotificationOtherButtonTitleKey")))
  (define kCFUserNotificationProgressIndicatorValueKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFUserNotificationProgressIndicatorValueKey")))
  (define kCFUserNotificationPopUpTitlesKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFUserNotificationPopUpTitlesKey")))
  (define kCFUserNotificationTextFieldTitlesKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFUserNotificationTextFieldTitlesKey")))
  (define kCFUserNotificationCheckBoxTitlesKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFUserNotificationCheckBoxTitlesKey")))
  (define kCFUserNotificationTextFieldValuesKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFUserNotificationTextFieldValuesKey")))
  (define kCFUserNotificationPopUpSelectionKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFUserNotificationPopUpSelectionKey")))
  (define kCFUserNotificationAlertTopMostKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFUserNotificationAlertTopMostKey")))
  (define kCFUserNotificationKeyboardTypesKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFUserNotificationKeyboardTypesKey")))

  ;;
  ;; Functions
  ;;

  (define CFUserNotificationGetTypeID
    (foreign-procedure "CFUserNotificationGetTypeID"
		       () CFTypeID))
  (define CFUserNotificationCreate
    (foreign-procedure "CFUserNotificationCreate"
		       (CFAllocatorRef CFTimeInterval CFOptionFlags (* integer-32) CFDictionaryRef) CFUserNotificationRef))
  (define CFUserNotificationReceiveResponse
    (foreign-procedure "CFUserNotificationReceiveResponse"
		       (CFUserNotificationRef CFTimeInterval (* CFOptionFlags)) integer-32))
  (define CFUserNotificationGetResponseValue
    (foreign-procedure "CFUserNotificationGetResponseValue"
		       (CFUserNotificationRef CFStringRef CFIndex) CFStringRef))
  (define CFUserNotificationGetResponseDictionary
    (foreign-procedure "CFUserNotificationGetResponseDictionary"
		       (CFUserNotificationRef) CFDictionaryRef))
  (define CFUserNotificationUpdate
    (foreign-procedure "CFUserNotificationUpdate"
		       (CFUserNotificationRef CFTimeInterval CFOptionFlags CFDictionaryRef) integer-32))
  (define CFUserNotificationCancel
    (foreign-procedure "CFUserNotificationCancel"
		       (CFUserNotificationRef) integer-32))
  (define CFUserNotificationCreateRunLoopSource
    (foreign-procedure "CFUserNotificationCreateRunLoopSource"
		       (CFAllocatorRef CFUserNotificationRef (* CFUserNotificationCallBack) CFIndex) CFRunLoopSourceRef))
  (define CFUserNotificationDisplayNotice
    (foreign-procedure "CFUserNotificationDisplayNotice"
		       (CFTimeInterval CFOptionFlags CFURLRef CFURLRef CFURLRef CFStringRef CFStringRef CFStringRef) integer-32))
  (define CFUserNotificationDisplayAlert
    (foreign-procedure "CFUserNotificationDisplayAlert"
		       (CFTimeInterval CFOptionFlags CFURLRef CFURLRef CFURLRef CFStringRef CFStringRef CFStringRef CFStringRef CFStringRef (* CFOptionFlags)) integer-32))
  ;; XXX: Should these operate on foreign types?
  (define CFUserNotificationCheckBoxChecked
    (lambda (i)
      (bitwise-arithmetic-shift-left i 8)))
  (define CFUserNotificationSecureTextField
    (lambda (i)
      (bitwise-arithmetic-shift-left i 16)))
  (define CFUserNotificationPopUpSelection
    (lambda (i)
      (bitwise-arithmetic-shift-left i 24)))
  )
