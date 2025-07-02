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
;; Based on Apple's CoreFoundation/CFRunLoop.h
(library
  (CoreFoundation CFRunLoop)
  (export
    CFRunLoopMode
    CFRunLoopRef
    CFRunLoopSourceRef
    CFRunLoopObserverRef
    CFRunLoopTimerRef
    CFRunLoopRunResult
    CFRunLoopActivity
    CFRunLoopSourceContext
    CFRunLoopSourceContext1
    CFRunLoopObserverContext
    CFRunLoopObserverCallBack
    CFRunLoopTimerContext
    CFRunLoopTimerCallBack
    kCFRunLoopRunFinished
    kCFRunLoopRunStopped
    kCFRunLoopRunTimedOut
    kCFRunLoopRunHandledSource
    kCFRunLoopEntry
    kCFRunLoopBeforeTimers
    kCFRunLoopBeforeSources
    kCFRunLoopBeforeWaiting
    kCFRunLoopAfterWaiting
    kCFRunLoopExit
    kCFRunLoopAllActivities
    kCFRunLoopDefaultMode
    kCFRunLoopCommonModes
    CFRunLoopGetTypeID
    CFRunLoopGetCurrent
    CFRunLoopGetMain
    CFRunLoopCopyCurrentMode
    CFRunLoopCopyAllModes
    CFRunLoopAddCommonMode
    CFRunLoopGetNextTimerFireDate
    CFRunLoopRun
    CFRunLoopRunInMode
    CFRunLoopIsWaiting
    CFRunLoopWakeUp
    CFRunLoopStop
    CFRunLoopContainsSource
    CFRunLoopAddSource
    CFRunLoopRemoveSource
    CFRunLoopContainsObserver
    CFRunLoopAddObserver
    CFRunLoopRemoveObserver
    CFRunLoopContainsTimer
    CFRunLoopAddTimer
    CFRunLoopRemoveTimer
    CFRunLoopSourceGetTypeID
    CFRunLoopSourceCreate
    CFRunLoopSourceGetOrder
    CFRunLoopSourceInvalidate
    CFRunLoopSourceIsValid
    CFRunLoopSourceGetContext
    CFRunLoopSourceSignal
    CFRunLoopObserverGetTypeID
    CFRunLoopObserverCreate
    CFRunLoopObserverGetActivities
    CFRunLoopObserverDoesRepeat
    CFRunLoopObserverGetOrder
    CFRunLoopObserverInvalidate
    CFRunLoopObserverIsValid
    CFRunLoopObserverGetContext
    CFRunLoopTimerGetTypeID
    CFRunLoopTimerCreate
    CFRunLoopTimerGetNextFireDate
    CFRunLoopTimerSetNextFireDate
    CFRunLoopTimerGetInterval
    CFRunLoopTimerDoesRepeat
    CFRunLoopTimerGetOrder
    CFRunLoopTimerInvalidate
    CFRunLoopTimerIsValid
    CFRunLoopTimerGetContext
    CFRunLoopTimerGetTolerance
    CFRunLoopTimerSetTolerance)
  (import
    (chezscheme)
    (CoreFoundation CFBase)
    (CoreFoundation CFArray)
    (CoreFoundation CFDate)
    (CoreFoundation CFString)
    (mach port))

  ;;-----------;;
  ;; CFRunLoop ;;
  ;;===========;;

  (define init
    (load-shared-object "CoreFoundation.framework/CoreFoundation"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [CFRunLoopMode CFStringRef]
    [CFRunLoopRef void*]
    [CFRunLoopSourceRef void*]
    [CFRunLoopObserverRef void*]
    [CFRunLoopTimerRef void*]
    [CFRunLoopRunResult integer-32]
    [CFRunLoopActivity CFOptionFlags])
  (define-ftype
    [CFRunLoopSourceContext (struct
			      [version CFIndex]
			      [info void*]
			      [retain (* (function (void*) void*))]
			      [release (* (function (void*) void))]
			      [copyDescription (* (function (void*) CFStringRef))]
			      [equal (* (function (void* void*) Boolean))]
			      [hash (* (function (void*) CFHashCode))]
			      [schedule (* (function (void* CFRunLoopRef CFRunLoopMode) void))]
			      [cancel (* (function (void* CFRunLoopRef CFRunLoopMode) void))]
			      [perform (* (function (void*) void))])]
    [CFRunLoopSourceContext1 (struct
			       [version CFIndex]
			       [info void*]
			       [retain (* (function (void*) void*))]
			       [release (* (function (void*) void))]
			       [copyDescription (* (function (void*) CFStringRef))]
			       [equal (* (function (void* void*) Boolean))]
			       [hash (* (function (void*) CFHashCode))]
			       [getPort (* (function (void*) mach_port_t))]
			       [perform (* (function (void* CFIndex CFAllocatorRef void*) void*))])]
    [CFRunLoopObserverContext (struct
				[version CFIndex]
				[info void*]
				[retain (* (function (void*) void*))]
				[release (* (function (void*) void))]
				[copyDescription (* (function (void*) CFStringRef))])]
    [CFRunLoopObserverCallBack (function (CFRunLoopObserverRef CFRunLoopActivity void*) void)]
    [CFRunLoopTimerContext (struct
			     [version CFIndex]
			     [info void*]
			     [retain (* (function (void*) void*))]
			     [release (* (function (void*) void))]
			     [copyDescription (* (function (void*) CFStringRef))])]
    [CFRunLoopTimerCallBack (function (CFRunLoopTimerRef void*) void)])

  ;;
  ;; Constants
  ;;

  (define kCFRunLoopRunFinished      1)
  (define kCFRunLoopRunStopped       2)
  (define kCFRunLoopRunTimedOut      3)
  (define kCFRunLoopRunHandledSource 4)

  (define kCFRunLoopEntry         #x00000001)
  (define kCFRunLoopBeforeTimers  #x00000002)
  (define kCFRunLoopBeforeSources #x00000004)
  (define kCFRunLoopBeforeWaiting #x00000010)
  (define kCFRunLoopAfterWaiting  #x00000020)
  (define kCFRunLoopExit          #x00000040)
  (define kCFRunLoopAllActivities #x0fffffff)

  (define kCFRunLoopDefaultMode
    (make-ftype-pointer CFRunLoopMode
			(foreign-entry "kCFRunLoopDefaultMode")))
  (define kCFRunLoopCommonModes
    (make-ftype-pointer CFRunLoopMode
			(foreign-entry "kCFRunLoopCommonModes")))

  ;;
  ;; Functions
  ;;

  (define CFRunLoopGetTypeID
    (foreign-procedure "CFRunLoopGetTypeID"
		       () CFTypeID))
  (define CFRunLoopGetCurrent
    (foreign-procedure "CFRunLoopGetCurrent"
		       () CFRunLoopRef))
  (define CFRunLoopGetMain
    (foreign-procedure "CFRunLoopGetMain"
		       () CFRunLoopRef))
  (define CFRunLoopCopyCurrentMode
    (foreign-procedure "CFRunLoopCopyCurrentMode"
		       (CFRunLoopRef) CFRunLoopMode))
  (define CFRunLoopCopyAllModes
    (foreign-procedure "CFRunLoopCopyAllModes"
		       (CFRunLoopRef) CFArrayRef))
  (define CFRunLoopAddCommonMode
    (foreign-procedure "CFRunLoopAddCommonMode"
		       (CFRunLoopRef CFRunLoopMode) void))
  (define CFRunLoopGetNextTimerFireDate
    (foreign-procedure "CFRunLoopGetNextTimerFireDate"
		       (CFRunLoopRef CFRunLoopMode) CFAbsoluteTime))
  (define CFRunLoopRun
    (foreign-procedure "CFRunLoopRun"
		       () void))
  (define CFRunLoopRunInMode
    (foreign-procedure "CFRunLoopRunInMode"
		       (CFRunLoopMode CFTimeInterval Boolean) CFRunLoopRunResult))
  (define CFRunLoopIsWaiting
    (foreign-procedure "CFRunLoopIsWaiting"
		       (CFRunLoopRef) Boolean))
  (define CFRunLoopWakeUp
    (foreign-procedure "CFRunLoopWakeUp"
		       (CFRunLoopRef) void))
  (define CFRunLoopStop
    (foreign-procedure "CFRunLoopStop"
		       (CFRunLoopRef) void))
  ;; XXX: CFRunLoopPerformBlock: Blocks APIs not exposed.
  (define CFRunLoopContainsSource
    (foreign-procedure "CFRunLoopContainsSource"
		       (CFRunLoopRef CFRunLoopSourceRef CFRunLoopMode) Boolean))
  (define CFRunLoopAddSource
    (foreign-procedure "CFRunLoopAddSource"
		       (CFRunLoopRef CFRunLoopSourceRef CFRunLoopMode) void))
  (define CFRunLoopRemoveSource
    (foreign-procedure "CFRunLoopRemoveSource"
		       (CFRunLoopRef CFRunLoopSourceRef CFRunLoopMode) void))
  (define CFRunLoopContainsObserver
    (foreign-procedure "CFRunLoopContainsObserver"
		       (CFRunLoopRef CFRunLoopObserverRef CFRunLoopMode) Boolean))
  (define CFRunLoopAddObserver
    (foreign-procedure "CFRunLoopAddObserver"
		       (CFRunLoopRef CFRunLoopObserverRef CFRunLoopMode) void))
  (define CFRunLoopRemoveObserver
    (foreign-procedure "CFRunLoopRemoveObserver"
		       (CFRunLoopRef CFRunLoopObserverRef CFRunLoopMode) void))
  (define CFRunLoopContainsTimer
    (foreign-procedure "CFRunLoopContainsTimer"
		       (CFRunLoopRef CFRunLoopTimerRef CFRunLoopMode) Boolean))
  (define CFRunLoopAddTimer
    (foreign-procedure "CFRunLoopAddTimer"
		       (CFRunLoopRef CFRunLoopTimerRef CFRunLoopMode) void))
  (define CFRunLoopRemoveTimer
    (foreign-procedure "CFRunLoopRemoveTimer"
		       (CFRunLoopRef CFRunLoopTimerRef CFRunLoopMode) void))
  (define CFRunLoopSourceGetTypeID
    (foreign-procedure "CFRunLoopSourceGetTypeID"
		       () CFTypeID))
  (define CFRunLoopSourceCreate
    (foreign-procedure "CFRunLoopSourceCreate"
		       (CFAllocatorRef CFIndex (* CFRunLoopSourceContext)) CFRunLoopSourceRef))
  (define CFRunLoopSourceGetOrder
    (foreign-procedure "CFRunLoopSourceGetOrder"
		       (CFRunLoopSourceRef) CFIndex))
  (define CFRunLoopSourceInvalidate
    (foreign-procedure "CFRunLoopSourceInvalidate"
		       (CFRunLoopSourceRef) void))
  (define CFRunLoopSourceIsValid
    (foreign-procedure "CFRunLoopSourceIsValid"
		       (CFRunLoopSourceRef) Boolean))
  (define CFRunLoopSourceGetContext
    (foreign-procedure "CFRunLoopSourceGetContext"
		       (CFRunLoopSourceRef (* CFRunLoopSourceContext)) void))
  (define CFRunLoopSourceSignal
    (foreign-procedure "CFRunLoopSourceSignal"
		       (CFRunLoopSourceRef) void))
  (define CFRunLoopObserverGetTypeID
    (foreign-procedure "CFRunLoopObserverGetTypeID"
		       () CFTypeID))
  ;; XXX: Apple mistyped CFRunLoopActivity.
  (define CFRunLoopObserverCreate
    (foreign-procedure "CFRunLoopObserverCreate"
		       (CFAllocatorRef CFRunLoopActivity Boolean CFIndex (* CFRunLoopObserverCallBack) (* CFRunLoopObserverContext)) CFRunLoopObserverRef))
  ;; XXX: CFRunLoopObserverCreateWithHandler: Blocks APIs not exposed.
  ;; XXX: Apple mistyped CFRunLoopActivity.
  (define CFRunLoopObserverGetActivities
    (foreign-procedure "CFRunLoopObserverGetActivities"
		       (CFRunLoopObserverRef) CFRunLoopActivity))
  (define CFRunLoopObserverDoesRepeat
    (foreign-procedure "CFRunLoopObserverDoesRepeat"
		       (CFRunLoopObserverRef) Boolean))
  (define CFRunLoopObserverGetOrder
    (foreign-procedure "CFRunLoopObserverGetOrder"
		       (CFRunLoopObserverRef) CFIndex))
  (define CFRunLoopObserverInvalidate
    (foreign-procedure "CFRunLoopObserverInvalidate"
		       (CFRunLoopObserverRef) void))
  (define CFRunLoopObserverIsValid
    (foreign-procedure "CFRunLoopObserverIsValid"
		       (CFRunLoopObserverRef) Boolean))
  (define CFRunLoopObserverGetContext
    (foreign-procedure "CFRunLoopObserverGetContext"
		       (CFRunLoopObserverRef (* CFRunLoopObserverContext)) void))
  (define CFRunLoopTimerGetTypeID
    (foreign-procedure "CFRunLoopTimerGetTypeID"
		       () CFTypeID))
  (define CFRunLoopTimerCreate
    (foreign-procedure "CFRunLoopTimerCreate"
		       (CFAllocatorRef CFAbsoluteTime CFTimeInterval CFRunLoopActivity CFIndex (* CFRunLoopTimerCallBack) (* CFRunLoopTimerContext)) CFRunLoopTimerRef))
  ;; XXX: CFRunLoopTimerCreateWithHandler: Blocks APIs not exposed.
  (define CFRunLoopTimerGetNextFireDate
    (foreign-procedure "CFRunLoopTimerGetNextFireDate"
		       (CFRunLoopTimerRef) CFAbsoluteTime))
  (define CFRunLoopTimerSetNextFireDate
    (foreign-procedure "CFRunLoopTimerSetNextFireDate"
		       (CFRunLoopTimerRef CFAbsoluteTime) void))
  (define CFRunLoopTimerGetInterval
    (foreign-procedure "CFRunLoopTimerGetInterval"
		       (CFRunLoopTimerRef) CFTimeInterval))
  (define CFRunLoopTimerDoesRepeat
    (foreign-procedure "CFRunLoopTimerDoesRepeat"
		       (CFRunLoopTimerRef) Boolean))
  (define CFRunLoopTimerGetOrder
    (foreign-procedure "CFRunLoopTimerGetOrder"
		       (CFRunLoopTimerRef) CFIndex))
  (define CFRunLoopTimerInvalidate
    (foreign-procedure "CFRunLoopTimerInvalidate"
		       (CFRunLoopTimerRef) void))
  (define CFRunLoopTimerIsValid
    (foreign-procedure "CFRunLoopTimerIsValid"
		       (CFRunLoopTimerRef) Boolean))
  (define CFRunLoopTimerGetContext
    (foreign-procedure "CFRunLoopTimerGetContext"
		       (CFRunLoopTimerRef (* CFRunLoopTimerContext)) void))
  (define CFRunLoopTimerGetTolerance
    (foreign-procedure "CFRunLoopTimerGetTolerance"
		       (CFRunLoopTimerRef) CFTimeInterval))
  (define CFRunLoopTimerSetTolerance
    (foreign-procedure "CFRunLoopTimerSetTolerance"
		       (CFRunLoopTimerRef CFTimeInterval) void))
  )
