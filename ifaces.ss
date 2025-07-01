(import
  (CoreFoundation)
  (SystemConfiguration))

(define-syntax ftype-alloc
  (syntax-rules ()
    [(_ t) (make-ftype-pointer t (foreign-alloc (ftype-sizeof t)))]))
(define ftype-free
  (lambda (p)
    (foreign-free (ftype-pointer-address p))))
(define make-CFRange
  (lambda (location length)
    (let ([p (ftype-alloc CFRange)])
      (ftype-set! CFRange (location) p location)
      (ftype-set! CFRange (length) p length)
      p)))
(define CFStringRef->string
  (lambda (r)
    (define len (CFStringGetLength r))
    (define range (make-CFRange 0 len))
    (define buf (make-bytevector (* (+ len 1) (ftype-sizeof UniChar)) 0))
    (lock-object buf)
    (let ([p (make-ftype-pointer UniChar (object->reference-address buf))])
      (CFStringGetCharacters r range p)
      (unlock-object buf)
      (utf16->string buf (native-endianness)))))
(define Boolean->bool
  (lambda (b)
    (not (= 0 b))))

(define ifaces (SCNetworkInterfaceCopyAll))
(define nifaces (CFArrayGetCount ifaces))
(define ifrange (make-CFRange 0 nifaces))
(define iter-ifaces-entry-point
  (let ([code (foreign-callable
		(lambda (iface context)
		  (define bsdname (SCNetworkInterfaceGetBSDName iface))
		  (define mac (SCNetworkInterfaceGetHardwareAddressString iface))
		  (define type (SCNetworkInterfaceGetInterfaceType iface))
		  (define mtu_cur (ftype-alloc int))
		  (define mtu_min (ftype-alloc int))
		  (define mtu_max (ftype-alloc int))
		  (display (CFStringRef->string bsdname))
		  (display " (")
		  (display (CFStringRef->string mac))
		  (display "): ")
		  (display (CFStringRef->string type))
		  (if (Boolean->bool
			(SCNetworkInterfaceCopyMTU iface mtu_cur mtu_min mtu_max))
		    (display (format " mtu cur ~a, min ~a, max ~a"
				     (ftype-ref int () mtu_cur)
				     (ftype-ref int () mtu_min)
				     (ftype-ref int () mtu_max))))
		  (newline)
		  (ftype-free mtu_cur)
		  (ftype-free mtu_min)
		  (ftype-free mtu_max))
		(SCNetworkInterfaceRef void*) void)])
    (lock-object code)
    (foreign-callable-entry-point code)))
(define iter-ifaces (make-ftype-pointer CFArrayApplierFunction iter-ifaces-entry-point))

(CFArrayApplyFunction ifaces ifrange iter-ifaces 0)
