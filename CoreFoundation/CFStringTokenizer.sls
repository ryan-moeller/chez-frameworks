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
;; Based on Apple's CoreFoundation/CFStringTokenizer.h
(library
  (CoreFoundation CFStringTokenizer)
  (export
    CFStringTokenizerRef
    CFStringTokenizerTokenType
    kCFStringTokenizerUnitWord
    kCFStringTokenizerUnitSentence
    kCFStringTokenizerUnitParagraph
    kCFStringTokenizerUnitLineBreak
    kCFStringTokenizerUnitWordBoundary
    kCFStringTokenizerAttributeLatinTranscription
    kCFStringTokenizerAttributeLanguage
    kCFStringTokenizerTokenNone
    kCFStringTokenizerTokenNormal
    kCFStringTokenizerTokenHasSubTokensMask
    kCFStringTokenizerTokenHasDerivedSubTokensMask
    kCFStringTokenizerTokenHasHasNumbersMask
    kCFStringTokenizerTokenHasNonLettersMask
    kCFStringTokenizerTokenIsCJWordMask
    CFStringTokenizerAdvanceToNextToken
    CFStringTokenizerCopyBestStringLanguage
    CFStringTokenizerCopyCurrentTokenAttribute
    CFStringTokenizerCreate
    CFStringTokenizerGetCurrentSubTokens
    CFStringTokenizerGetCurrentTokenRange
    CFStringTokenizerGetTypeID
    CFStringTokenizerGoToTokenAtIndex
    CFStringTokenizerSetString)
  (import
    (chezscheme)
    (CoreFoundation CFBase)
    (CoreFoundation CFArray)
    (CoreFoundation CFLocale)
    (CoreFoundation CFString))

  ;;-------------------;;
  ;; CFStringTokenizer ;;
  ;;===================;;

  (define init
    (load-shared-object "CoreFoundation.framework/CoreFoundation"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [CFStringTokenizerRef void*]
    [CFStringTokenizerTokenType CFOptionFlags])

  ;;
  ;; Constants
  ;;

  (define kCFStringTokenizerUnitWord         0)
  (define kCFStringTokenizerUnitSentence     1)
  (define kCFStringTokenizerUnitParagraph    2)
  (define kCFStringTokenizerUnitLineBreak    3)
  (define kCFStringTokenizerUnitWordBoundary 4)

  (define kCFStringTokenizerAttributeLatinTranscription #x10000)
  (define kCFStringTokenizerAttributeLanguage           #x20000)

  (define kCFStringTokenizerTokenNone                    0)
  (define kCFStringTokenizerTokenNormal                  1)
  (define kCFStringTokenizerTokenHasSubTokensMask        2)
  (define kCFStringTokenizerTokenHasDerivedSubTokensMask 4)
  (define kCFStringTokenizerTokenHasHasNumbersMask       8)
  (define kCFStringTokenizerTokenHasNonLettersMask      16)
  (define kCFStringTokenizerTokenIsCJWordMask           32)

  ;;
  ;; Functions
  ;;

  (define CFStringTokenizerAdvanceToNextToken
    (foreign-procedure "CFStringTokenizerAdvanceToNextToken"
		       (CFStringTokenizerRef) CFStringTokenizerTokenType))
  (define CFStringTokenizerCopyBestStringLanguage
    (foreign-procedure "CFStringTokenizerCopyBestStringLanguage"
		       (CFStringRef (& CFRange)) CFStringRef))
  ;; CFStringTokenizerCopyBestStringLanguageWithHints "Apple private"
  (define CFStringTokenizerCopyCurrentTokenAttribute
    (foreign-procedure "CFStringTokenizerCopyCurrentTokenAttribute"
		       (CFStringTokenizerRef CFOptionFlags) CFTypeRef))
  (define CFStringTokenizerCreate
    (foreign-procedure "CFStringTokenizerCreate"
		       (CFAllocatorRef CFStringRef (& CFRange) CFOptionFlags CFLocaleRef) CFStringTokenizerRef))
  (define CFStringTokenizerGetCurrentSubTokens
    (foreign-procedure "CFStringTokenizerGetCurrentSubTokens"
		       (CFStringTokenizerRef (* CFRange) CFIndex CFMutableArrayRef) CFIndex))
  (define CFStringTokenizerGetCurrentTokenRange
    (foreign-procedure "CFStringTokenizerGetCurrentTokenRange"
		       (CFStringTokenizerRef) (& CFRange)))
  (define CFStringTokenizerGetTypeID
    (foreign-procedure "CFStringTokenizerGetTypeID"
		       () CFTypeID))
  (define CFStringTokenizerGoToTokenAtIndex
    (foreign-procedure "CFStringTokenizerGoToTokenAtIndex"
		       (CFStringTokenizerRef CFIndex) CFStringTokenizerTokenType))
  (define CFStringTokenizerSetString
    (foreign-procedure "CFStringTokenizerSetString"
		       (CFStringTokenizerRef CFStringRef (& CFRange)) void))
  ;; CFStringTokenizerSetStringWithOptions "Apple private"
  )
