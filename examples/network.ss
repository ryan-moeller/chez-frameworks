(import (CoreFoundation))
(import (Network))

;; TODO: come up with a more interesting example
(define ip_definition (nw_protocol_copy_ip_definition))
(CFRelease ip_definition)
