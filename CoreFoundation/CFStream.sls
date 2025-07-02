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
;; Based on Apple's CoreFoundation/CFStream.h
(library
  (CoreFoundation CFStream)
  (export
    CFStreamError
    CFStreamPropertyKey
    CFStreamStatus
    CFStreamEventType
    CFStreamClientContext
    CFReadStreamRef
    CFWriteStreamRef
    CFReadStreamClientCallBack
    CFWriteStreamClientCallBack
    kCFStreamStatusNotOpen
    kCFStreamStatusOpening
    kCFStreamStatusOpen
    kCFStreamStatusReading
    kCFStreamStatusWriting
    kCFStreamStatusAtEnd
    kCFStreamStatusClosed
    kCFStreamStatusError
    kCFStreamEventNone
    kCFStreamEventOpenCompleted
    kCFStreamEventHasBytesAvailable
    kCFStreamEventCanAcceptBytes
    kCFStreamEventErrorOccurred
    kCFStreamEventEndEncountered
    kCFStreamPropertyDataWritten
    kCFStreamPropertyAppendToFile
    kCFStreamPropertyFileCurrentOffset
    kCFStreamPropertySocketNativeHandle
    kCFStreamPropertySocketRemoteHostName
    kCFStreamPropertySocketRemotePortNumber
    kCFStreamPropertyShouldCloseNativeSocket
    kCFStreamErrorDomainSOCKS
    kCFStreamPropertySOCKSProxyHost
    kCFStreamPropertySOCKSProxyPort
    kCFStreamPropertySOCKSVersion
    kCFStreamSocketSOCKSVersion4
    kCFStreamSocketSOCKSVersion5
    kCFStreamPropertySOCKSUser
    kCFStreamPropertySOCKSPassword
    kCFStreamErrorDomainSSL
    kCFStreamPropertySocketSecurityLevel
    kCFStreamSocketSecurityLevelSSLv2
    kCFStreamSocketSecurityLevelSSLv3
    kCFStreamSocketSecurityLevelTLSv1
    kCFStreamSocketSecurityLevelNegotiatedSSL
    CFReadStreamGetTypeID
    CFWriteStreamGetTypeID
    CFReadStreamCreateWithBytesNoCopy
    CFWriteStreamCreateWithBuffer
    CFWriteStreamCreateWithAllocatedBuffers
    CFReadStreamCreateWithFile
    CFWriteStreamCreateWithFile
    CFStreamCreateBoundPair
    CFReadStreamGetStatus
    CFWriteStreamGetStatus
    CFReadStreamCopyError
    CFWriteStreamCopyError
    CFReadStreamOpen
    CFWriteStreamOpen
    CFReadStreamClose
    CFWriteStreamClose
    CFReadStreamHasBytesAvailable
    CFReadStreamRead
    CFReadStreamGetBuffer
    CFWriteStreamCanAcceptBytes
    CFWriteStreamWrite
    CFReadStreamCopyProperty
    CFWriteStreamCopyProperty
    CFReadStreamSetProperty
    CFWriteStreamSetProperty
    CFReadStreamSetClient
    CFWriteStreamSetClient
    CFReadStreamScheduleWithRunLoop
    CFWriteStreamScheduleWithRunLoop
    CFReadStreamUnscheduleFromRunLoop
    CFWriteStreamUnscheduleFromRunLoop)
  (import
    (chezscheme)
    (CoreFoundation CFBase)
    (CoreFoundation CFString)
    (CoreFoundation CFDictionary)
    (CoreFoundation CFURL)
    (CoreFoundation CFRunLoop)
    (CoreFoundation CFSocket)
    (CoreFoundation CFError))

  ;;----------;;
  ;; CFStream ;;
  ;;==========;;

  (define init
    (load-shared-object "CoreFoundation.framework/CoreFoundation"))

  ;; XXX: Deprecated APIs are not exposed.

  ;;
  ;; Types
  ;;

  (define-ftype
    [CFStreamError (struct
		     [domain CFIndex]
		     [error integer-32])]
    [CFStreamPropertyKey CFStringRef]
    [CFStreamStatus CFIndex]
    [CFStreamEventType CFOptionFlags]
    [CFStreamClientContext (struct
			     [version CFIndex]
			     [retain (* (function (void*) void*))]
			     [release (* (function (void*) void))]
			     [copyDescription (* (function (void*) CFStringRef))])]
    [CFReadStreamRef void*]
    [CFWriteStreamRef void*])
  (define-ftype
    [CFReadStreamClientCallBack (function (CFReadStreamRef CFStreamEventType void*) void)]
    [CFWriteStreamClientCallBack (function (CFWriteStreamRef CFStreamEventType void*) void)])

  ;;
  ;; Constants
  ;;

  (define kCFStreamStatusNotOpen 0)
  (define kCFStreamStatusOpening 1)
  (define kCFStreamStatusOpen    2)
  (define kCFStreamStatusReading 3)
  (define kCFStreamStatusWriting 4)
  (define kCFStreamStatusAtEnd   5)
  (define kCFStreamStatusClosed  6)
  (define kCFStreamStatusError   7)

  (define kCFStreamEventNone              0)
  (define kCFStreamEventOpenCompleted     1)
  (define kCFStreamEventHasBytesAvailable 2)
  (define kCFStreamEventCanAcceptBytes    4)
  (define kCFStreamEventErrorOccurred     8)
  (define kCFStreamEventEndEncountered   16)

  (define kCFStreamPropertyDataWritten
    (make-ftype-pointer CFStreamPropertyKey
			(foreign-entry "kCFStreamPropertyDataWritten")))

  (define kCFStreamPropertyAppendToFile
    (make-ftype-pointer CFStreamPropertyKey
			(foreign-entry "kCFStreamPropertyAppendToFile")))
  (define kCFStreamPropertyFileCurrentOffset
    (make-ftype-pointer CFStreamPropertyKey
			(foreign-entry "kCFStreamPropertyFileCurrentOffset")))

  (define kCFStreamPropertySocketNativeHandle
    (make-ftype-pointer CFStreamPropertyKey
			(foreign-entry "kCFStreamPropertySocketNativeHandle")))
  (define kCFStreamPropertySocketRemoteHostName
    (make-ftype-pointer CFStreamPropertyKey
			(foreign-entry "kCFStreamPropertySocketRemoteHostName")))
  (define kCFStreamPropertySocketRemotePortNumber
    (make-ftype-pointer CFStreamPropertyKey
			(foreign-entry "kCFStreamPropertySocketRemotePortNumber")))
  (define kCFStreamPropertyShouldCloseNativeSocket
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFStreamPropertyShouldCloseNativeSocket")))

  (define kCFStreamErrorDomainSOCKS
    (make-ftype-pointer int
			(foreign-entry "kCFStreamErrorDomainSOCKS")))
  ;; XXX: Apple mistyped these in their headers.  We'll use the correct type.
  (define kCFStreamPropertySOCKSProxyHost
    (make-ftype-pointer CFStreamPropertyKey
			(foreign-entry "kCFStreamPropertySOCKSProxyHost")))
  (define kCFStreamPropertySOCKSProxyPort
    (make-ftype-pointer CFStreamPropertyKey
			(foreign-entry "kCFStreamPropertySOCKSProxyPort")))
  (define kCFStreamPropertySOCKSVersion
    (make-ftype-pointer CFStreamPropertyKey
			(foreign-entry "kCFStreamPropertySOCKSVersion")))
  (define kCFStreamSocketSOCKSVersion4
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFStreamSocketSOCKSVersion4")))
  (define kCFStreamSocketSOCKSVersion5
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFStreamSocketSOCKSVersion5")))
  (define kCFStreamPropertySOCKSUser
    (make-ftype-pointer CFStreamPropertyKey
			(foreign-entry "kCFStreamPropertySOCKSUser")))
  (define kCFStreamPropertySOCKSPassword
    (make-ftype-pointer CFStreamPropertyKey
			(foreign-entry "kCFStreamPropertySOCKSPassword")))

  (define kCFStreamErrorDomainSSL
    (make-ftype-pointer int
			(foreign-entry "kCFStreamErrorDomainSSL")))
  (define kCFStreamPropertySocketSecurityLevel
    (make-ftype-pointer CFStreamPropertyKey
			(foreign-entry "kCFStreamPropertySocketSecurityLevel")))
  (define kCFStreamSocketSecurityLevelSSLv2
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFStreamSocketSecurityLevelSSLv2")))
  (define kCFStreamSocketSecurityLevelSSLv3
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFStreamSocketSecurityLevelSSLv3")))
  (define kCFStreamSocketSecurityLevelTLSv1
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFStreamSocketSecurityLevelTLSv1")))
  (define kCFStreamSocketSecurityLevelNegotiatedSSL
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFStreamSocketSecurityLevelNegotiatedSSL")))

  ;;
  ;; Functions
  ;;

  (define CFReadStreamGetTypeID
    (foreign-procedure "CFReadStreamGetTypeID"
		       () CFTypeID))
  (define CFWriteStreamGetTypeID
    (foreign-procedure "CFWriteStreamGetTypeID"
		       () CFTypeID))
  (define CFReadStreamCreateWithBytesNoCopy
    (foreign-procedure "CFReadStreamCreateWithBytesNoCopy"
		       (CFAllocatorRef u8* CFIndex CFAllocatorRef) CFReadStreamRef))
  (define CFWriteStreamCreateWithBuffer
    (foreign-procedure "CFWriteStreamCreateWithBuffer"
		       (CFAllocatorRef u8* CFIndex) CFWriteStreamRef))
  (define CFWriteStreamCreateWithAllocatedBuffers
    (foreign-procedure "CFWriteStreamCreateWithAllocatedBuffers"
		       (CFAllocatorRef CFAllocatorRef) CFWriteStreamRef))
  (define CFReadStreamCreateWithFile
    (foreign-procedure "CFReadStreamCreateWithFile"
		       (CFAllocatorRef CFURLRef) CFReadStreamRef))
  (define CFWriteStreamCreateWithFile
    (foreign-procedure "CFWriteStreamCreateWithFile"
		       (CFAllocatorRef CFURLRef) CFWriteStreamRef))
  (define CFStreamCreateBoundPair
    (foreign-procedure "CFStreamCreateBoundPair"
		       (CFAllocatorRef (* CFReadStreamRef) (* CFWriteStreamRef) CFIndex) void))
  (define CFReadStreamGetStatus
    (foreign-procedure "CFReadStreamGetStatus"
		       (CFReadStreamRef) CFStreamStatus))
  (define CFWriteStreamGetStatus
    (foreign-procedure "CFWriteStreamGetStatus"
		       (CFWriteStreamRef) CFStreamStatus))
  (define CFReadStreamCopyError
    (foreign-procedure "CFReadStreamCopyError"
		       (CFReadStreamRef) CFErrorRef))
  (define CFWriteStreamCopyError
    (foreign-procedure "CFWriteStreamCopyError"
		       (CFWriteStreamRef) CFErrorRef))
  (define CFReadStreamOpen
    (foreign-procedure "CFReadStreamOpen"
		       (CFReadStreamRef) Boolean))
  (define CFWriteStreamOpen
    (foreign-procedure "CFWriteStreamOpen"
		       (CFWriteStreamRef) Boolean))
  (define CFReadStreamClose
    (foreign-procedure "CFReadStreamClose"
		       (CFReadStreamRef) void))
  (define CFWriteStreamClose
    (foreign-procedure "CFWriteStreamClose"
		       (CFWriteStreamRef) void))
  (define CFReadStreamHasBytesAvailable
    (foreign-procedure "CFReadStreamHasBytesAvailable"
		       (CFReadStreamRef) Boolean))
  (define CFReadStreamRead
    (foreign-procedure "CFReadStreamRead"
		       (CFReadStreamRef u8* CFIndex) CFIndex))
  (define CFReadStreamGetBuffer
    (foreign-procedure "CFReadStreamGetBuffer"
		       (CFReadStreamRef CFIndex (* CFIndex)) (* unsigned-8)))
  (define CFWriteStreamCanAcceptBytes
    (foreign-procedure "CFWriteStreamCanAcceptBytes"
		       (CFWriteStreamRef) Boolean))
  (define CFWriteStreamWrite
    (foreign-procedure "CFWriteStreamWrite"
		       (CFWriteStreamRef u8* CFIndex) CFIndex))
  (define CFReadStreamCopyProperty
    (foreign-procedure "CFReadStreamCopyProperty"
		       (CFReadStreamRef CFStreamPropertyKey) CFTypeRef))
  (define CFWriteStreamCopyProperty
    (foreign-procedure "CFWriteStreamCopyProperty"
		       (CFWriteStreamRef CFStreamPropertyKey) CFTypeRef))
  (define CFReadStreamSetProperty
    (foreign-procedure "CFReadStreamSetProperty"
		       (CFReadStreamRef CFStreamPropertyKey CFTypeRef) Boolean))
  (define CFWriteStreamSetProperty
    (foreign-procedure "CFWriteStreamSetProperty"
		       (CFWriteStreamRef CFStreamPropertyKey CFTypeRef) Boolean))
  ;; XXX: Apple mistyped CFStreamEventType.
  (define CFReadStreamSetClient
    (foreign-procedure "CFReadStreamSetClient"
		       (CFReadStreamRef CFStreamEventType (* CFReadStreamClientCallBack) (* CFStreamClientContext)) Boolean))
  (define CFWriteStreamSetClient
    (foreign-procedure "CFWriteStreamSetClient"
		       (CFWriteStreamRef CFStreamEventType (* CFWriteStreamClientCallBack) (* CFStreamClientContext)) Boolean))
  (define CFReadStreamScheduleWithRunLoop
    (foreign-procedure "CFReadStreamScheduleWithRunLoop"
		       (CFReadStreamRef CFRunLoopRef CFRunLoopMode) void))
  (define CFWriteStreamScheduleWithRunLoop
    (foreign-procedure "CFWriteStreamScheduleWithRunLoop"
		       (CFWriteStreamRef CFRunLoopRef CFRunLoopMode) void))
  (define CFReadStreamUnscheduleFromRunLoop
    (foreign-procedure "CFReadStreamUnscheduleFromRunLoop"
		       (CFReadStreamRef CFRunLoopRef CFRunLoopMode) void))
  (define CFWriteStreamUnscheduleFromRunLoop
    (foreign-procedure "CFWriteStreamUnscheduleFromRunLoop"
		       (CFWriteStreamRef CFRunLoopRef CFRunLoopMode) void))
  ;; XXX: Dispatch queue APIs not exposed.
  )
