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
;; Based on Apple's CoreFoundation/CFTree.h
(library
  (CoreFoundation CFTree)
  (export
    CFTreeRetainCallBack
    CFTreeReleaseCallBack
    CFTreeCopyDescriptionCallBack
    CFTreeApplierFunction
    CFTreeRef
    CFTreeContext
    CFTreeGetTypeID
    CFTreeCreate
    CFTreeGetParent
    CFTreeGetNextSibling
    CFTreeGetFirstChild
    CFTreeGetContext
    CFTreeGetChildCount
    CFTreeGetChildAtIndex
    CFTreeGetChildren
    CFTreeApplyFunctionToChildren
    CFTreeFindRoot
    CFTreeSetContext
    CFTreePrependChild
    CFTreeAppendChild
    CFTreeInsertSibling
    CFTreeRemove
    CFTreeRemoveAllChildren
    CFTreeSortChildren)
  (import
    (chezscheme)
    (CoreFoundation CFBase))

  ;;--------;;
  ;; CFTree ;;
  ;;========;;

  (define init
    (load-shared-object "CoreFoundation.framework/CoreFoundation"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [CFTreeRetainCallBack (function (void*) void*)]
    [CFTreeReleaseCallBack (function (void*) void)]
    [CFTreeCopyDescriptionCallBack (function (void*) CFStringRef)]
    [CFTreeApplierFunction (function (void* void*) void)]
    [CFTreeRef void*])
  (define-ftype
    [CFTreeContext (struct
		     [version CFIndex]
		     [info void*]
		     [retain (* CFTreeRetainCallBack)]
		     [release (* CFTreeReleaseCallBack)]
		     [copyDescription (* CFTreeCopyDescriptionCallBack)])])

  ;;
  ;; Constants
  ;;

  ;; (none defined)

  ;;
  ;; Functions
  ;;

  (define CFTreeGetTypeID
    (foreign-procedure "CFTreeGetTypeID"
		       () CFTypeID))
  (define CFTreeCreate
    (foreign-procedure "CFTreeCreate"
		       (CFAllocatorRef (* CFTreeContext)) CFTreeRef))
  (define CFTreeGetParent
    (foreign-procedure "CFTreeGetParent"
		       (CFTreeRef) CFTreeRef))
  (define CFTreeGetNextSibling
    (foreign-procedure "CFTreeGetNextSibling"
		       (CFTreeRef) CFTreeRef))
  (define CFTreeGetFirstChild
    (foreign-procedure "CFTreeGetFirstChild"
		       (CFTreeRef) CFTreeRef))
  (define CFTreeGetContext
    (foreign-procedure "CFTreeGetContext"
		       (CFTreeRef (* CFTreeContext)) void))
  (define CFTreeGetChildCount
    (foreign-procedure "CFTreeGetChildCount"
		       (CFTreeRef) CFIndex))
  (define CFTreeGetChildAtIndex
    (foreign-procedure "CFTreeGetChildAtIndex"
		       (CFTreeRef CFIndex) CFTreeRef))
  (define CFTreeGetChildren
    (foreign-procedure "CFTreeGetChildren"
		       (CFTreeRef (* CFTreeRef)) void))
  (define CFTreeApplyFunctionToChildren
    (foreign-procedure "CFTreeApplyFunctionToChildren"
		       (CFTreeRef (* CFTreeApplierFunction) void*) void))
  (define CFTreeFindRoot
    (foreign-procedure "CFTreeFindRoot"
		       (CFTreeRef) CFTreeRef))
  (define CFTreeSetContext
    (foreign-procedure "CFTreeSetContext"
		       (CFTreeRef (* CFTreeContext)) void))
  (define CFTreePrependChild
    (foreign-procedure "CFTreePrependChild"
		       (CFTreeRef CFTreeRef) void))
  (define CFTreeAppendChild
    (foreign-procedure "CFTreeAppendChild"
		       (CFTreeRef CFTreeRef) void))
  (define CFTreeInsertSibling
    (foreign-procedure "CFTreeInsertSibling"
		       (CFTreeRef CFTreeRef) void))
  (define CFTreeRemove
    (foreign-procedure "CFTreeRemove"
		       (CFTreeRef) void))
  (define CFTreeRemoveAllChildren
    (foreign-procedure "CFTreeRemoveAllChildren"
		       (CFTreeRef) void))
  (define CFTreeSortChildren
    (foreign-procedure "CFTreeSortChildren"
		       (CFTreeRef (* CFComparatorFunction) void*) void))
  )
