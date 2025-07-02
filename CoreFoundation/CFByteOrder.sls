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
;; Based on Apple's CoreFoundation/CFByteOrder.h
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
