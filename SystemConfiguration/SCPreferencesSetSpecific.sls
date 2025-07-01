(library
  (SystemConfiguration SCPreferencesSetSpecific)
  (export
    SCPreferencesSetComputerName
    SCPreferencesSetLocalHostName)
  (import
    (chezscheme)
    (CoreFoundation)
    (SystemConfiguration SCPreferences))

  ;;--------------------------;;
  ;; SCPreferencesSetSpecific ;;
  ;;==========================;;

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

  (define SCPreferencesSetComputerName
    (foreign-procedure "SCPreferencesSetComputerName"
		       (SCPreferencesRef CFStringRef CFStringEncoding) Boolean))
  (define SCPreferencesSetLocalHostName
    (foreign-procedure "SCPreferencesSetLocalHostName"
		       (SCPreferencesRef CFStringRef) Boolean))
  )
