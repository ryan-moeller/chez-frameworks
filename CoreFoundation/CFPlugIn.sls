(library
  (CoreFoundation CFPlugIn)
  (export
    )
  (import
    (chezscheme)
    (CoreFoundation CFBase)
    (CoreFoundation CFArray)
    (CoreFoundation CFBundle)
    (CoreFoundation CFString)
    (CoreFoundation CFURL)
    (CoreFoundation CFUUID))

  ;;----------;;
  ;; CFPlugIn ;;
  ;;==========;;

  (define init
    (load-shared-object "CoreFoundation.framework/CoreFoundation"))

  ;;
  ;; Types
  ;;

  (define-ftype
    )

  ;;
  ;; Constants
  ;;

  ;;
  ;; Functions
  ;;
  )
