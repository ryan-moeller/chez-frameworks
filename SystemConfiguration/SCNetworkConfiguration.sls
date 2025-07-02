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
;; Based on Apple's SystemConfiguration/SCNetworkConfiguration.h
(library
  (SystemConfiguration SCNetworkConfiguration)
  (export
    SCNetworkInterfaceRef
    SCBondStatusRef
    SCNetworkProtocolRef
    SCNetworkServiceRef
    SCNetworkSetRef
    SCBondInterfaceRef
    SCVLANInterfaceRef
    kSCNetworkInterfaceType6to4
    kSCNetworkInterfaceTypeBluetooth
    kSCNetworkInterfaceTypeBond
    kSCNetworkInterfaceTypeEthernet
    kSCNetworkInterfaceTypeFireWire
    kSCNetworkInterfaceTypeIEEE80211
    kSCNetworkInterfaceTypeIPSec
    kSCNetworkInterfaceTypeIrDA
    kSCNetworkInterfaceTypeL2TP
    kSCNetworkInterfaceTypeModem
    kSCNetworkInterfaceTypePPP
    kSCNetworkInterfaceTypePPTP
    kSCNetworkInterfaceTypeSerial
    kSCNetworkInterfaceTypeVLAN
    kSCNetworkInterfaceTypeWWAN
    kSCNetworkInterfaceTypeIPv4
    kSCNetworkInterfaceIPv4
    kSCBondStatusOK
    kSCBondStatusLinkInvalid
    kSCBondStatusNoPartner
    kSCBondStatusNotInActiveGroup
    kSCBondStatusUnknown
    kSCBondStatusDeviceAggregationStatus
    kSCBondStatusDeviceCollecting
    kSCBondStatusDeviceDistributing
    kSCNetworkProtocolTypeDNS
    kSCNetworkProtocolTypeIPv4
    kSCNetworkProtocolTypeIPv6
    kSCNetworkProtocolTypeProxies
    kSCNetworkProtocolTypeSMB
    SCNetworkInterfaceGetTypeID
    SCNetworkInterfaceCopyAll
    SCNetworkInterfaceGetSupportedInterfaceTypes
    SCNetworkInterfaceGetSupportedProtocolTypes
    SCNetworkInterfaceCreateWithInterface
    SCNetworkInterfaceGetBSDName
    SCNetworkInterfaceGetConfiguration
    SCNetworkInterfaceGetExtendedConfiguration
    SCNetworkInterfaceGetHardwareAddressString
    SCNetworkInterfaceGetInterface
    SCNetworkInterfaceGetInterfaceType
    SCNetworkInterfaceGetLocalizedDisplayName
    SCNetworkInterfaceSetConfiguration
    SCNetworkInterfaceSetExtendedConfiguration
    SCNetworkInterfaceCopyMediaOptions
    SCNetworkInterfaceCopyMediaSubTypes
    SCNetworkInterfaceCopyMediaSubTypeOptions
    SCNetworkInterfaceCopyMTU
    SCNetworkInterfaceSetMediaOptions
    SCNetworkInterfaceSetMTU
    SCNetworkInterfaceForceConfigurationRefresh
    SCBondInterfaceCopyAll
    SCBondInterfaceCopyAvailableMemberInterfaces
    SCBondInterfaceCreate
    SCBondInterfaceRemove
    SCBondInterfaceGetMemberInterfaces
    SCBondInterfaceGetOptions
    SCBondInterfaceSetMemberInterfaces
    SCBondInterfaceSetLocalizedDisplayName
    SCBondInterfaceSetOptions
    SCBondInterfaceCopyStatus
    SCBondStatusGetTypeID
    SCBondStatusGetMemberInterfaces
    SCBondStatusGetInterfaceStatus
    SCVLANInterfaceCopyAll
    SCVLANInterfaceCopyAvailablePhysicalInterfaces
    SCVLANInterfaceCreate
    SCVLANInterfaceRemove
    SCVLANInterfaceGetPhysicalInterface
    SCVLANInterfaceGetTag
    SCVLANInterfaceGetOptions
    SCVLANInterfaceSetPhysicalInterfaceAndTag
    SCVLANInterfaceSetLocalizedDisplayName
    SCVLANInterfaceSetOptions
    SCNetworkProtocolGetTypeID
    SCNetworkProtocolGetConfiguration
    SCNetworkProtocolGetEnabled
    SCNetworkProtocolGetProtocolType
    SCNetworkProtocolSetConfiguration
    SCNetworkProtocolSetEnabled
    SCNetworkServiceGetTypeID
    SCNetworkServiceAddProtocolType
    SCNetworkServiceCopyAll
    SCNetworkServiceCopyProtocols
    SCNetworkServiceCreate
    SCNetworkServiceCopy
    SCNetworkServiceEstablishDefaultConfiguration
    SCNetworkServiceGetEnabled
    SCNetworkServiceGetInterface
    SCNetworkServiceGetName
    SCNetworkServiceCopyProtocol
    SCNetworkServiceGetServiceID
    SCNetworkServiceRemove
    SCNetworkServiceRemoveProtocolType
    SCNetworkServiceSetEnabled
    SCNetworkServiceSetName
    SCNetworkSetGetTypeID
    SCNetworkSetAddService
    SCNetworkSetContainsInterface
    SCNetworkSetCopyAll
    SCNetworkSetCopyCurrent
    SCNetworkSetCopyServices
    SCNetworkSetCreate
    SCNetworkSetCopy
    SCNetworkSetGetName
    SCNetworkSetGetSetID
    SCNetworkSetGetServiceOrder
    SCNetworkSetRemove
    SCNetworkSetRemoveService
    SCNetworkSetSetCurrent
    SCNetworkSetSetName
    SCNetworkSetSetServiceOrder)
  (import
    (chezscheme)
    (CoreFoundation)
    (SystemConfiguration SCPreferences))

  ;;------------------------;;
  ;; SCNetworkConfiguration ;;
  ;;========================;;

  (define init
    (load-shared-object "SystemConfiguration.framework/SystemConfiguration"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [SCNetworkInterfaceRef void*]
    [SCBondStatusRef void*]
    [SCNetworkProtocolRef void*]
    [SCNetworkServiceRef void*]
    [SCNetworkSetRef void*])
  (define-ftype
    [SCBondInterfaceRef SCNetworkInterfaceRef]
    [SCVLANInterfaceRef SCNetworkInterfaceRef])

  ;;
  ;; Constants
  ;;

  (define kSCNetworkInterfaceType6to4
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCNetworkInterfaceType6to4")))
  (define kSCNetworkInterfaceTypeBluetooth
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCNetworkInterfaceTypeBluetooth")))
  (define kSCNetworkInterfaceTypeBond
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCNetworkInterfaceTypeBond")))
  (define kSCNetworkInterfaceTypeEthernet
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCNetworkInterfaceTypeEthernet")))
  (define kSCNetworkInterfaceTypeFireWire
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCNetworkInterfaceTypeFireWire")))
  (define kSCNetworkInterfaceTypeIEEE80211
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCNetworkInterfaceTypeIEEE80211")))
  (define kSCNetworkInterfaceTypeIPSec
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCNetworkInterfaceTypeIPSec")))
  (define kSCNetworkInterfaceTypeIrDA
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCNetworkInterfaceTypeIrDA")))
  (define kSCNetworkInterfaceTypeL2TP
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCNetworkInterfaceTypeL2TP")))
  (define kSCNetworkInterfaceTypeModem
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCNetworkInterfaceTypeModem")))
  (define kSCNetworkInterfaceTypePPP
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCNetworkInterfaceTypePPP")))
  (define kSCNetworkInterfaceTypePPTP
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCNetworkInterfaceTypePPTP")))
  (define kSCNetworkInterfaceTypeSerial
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCNetworkInterfaceTypeSerial")))
  (define kSCNetworkInterfaceTypeVLAN
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCNetworkInterfaceTypeVLAN")))
  (define kSCNetworkInterfaceTypeWWAN
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCNetworkInterfaceTypeWWAN")))
  (define kSCNetworkInterfaceTypeIPv4
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCNetworkInterfaceTypeIPv4")))

  (define kSCNetworkInterfaceIPv4
    (make-ftype-pointer SCNetworkInterfaceRef
			(foreign-entry "kSCNetworkInterfaceIPv4")))

  (define kSCBondStatusOK               0)
  (define kSCBondStatusLinkInvalid      1)
  (define kSCBondStatusNoPartner        2)
  (define kSCBondStatusNotInActiveGroup 3)
  (define kSCBondStatusUnknown        999)

  (define kSCBondStatusDeviceAggregationStatus
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCBondStatusDeviceAggregationStatus")))
  (define kSCBondStatusDeviceCollecting
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCBondStatusDeviceCollecting")))
  (define kSCBondStatusDeviceDistributing
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCBondStatusDeviceDistributing")))

  (define kSCNetworkProtocolTypeDNS
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCNetworkProtocolTypeDNS")))
  (define kSCNetworkProtocolTypeIPv4
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCNetworkProtocolTypeIPv4")))
  (define kSCNetworkProtocolTypeIPv6
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCNetworkProtocolTypeIPv6")))
  (define kSCNetworkProtocolTypeProxies
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCNetworkProtocolTypeProxies")))
  (define kSCNetworkProtocolTypeSMB
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCNetworkProtocolTypeSMB")))

  ;;
  ;; SCNetworkInterface Functions
  ;;

  (define SCNetworkInterfaceGetTypeID
    (foreign-procedure "SCNetworkInterfaceGetTypeID"
		       () CFTypeID))
  (define SCNetworkInterfaceCopyAll
    (foreign-procedure "SCNetworkInterfaceCopyAll"
		       () CFArrayRef))
  (define SCNetworkInterfaceGetSupportedInterfaceTypes
    (foreign-procedure "SCNetworkInterfaceGetSupportedInterfaceTypes"
		       (SCNetworkInterfaceRef) CFArrayRef))
  (define SCNetworkInterfaceGetSupportedProtocolTypes
    (foreign-procedure "SCNetworkInterfaceGetSupportedProtocolTypes"
		       (SCNetworkInterfaceRef) CFArrayRef))
  (define SCNetworkInterfaceCreateWithInterface
    (foreign-procedure "SCNetworkInterfaceCreateWithInterface"
		       (SCNetworkInterfaceRef CFStringRef) SCNetworkInterfaceRef))
  (define SCNetworkInterfaceGetBSDName
    (foreign-procedure "SCNetworkInterfaceGetBSDName"
		       (SCNetworkInterfaceRef) CFStringRef))
  (define SCNetworkInterfaceGetConfiguration
    (foreign-procedure "SCNetworkInterfaceGetConfiguration"
		       (SCNetworkInterfaceRef) CFDictionaryRef))
  (define SCNetworkInterfaceGetExtendedConfiguration
    (foreign-procedure "SCNetworkInterfaceGetExtendedConfiguration"
		       (SCNetworkInterfaceRef CFStringRef) CFDictionaryRef))
  (define SCNetworkInterfaceGetHardwareAddressString
    (foreign-procedure "SCNetworkInterfaceGetHardwareAddressString"
		       (SCNetworkInterfaceRef) CFStringRef))
  (define SCNetworkInterfaceGetInterface
    (foreign-procedure "SCNetworkInterfaceGetInterface"
		       (SCNetworkInterfaceRef) SCNetworkInterfaceRef))
  (define SCNetworkInterfaceGetInterfaceType
    (foreign-procedure "SCNetworkInterfaceGetInterfaceType"
		       (SCNetworkInterfaceRef) CFStringRef))
  (define SCNetworkInterfaceGetLocalizedDisplayName
    (foreign-procedure "SCNetworkInterfaceGetLocalizedDisplayName"
		       (SCNetworkInterfaceRef) CFStringRef))
  (define SCNetworkInterfaceSetConfiguration
    (foreign-procedure "SCNetworkInterfaceSetConfiguration"
		       (SCNetworkInterfaceRef CFDictionaryRef) Boolean))
  (define SCNetworkInterfaceSetExtendedConfiguration
    (foreign-procedure "SCNetworkInterfaceSetExtendedConfiguration"
		       (SCNetworkInterfaceRef CFStringRef CFDictionaryRef) Boolean))
  (define SCNetworkInterfaceCopyMediaOptions
    (foreign-procedure "SCNetworkInterfaceCopyMediaOptions"
		       (SCNetworkInterfaceRef (* CFDictionaryRef) (* CFDictionaryRef) (* CFArrayRef) Boolean) Boolean))
  (define SCNetworkInterfaceCopyMediaSubTypes
    (foreign-procedure "SCNetworkInterfaceCopyMediaSubTypes"
		       (CFArrayRef) CFArrayRef))
  (define SCNetworkInterfaceCopyMediaSubTypeOptions
    (foreign-procedure "SCNetworkInterfaceCopyMediaSubTypeOptions"
		       (CFArrayRef CFStringRef) CFArrayRef))
  (define SCNetworkInterfaceCopyMTU
    (foreign-procedure "SCNetworkInterfaceCopyMTU"
		       (SCNetworkInterfaceRef (* int) (* int) (* int)) Boolean))
  (define SCNetworkInterfaceSetMediaOptions
    (foreign-procedure "SCNetworkInterfaceSetMediaOptions"
		       (SCNetworkInterfaceRef CFStringRef CFArrayRef) Boolean))
  (define SCNetworkInterfaceSetMTU
    (foreign-procedure "SCNetworkInterfaceSetMTU"
		       (SCNetworkInterfaceRef int) Boolean))
  (define SCNetworkInterfaceForceConfigurationRefresh
    (foreign-procedure "SCNetworkInterfaceForceConfigurationRefresh"
		       (SCNetworkInterfaceRef) Boolean))

  ;;
  ;; SCBondInterface Functions
  ;;

  (define SCBondInterfaceCopyAll
    (foreign-procedure "SCBondInterfaceCopyAll"
		       (SCPreferencesRef) CFArrayRef))
  (define SCBondInterfaceCopyAvailableMemberInterfaces
    (foreign-procedure "SCBondInterfaceCopyAvailableMemberInterfaces"
		       (SCPreferencesRef) CFArrayRef))
  (define SCBondInterfaceCreate
    (foreign-procedure "SCBondInterfaceCreate"
		       (SCPreferencesRef) SCBondInterfaceRef))
  (define SCBondInterfaceRemove
    (foreign-procedure "SCBondInterfaceRemove"
		       (SCBondInterfaceRef) Boolean))
  (define SCBondInterfaceGetMemberInterfaces
    (foreign-procedure "SCBondInterfaceGetMemberInterfaces"
		       (SCBondInterfaceRef) CFArrayRef))
  (define SCBondInterfaceGetOptions
    (foreign-procedure "SCBondInterfaceGetOptions"
		       (SCBondInterfaceRef) CFDictionaryRef))
  (define SCBondInterfaceSetMemberInterfaces
    (foreign-procedure "SCBondInterfaceSetMemberInterfaces"
		       (SCBondInterfaceRef CFArrayRef) Boolean))
  (define SCBondInterfaceSetLocalizedDisplayName
    (foreign-procedure "SCBondInterfaceSetLocalizedDisplayName"
		       (SCBondInterfaceRef CFStringRef) Boolean))
  (define SCBondInterfaceSetOptions
    (foreign-procedure "SCBondInterfaceSetOptions"
		       (SCBondInterfaceRef CFDictionaryRef) Boolean))
  (define SCBondInterfaceCopyStatus
    (foreign-procedure "SCBondInterfaceCopyStatus"
		       (SCBondInterfaceRef) SCBondStatusRef))

  ;;
  ;; SCBondStatus Functions
  ;;

  (define SCBondStatusGetTypeID
    (foreign-procedure "SCBondStatusGetTypeID"
		       () CFTypeID))
  (define SCBondStatusGetMemberInterfaces
    (foreign-procedure "SCBondStatusGetMemberInterfaces"
		       (SCBondStatusRef) CFArrayRef))
  (define SCBondStatusGetInterfaceStatus
    (foreign-procedure "SCBondStatusGetInterfaceStatus"
		       (SCBondStatusRef SCNetworkInterfaceRef) CFDictionaryRef))

  ;;
  ;; SCVLANInterface Functions
  ;;

  (define SCVLANInterfaceCopyAll
    (foreign-procedure "SCVLANInterfaceCopyAll"
		       (SCPreferencesRef) CFArrayRef))
  (define SCVLANInterfaceCopyAvailablePhysicalInterfaces
    (foreign-procedure "SCVLANInterfaceCopyAvailablePhysicalInterfaces"
		       () CFArrayRef))
  (define SCVLANInterfaceCreate
    (foreign-procedure "SCVLANInterfaceCreate"
		       (SCPreferencesRef SCNetworkInterfaceRef CFNumberRef) SCVLANInterfaceRef))
  (define SCVLANInterfaceRemove
    (foreign-procedure "SCVLANInterfaceRemove"
		       (SCVLANInterfaceRef) Boolean))
  (define SCVLANInterfaceGetPhysicalInterface
    (foreign-procedure "SCVLANInterfaceGetPhysicalInterface"
		       (SCVLANInterfaceRef) SCNetworkInterfaceRef))
  (define SCVLANInterfaceGetTag
    (foreign-procedure "SCVLANInterfaceGetTag"
		       (SCVLANInterfaceRef) CFNumberRef))
  (define SCVLANInterfaceGetOptions
    (foreign-procedure "SCVLANInterfaceGetOptions"
		       (SCVLANInterfaceRef) CFDictionaryRef))
  (define SCVLANInterfaceSetPhysicalInterfaceAndTag
    (foreign-procedure "SCVLANInterfaceSetPhysicalInterfaceAndTag"
		       (SCVLANInterfaceRef SCNetworkInterfaceRef CFNumberRef) Boolean))
  (define SCVLANInterfaceSetLocalizedDisplayName
    (foreign-procedure "SCVLANInterfaceSetLocalizedDisplayName"
		       (SCVLANInterfaceRef CFStringRef) Boolean))
  (define SCVLANInterfaceSetOptions
    (foreign-procedure "SCVLANInterfaceSetOptions"
		       (SCVLANInterfaceRef CFDictionaryRef) Boolean))

  ;;
  ;; SCNetworkProtocol Functions
  ;;

  (define SCNetworkProtocolGetTypeID
    (foreign-procedure "SCNetworkProtocolGetTypeID"
		       () CFTypeID))
  (define SCNetworkProtocolGetConfiguration
    (foreign-procedure "SCNetworkProtocolGetConfiguration"
		       (SCNetworkProtocolRef) CFDictionaryRef))
  (define SCNetworkProtocolGetEnabled
    (foreign-procedure "SCNetworkProtocolGetEnabled"
		       (SCNetworkProtocolRef) Boolean))
  (define SCNetworkProtocolGetProtocolType
    (foreign-procedure "SCNetworkProtocolGetProtocolType"
		       (SCNetworkProtocolRef) CFStringRef))
  (define SCNetworkProtocolSetConfiguration
    (foreign-procedure "SCNetworkProtocolSetConfiguration"
		       (SCNetworkProtocolRef CFDictionaryRef) Boolean))
  (define SCNetworkProtocolSetEnabled
    (foreign-procedure "SCNetworkProtocolSetEnabled"
		       (SCNetworkProtocolRef Boolean) Boolean))

  ;;
  ;; SCNetworkService Functions
  ;;

  (define SCNetworkServiceGetTypeID
    (foreign-procedure "SCNetworkServiceGetTypeID"
		       () CFTypeID))
  (define SCNetworkServiceAddProtocolType
    (foreign-procedure "SCNetworkServiceAddProtocolType"
		       (SCNetworkProtocolRef CFStringRef) Boolean))
  (define SCNetworkServiceCopyAll
    (foreign-procedure "SCNetworkServiceCopyAll"
		       (SCPreferencesRef) CFArrayRef))
  (define SCNetworkServiceCopyProtocols
    (foreign-procedure "SCNetworkServiceCopyProtocols"
		       (SCNetworkServiceRef) CFArrayRef))
  (define SCNetworkServiceCreate
    (foreign-procedure "SCNetworkServiceCreate"
		       (SCPreferencesRef SCNetworkInterfaceRef) SCNetworkServiceRef))
  (define SCNetworkServiceCopy
    (foreign-procedure "SCNetworkServiceCopy"
		       (SCPreferencesRef CFStringRef) SCNetworkServiceRef))
  (define SCNetworkServiceEstablishDefaultConfiguration
    (foreign-procedure "SCNetworkServiceEstablishDefaultConfiguration"
		       (SCNetworkServiceRef) Boolean))
  (define SCNetworkServiceGetEnabled
    (foreign-procedure "SCNetworkServiceGetEnabled"
		       (SCNetworkServiceRef) Boolean))
  (define SCNetworkServiceGetInterface
    (foreign-procedure "SCNetworkServiceGetInterface"
		       (SCNetworkServiceRef) SCNetworkInterfaceRef))
  (define SCNetworkServiceGetName
    (foreign-procedure "SCNetworkServiceGetName"
		       (SCNetworkServiceRef) CFStringRef))
  (define SCNetworkServiceCopyProtocol
    (foreign-procedure "SCNetworkServiceCopyProtocol"
		       (SCNetworkServiceRef CFStringRef) SCNetworkProtocolRef))
  (define SCNetworkServiceGetServiceID
    (foreign-procedure "SCNetworkServiceGetServiceID"
		       (SCNetworkServiceRef) CFStringRef))
  (define SCNetworkServiceRemove
    (foreign-procedure "SCNetworkServiceRemove"
		       (SCNetworkServiceRef) Boolean))
  (define SCNetworkServiceRemoveProtocolType
    (foreign-procedure "SCNetworkServiceRemoveProtocolType"
		       (SCNetworkServiceRef CFStringRef) Boolean))
  (define SCNetworkServiceSetEnabled
    (foreign-procedure "SCNetworkServiceSetEnabled"
		       (SCNetworkServiceRef Boolean) Boolean))
  (define SCNetworkServiceSetName
    (foreign-procedure "SCNetworkServiceSetName"
		       (SCNetworkServiceRef CFStringRef) Boolean))

  ;;
  ;; SCNetworkSet Functions
  ;;

  (define SCNetworkSetGetTypeID
    (foreign-procedure "SCNetworkSetGetTypeID"
		       () CFTypeID))
  (define SCNetworkSetAddService
    (foreign-procedure "SCNetworkSetAddService"
		       (SCNetworkSetRef SCNetworkServiceRef) Boolean))
  (define SCNetworkSetContainsInterface
    (foreign-procedure "SCNetworkSetContainsInterface"
		       (SCNetworkSetRef SCNetworkInterfaceRef) Boolean))
  (define SCNetworkSetCopyAll
    (foreign-procedure "SCNetworkSetCopyAll"
		       (SCPreferencesRef) CFArrayRef))
  (define SCNetworkSetCopyCurrent
    (foreign-procedure "SCNetworkSetCopyCurrent"
		       (SCPreferencesRef) SCNetworkSetRef))
  (define SCNetworkSetCopyServices
    (foreign-procedure "SCNetworkSetCopyServices"
		       (SCNetworkSetRef) CFArrayRef))
  (define SCNetworkSetCreate
    (foreign-procedure "SCNetworkSetCreate"
		       (SCPreferencesRef) SCNetworkSetRef))
  (define SCNetworkSetCopy
    (foreign-procedure "SCNetworkSetCopy"
		       (SCPreferencesRef CFStringRef) SCNetworkSetRef))
  (define SCNetworkSetGetName
    (foreign-procedure "SCNetworkSetGetName"
		       (SCNetworkSetRef) CFStringRef))
  (define SCNetworkSetGetSetID
    (foreign-procedure "SCNetworkSetGetSetID"
		       (SCNetworkSetRef) CFStringRef))
  (define SCNetworkSetGetServiceOrder
    (foreign-procedure "SCNetworkSetGetServiceOrder"
		       (SCNetworkSetRef) CFArrayRef))
  (define SCNetworkSetRemove
    (foreign-procedure "SCNetworkSetRemove"
		       (SCNetworkSetRef) Boolean))
  (define SCNetworkSetRemoveService
    (foreign-procedure "SCNetworkSetRemoveService"
		       (SCNetworkSetRef SCNetworkServiceRef) Boolean))
  (define SCNetworkSetSetCurrent
    (foreign-procedure "SCNetworkSetSetCurrent"
		       (SCNetworkSetRef) Boolean))
  (define SCNetworkSetSetName
    (foreign-procedure "SCNetworkSetSetName"
		       (SCNetworkSetRef CFStringRef) Boolean))
  (define SCNetworkSetSetServiceOrder
    (foreign-procedure "SCNetworkSetSetServiceOrder"
		       (SCNetworkSetRef CFArrayRef) Boolean))
  )
