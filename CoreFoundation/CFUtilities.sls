(library
  (CoreFoundation CFUtilities)
  (export CFCopyHomeDirectoryURL)
  (import
    (chezscheme)
    (CoreFoundation CFBase)
    (CoreFoundation CFURL))

  ;;-------------;;
  ;; CFUtilities ;;
  ;;=============;;

  (define init
    (load-shared-object "CoreFoundation.framework/CoreFoundation"))

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

  (define CFCopyHomeDirectoryURL
    (foreign-procedure "CFCopyHomeDirectoryURL"
		       () CFURLRef))
  )
