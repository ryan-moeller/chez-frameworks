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
;; Based on Apple's CoreFoundation/CFURL.h
(library
  (CoreFoundation CFURL)
  (export
    CFURLPathStyle
    CFURLRef
    CFURLComponentType
    CFURLBookmarkCreationOptions
    CFURLBookmarkResolutionOptions
    CFURLBookmarkFileCreationOptions
    kCFURLPOSIXPathStyle
    kCFURLHFSPathStyle
    kCFURLWindowsPathStyle
    kCFURLComponentScheme
    kCFURLComponentNetLocation
    kCFURLComponentPath
    kCFURLComponentResourceSpecifier
    kCFURLComponentUser
    kCFURLComponentPassword
    kCFURLComponentUserInfo
    kCFURLComponentHost
    kCFURLComponentPort
    kCFURLComponentParameterString
    kCFURLComponentQuery
    kCFURLComponentFragment
    kCFURLKeysOfUnsetValuesKey
    kCFURLNameKey
    kCFURLLocalizedNameKey
    kCFURLIsRegularFileKey
    kCFURLIsDirectoryKey
    kCFURLIsSymbolicLinkKey
    kCFURLIsVolumeKey
    kCFURLIsPackageKey
    kCFURLIsApplicationKey
    kCFURLApplicationIsScriptableKey
    kCFURLIsSystemImmutableKey
    kCFURLIsUserImmutableKey
    kCFURLIsHiddenKey
    kCFURLHasHiddenExtensionKey
    kCFURLCreationDateKey
    kCFURLContentAccessDateKey
    kCFURLContentModificationDateKey
    kCFURLAttributeModificationDateKey
    kCFURLFileContentIdentifierKey
    kCFURLMayShareFileContentKey
    kCFURLMayHaveExtendedAttributesKey
    kCFURLIsPurgeableKey
    kCFURLIsSparseKey
    kCFURLLinkCountKey
    kCFURLParentDirectoryURLKey
    kCFURLVolumeURLKey
    kCFURLTypeIdentifierKey
    kCFURLLocalizedTypeDescriptionKey
    kCFURLLabelNumberKey
    kCFURLLabelColorKey
    kCFURLLocalizedLabelKey
    kCFURLEffectiveIconKey
    kCFURLCustomIconKey
    kCFURLFileResourceIdentifierKey
    kCFURLVolumeIdentifierKey
    kCFURLPreferredIOBlockSizeKey
    kCFURLIsReadableKey
    kCFURLIsWritableKey
    kCFURLIsExecutableKey
    kCFURLFileSecurityKey
    kCFURLIsExcludedFromBackupKey
    kCFURLTagNamesKey
    kCFURLPathKey
    kCFURLCanonicalPathKey
    kCFURLIsMountTriggerKey
    kCFURLGenerationIdentifierKey
    kCFURLDocumentIdentifierKey
    kCFURLAddedToDirectoryDateKey
    kCFURLQuarantinePropertiesKey
    kCFURLFileResourceTypeKey
    kCFURLFileResourceTypeNamedPipe
    kCFURLFileResourceTypeCharacterSpecial
    kCFURLFileResourceTypeDirectory
    kCFURLFileResourceTypeBlockSpecial
    kCFURLFileResourceTypeRegular
    kCFURLFileResourceTypeSymbolicLink
    kCFURLFileResourceTypeSocket
    kCFURLFileResourceTypeUnknown
    kCFURLFileSizeKey
    kCFURLFileAllocatedSizeKey
    kCFURLTotalFileSizeKey
    kCFURLTotalFileAllocatedSizeKey
    kCFURLIsAliasFileKey
    kCFURLFileProtectionKey
    kCFURLFileProtectionNone
    kCFURLFileProtectionComplete
    kCFURLFileProtectionCompleteUnlessOpen
    kCFURLFileProtectionCompleteUntilFirstUserAuthentication
    kCFURLVolumeLocalizedFormatDescriptionKey
    kCFURLVolumeTotalCapacityKey
    kCFURLVolumeAvailableCapacityKey
    kCFURLVolumeAvailableCapacityForImportantUsageKey
    kCFURLVolumeAvailableCapacityForOpportunisticUsageKey
    kCFURLVolumeResourceCountKey
    kCFURLVolumeSupportsPersistentIDsKey
    kCFURLVolumeSupportsSymbolicLinksKey
    kCFURLVolumeSupportsHardLinksKey
    kCFURLVolumeSupportsJournalingKey
    kCFURLVolumeIsJournalingKey
    kCFURLVolumeSupportsSparseFilesKey
    kCFURLVolumeSupportsZeroRunsKey
    kCFURLVolumeSupportsCaseSensitiveNamesKey
    kCFURLVolumeSupportsCasePreservedNamesKey
    kCFURLVolumeSupportsRootDirectoryDatesKey
    kCFURLVolumeSupportsVolumeSizesKey
    kCFURLVolumeSupportsRenamingKey
    kCFURLVolumeSupportsAdvisoryFileLockingKey
    kCFURLVolumeSupportsExtendedSecurityKey
    kCFURLVolumeIsBrowsableKey
    kCFURLVolumeMaximumFileSizeKey
    kCFURLVolumeIsEjectableKey
    kCFURLVolumeIsRemovableKey
    kCFURLVolumeIsInternalKey
    kCFURLVolumeIsAutomountedKey
    kCFURLVolumeIsLocalKey
    kCFURLVolumeIsReadOnlyKey
    kCFURLVolumeCreationDateKey
    kCFURLVolumeURLForRemountingKey
    kCFURLVolumeUUIDStringKey
    kCFURLVolumeNameKey
    kCFURLVolumeLocalizedNameKey
    kCFURLVolumeIsEncryptedKey
    kCFURLVolumeIsRootFileSystemKey
    kCFURLVolumeSupportsCompressionKey
    kCFURLVolumeSupportsFileCloningKey
    kCFURLVolumeSupportsSwapRenamingKey
    kCFURLVolumeSupportsExclusiveRenamingKey
    kCFURLVolumeSupportsImmutableFilesKey
    kCFURLVolumeSupportsAccessPermissionsKey
    kCFURLVolumeSupportsFileProtectionKey
    kCFURLIsUbiquitousItemKey
    kCFURLUbiquitousItemHasUnresolvedConflictsKey
    kCFURLUbiquitousItemIsDownloadingKey
    kCFURLUbiquitousItemIsUploadedKey
    kCFURLUbiquitousItemIsUploadingKey
    kCFURLUbiquitousItemDownloadingStatusKey
    kCFURLUbiquitousItemDownloadingStatusNotDownloaded
    kCFURLUbiquitousItemDownloadingStatusDownloaded
    kCFURLUbiquitousItemDownloadingStatusCurrent
    kCFURLUbiquitousItemDownloadingErrorKey
    kCFURLUbiquitousItemUploadingErrorKey
    kCFURLUbiquitousItemIsExcludedFromSyncKey
    kCFURLBookmarkCreationMinimalBookmarkMask
    kCFURLBookmarkCreationSuitableForBookmarkFile
    kCFURLBookmarkCreationWithSecurityScope
    kCFURLBookmarkCreationSecurityScopeAllowOnlyReadAccess
    kCFURLBookmarkCreationWithoutImplicitSecurityScope
    kCFURLBookmarkResolutionWithoutUIMask
    kCFURLBookmarkResolutionWithoutMountingMask
    kCFURLBookmarkResolutionWithSecurityScope
    kCFURLBookmarkResolutionWithoutImplicitStartAccessing
    kCFBookmarkResolutionWithoutUIMask
    kCFBookmarkResolutionWithoutMountingMask
    CFURLGetTypeID
    CFURLCreateWithBytes
    CFURLCreateData
    CFURLCreateWithString
    CFURLCreateAbsoluteURLWithBytes
    CFURLCreateWithFileSystemPath
    CFURLCreateFromFileSystemRepresentation
    CFURLCreateWithFileSystemPathRelativeToBase
    CFURLGetFileSystemRepresentation
    CFURLCopyAbsoluteURL
    CFURLGetString
    CFURLGetBaseURL
    CFURLCanBeDecomposed
    CFURLCopyScheme
    CFURLCopyNetLocation
    CFURLCopyPath
    CFURLCopyStrictPath
    CFURLCopyFileSystemPath
    CFURLHasDirectoryPath
    CFURLCopyResourceSpecifier
    CFURLCopyHostName
    CFURLGetPortNumber
    CFURLCopyUserName
    CFURLCopyPassword
    CFURLCopyQueryString
    CFURLCopyFragment
    CFURLCopyLastPathComponent
    CFURLCopyPathExtension
    CFURLCreateCopyAppendingPathComponent
    CFURLCreateCopyDeletingLastPathComponent
    CFURLCreateCopyAppendingPathExtension
    CFURLCreateCopyDeletingPathExtension
    CFURLGetBytes
    CFURLGetByteRangeForComponent
    CFURLCreateStringByReplacingPercentEscapes
    CFURLIsFileReferenceURL
    CFURLCreateFileReferenceURL
    CFURLCreateFilePathURL
    CFURLCopyResourcePropertyForKey
    CFURLCopyResourcePropertiesForKeys
    CFURLSetResourcePropertyValueForKey
    CFURLSetResourcePropertiesForKeys
    CFURLClearResourcePropertyCacheForKey
    CFURLClearResourcePropertyCache
    CFURLSetTemporaryResourcePropertyForKey
    CFURLResourceIsReachable
    CFURLCreateBookmarkData
    CFURLCreateByResolvingBookmarkData
    CFURLCreateResourcePropertiesForKeysFromBookmarkData
    CFURLCreateResourcePropertyForKeyFromBookmarkData
    CFURLCreateBookmarkDataFromFile
    CFURLWriteBookmarkDataToFile
    CFURLStartAccessingSecurityScopedResource
    CFURLStopAccessingSecurityScopedResource)
  (import
    (chezscheme)
    (CoreFoundation CFBase)
    (CoreFoundation CFArray)
    (CoreFoundation CFData)
    (CoreFoundation CFDictionary)
    (CoreFoundation CFError)
    (CoreFoundation CFString))

  ;;-------;;
  ;; CFURL ;;
  ;;=======;;

  (define init
    (load-shared-object "CoreFoundation.framework/CoreFoundation"))

  ;; XXX: Deprecated APIs not exposed.

  ;;
  ;; Types
  ;;

  (define-ftype
    [CFURLPathStyle CFIndex]
    [CFURLRef void*]
    [CFURLComponentType CFIndex]
    [CFURLBookmarkCreationOptions CFOptionFlags]
    [CFURLBookmarkResolutionOptions CFOptionFlags]
    [CFURLBookmarkFileCreationOptions CFOptionFlags])

  ;;
  ;; Constants
  ;;

  (define kCFURLPOSIXPathStyle   0)
  (define kCFURLHFSPathStyle     1)
  (define kCFURLWindowsPathStyle 2)

  (define kCFURLComponentScheme            1)
  (define kCFURLComponentNetLocation       2)
  (define kCFURLComponentPath              3)
  (define kCFURLComponentResourceSpecifier 4)
  (define kCFURLComponentUser              5)
  (define kCFURLComponentPassword          6)
  (define kCFURLComponentUserInfo          7)
  (define kCFURLComponentHost              8)
  (define kCFURLComponentPort              9)
  (define kCFURLComponentParameterString  10)
  (define kCFURLComponentQuery            11)
  (define kCFURLComponentFragment         12)

  (define kCFURLKeysOfUnsetValuesKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLKeysOfUnsetValuesKey")))
  (define kCFURLNameKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLNameKey")))
  (define kCFURLLocalizedNameKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLLocalizedNameKey")))
  (define kCFURLIsRegularFileKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLIsRegularFileKey")))
  (define kCFURLIsDirectoryKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLIsDirectoryKey")))
  (define kCFURLIsSymbolicLinkKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLIsSymbolicLinkKey")))
  (define kCFURLIsVolumeKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLIsVolumeKey")))
  (define kCFURLIsPackageKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLIsPackageKey")))
  (define kCFURLIsApplicationKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLIsApplicationKey")))
  (define kCFURLApplicationIsScriptableKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLApplicationIsScriptableKey")))
  (define kCFURLIsSystemImmutableKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLIsSystemImmutableKey")))
  (define kCFURLIsUserImmutableKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLIsUserImmutableKey")))
  (define kCFURLIsHiddenKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLIsHiddenKey")))
  (define kCFURLHasHiddenExtensionKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLHasHiddenExtensionKey")))
  (define kCFURLCreationDateKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLCreationDateKey")))
  (define kCFURLContentAccessDateKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLContentAccessDateKey")))
  (define kCFURLContentModificationDateKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLContentModificationDateKey")))
  (define kCFURLAttributeModificationDateKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLAttributeModificationDateKey")))
  (define kCFURLFileContentIdentifierKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLFileContentIdentifierKey")))
  (define kCFURLMayShareFileContentKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLMayShareFileContentKey")))
  (define kCFURLMayHaveExtendedAttributesKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLMayHaveExtendedAttributesKey")))
  (define kCFURLIsPurgeableKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLIsPurgeableKey")))
  (define kCFURLIsSparseKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLIsSparseKey")))
  (define kCFURLLinkCountKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLLinkCountKey")))
  (define kCFURLParentDirectoryURLKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLParentDirectoryURLKey")))
  (define kCFURLVolumeURLKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeURLKey")))
  (define kCFURLTypeIdentifierKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLTypeIdentifierKey")))
  (define kCFURLLocalizedTypeDescriptionKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLLocalizedTypeDescriptionKey")))
  (define kCFURLLabelNumberKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLLabelNumberKey")))
  (define kCFURLLabelColorKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLLabelColorKey")))
  (define kCFURLLocalizedLabelKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLLocalizedLabelKey")))
  (define kCFURLEffectiveIconKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLEffectiveIconKey")))
  (define kCFURLCustomIconKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLCustomIconKey")))
  (define kCFURLFileResourceIdentifierKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLFileResourceIdentifierKey")))
  (define kCFURLVolumeIdentifierKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeIdentifierKey")))
  (define kCFURLPreferredIOBlockSizeKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLPreferredIOBlockSizeKey")))
  (define kCFURLIsReadableKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLIsReadableKey")))
  (define kCFURLIsWritableKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLIsWritableKey")))
  (define kCFURLIsExecutableKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLIsExecutableKey")))
  (define kCFURLFileSecurityKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLFileSecurityKey")))
  (define kCFURLIsExcludedFromBackupKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLIsExcludedFromBackupKey")))
  (define kCFURLTagNamesKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLTagNamesKey")))
  (define kCFURLPathKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLPathKey")))
  (define kCFURLCanonicalPathKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLCanonicalPathKey")))
  (define kCFURLIsMountTriggerKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLIsMountTriggerKey")))
  (define kCFURLGenerationIdentifierKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLGenerationIdentifierKey")))
  (define kCFURLDocumentIdentifierKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLDocumentIdentifierKey")))
  (define kCFURLAddedToDirectoryDateKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLAddedToDirectoryDateKey")))
  (define kCFURLQuarantinePropertiesKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLQuarantinePropertiesKey")))
  (define kCFURLFileResourceTypeKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLFileResourceTypeKey")))
  (define kCFURLFileResourceTypeNamedPipe
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLFileResourceTypeNamedPipe")))
  (define kCFURLFileResourceTypeCharacterSpecial
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLFileResourceTypeCharacterSpecial")))
  (define kCFURLFileResourceTypeDirectory
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLFileResourceTypeDirectory")))
  (define kCFURLFileResourceTypeBlockSpecial
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLFileResourceTypeBlockSpecial")))
  (define kCFURLFileResourceTypeRegular
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLFileResourceTypeRegular")))
  (define kCFURLFileResourceTypeSymbolicLink
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLFileResourceTypeSymbolicLink")))
  (define kCFURLFileResourceTypeSocket
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLFileResourceTypeSocket")))
  (define kCFURLFileResourceTypeUnknown
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLFileResourceTypeUnknown")))
  (define kCFURLFileSizeKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLFileSizeKey")))
  (define kCFURLFileAllocatedSizeKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLFileAllocatedSizeKey")))
  (define kCFURLTotalFileSizeKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLTotalFileSizeKey")))
  (define kCFURLTotalFileAllocatedSizeKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLTotalFileAllocatedSizeKey")))
  (define kCFURLIsAliasFileKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLIsAliasFileKey")))
  (define kCFURLFileProtectionKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLFileProtectionKey")))
  (define kCFURLFileProtectionNone
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLFileProtectionNone")))
  (define kCFURLFileProtectionComplete
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLFileProtectionComplete")))
  (define kCFURLFileProtectionCompleteUnlessOpen
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLFileProtectionCompleteUnlessOpen")))
  (define kCFURLFileProtectionCompleteUntilFirstUserAuthentication
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLFileProtectionCompleteUntilFirstUserAuthentication")))
  (define kCFURLVolumeLocalizedFormatDescriptionKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeLocalizedFormatDescriptionKey")))
  (define kCFURLVolumeTotalCapacityKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeTotalCapacityKey")))
  (define kCFURLVolumeAvailableCapacityKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeAvailableCapacityKey")))
  (define kCFURLVolumeAvailableCapacityForImportantUsageKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeAvailableCapacityForImportantUsageKey")))
  (define kCFURLVolumeAvailableCapacityForOpportunisticUsageKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeAvailableCapacityForOpportunisticUsageKey")))
  (define kCFURLVolumeResourceCountKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeResourceCountKey")))
  (define kCFURLVolumeSupportsPersistentIDsKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeSupportsPersistentIDsKey")))
  (define kCFURLVolumeSupportsSymbolicLinksKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeSupportsSymbolicLinksKey")))
  (define kCFURLVolumeSupportsHardLinksKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeSupportsHardLinksKey")))
  (define kCFURLVolumeSupportsJournalingKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeSupportsJournalingKey")))
  (define kCFURLVolumeIsJournalingKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeIsJournalingKey")))
  (define kCFURLVolumeSupportsSparseFilesKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeSupportsSparseFilesKey")))
  (define kCFURLVolumeSupportsZeroRunsKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeSupportsZeroRunsKey")))
  (define kCFURLVolumeSupportsCaseSensitiveNamesKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeSupportsCaseSensitiveNamesKey")))
  (define kCFURLVolumeSupportsCasePreservedNamesKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeSupportsCasePreservedNamesKey")))
  (define kCFURLVolumeSupportsRootDirectoryDatesKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeSupportsRootDirectoryDatesKey")))
  (define kCFURLVolumeSupportsVolumeSizesKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeSupportsVolumeSizesKey")))
  (define kCFURLVolumeSupportsRenamingKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeSupportsRenamingKey")))
  (define kCFURLVolumeSupportsAdvisoryFileLockingKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeSupportsAdvisoryFileLockingKey")))
  (define kCFURLVolumeSupportsExtendedSecurityKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeSupportsExtendedSecurityKey")))
  (define kCFURLVolumeIsBrowsableKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeIsBrowsableKey")))
  (define kCFURLVolumeMaximumFileSizeKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeMaximumFileSizeKey")))
  (define kCFURLVolumeIsEjectableKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeIsEjectableKey")))
  (define kCFURLVolumeIsRemovableKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeIsRemovableKey")))
  (define kCFURLVolumeIsInternalKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeIsInternalKey")))
  (define kCFURLVolumeIsAutomountedKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeIsAutomountedKey")))
  (define kCFURLVolumeIsLocalKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeIsLocalKey")))
  (define kCFURLVolumeIsReadOnlyKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeIsReadOnlyKey")))
  (define kCFURLVolumeCreationDateKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeCreationDateKey")))
  (define kCFURLVolumeURLForRemountingKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeURLForRemountingKey")))
  (define kCFURLVolumeUUIDStringKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeUUIDStringKey")))
  (define kCFURLVolumeNameKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeNameKey")))
  (define kCFURLVolumeLocalizedNameKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeLocalizedNameKey")))
  (define kCFURLVolumeIsEncryptedKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeIsEncryptedKey")))
  (define kCFURLVolumeIsRootFileSystemKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeIsRootFileSystemKey")))
  (define kCFURLVolumeSupportsCompressionKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeSupportsCompressionKey")))
  (define kCFURLVolumeSupportsFileCloningKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeSupportsFileCloningKey")))
  (define kCFURLVolumeSupportsSwapRenamingKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeSupportsSwapRenamingKey")))
  (define kCFURLVolumeSupportsExclusiveRenamingKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeSupportsExclusiveRenamingKey")))
  (define kCFURLVolumeSupportsImmutableFilesKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeSupportsImmutableFilesKey")))
  (define kCFURLVolumeSupportsAccessPermissionsKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeSupportsAccessPermissionsKey")))
  (define kCFURLVolumeSupportsFileProtectionKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLVolumeSupportsFileProtectionKey")))
  (define kCFURLIsUbiquitousItemKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLIsUbiquitousItemKey")))
  (define kCFURLUbiquitousItemHasUnresolvedConflictsKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLUbiquitousItemHasUnresolvedConflictsKey")))
  (define kCFURLUbiquitousItemIsDownloadingKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLUbiquitousItemIsDownloadingKey")))
  (define kCFURLUbiquitousItemIsUploadedKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLUbiquitousItemIsUploadedKey")))
  (define kCFURLUbiquitousItemIsUploadingKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLUbiquitousItemIsUploadingKey")))
  (define kCFURLUbiquitousItemDownloadingStatusKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLUbiquitousItemDownloadingStatusKey")))
  (define kCFURLUbiquitousItemDownloadingStatusNotDownloaded
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLUbiquitousItemDownloadingStatusNotDownloaded")))
  (define kCFURLUbiquitousItemDownloadingStatusDownloaded
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLUbiquitousItemDownloadingStatusDownloaded")))
  (define kCFURLUbiquitousItemDownloadingStatusCurrent
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLUbiquitousItemDownloadingStatusCurrent")))
  (define kCFURLUbiquitousItemDownloadingErrorKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLUbiquitousItemDownloadingErrorKey")))
  (define kCFURLUbiquitousItemUploadingErrorKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLUbiquitousItemUploadingErrorKey")))
  (define kCFURLUbiquitousItemIsExcludedFromSyncKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFURLUbiquitousItemIsExcludedFromSyncKey")))

  (define kCFURLBookmarkCreationMinimalBookmarkMask              #x00000200)
  (define kCFURLBookmarkCreationSuitableForBookmarkFile          #x00000400)
  (define kCFURLBookmarkCreationWithSecurityScope                #x00000800)
  (define kCFURLBookmarkCreationSecurityScopeAllowOnlyReadAccess #x00001000)
  (define kCFURLBookmarkCreationWithoutImplicitSecurityScope     #x20000000)

  (define kCFURLBookmarkResolutionWithoutUIMask                 #x00000100)
  (define kCFURLBookmarkResolutionWithoutMountingMask           #x00000200)
  (define kCFURLBookmarkResolutionWithSecurityScope             #x00000400)
  (define kCFURLBookmarkResolutionWithoutImplicitStartAccessing #x00008000)
  (define kCFBookmarkResolutionWithoutUIMask kCFURLBookmarkResolutionWithoutUIMask)
  (define kCFBookmarkResolutionWithoutMountingMask kCFURLBookmarkResolutionWithoutMountingMask)

  ;;
  ;; Functions
  ;;

  (define CFURLGetTypeID
    (foreign-procedure "CFURLGetTypeID"
		       () CFTypeID))
  (define CFURLCreateWithBytes
    (foreign-procedure "CFURLCreateWithBytes"
		       (CFAllocatorRef u8* CFIndex CFStringEncoding CFURLRef) CFURLRef))
  (define CFURLCreateData
    (foreign-procedure "CFURLCreateData"
		       (CFAllocatorRef CFURLRef CFStringEncoding Boolean) CFDataRef))
  (define CFURLCreateWithString
    (foreign-procedure "CFURLCreateWithString"
		       (CFAllocatorRef CFStringRef CFURLRef) CFURLRef))
  (define CFURLCreateAbsoluteURLWithBytes
    (foreign-procedure "CFURLCreateAbsoluteURLWithBytes"
		       (CFAllocatorRef u8* CFIndex CFStringEncoding CFURLRef Boolean) CFURLRef))
  (define CFURLCreateWithFileSystemPath
    (foreign-procedure "CFURLCreateWithFileSystemPath"
		       (CFAllocatorRef CFStringRef CFURLPathStyle Boolean) CFURLRef))
  (define CFURLCreateFromFileSystemRepresentation
    (foreign-procedure "CFURLCreateFromFileSystemRepresentation"
		       (CFAllocatorRef u8* CFIndex Boolean) CFURLRef))
  (define CFURLCreateWithFileSystemPathRelativeToBase
    (foreign-procedure "CFURLCreateWithFileSystemPathRelativeToBase"
		       (CFAllocatorRef CFStringRef CFURLPathStyle Boolean CFURLRef) CFURLRef))
  (define CFURLGetFileSystemRepresentation
    (foreign-procedure "CFURLGetFileSystemRepresentation"
		       (CFURLRef Boolean u8* CFIndex) Boolean))
  (define CFURLCopyAbsoluteURL
    (foreign-procedure "CFURLCopyAbsoluteURL"
		       (CFURLRef) CFURLRef))
  (define CFURLGetString
    (foreign-procedure "CFURLGetString"
		       (CFURLRef) CFStringRef))
  (define CFURLGetBaseURL
    (foreign-procedure "CFURLGetBaseURL"
		       (CFURLRef) CFURLRef))
  (define CFURLCanBeDecomposed
    (foreign-procedure "CFURLCanBeDecomposed"
		       (CFURLRef) Boolean))
  (define CFURLCopyScheme
    (foreign-procedure "CFURLCopyScheme"
		       (CFURLRef) CFStringRef))
  (define CFURLCopyNetLocation
    (foreign-procedure "CFURLCopyNetLocation"
		       (CFURLRef) CFStringRef))
  (define CFURLCopyPath
    (foreign-procedure "CFURLCopyPath"
		       (CFURLRef) CFStringRef))
  (define CFURLCopyStrictPath
    (foreign-procedure "CFURLCopyStrictPath"
		       (CFURLRef) CFStringRef))
  (define CFURLCopyFileSystemPath
    (foreign-procedure "CFURLCopyFileSystemPath"
		       (CFURLRef CFURLPathStyle) CFStringRef))
  (define CFURLHasDirectoryPath
    (foreign-procedure "CFURLHasDirectoryPath"
		       (CFURLRef) Boolean))
  (define CFURLCopyResourceSpecifier
    (foreign-procedure "CFURLCopyResourceSpecifier"
		       (CFURLRef) CFStringRef))
  (define CFURLCopyHostName
    (foreign-procedure "CFURLCopyHostName"
		       (CFURLRef) CFStringRef))
  (define CFURLGetPortNumber
    (foreign-procedure "CFURLGetPortNumber"
		       (CFURLRef) integer-32))
  (define CFURLCopyUserName
    (foreign-procedure "CFURLCopyUserName"
		       (CFURLRef) CFStringRef))
  (define CFURLCopyPassword
    (foreign-procedure "CFURLCopyPassword"
		       (CFURLRef) CFStringRef))
  (define CFURLCopyQueryString
    (foreign-procedure "CFURLCopyQueryString"
		       (CFURLRef) CFStringRef))
  (define CFURLCopyFragment
    (foreign-procedure "CFURLCopyFragment"
		       (CFURLRef) CFStringRef))
  (define CFURLCopyLastPathComponent
    (foreign-procedure "CFURLCopyLastPathComponent"
		       (CFURLRef) CFStringRef))
  (define CFURLCopyPathExtension
    (foreign-procedure "CFURLCopyPathExtension"
		       (CFURLRef) CFStringRef))
  (define CFURLCreateCopyAppendingPathComponent
    (foreign-procedure "CFURLCreateCopyAppendingPathComponent"
		       (CFAllocatorRef CFURLRef CFStringRef Boolean) CFURLRef))
  (define CFURLCreateCopyDeletingLastPathComponent
    (foreign-procedure "CFURLCreateCopyDeletingLastPathComponent"
		       (CFAllocatorRef CFURLRef) CFURLRef))
  (define CFURLCreateCopyAppendingPathExtension
    (foreign-procedure "CFURLCreateCopyAppendingPathExtension"
		       (CFAllocatorRef CFURLRef CFStringRef) CFURLRef))
  (define CFURLCreateCopyDeletingPathExtension
    (foreign-procedure "CFURLCreateCopyDeletingPathExtension"
		       (CFAllocatorRef CFURLRef) CFURLRef))
  (define CFURLGetBytes
    (foreign-procedure "CFURLGetBytes"
		       (CFURLRef u8* CFIndex) CFIndex))
  (define CFURLGetByteRangeForComponent
    (foreign-procedure "CFURLGetByteRangeForComponent"
		       (CFURLRef CFURLComponentType (* CFRange)) (& CFRange)))
  (define CFURLCreateStringByReplacingPercentEscapes
    (foreign-procedure "CFURLCreateStringByReplacingPercentEscapes"
		       (CFAllocatorRef CFStringRef CFStringRef) CFStringRef))
  (define CFURLIsFileReferenceURL
    (foreign-procedure "CFURLIsFileReferenceURL"
		       (CFURLRef) Boolean))
  (define CFURLCreateFileReferenceURL
    (foreign-procedure "CFURLCreateFileReferenceURL"
		       (CFAllocatorRef CFURLRef (* CFErrorRef)) CFURLRef))
  (define CFURLCreateFilePathURL
    (foreign-procedure "CFURLCreateFilePathURL"
		       (CFAllocatorRef CFURLRef (* CFErrorRef)) CFURLRef))
  (define CFURLCopyResourcePropertyForKey
    (foreign-procedure "CFURLCopyResourcePropertyForKey"
		       (CFURLRef CFStringRef void* (* CFErrorRef)) Boolean))
  (define CFURLCopyResourcePropertiesForKeys
    (foreign-procedure "CFURLCopyResourcePropertiesForKeys"
		       (CFURLRef CFArrayRef (* CFErrorRef)) CFDictionaryRef))
  (define CFURLSetResourcePropertyValueForKey
    (foreign-procedure "CFURLSetResourcePropertyValueForKey"
		       (CFURLRef CFStringRef CFTypeRef (* CFErrorRef)) Boolean))
  (define CFURLSetResourcePropertiesForKeys
    (foreign-procedure "CFURLSetResourcePropertiesForKeys"
		       (CFURLRef CFDictionaryRef (* CFErrorRef)) Boolean))
  (define CFURLClearResourcePropertyCacheForKey
    (foreign-procedure "CFURLClearResourcePropertyCacheForKey"
		       (CFURLRef CFStringRef) void))
  (define CFURLClearResourcePropertyCache
    (foreign-procedure "CFURLClearResourcePropertyCache"
		       (CFURLRef) void))
  (define CFURLSetTemporaryResourcePropertyForKey
    (foreign-procedure "CFURLSetTemporaryResourcePropertyForKey"
		       (CFURLRef CFStringRef CFTypeRef) void))
  (define CFURLResourceIsReachable
    (foreign-procedure "CFURLResourceIsReachable"
		       (CFURLRef (* CFErrorRef)) Boolean))
  (define CFURLCreateBookmarkData
    (foreign-procedure "CFURLCreateBookmarkData"
		       (CFAllocatorRef CFURLRef CFURLBookmarkCreationOptions CFArrayRef CFURLRef (* CFErrorRef)) CFDataRef))
  (define CFURLCreateByResolvingBookmarkData
    (foreign-procedure "CFURLCreateByResolvingBookmarkData"
		       (CFAllocatorRef CFDataRef CFURLBookmarkResolutionOptions CFURLRef CFArrayRef (* Boolean) (* CFErrorRef)) CFURLRef))
  (define CFURLCreateResourcePropertiesForKeysFromBookmarkData
    (foreign-procedure "CFURLCreateResourcePropertiesForKeysFromBookmarkData"
		       (CFAllocatorRef CFArrayRef CFDataRef) CFDictionaryRef))
  (define CFURLCreateResourcePropertyForKeyFromBookmarkData
    (foreign-procedure "CFURLCreateResourcePropertyForKeyFromBookmarkData"
		       (CFAllocatorRef CFStringRef CFDataRef) CFTypeRef))
  (define CFURLCreateBookmarkDataFromFile
    (foreign-procedure "CFURLCreateBookmarkDataFromFile"
		       (CFAllocatorRef CFURLRef (* CFErrorRef)) CFDataRef))
  (define CFURLWriteBookmarkDataToFile
    (foreign-procedure "CFURLWriteBookmarkDataToFile"
		       (CFDataRef CFURLRef CFURLBookmarkFileCreationOptions (* CFErrorRef)) Boolean))
  (define CFURLStartAccessingSecurityScopedResource
    (foreign-procedure "CFURLStartAccessingSecurityScopedResource"
		       (CFURLRef) Boolean))
  (define CFURLStopAccessingSecurityScopedResource
    (foreign-procedure "CFURLStopAccessingSecurityScopedResource"
		       (CFURLRef) void))
  )
