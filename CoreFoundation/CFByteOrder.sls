(library
  (CoreFoundation CFByteOrder)
  (export
    CFByteOrder
    CFByteOrderUnknown
    CFByteOrderLittleEndian
    CFByteOrderBigEndian
    endianness->CFByteOrder
    CFByteOrderGetCurrent)
  (import
    (chezscheme)
    (CoreFoundation CFBase))

  ;;-------------;;
  ;; CFByteOrder ;;
  ;;=============;;

  (define init
    (load-shared-object "CoreFoundation.framework/CoreFoundation"))

  ;;
  ;; Types
  ;;

  (define-ftype CFByteOrder CFIndex)

  ;;
  ;; Constants
  ;;

  ;; XXX: Apple left out the k prefix on these.
  (define CFByteOrderUnknown      0)
  (define CFByteOrderLittleEndian 1)
  (define CFByteOrderBigEndian    2)

  ;;
  ;; Functions
  ;;

  ;; XXX: All of the functions in this header are inline.

  (define endianness->CFByteOrder
    (lambda (e)
      (case e
	[little CFByteOrderLittleEndian]
	[big CFByteOrderBigEndian]
	[else CFByteOrderUnknown])))

  (define CFByteOrderGetCurrent
    (lambda ()
      (endianness->CFByteOrder (native-endianness))))
  )
