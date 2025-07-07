(import (Network))

(define endpoint (nw_endpoint_create_host "localhost" "1337"))
(define parameters (nw_parameters_create))
(define stack (nw_parameters_copy_default_protocol_stack parameters))
(define options (nw_protocol_stack_copy_internet_protocol stack))
(nw_ip_options_set_version options nw_ip_version_4)
(define connection (nw_connection_create endpoint parameters))

;; This is where you'd do cool things with the connection if we could do blocks.

(nw_release connection)
(nw_release options)
(nw_release stack)
(nw_release parameters)
(nw_release endpoint)
