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
;; Based on Apple's CoreFoundation/CoreFoundation.h
(library
  (CoreFoundation)
  (export)
  (import (chezscheme))

  ;;----------------;;
  ;; CoreFoundation ;;
  ;;================;;

  (define init
    (load-shared-object "CoreFoundation.framework/CoreFoundation"))

  (export
    (import (CoreFoundation CFBase))
    (import (CoreFoundation CFArray))
    (import (CoreFoundation CFBag))
    (import (CoreFoundation CFBinaryHeap))
    (import (CoreFoundation CFBitVector))
    (import (CoreFoundation CFByteOrder))
    (import (CoreFoundation CFCalendar))
    ;;(import (CoreFoundation CFCGTypes))
    (import (CoreFoundation CFCharacterSet))
    (import (CoreFoundation CFData))
    (import (CoreFoundation CFDate))
    (import (CoreFoundation CFDateFormatter))
    (import (CoreFoundation CFDictionary))
    (import (CoreFoundation CFError))
    (import (CoreFoundation CFLocale))
    (import (CoreFoundation CFNumber))
    (import (CoreFoundation CFNumberFormatter))
    (import (CoreFoundation CFPreferences))
    (import (CoreFoundation CFPropertyList))
    (import (CoreFoundation CFSet))
    (import (CoreFoundation CFString))
    (import (CoreFoundation CFStringEncodingExt))
    (import (CoreFoundation CFTimeZone))
    (import (CoreFoundation CFTree))
    (import (CoreFoundation CFURL))
    ;;(import (CoreFoundation CFURLAccess)) deprecated
    (import (CoreFoundation CFUUID))
    (import (CoreFoundation CFUtilities))
    (import (CoreFoundation CFBundle))

    ;;(import (CoreFoundation CFMessagePort))
    (import (CoreFoundation CFPlugIn))
    (import (CoreFoundation CFRunLoop))
    (import (CoreFoundation CFStream))
    (import (CoreFoundation CFSocket))
    ;;(import (CoreFoundation CFMachPort))

    (import (CoreFoundation CFAttributedString))
    (import (CoreFoundation CFNotificationCenter))

    (import (CoreFoundation CFURLEnumerator))

    ;;(import (CoreFoundation CFFileSecurity))
    (import (CoreFoundation CFStringTokenizer))
    (import (CoreFoundation CFFileDescriptor))

    (import (CoreFoundation CFUserNotification))
    ;;(import (CoreFoundation CFXMLNode))
    ;;(import (CoreFoundation CFXMLParser))
    )
  )
