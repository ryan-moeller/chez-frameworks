(library
  (mach port)
  (export mach_port_t)
  (import (chezscheme))

  ;; XXX: Bare minimum.
  (define-ftype mach_port_t unsigned-int)
  )
