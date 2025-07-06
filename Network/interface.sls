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
;; Based on Apple's Network/interface.h
(library
  (Network interface)
  (export
    nw_interface_t
    nw_interface_type_t
    nw_interface_radio_type_t
    nw_interface_type_other
    nw_interface_type_wifi
    nw_interface_type_cellular
    nw_interface_type_wired
    nw_interface_type_loopback
    nw_interface_radio_type_unknown
    nw_interface_radio_type_wifi_b
    nw_interface_radio_type_wifi_a
    nw_interface_radio_type_wifi_g
    nw_interface_radio_type_wifi_n
    nw_interface_radio_type_wifi_ac
    nw_interface_radio_type_wifi_ax
    nw_interface_radio_type_cell_lte
    nw_interface_radio_type_cell_endc_sub6
    nw_interface_radio_type_cell_endc_mmw
    nw_interface_radio_type_cell_nr_sa_sub6
    nw_interface_radio_type_cell_nr_sa_mmw
    nw_interface_radio_type_cell_wcdma
    nw_interface_radio_type_cell_gsm
    nw_interface_radio_type_cell_cdma
    nw_interface_radio_type_cell_evdo
    nw_interface_get_type
    nw_interface_get_name
    nw_interface_get_index)
  (import (chezscheme))

  ;;--------------;;
  ;; nw_interface ;;
  ;;==============;;

  (define init
    (load-shared-object "Network.framework/Network"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [nw_interface_t void*]
    [nw_interface_type_t int]
    [nw_interface_radio_type_t int])

  ;;
  ;; Constants
  ;;

  (define nw_interface_type_other    0)
  (define nw_interface_type_wifi     1)
  (define nw_interface_type_cellular 2)
  (define nw_interface_type_wired    3)
  (define nw_interface_type_loopback 4)

  (define nw_interface_radio_type_unknown         #x00)
  (define nw_interface_radio_type_wifi_b          #x01)
  (define nw_interface_radio_type_wifi_a          #x02)
  (define nw_interface_radio_type_wifi_g          #x03)
  (define nw_interface_radio_type_wifi_n          #x04)
  (define nw_interface_radio_type_wifi_ac         #x05)
  (define nw_interface_radio_type_wifi_ax         #x06)
  (define nw_interface_radio_type_cell_lte        #x80)
  (define nw_interface_radio_type_cell_endc_sub6  #x81)
  (define nw_interface_radio_type_cell_endc_mmw   #x82)
  (define nw_interface_radio_type_cell_nr_sa_sub6 #x83)
  (define nw_interface_radio_type_cell_nr_sa_mmw  #x84)
  (define nw_interface_radio_type_cell_wcdma      #x85)
  (define nw_interface_radio_type_cell_gsm        #x86)
  (define nw_interface_radio_type_cell_cdma       #x87)
  (define nw_interface_radio_type_cell_evdo       #x88)

  ;;
  ;; Functions
  ;;
  (define nw_interface_get_type
    (foreign-procedure "nw_interface_get_type"
		       (nw_interface_t) nw_interface_type_t))
  (define nw_interface_get_name
    (foreign-procedure "nw_interface_get_name"
		       (nw_interface_t) string))
  (define nw_interface_get_index
    (foreign-procedure "nw_interface_get_index"
		       (nw_interface_t) unsigned-32))
  )
