(library
  (SystemConfiguration SCPreferencesPath)
  (export
    SCPreferencesPathCreateUniqueChild
    SCPreferencesPathGetValue
    SCPreferencesPathGetLink
    SCPreferencesPathSetValue
    SCPreferencesPathSetLink
    SCPreferencesPathRemoveValue)
  (import
    (chezscheme)
    (CoreFoundation)
    (SystemConfiguration SCPreferences))

  ;;-------------------;;
  ;; SCPreferencesPath ;;
  ;;===================;;

  (define init
    (load-shared-object "SystemConfiguration.framework/SystemConfiguration"))

  ;;
  ;; Types
  ;;

  ;; (none defined)

  ;;
  ;; Constants
  ;;

  ;; (none defined)

  ;;
  ;; Functions
  ;;

  (define SCPreferencesPathCreateUniqueChild
    (foreign-procedure "SCPreferencesPathCreateUniqueChild"
		       (SCPreferencesRef CFStringRef) CFStringRef))
  (define SCPreferencesPathGetValue
    (foreign-procedure "SCPreferencesPathGetValue"
		       (SCPreferencesRef CFStringRef) CFDictionaryRef))
  (define SCPreferencesPathGetLink
    (foreign-procedure "SCPreferencesPathGetLink"
		       (SCPreferencesRef CFStringRef) CFStringRef))
  (define SCPreferencesPathSetValue
    (foreign-procedure "SCPreferencesPathSetValue"
		       (SCPreferencesRef CFStringRef CFDictionaryRef) Boolean))
  (define SCPreferencesPathSetLink
    (foreign-procedure "SCPreferencesPathSetLink"
		       (SCPreferencesRef CFStringRef CFStringRef) Boolean))
  (define SCPreferencesPathRemoveValue
    (foreign-procedure "SCPreferencesPathRemoveValue"
		       (SCPreferencesRef CFStringRef) Boolean))
  )
