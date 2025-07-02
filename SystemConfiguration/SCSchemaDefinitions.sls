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
;; Based on Apple's SystemConfiguration/SCSchemaDefinitions.h
(library
  (SystemConfiguration SCSchemaDefinitions)
  (export
    kSCResvLink
    kSCResvInactive
    kSCPropInterfaceName
    kSCPropMACAddress
    kSCPropUserDefinedName
    kSCPropVersion
    kSCPrefCurrentSet
    kSCPrefNetworkServices
    kSCPrefSets
    kSCPrefSystem
    kSCCompNetwork
    kSCCompService
    kSCCompGlobal
    kSCCompHostNames
    kSCCompInterface
    kSCCompSystem
    kSCCompUsers
    kSCCompAnyRegex
    kSCEntNetAirPort
    kSCEntNetDHCP
    kSCEntNetDNS
    kSCEntNetEthernet
    kSCEntNetFireWire
    kSCEntNetInterface
    kSCEntNetIPSec
    kSCEntNetIPv4
    kSCEntNetIPv6
    kSCEntNetL2TP
    kSCEntNetLink
    kSCEntNetModem
    kSCEntNetPPP
    kSCEntNetPPPoE
    kSCEntNetPPPSerial
    kSCEntNetPPTP
    kSCEntNetProxies
    kSCEntNetSMB
    kSCEntNet6to4
    kSCPropNetOverridePrimary
    kSCPropNetServiceOrder
    kSCPropNetPPPOverridePrimary
    kSCPropNetInterfaces
    kSCPropNetLocalHostName
    kSCPropNetAirPortAllowNetCreation
    kSCPropNetAirPortAuthPassword
    kSCPropNetAirPortAuthPasswordEncryption
    kSCPropNetAirPortJoinMode
    kSCPropNetAirPortPowerEnabled
    kSCPropNetAirPortPreferredNetwork
    kSCPropNetAirPortSavePasswords
    kSCValNetAirPortJoinModeAutomatic
    kSCValNetAirPortJoinModePreferred
    kSCValNetAirPortJoinModeRanked
    kSCValNetAirPortJoinModeRecent
    kSCValNetAirPortJoinModeStrongest
    kSCValNetAirPortAuthPasswordEncryptionKeychain
    kSCPropNetDNSDomainName
    kSCPropNetDNSOptions
    kSCPropNetDNSSearchDomains
    kSCPropNetDNSSearchOrder
    kSCPropNetDNSServerAddresses
    kSCPropNetDNSServerPort
    kSCPropNetDNSServerTimeout
    kSCPropNetDNSSortList
    kSCPropNetDNSSupplementalMatchDomains
    kSCPropNetDNSSupplementalMatchOrders
    kSCPropNetEthernetMediaSubType
    kSCPropNetEthernetMediaOptions
    kSCPropNetEthernetMTU
    kSCPropNetInterfaceDeviceName
    kSCPropNetInterfaceHardware
    kSCPropNetInterfaceType
    kSCPropNetInterfaceSubType
    kSCPropNetInterfaceSupportsModemOnHold
    kSCValNetInterfaceTypeEthernet
    kSCValNetInterfaceTypeFireWire
    kSCValNetInterfaceTypePPP
    kSCValNetInterfaceType6to4
    kSCValNetInterfaceTypeIPSec
    kSCValNetInterfaceSubTypePPPoE
    kSCValNetInterfaceSubTypePPPSerial
    kSCValNetInterfaceSubTypePPTP
    kSCValNetInterfaceSubTypeL2TP
    kSCPropNetIPSecAuthenticationMethod
    kSCPropNetIPSecLocalCertificate
    kSCPropNetIPSecLocalIdentifier
    kSCPropNetIPSecLocalIdentifierType
    kSCPropNetIPSecSharedSecret
    kSCPropNetIPSecSharedSecretEncryption
    kSCPropNetIPSecConnectTime
    kSCPropNetIPSecRemoteAddress
    kSCPropNetIPSecStatus
    kSCPropNetIPSecXAuthEnabled
    kSCPropNetIPSecXAuthName
    kSCPropNetIPSecXAuthPassword
    kSCPropNetIPSecXAuthPasswordEncryption
    kSCValNetIPSecAuthenticationMethodSharedSecret
    kSCValNetIPSecAuthenticationMethodCertificate
    kSCValNetIPSecAuthenticationMethodHybrid
    kSCValNetIPSecLocalIdentifierTypeKeyID
    kSCValNetIPSecSharedSecretEncryptionKeychain
    kSCValNetIPSecXAuthPasswordEncryptionKeychain
    kSCValNetIPSecXAuthPasswordEncryptionPrompt
    kSCPropNetIPv4Addresses
    kSCPropNetIPv4ConfigMethod
    kSCPropNetIPv4DHCPClientID
    kSCPropNetIPv4Router
    kSCPropNetIPv4SubnetMasks
    kSCPropNetIPv4DestAddresses
    kSCPropNetIPv4BroadcastAddresses
    kSCValNetIPv4ConfigMethodAutomatic
    kSCValNetIPv4ConfigMethodBOOTP
    kSCValNetIPv4ConfigMethodDHCP
    kSCValNetIPv4ConfigMethodINFORM
    kSCValNetIPv4ConfigMethodLinkLocal
    kSCValNetIPv4ConfigMethodManual
    kSCValNetIPv4ConfigMethodPPP
    kSCPropNetIPv6Addresses
    kSCPropNetIPv6ConfigMethod
    kSCPropNetIPv6DestAddresses
    kSCPropNetIPv6Flags
    kSCPropNetIPv6PrefixLength
    kSCPropNetIPv6Router
    kSCValNetIPv6ConfigMethodAutomatic
    kSCValNetIPv6ConfigMethodLinkLocal
    kSCValNetIPv6ConfigMethodManual
    kSCValNetIPv6ConfigMethodRouterAdvertisement
    kSCValNetIPv6ConfigMethod6to4
    kSCPropNet6to4Relay
    kSCPropNetLinkActive
    kSCPropNetLinkDetaching
    kSCPropNetModemAccessPointName
    kSCPropNetModemConnectionPersonality
    kSCPropNetModemConnectionScript
    kSCPropNetModemConnectSpeed
    kSCPropNetModemDataCompression
    kSCPropNetModemDeviceContextID
    kSCPropNetModemDeviceModel
    kSCPropNetModemDeviceVendor
    kSCPropNetModemDialMode
    kSCPropNetModemErrorCorrection
    kSCPropNetModemHoldCallWaitingAudibleAlert
    kSCPropNetModemHoldDisconnectOnAnswer
    kSCPropNetModemHoldEnabled
    kSCPropNetModemHoldReminder
    kSCPropNetModemHoldReminderTime
    kSCPropNetModemNote
    kSCPropNetModemPulseDial
    kSCPropNetModemSpeaker
    kSCPropNetModemSpeed
    kSCValNetModemDialModeIgnoreDialTone
    kSCValNetModemDialModeManual
    kSCValNetModemDialModeWaitForDialTone
    kSCPropNetPPPACSPEnabled
    kSCPropNetPPPConnectTime
    kSCPropNetPPPDeviceLastCause
    kSCPropNetPPPDialOnDemand
    kSCPropNetPPPDisconnectOnFastUserSwitch
    kSCPropNetPPPDisconnectOnIdle
    kSCPropNetPPPDisconnectOnIdleTimer
    kSCPropNetPPPDisconnectOnLogout
    kSCPropNetPPPDisconnectOnSleep
    kSCPropNetPPPDisconnectTime
    kSCPropNetPPPIdleReminder
    kSCPropNetPPPIdleReminderTimer
    kSCPropNetPPPLastCause
    kSCPropNetPPPLogfile
    kSCPropNetPPPPlugins
    kSCPropNetPPPRetryConnectTime
    kSCPropNetPPPSessionTimer
    kSCPropNetPPPStatus
    kSCPropNetPPPUseSessionTimer
    kSCPropNetPPPVerboseLogging
    kSCPropNetPPPAuthEAPPlugins
    kSCPropNetPPPAuthName
    kSCPropNetPPPAuthPassword
    kSCPropNetPPPAuthPasswordEncryption
    kSCPropNetPPPAuthPrompt
    kSCPropNetPPPAuthProtocol
    kSCValNetPPPAuthPasswordEncryptionKeychain
    kSCValNetPPPAuthPasswordEncryptionToken
    kSCValNetPPPAuthPromptBefore
    kSCValNetPPPAuthPromptAfter
    kSCValNetPPPAuthProtocolCHAP
    kSCValNetPPPAuthProtocolEAP
    kSCValNetPPPAuthProtocolMSCHAP1
    kSCValNetPPPAuthProtocolMSCHAP2
    kSCValNetPPPAuthProtocolPAP
    kSCPropNetPPPCommAlternateRemoteAddress
    kSCPropNetPPPCommConnectDelay
    kSCPropNetPPPCommDisplayTerminalWindow
    kSCPropNetPPPCommRedialCount
    kSCPropNetPPPCommRedialEnabled
    kSCPropNetPPPCommRedialInterval
    kSCPropNetPPPCommRemoteAddress
    kSCPropNetPPPCommTerminalScript
    kSCPropNetPPPCommUseTerminalScript
    kSCPropNetPPPCCPEnabled
    kSCPropNetPPPCCPMPPE40Enabled
    kSCPropNetPPPCCPMPPE128Enabled
    kSCPropNetPPPIPCPCompressionVJ
    kSCPropNetPPPIPCPUsePeerDNS
    kSCPropNetPPPLCPEchoEnabled
    kSCPropNetPPPLCPEchoFailure
    kSCPropNetPPPLCPEchoInterval
    kSCPropNetPPPLCPCompressionACField
    kSCPropNetPPPLCPCompressionPField
    kSCPropNetPPPLCPMRU
    kSCPropNetPPPLCPMTU
    kSCPropNetPPPLCPReceiveACCM
    kSCPropNetPPPLCPTransmitACCM
    kSCPropNetL2TPIPSecSharedSecret
    kSCPropNetL2TPIPSecSharedSecretEncryption
    kSCPropNetL2TPTransport
    kSCValNetL2TPIPSecSharedSecretEncryptionKeychain
    kSCValNetL2TPTransportIP
    kSCValNetL2TPTransportIPSec
    kSCPropNetProxiesExceptionsList
    kSCPropNetProxiesExcludeSimpleHostnames
    kSCPropNetProxiesFTPEnable
    kSCPropNetProxiesFTPPassive
    kSCPropNetProxiesFTPPort
    kSCPropNetProxiesFTPProxy
    kSCPropNetProxiesGopherEnable
    kSCPropNetProxiesGopherPort
    kSCPropNetProxiesGopherProxy
    kSCPropNetProxiesHTTPEnable
    kSCPropNetProxiesHTTPPort
    kSCPropNetProxiesHTTPProxy
    kSCPropNetProxiesHTTPSEnable
    kSCPropNetProxiesHTTPSPort
    kSCPropNetProxiesHTTPSProxy
    kSCPropNetProxiesRTSPEnable
    kSCPropNetProxiesRTSPPort
    kSCPropNetProxiesRTSPProxy
    kSCPropNetProxiesSOCKSEnable
    kSCPropNetProxiesSOCKSPort
    kSCPropNetProxiesSOCKSProxy
    kSCPropNetProxiesProxyAutoConfigEnable
    kSCPropNetProxiesProxyAutoConfigJavaScript
    kSCPropNetProxiesProxyAutoConfigURLString
    kSCPropNetProxiesProxyAutoDiscoveryEnable
    kSCPropNetSMBNetBIOSName
    kSCPropNetSMBNetBIOSNodeType
    kSCPropNetSMBNetBIOSScope
    kSCPropNetSMBWINSAddresses
    kSCPropNetSMBWorkgroup
    kSCValNetSMBNetBIOSNodeTypeBroadcast
    kSCValNetSMBNetBIOSNodeTypePeer
    kSCValNetSMBNetBIOSNodeTypeMixed
    kSCValNetSMBNetBIOSNodeTypeHybrid
    kSCEntUsersConsoleUser
    kSCPropSystemComputerName
    kSCPropSystemComputerNameEncoding
    kSCDynamicStoreDomainFile
    kSCDynamicStoreDomainPlugin
    kSCDynamicStoreDomainSetup
    kSCDynamicStoreDomainState
    kSCDynamicStoreDomainPrefs
    kSCDynamicStorePropSetupCurrentSet
    kSCDynamicStorePropSetupLastUpdated
    kSCDynamicStorePropNetInterfaces
    kSCDynamicStorePropNetPrimaryInterface
    kSCDynamicStorePropNetPrimaryService
    kSCDynamicStorePropNetServiceIDs
    kSCPropUsersConsoleUserName
    kSCPropUsersConsoleUserUID
    kSCPropUsersConsoleUserGID)
  (import
    (chezscheme)
    (CoreFoundation CFBase))

  ;;---------------------;;
  ;; SCSchemaDefinitions ;;
  ;;=====================;;

  (define init
    (load-shared-object "SystemConfiguration.framework/SystemConfiguration"))

  ;;
  ;; Types
  ;;

  ;; (none defined)

  ;;
  ;; Constants
  ;;

  (define kSCResvLink
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCResvLink")))
  (define kSCResvInactive
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCResvInactive")))
  (define kSCPropInterfaceName
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropInterfaceName")))
  (define kSCPropMACAddress
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropMACAddress")))
  (define kSCPropUserDefinedName
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropUserDefinedName")))
  (define kSCPropVersion
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropVersion")))
  (define kSCPrefCurrentSet
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPrefCurrentSet")))
  (define kSCPrefNetworkServices
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPrefNetworkServices")))
  (define kSCPrefSets
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPrefSets")))
  (define kSCPrefSystem
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPrefSystem")))
  (define kSCCompNetwork
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCCompNetwork")))
  (define kSCCompService
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCCompService")))
  (define kSCCompGlobal
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCCompGlobal")))
  (define kSCCompHostNames
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCCompHostNames")))
  (define kSCCompInterface
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCCompInterface")))
  (define kSCCompSystem
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCCompSystem")))
  (define kSCCompUsers
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCCompUsers")))
  (define kSCCompAnyRegex
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCCompAnyRegex")))
  (define kSCEntNetAirPort
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCEntNetAirPort")))
  (define kSCEntNetDHCP
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCEntNetDHCP")))
  (define kSCEntNetDNS
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCEntNetDNS")))
  (define kSCEntNetEthernet
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCEntNetEthernet")))
  (define kSCEntNetFireWire
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCEntNetFireWire")))
  (define kSCEntNetInterface
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCEntNetInterface")))
  (define kSCEntNetIPSec
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCEntNetIPSec")))
  (define kSCEntNetIPv4
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCEntNetIPv4")))
  (define kSCEntNetIPv6
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCEntNetIPv6")))
  (define kSCEntNetL2TP
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCEntNetL2TP")))
  (define kSCEntNetLink
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCEntNetLink")))
  (define kSCEntNetModem
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCEntNetModem")))
  (define kSCEntNetPPP
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCEntNetPPP")))
  (define kSCEntNetPPPoE
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCEntNetPPPoE")))
  (define kSCEntNetPPPSerial
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCEntNetPPPSerial")))
  (define kSCEntNetPPTP
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCEntNetPPTP")))
  (define kSCEntNetProxies
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCEntNetProxies")))
  (define kSCEntNetSMB
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCEntNetSMB")))
  (define kSCEntNet6to4
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCEntNet6to4")))
  (define kSCPropNetOverridePrimary
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetOverridePrimary")))
  (define kSCPropNetServiceOrder
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetServiceOrder")))
  (define kSCPropNetPPPOverridePrimary
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPOverridePrimary")))
  (define kSCPropNetInterfaces
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetInterfaces")))
  (define kSCPropNetLocalHostName
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetLocalHostName")))
  (define kSCPropNetAirPortAllowNetCreation
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetAirPortAllowNetCreation")))
  (define kSCPropNetAirPortAuthPassword
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetAirPortAuthPassword")))
  (define kSCPropNetAirPortAuthPasswordEncryption
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetAirPortAuthPasswordEncryption")))
  (define kSCPropNetAirPortJoinMode
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetAirPortJoinMode")))
  (define kSCPropNetAirPortPowerEnabled
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetAirPortPowerEnabled")))
  (define kSCPropNetAirPortPreferredNetwork
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetAirPortPreferredNetwork")))
  (define kSCPropNetAirPortSavePasswords
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetAirPortSavePasswords")))
  (define kSCValNetAirPortJoinModeAutomatic
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetAirPortJoinModeAutomatic")))
  (define kSCValNetAirPortJoinModePreferred
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetAirPortJoinModePreferred")))
  (define kSCValNetAirPortJoinModeRanked
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetAirPortJoinModeRanked")))
  (define kSCValNetAirPortJoinModeRecent
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetAirPortJoinModeRecent")))
  (define kSCValNetAirPortJoinModeStrongest
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetAirPortJoinModeStrongest")))
  (define kSCValNetAirPortAuthPasswordEncryptionKeychain
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetAirPortAuthPasswordEncryptionKeychain")))
  (define kSCPropNetDNSDomainName
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetDNSDomainName")))
  (define kSCPropNetDNSOptions
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetDNSOptions")))
  (define kSCPropNetDNSSearchDomains
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetDNSSearchDomains")))
  (define kSCPropNetDNSSearchOrder
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetDNSSearchOrder")))
  (define kSCPropNetDNSServerAddresses
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetDNSServerAddresses")))
  (define kSCPropNetDNSServerPort
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetDNSServerPort")))
  (define kSCPropNetDNSServerTimeout
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetDNSServerTimeout")))
  (define kSCPropNetDNSSortList
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetDNSSortList")))
  (define kSCPropNetDNSSupplementalMatchDomains
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetDNSSupplementalMatchDomains")))
  (define kSCPropNetDNSSupplementalMatchOrders
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetDNSSupplementalMatchOrders")))
  (define kSCPropNetEthernetMediaSubType
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetEthernetMediaSubType")))
  (define kSCPropNetEthernetMediaOptions
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetEthernetMediaOptions")))
  (define kSCPropNetEthernetMTU
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetEthernetMTU")))
  (define kSCPropNetInterfaceDeviceName
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetInterfaceDeviceName")))
  (define kSCPropNetInterfaceHardware
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetInterfaceHardware")))
  (define kSCPropNetInterfaceType
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetInterfaceType")))
  (define kSCPropNetInterfaceSubType
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetInterfaceSubType")))
  (define kSCPropNetInterfaceSupportsModemOnHold
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetInterfaceSupportsModemOnHold")))
  (define kSCValNetInterfaceTypeEthernet
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetInterfaceTypeEthernet")))
  (define kSCValNetInterfaceTypeFireWire
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetInterfaceTypeFireWire")))
  (define kSCValNetInterfaceTypePPP
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetInterfaceTypePPP")))
  (define kSCValNetInterfaceType6to4
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetInterfaceType6to4")))
  (define kSCValNetInterfaceTypeIPSec
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetInterfaceTypeIPSec")))
  (define kSCValNetInterfaceSubTypePPPoE
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetInterfaceSubTypePPPoE")))
  (define kSCValNetInterfaceSubTypePPPSerial
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetInterfaceSubTypePPPSerial")))
  (define kSCValNetInterfaceSubTypePPTP
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetInterfaceSubTypePPTP")))
  (define kSCValNetInterfaceSubTypeL2TP
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetInterfaceSubTypeL2TP")))
  (define kSCPropNetIPSecAuthenticationMethod
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetIPSecAuthenticationMethod")))
  (define kSCPropNetIPSecLocalCertificate
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetIPSecLocalCertificate")))
  (define kSCPropNetIPSecLocalIdentifier
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetIPSecLocalIdentifier")))
  (define kSCPropNetIPSecLocalIdentifierType
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetIPSecLocalIdentifierType")))
  (define kSCPropNetIPSecSharedSecret
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetIPSecSharedSecret")))
  (define kSCPropNetIPSecSharedSecretEncryption
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetIPSecSharedSecretEncryption")))
  (define kSCPropNetIPSecConnectTime
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetIPSecConnectTime")))
  (define kSCPropNetIPSecRemoteAddress
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetIPSecRemoteAddress")))
  (define kSCPropNetIPSecStatus
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetIPSecStatus")))
  (define kSCPropNetIPSecXAuthEnabled
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetIPSecXAuthEnabled")))
  (define kSCPropNetIPSecXAuthName
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetIPSecXAuthName")))
  (define kSCPropNetIPSecXAuthPassword
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetIPSecXAuthPassword")))
  (define kSCPropNetIPSecXAuthPasswordEncryption
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetIPSecXAuthPasswordEncryption")))
  (define kSCValNetIPSecAuthenticationMethodSharedSecret
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetIPSecAuthenticationMethodSharedSecret")))
  (define kSCValNetIPSecAuthenticationMethodCertificate
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetIPSecAuthenticationMethodCertificate")))
  (define kSCValNetIPSecAuthenticationMethodHybrid
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetIPSecAuthenticationMethodHybrid")))
  (define kSCValNetIPSecLocalIdentifierTypeKeyID
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetIPSecLocalIdentifierTypeKeyID")))
  (define kSCValNetIPSecSharedSecretEncryptionKeychain
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetIPSecSharedSecretEncryptionKeychain")))
  (define kSCValNetIPSecXAuthPasswordEncryptionKeychain
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetIPSecXAuthPasswordEncryptionKeychain")))
  (define kSCValNetIPSecXAuthPasswordEncryptionPrompt
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetIPSecXAuthPasswordEncryptionPrompt")))
  (define kSCPropNetIPv4Addresses
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetIPv4Addresses")))
  (define kSCPropNetIPv4ConfigMethod
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetIPv4ConfigMethod")))
  (define kSCPropNetIPv4DHCPClientID
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetIPv4DHCPClientID")))
  (define kSCPropNetIPv4Router
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetIPv4Router")))
  (define kSCPropNetIPv4SubnetMasks
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetIPv4SubnetMasks")))
  (define kSCPropNetIPv4DestAddresses
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetIPv4DestAddresses")))
  (define kSCPropNetIPv4BroadcastAddresses
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetIPv4BroadcastAddresses")))
  (define kSCValNetIPv4ConfigMethodAutomatic
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetIPv4ConfigMethodAutomatic")))
  (define kSCValNetIPv4ConfigMethodBOOTP
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetIPv4ConfigMethodBOOTP")))
  (define kSCValNetIPv4ConfigMethodDHCP
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetIPv4ConfigMethodDHCP")))
  (define kSCValNetIPv4ConfigMethodINFORM
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetIPv4ConfigMethodINFORM")))
  (define kSCValNetIPv4ConfigMethodLinkLocal
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetIPv4ConfigMethodLinkLocal")))
  (define kSCValNetIPv4ConfigMethodManual
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetIPv4ConfigMethodManual")))
  (define kSCValNetIPv4ConfigMethodPPP
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetIPv4ConfigMethodPPP")))
  (define kSCPropNetIPv6Addresses
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetIPv6Addresses")))
  (define kSCPropNetIPv6ConfigMethod
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetIPv6ConfigMethod")))
  (define kSCPropNetIPv6DestAddresses
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetIPv6DestAddresses")))
  (define kSCPropNetIPv6Flags
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetIPv6Flags")))
  (define kSCPropNetIPv6PrefixLength
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetIPv6PrefixLength")))
  (define kSCPropNetIPv6Router
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetIPv6Router")))
  (define kSCValNetIPv6ConfigMethodAutomatic
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetIPv6ConfigMethodAutomatic")))
  (define kSCValNetIPv6ConfigMethodLinkLocal
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetIPv6ConfigMethodLinkLocal")))
  (define kSCValNetIPv6ConfigMethodManual
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetIPv6ConfigMethodManual")))
  (define kSCValNetIPv6ConfigMethodRouterAdvertisement
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetIPv6ConfigMethodRouterAdvertisement")))
  (define kSCValNetIPv6ConfigMethod6to4
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetIPv6ConfigMethod6to4")))
  (define kSCPropNet6to4Relay
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNet6to4Relay")))
  (define kSCPropNetLinkActive
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetLinkActive")))
  (define kSCPropNetLinkDetaching
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetLinkDetaching")))
  (define kSCPropNetModemAccessPointName
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetModemAccessPointName")))
  (define kSCPropNetModemConnectionPersonality
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetModemConnectionPersonality")))
  (define kSCPropNetModemConnectionScript
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetModemConnectionScript")))
  (define kSCPropNetModemConnectSpeed
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetModemConnectSpeed")))
  (define kSCPropNetModemDataCompression
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetModemDataCompression")))
  (define kSCPropNetModemDeviceContextID
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetModemDeviceContextID")))
  (define kSCPropNetModemDeviceModel
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetModemDeviceModel")))
  (define kSCPropNetModemDeviceVendor
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetModemDeviceVendor")))
  (define kSCPropNetModemDialMode
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetModemDialMode")))
  (define kSCPropNetModemErrorCorrection
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetModemErrorCorrection")))
  (define kSCPropNetModemHoldCallWaitingAudibleAlert
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetModemHoldCallWaitingAudibleAlert")))
  (define kSCPropNetModemHoldDisconnectOnAnswer
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetModemHoldDisconnectOnAnswer")))
  (define kSCPropNetModemHoldEnabled
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetModemHoldEnabled")))
  (define kSCPropNetModemHoldReminder
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetModemHoldReminder")))
  (define kSCPropNetModemHoldReminderTime
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetModemHoldReminderTime")))
  (define kSCPropNetModemNote
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetModemNote")))
  (define kSCPropNetModemPulseDial
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetModemPulseDial")))
  (define kSCPropNetModemSpeaker
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetModemSpeaker")))
  (define kSCPropNetModemSpeed
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetModemSpeed")))
  (define kSCValNetModemDialModeIgnoreDialTone
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetModemDialModeIgnoreDialTone")))
  (define kSCValNetModemDialModeManual
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetModemDialModeManual")))
  (define kSCValNetModemDialModeWaitForDialTone
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetModemDialModeWaitForDialTone")))
  (define kSCPropNetPPPACSPEnabled
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPACSPEnabled")))
  (define kSCPropNetPPPConnectTime
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPConnectTime")))
  (define kSCPropNetPPPDeviceLastCause
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPDeviceLastCause")))
  (define kSCPropNetPPPDialOnDemand
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPDialOnDemand")))
  (define kSCPropNetPPPDisconnectOnFastUserSwitch
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPDisconnectOnFastUserSwitch")))
  (define kSCPropNetPPPDisconnectOnIdle
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPDisconnectOnIdle")))
  (define kSCPropNetPPPDisconnectOnIdleTimer
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPDisconnectOnIdleTimer")))
  (define kSCPropNetPPPDisconnectOnLogout
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPDisconnectOnLogout")))
  (define kSCPropNetPPPDisconnectOnSleep
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPDisconnectOnSleep")))
  (define kSCPropNetPPPDisconnectTime
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPDisconnectTime")))
  (define kSCPropNetPPPIdleReminder
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPIdleReminder")))
  (define kSCPropNetPPPIdleReminderTimer
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPIdleReminderTimer")))
  (define kSCPropNetPPPLastCause
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPLastCause")))
  (define kSCPropNetPPPLogfile
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPLogfile")))
  (define kSCPropNetPPPPlugins
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPPlugins")))
  (define kSCPropNetPPPRetryConnectTime
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPRetryConnectTime")))
  (define kSCPropNetPPPSessionTimer
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPSessionTimer")))
  (define kSCPropNetPPPStatus
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPStatus")))
  (define kSCPropNetPPPUseSessionTimer
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPUseSessionTimer")))
  (define kSCPropNetPPPVerboseLogging
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPVerboseLogging")))
  (define kSCPropNetPPPAuthEAPPlugins
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPAuthEAPPlugins")))
  (define kSCPropNetPPPAuthName
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPAuthName")))
  (define kSCPropNetPPPAuthPassword
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPAuthPassword")))
  (define kSCPropNetPPPAuthPasswordEncryption
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPAuthPasswordEncryption")))
  (define kSCPropNetPPPAuthPrompt
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPAuthPrompt")))
  (define kSCPropNetPPPAuthProtocol
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPAuthProtocol")))
  (define kSCValNetPPPAuthPasswordEncryptionKeychain
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetPPPAuthPasswordEncryptionKeychain")))
  (define kSCValNetPPPAuthPasswordEncryptionToken
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetPPPAuthPasswordEncryptionToken")))
  (define kSCValNetPPPAuthPromptBefore
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetPPPAuthPromptBefore")))
  (define kSCValNetPPPAuthPromptAfter
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetPPPAuthPromptAfter")))
  (define kSCValNetPPPAuthProtocolCHAP
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetPPPAuthProtocolCHAP")))
  (define kSCValNetPPPAuthProtocolEAP
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetPPPAuthProtocolEAP")))
  (define kSCValNetPPPAuthProtocolMSCHAP1
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetPPPAuthProtocolMSCHAP1")))
  (define kSCValNetPPPAuthProtocolMSCHAP2
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetPPPAuthProtocolMSCHAP2")))
  (define kSCValNetPPPAuthProtocolPAP
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetPPPAuthProtocolPAP")))
  (define kSCPropNetPPPCommAlternateRemoteAddress
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPCommAlternateRemoteAddress")))
  (define kSCPropNetPPPCommConnectDelay
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPCommConnectDelay")))
  (define kSCPropNetPPPCommDisplayTerminalWindow
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPCommDisplayTerminalWindow")))
  (define kSCPropNetPPPCommRedialCount
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPCommRedialCount")))
  (define kSCPropNetPPPCommRedialEnabled
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPCommRedialEnabled")))
  (define kSCPropNetPPPCommRedialInterval
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPCommRedialInterval")))
  (define kSCPropNetPPPCommRemoteAddress
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPCommRemoteAddress")))
  (define kSCPropNetPPPCommTerminalScript
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPCommTerminalScript")))
  (define kSCPropNetPPPCommUseTerminalScript
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPCommUseTerminalScript")))
  (define kSCPropNetPPPCCPEnabled
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPCCPEnabled")))
  (define kSCPropNetPPPCCPMPPE40Enabled
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPCCPMPPE40Enabled")))
  (define kSCPropNetPPPCCPMPPE128Enabled
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPCCPMPPE128Enabled")))
  (define kSCPropNetPPPIPCPCompressionVJ
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPIPCPCompressionVJ")))
  (define kSCPropNetPPPIPCPUsePeerDNS
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPIPCPUsePeerDNS")))
  (define kSCPropNetPPPLCPEchoEnabled
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPLCPEchoEnabled")))
  (define kSCPropNetPPPLCPEchoFailure
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPLCPEchoFailure")))
  (define kSCPropNetPPPLCPEchoInterval
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPLCPEchoInterval")))
  (define kSCPropNetPPPLCPCompressionACField
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPLCPCompressionACField")))
  (define kSCPropNetPPPLCPCompressionPField
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPLCPCompressionPField")))
  (define kSCPropNetPPPLCPMRU
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPLCPMRU")))
  (define kSCPropNetPPPLCPMTU
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPLCPMTU")))
  (define kSCPropNetPPPLCPReceiveACCM
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPLCPReceiveACCM")))
  (define kSCPropNetPPPLCPTransmitACCM
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetPPPLCPTransmitACCM")))
  (define kSCPropNetL2TPIPSecSharedSecret
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetL2TPIPSecSharedSecret")))
  (define kSCPropNetL2TPIPSecSharedSecretEncryption
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetL2TPIPSecSharedSecretEncryption")))
  (define kSCPropNetL2TPTransport
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetL2TPTransport")))
  (define kSCValNetL2TPIPSecSharedSecretEncryptionKeychain
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetL2TPIPSecSharedSecretEncryptionKeychain")))
  (define kSCValNetL2TPTransportIP
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetL2TPTransportIP")))
  (define kSCValNetL2TPTransportIPSec
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetL2TPTransportIPSec")))
  (define kSCPropNetProxiesExceptionsList
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetProxiesExceptionsList")))
  (define kSCPropNetProxiesExcludeSimpleHostnames
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetProxiesExcludeSimpleHostnames")))
  (define kSCPropNetProxiesFTPEnable
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetProxiesFTPEnable")))
  (define kSCPropNetProxiesFTPPassive
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetProxiesFTPPassive")))
  (define kSCPropNetProxiesFTPPort
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetProxiesFTPPort")))
  (define kSCPropNetProxiesFTPProxy
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetProxiesFTPProxy")))
  (define kSCPropNetProxiesGopherEnable
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetProxiesGopherEnable")))
  (define kSCPropNetProxiesGopherPort
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetProxiesGopherPort")))
  (define kSCPropNetProxiesGopherProxy
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetProxiesGopherProxy")))
  (define kSCPropNetProxiesHTTPEnable
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetProxiesHTTPEnable")))
  (define kSCPropNetProxiesHTTPPort
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetProxiesHTTPPort")))
  (define kSCPropNetProxiesHTTPProxy
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetProxiesHTTPProxy")))
  (define kSCPropNetProxiesHTTPSEnable
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetProxiesHTTPSEnable")))
  (define kSCPropNetProxiesHTTPSPort
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetProxiesHTTPSPort")))
  (define kSCPropNetProxiesHTTPSProxy
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetProxiesHTTPSProxy")))
  (define kSCPropNetProxiesRTSPEnable
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetProxiesRTSPEnable")))
  (define kSCPropNetProxiesRTSPPort
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetProxiesRTSPPort")))
  (define kSCPropNetProxiesRTSPProxy
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetProxiesRTSPProxy")))
  (define kSCPropNetProxiesSOCKSEnable
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetProxiesSOCKSEnable")))
  (define kSCPropNetProxiesSOCKSPort
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetProxiesSOCKSPort")))
  (define kSCPropNetProxiesSOCKSProxy
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetProxiesSOCKSProxy")))
  (define kSCPropNetProxiesProxyAutoConfigEnable
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetProxiesProxyAutoConfigEnable")))
  (define kSCPropNetProxiesProxyAutoConfigJavaScript
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetProxiesProxyAutoConfigJavaScript")))
  (define kSCPropNetProxiesProxyAutoConfigURLString
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetProxiesProxyAutoConfigURLString")))
  (define kSCPropNetProxiesProxyAutoDiscoveryEnable
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetProxiesProxyAutoDiscoveryEnable")))
  (define kSCPropNetSMBNetBIOSName
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetSMBNetBIOSName")))
  (define kSCPropNetSMBNetBIOSNodeType
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetSMBNetBIOSNodeType")))
  (define kSCPropNetSMBNetBIOSScope
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetSMBNetBIOSScope")))
  (define kSCPropNetSMBWINSAddresses
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetSMBWINSAddresses")))
  (define kSCPropNetSMBWorkgroup
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropNetSMBWorkgroup")))
  (define kSCValNetSMBNetBIOSNodeTypeBroadcast
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetSMBNetBIOSNodeTypeBroadcast")))
  (define kSCValNetSMBNetBIOSNodeTypePeer
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetSMBNetBIOSNodeTypePeer")))
  (define kSCValNetSMBNetBIOSNodeTypeMixed
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetSMBNetBIOSNodeTypeMixed")))
  (define kSCValNetSMBNetBIOSNodeTypeHybrid
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCValNetSMBNetBIOSNodeTypeHybrid")))
  (define kSCEntUsersConsoleUser
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCEntUsersConsoleUser")))
  (define kSCPropSystemComputerName
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropSystemComputerName")))
  (define kSCPropSystemComputerNameEncoding
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropSystemComputerNameEncoding")))
  (define kSCDynamicStoreDomainFile
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCDynamicStoreDomainFile")))
  (define kSCDynamicStoreDomainPlugin
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCDynamicStoreDomainPlugin")))
  (define kSCDynamicStoreDomainSetup
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCDynamicStoreDomainSetup")))
  (define kSCDynamicStoreDomainState
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCDynamicStoreDomainState")))
  (define kSCDynamicStoreDomainPrefs
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCDynamicStoreDomainPrefs")))
  (define kSCDynamicStorePropSetupCurrentSet
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCDynamicStorePropSetupCurrentSet")))
  (define kSCDynamicStorePropSetupLastUpdated
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCDynamicStorePropSetupLastUpdated")))
  (define kSCDynamicStorePropNetInterfaces
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCDynamicStorePropNetInterfaces")))
  (define kSCDynamicStorePropNetPrimaryInterface
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCDynamicStorePropNetPrimaryInterface")))
  (define kSCDynamicStorePropNetPrimaryService
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCDynamicStorePropNetPrimaryService")))
  (define kSCDynamicStorePropNetServiceIDs
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCDynamicStorePropNetServiceIDs")))
  (define kSCPropUsersConsoleUserName
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropUsersConsoleUserName")))
  (define kSCPropUsersConsoleUserUID
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropUsersConsoleUserUID")))
  (define kSCPropUsersConsoleUserGID
    (make-ftype-pointer CFStringRef
			(foreign-entry "kSCPropUsersConsoleUserGID")))
  
  ;;
  ;; Functions
  ;;

  ;; (none defined)
  )
