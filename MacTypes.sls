(library
  (MacTypes)
  (export
    Boolean
    ConstStr255Param
    ConstStringPtr
    LangCode
    RegionCode
    StringPtr
    UniChar
    UTF32Char)
  (import (chezscheme))

  ;;----------;;
  ;; MacTypes ;;
  ;;==========;;

  ;;
  ;; Types
  ;;

  (define-ftype
    [Boolean unsigned-8]
    [ConstStr255Param (* unsigned-8)]
    [ConstStringPtr void*]
    [LangCode integer-16]
    [RegionCode integer-16]
    [StringPtr void*]
    [UniChar unsigned-16]
    [UTF32Char unsigned-32])
  )
