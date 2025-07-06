#|
   Copyright 2025 Ryan Moeller

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
|#
;; Based on Apple's Network/error.h
(library
  (Network error)
  (export
    nw_error_t
    nw_error_domain_t
    nw_error_domain_invalid
    nw_error_domain_posix
    nw_error_domain_dns
    nw_error_domain_tls
    kNWErrorDomainPOSIX
    kNWErrorDomainDNS
    kNWErrorDomainTLS
    nw_error_get_error_domain
    nw_error_get_error_code
    nw_error_copy_cf_error)
  (import
    (chezscheme)
    (CoreFoundation))

  ;;----------;;
  ;; nw_error ;;
  ;;==========;;

  (define init
    (load-shared-object "Network.framework/Network"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [nw_error_t void*]
    [nw_error_domain_t int])

  ;;
  ;; Constants
  ;;

  (define nw_error_domain_invalid 0)
  (define nw_error_domain_posix   1)
  (define nw_error_domain_dns     2)
  (define nw_error_domain_tls     3)

  (define kNWErrorDomainPOSIX
    (make-ftype-pointer CFStringRef
			(foreign-entry "kNWErrorDomainPOSIX")))
  (define kNWErrorDomainDNS
    (make-ftype-pointer CFStringRef
			(foreign-entry "kNWErrorDomainDNS")))
  (define kNWErrorDomainTLS
    (make-ftype-pointer CFStringRef
			(foreign-entry "kNWErrorDomainTLS")))

  ;;
  ;; Functions
  ;;

  (define nw_error_get_error_domain
    (foreign-procedure "nw_error_get_error_domain"
		       (nw_error_t) nw_error_domain_t))
  (define nw_error_get_error_code
    (foreign-procedure "nw_error_get_error_code"
		       (nw_error_t) int))
  (define nw_error_copy_cf_error
    (foreign-procedure "nw_error_copy_cf_error"
		       (nw_error_t) CFErrorRef))
  )
