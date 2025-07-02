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
;; Based on Apple's CoreFoundation/CFSocket.h
(library
  (CoreFoundation CFSocket)
  (export
    CFSocketRef
    CFSocketError
    CFSocketSignature
    CFSocketCallBackType
    CFSocketContext
    CFSocketNativeHandle
    CFSocketCallBack
    kCFSocketSuccess
    kCFSocketError
    kCFSocketTimeout
    kCFSocketNoCallBack
    kCFSocketReadCallBack
    kCFSocketAcceptCallBack
    kCFSocketDataCallBack
    kCFSocketConnectCallBack
    kCFSocketWriteCallBack
    kCFSocketAutomaticallyReenableReadCallBack
    kCFSocketAutomaticallyReenableAcceptCallBack
    kCFSocketAutomaticallyReenableDataCallBack
    kCFSocketAutomaticallyReenableWriteCallBack
    kCFSocketLeaveErrors
    kCFSocketCloseOnInvalidate
    kCFSocketCommandKey
    kCFSocketNameKey
    kCFSocketValueKey
    kCFSocketResultKey
    kCFSocketErrorKey
    kCFSocketRegisterCommand
    kCFSocketRetrieveCommand
    CFSocketGetTypeID
    CFSocketCreate
    CFSocketCreateWithNative
    CFSocketCreateWithSocketSignature
    CFSocketCreateConnectedToSocketSignature
    CFSocketSetAddress
    CFSocketConnectToAddress
    CFSocketInvalidate
    CFSocketIsValid
    CFSocketCopyAddress
    CFSocketCopyPeerAddress
    CFSocketGetContext
    CFSocketGetNative
    CFSocketCreateRunLoopSource
    CFSocketGetSocketFlags
    CFSocketSetSocketFlags
    CFSocketDisableCallBacks
    CFSocketEnableCallBacks
    CFSocketSendData
    CFSocketRegisterValue
    CFSocketCopyRegisteredValue
    CFSocketRegisterSocketSignature
    CFSocketCopyRegisteredSocketSignature
    CFSocketUnregister
    CFSocketSetDefaultNameRegistryPortNumber
    CFSocketGetDefaultNameRegistryPortNumber)
  (import
    (chezscheme)
    (CoreFoundation CFBase)
    (CoreFoundation CFRunLoop)
    (CoreFoundation CFData)
    (CoreFoundation CFDate))

  ;;----------;;
  ;; CFSocket ;;
  ;;==========;;

  (define init
    (load-shared-object "CoreFoundation.framework/CoreFoundation"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [CFSocketRef void*]
    [CFSocketError CFIndex]
    [CFSocketSignature (struct
			 [protocolFamily integer-32]
			 [socketType integer-32]
			 [protocol integer-32]
			 [address CFDataRef])]
    [CFSocketCallBackType CFOptionFlags]
    [CFSocketContext (struct
		       [version CFIndex]
		       [info void*]
		       [retain (* (function (void*) void*))]
		       [release (* (function (void*) void))]
		       [copyDescription (* (function (void*) CFStringRef))])]
    [CFSocketNativeHandle int])
  (define-ftype
    [CFSocketCallBack (function (CFSocketRef CFSocketCallBackType CFDataRef void* void*) void)])

  ;;
  ;; Constants
  ;;

  (define kCFSocketSuccess  0)
  (define kCFSocketError   -1)
  (define kCFSocketTimeout -2)

  (define kCFSocketNoCallBack      0)
  (define kCFSocketReadCallBack    1)
  (define kCFSocketAcceptCallBack  2)
  (define kCFSocketDataCallBack    3)
  (define kCFSocketConnectCallBack 4)
  (define kCFSocketWriteCallBack   8)

  (define kCFSocketAutomaticallyReenableReadCallBack   1)
  (define kCFSocketAutomaticallyReenableAcceptCallBack 2)
  (define kCFSocketAutomaticallyReenableDataCallBack   3)
  (define kCFSocketAutomaticallyReenableWriteCallBack  8)
  (define kCFSocketLeaveErrors                        64)
  (define kCFSocketCloseOnInvalidate                 128)

  (define kCFSocketCommandKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFSocketCommandKey")))
  (define kCFSocketNameKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFSocketNameKey")))
  (define kCFSocketValueKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFSocketValueKey")))
  (define kCFSocketResultKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFSocketResultKey")))
  (define kCFSocketErrorKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFSocketErrorKey")))
  (define kCFSocketRegisterCommand
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFSocketRegisterCommand")))
  (define kCFSocketRetrieveCommand
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFSocketRetrieveCommand")))

  ;;
  ;; Functions
  ;;

  (define CFSocketGetTypeID
    (foreign-procedure "CFSocketGetTypeID"
		       () CFTypeID))
  ;; XXX: Assuming Apple mistyped CFSocketCallBackType
  (define CFSocketCreate
    (foreign-procedure "CFSocketCreate"
		       (CFAllocatorRef integer-32 integer-32 integer-32 CFSocketCallBackType (* CFSocketCallBack) (* CFSocketContext)) CFSocketRef))
  (define CFSocketCreateWithNative
    (foreign-procedure "CFSocketCreateWithNative"
		       (CFAllocatorRef CFSocketNativeHandle CFSocketCallBackType (* CFSocketCallBack) (* CFSocketContext)) CFSocketRef))
  (define CFSocketCreateWithSocketSignature
    (foreign-procedure "CFSocketCreateWithSocketSignature"
		       (CFAllocatorRef (* CFSocketSignature) CFSocketCallBackType (* CFSocketCallBack) (* CFSocketContext)) CFSocketRef))
  (define CFSocketCreateConnectedToSocketSignature
    (foreign-procedure "CFSocketCreateConnectedToSocketSignature"
		       (CFAllocatorRef (* CFSocketSignature) CFSocketCallBackType (* CFSocketCallBack) (* CFSocketContext) CFTimeInterval) CFSocketRef))
  (define CFSocketSetAddress
    (foreign-procedure "CFSocketSetAddress"
		       (CFSocketRef CFDataRef) CFSocketError))
  (define CFSocketConnectToAddress
    (foreign-procedure "CFSocketConnectToAddress"
		       (CFSocketRef CFDataRef CFTimeInterval) CFSocketError))
  (define CFSocketInvalidate
    (foreign-procedure "CFSocketInvalidate"
		       (CFSocketRef) void))
  (define CFSocketIsValid
    (foreign-procedure "CFSocketIsValid"
		       (CFSocketRef) Boolean))
  (define CFSocketCopyAddress
    (foreign-procedure "CFSocketCopyAddress"
		       (CFSocketRef) CFDataRef))
  (define CFSocketCopyPeerAddress
    (foreign-procedure "CFSocketCopyPeerAddress"
		       (CFSocketRef) CFDataRef))
  (define CFSocketGetContext
    (foreign-procedure "CFSocketGetContext"
		       (CFSocketRef (* CFSocketContext)) void))
  (define CFSocketGetNative
    (foreign-procedure "CFSocketGetNative"
		       (CFSocketRef) CFSocketNativeHandle))
  (define CFSocketCreateRunLoopSource
    (foreign-procedure "CFSocketCreateRunLoopSource"
		       (CFAllocatorRef CFSocketRef CFIndex) CFRunLoopSourceRef))
  (define CFSocketGetSocketFlags
    (foreign-procedure "CFSocketGetSocketFlags"
		       (CFSocketRef) CFOptionFlags))
  (define CFSocketSetSocketFlags
    (foreign-procedure "CFSocketSetSocketFlags"
		       (CFSocketRef CFOptionFlags) void))
  (define CFSocketDisableCallBacks
    (foreign-procedure "CFSocketDisableCallBacks"
		       (CFSocketRef CFSocketCallBackType) void))
  (define CFSocketEnableCallBacks
    (foreign-procedure "CFSocketEnableCallBacks"
		       (CFSocketRef CFSocketCallBackType) void))
  (define CFSocketSendData
    (foreign-procedure "CFSocketSendData"
		       (CFSocketRef CFDataRef CFDataRef CFTimeInterval) CFSocketError))
  (define CFSocketRegisterValue
    (foreign-procedure "CFSocketRegisterValue"
		       ((* CFSocketSignature) CFTimeInterval CFStringRef CFPropertyListRef) CFSocketError))
  (define CFSocketCopyRegisteredValue
    (foreign-procedure "CFSocketCopyRegisteredValue"
		       ((* CFSocketSignature) CFTimeInterval CFStringRef (* CFPropertyListRef) (* CFDataRef)) CFSocketError))
  (define CFSocketRegisterSocketSignature
    (foreign-procedure "CFSocketRegisterSocketSignature"
		       ((* CFSocketSignature) CFTimeInterval CFStringRef (* CFSocketSignature)) CFSocketError))
  (define CFSocketCopyRegisteredSocketSignature
    (foreign-procedure "CFSocketCopyRegisteredSocketSignature"
		       ((* CFSocketSignature) CFTimeInterval CFStringRef (* CFSocketSignature) (* CFDataRef)) CFSocketError))
  (define CFSocketUnregister
    (foreign-procedure "CFSocketUnregister"
		       ((* CFSocketSignature) CFTimeInterval CFStringRef) CFSocketError))
  (define CFSocketSetDefaultNameRegistryPortNumber
    (foreign-procedure "CFSocketSetDefaultNameRegistryPortNumber"
		       (unsigned-16) void))
  (define CFSocketGetDefaultNameRegistryPortNumber
    (foreign-procedure "CFSocketGetDefaultNameRegistryPortNumber"
		       () unsigned-16))
  )
