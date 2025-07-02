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
;; Based on Apple's CoreFoundation/CFAttributedString.h
(library
  (CoreFoundation CFAttributedString)
  (export
    CFAttributedStringRef
    CFMutableAttributedStringRef
    CFAttributedStringGetTypeID
    CFAttributedStringCreate
    CFAttributedStringCreateWithSubstring
    CFAttributedStringCreateCopy
    CFAttributedStringGetString
    CFAttributedStringGetLength
    CFAttributedStringGetAttributes
    CFAttributedStringGetAttribute
    CFAttributedStringGetAttributesAndLongestEffectiveRange
    CFAttributedStringGetAttributeAndLongestEffectiveRange
    CFAttributedStringCreateMutableCopy
    CFAttributedStringCreateMutable
    CFAttributedStringReplaceString
    CFAttributedStringGetMutableString
    CFAttributedStringSetAttributes
    CFAttributedStringSetAttribute
    CFAttributedStringRemoveAttribute
    CFAttributedStringReplaceAttributedString
    CFAttributedStringBeginEditing
    CFAttributedStringEndEditing)
  (import
    (chezscheme)
    (CoreFoundation CFBase)
    (CoreFoundation CFDictionary)
    (CoreFoundation CFString))

  ;;--------------------;;
  ;; CFAttributedString ;;
  ;;====================;;

  (define init
    (load-shared-object "CoreFoundation.framework/CoreFoundation"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [CFAttributedStringRef void*]
    [CFMutableAttributedStringRef void*])

  ;;
  ;; Constants
  ;;

  ;; (none defined)

  ;;
  ;; Functions
  ;;

  (define CFAttributedStringGetTypeID
    (foreign-procedure "CFAttributedStringGetTypeID"
		       () CFTypeID))
  (define CFAttributedStringCreate
    (foreign-procedure "CFAttributedStringCreate"
		       (CFAllocatorRef CFStringRef CFDictionaryRef) CFAttributedStringRef))
  (define CFAttributedStringCreateWithSubstring
    (foreign-procedure "CFAttributedStringCreateWithSubstring"
		       (CFAllocatorRef CFAttributedStringRef (& CFRange)) CFAttributedStringRef))
  (define CFAttributedStringCreateCopy
    (foreign-procedure "CFAttributedStringCreateCopy"
		       (CFAllocatorRef CFAttributedStringRef) CFAttributedStringRef))
  (define CFAttributedStringGetString
    (foreign-procedure "CFAttributedStringGetString"
		       (CFAttributedStringRef) CFStringRef))
  (define CFAttributedStringGetLength
    (foreign-procedure "CFAttributedStringGetLength"
		       (CFAttributedStringRef) CFIndex))
  (define CFAttributedStringGetAttributes
    (foreign-procedure "CFAttributedStringGetAttributes"
		       (CFAttributedStringRef CFIndex (* CFRange)) CFDictionaryRef))
  (define CFAttributedStringGetAttribute
    (foreign-procedure "CFAttributedStringGetAttribute"
		       (CFAttributedStringRef CFIndex CFStringRef (* CFRange)) CFTypeRef))
  (define CFAttributedStringGetAttributesAndLongestEffectiveRange
    (foreign-procedure "CFAttributedStringGetAttributesAndLongestEffectiveRange"
		       (CFAttributedStringRef CFIndex (& CFRange) (* CFRange)) CFDictionaryRef))
  (define CFAttributedStringGetAttributeAndLongestEffectiveRange
    (foreign-procedure "CFAttributedStringGetAttributeAndLongestEffectiveRange"
		       (CFAttributedStringRef CFIndex CFStringRef (& CFRange) (* CFRange)) CFTypeRef))
  (define CFAttributedStringCreateMutableCopy
    (foreign-procedure "CFAttributedStringCreateMutableCopy"
		       (CFAllocatorRef CFIndex CFAttributedStringRef) CFMutableAttributedStringRef))
  (define CFAttributedStringCreateMutable
    (foreign-procedure "CFAttributedStringCreateMutable"
		       (CFAllocatorRef CFIndex) CFMutableAttributedStringRef))
  (define CFAttributedStringReplaceString
    (foreign-procedure "CFAttributedStringReplaceString"
		       (CFMutableAttributedStringRef (& CFRange) CFStringRef) void))
  (define CFAttributedStringGetMutableString
    (foreign-procedure "CFAttributedStringGetMutableString"
		       (CFMutableAttributedStringRef) CFMutableStringRef))
  (define CFAttributedStringSetAttributes
    (foreign-procedure "CFAttributedStringSetAttributes"
		       (CFMutableAttributedStringRef (& CFRange) CFDictionaryRef Boolean) void))
  (define CFAttributedStringSetAttribute
    (foreign-procedure "CFAttributedStringSetAttribute"
			(CFMutableAttributedStringRef (& CFRange) CFStringRef CFTypeRef) void))
  (define CFAttributedStringRemoveAttribute
    (foreign-procedure "CFAttributedStringRemoveAttribute"
		       (CFMutableAttributedStringRef (& CFRange) CFStringRef) void))
  (define CFAttributedStringReplaceAttributedString
    (foreign-procedure "CFAttributedStringReplaceAttributedString"
		       (CFMutableAttributedStringRef (& CFRange) CFAttributedStringRef) void))
  (define CFAttributedStringBeginEditing
    (foreign-procedure "CFAttributedStringBeginEditing"
		       (CFMutableAttributedStringRef) void))
  (define CFAttributedStringEndEditing
    (foreign-procedure "CFAttributedStringEndEditing"
		       (CFMutableAttributedStringRef) void))
  )
