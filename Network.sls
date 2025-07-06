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
;; Based on Apple's Network/Network.h
(library
  (Network)
  (export)
  (import (chezscheme))

  ;;----------;;
  ;; Security ;;
  ;;==========;;

  (define init
    (load-shared-object "Network.framework/Network"))

  (export
    (import (Network advertise_descriptor))
    (import (Network browser))
    (import (Network browse_result))
    (import (Network browse_descriptor))
    (import (Network connection))
    (import (Network connection_group))
    (import (Network connection_report))
    (import (Network content_context))
    (import (Network endpoint))
    (import (Network ethernet_channel))
    (import (Network framer_options))
    (import (Network group_descriptor))
    (import (Network interface))
    (import (Network ip_options))
    (import (Network listener))
    (import (Network error))
    (import (Network parameters))
    (import (Network path_monitor))
    (import (Network path))
    (import (Network privacy_context))
    (import (Network protocol_options))
    (import (Network quic_options))
    (import (Network resolver_config))
    (import (Network tcp_options))
    (import (Network tls_options))
    (import (Network txt_record))
    (import (Network udp_options))
    (import (Network ws_options)))
  )
