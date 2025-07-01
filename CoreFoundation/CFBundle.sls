(library
  (CoreFoundation CFBundle)
  (export
    CFBundleRef
    CFPlugInRef
    kCFBundleInfoDictionaryVersionKey
    kCFBundleExecutableKey
    kCFBundleIdentifierKey
    kCFBundleVersionKey
    kCFBundleDevelopmentRegionKey
    kCFBundleNameKey
    kCFBundleLocalizationsKey
    kCFBundleExecutableArchitectureI386
    kCFBundleExecutableArchitecturePPC
    kCFBundleExecutableArchitectureX86_64
    kCFBundleExecutableArchitecturePPC64
    kCFBundleExecutableArchitectureARM64
    CFBundleGetMainBundle
    CFBundleGetBundleWithIdentifier
    CFBundleGetAllBundles
    CFBundleGetTypeID
    CFBundleCreate
    CFBundleCreateBundlesFromDirectory
    CFBundleCopyBundleURL
    CFBundleGetValueForInfoDictionaryKey
    CFBundleGetInfoDictionary
    CFBundleGetLocalInfoDictionary
    CFBundleGetPackageInfo
    CFBundleGetIdentifier
    CFBundleGetVersionNumber
    CFBundleGetDevelopmentRegion
    CFBundleCopySupportFilesDirectoryURL
    CFBundleCopyResourcesDirectoryURL
    CFBundleCopyPrivateFrameworksURL
    CFBundleCopySharedFrameworksURL
    CFBundleCopyBuiltInPlugInsURL
    CFBundleCopyInfoDictionaryInDirectory
    CFBundleGetPakageInfoInDirectory
    CFBundleCopyResourceURL
    CFBundleCopyResourceURLsOfType
    CFBundleCopyLocalizedString
    CFCopyLocalizedString
    CFCopyLocalizedStringFromTable
    CFCopyLocalizedStringFromTableInBundle
    CFCopyLocalizedStringWithDefaultValue
    CFBundleCopyResourceURLInDirectory
    CFBundleCopyResourceURLsOfTypeInDirectory
    CFBundleCopyBundleLocalizations
    CFBundleCopyPreferredLocalizationsFromArray
    CFBundleCopyLocalizationsForPreferences
    CFBundleCopyResourceURLForLocalization
    CFBundleCopyResourceURLsOfTypeForLocalization
    CFBundleCopyInfoDictionaryForURL
    CFBundleCopyLocalizationsForURL
    CFBundleCopyExecutableArchitecturesForURL
    CFBundleCopyExecutableURL
    CFBundleCopyExecutableArchitectures
    CFBundlePreflightExecutable
    CFBundleLoadExecutableAndReturnError
    CFBundleLoadExecutable
    CFBundleIsExecutableLoaded
    CFBundleUnloadExecutable
    CFBundleGetFunctionPointerForName
    CFBundleGetFunctionPointersForNames
    CFBundleCopyAuxiliaryExecutableURL
    CFBundleIsExecutableLoadable
    CFBundleIsExecutableLoadableForURL
    CFBundleIsArchitectureLoadable
    CFBundleGetPlugIn)
  (import
    (chezscheme)
    (CoreFoundation CFBase)
    (CoreFoundation CFArray)
    (CoreFoundation CFDictionary)
    (CoreFoundation CFError)
    (CoreFoundation CFString)
    (CoreFoundation CFURL)
    (mach machine))

  ;;----------;;
  ;; CFBundle ;;
  ;;==========;;

  (define init
    (load-shared-object "CoreFoundation.framework/CoreFoundation"))

  ;; XXX: Deprecated APIs not exposed.

  ;;
  ;; Types
  ;;

  (define-ftype
    [CFBundleRef void*]
    [CFPlugInRef void*])

  ;;
  ;; Constants
  ;;

  (define kCFBundleInfoDictionaryVersionKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFBundleInfoDictionaryVersionKey")))
  (define kCFBundleExecutableKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFBundleExecutableKey")))
  (define kCFBundleIdentifierKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFBundleIdentifierKey")))
  (define kCFBundleVersionKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFBundleVersionKey")))
  (define kCFBundleDevelopmentRegionKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFBundleDevelopmentRegionKey")))
  (define kCFBundleNameKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFBundleNameKey")))
  (define kCFBundleLocalizationsKey
    (make-ftype-pointer CFStringRef
			(foreign-entry "kCFBundleLocalizationsKey")))

  (define kCFBundleExecutableArchitectureI386   #x00000007)
  (define kCFBundleExecutableArchitecturePPC    #x00000012)
  (define kCFBundleExecutableArchitectureX86_64 #x01000007)
  (define kCFBundleExecutableArchitecturePPC64  #x01000012)
  (define kCFBundleExecutableArchitectureARM64  #x0100000c)

  ;;
  ;; Functions
  ;;

  (define CFBundleGetMainBundle
    (foreign-procedure "CFBundleGetMainBundle"
		       () CFBundleRef))
  (define CFBundleGetBundleWithIdentifier
    (foreign-procedure "CFBundleGetBundleWithIdentifier"
		       (CFStringRef) CFBundleRef))
  (define CFBundleGetAllBundles
    (foreign-procedure "CFBundleGetAllBundles"
		       () CFArrayRef))
  (define CFBundleGetTypeID
    (foreign-procedure "CFBundleGetTypeID"
		       () CFTypeID))
  (define CFBundleCreate
    (foreign-procedure "CFBundleCreate"
		       (CFAllocatorRef CFURLRef) CFBundleRef))
  (define CFBundleCreateBundlesFromDirectory
    (foreign-procedure "CFBundleCreateBundlesFromDirectory"
		       (CFAllocatorRef CFURLRef CFStringRef) CFArrayRef))
  (define CFBundleCopyBundleURL
    (foreign-procedure "CFBundleCopyBundleURL"
		       (CFBundleRef) CFURLRef))
  (define CFBundleGetValueForInfoDictionaryKey
    (foreign-procedure "CFBundleGetValueForInfoDictionaryKey"
		       (CFBundleRef CFStringRef) CFTypeRef))
  (define CFBundleGetInfoDictionary
    (foreign-procedure "CFBundleGetInfoDictionary"
		       (CFBundleRef) CFDictionaryRef))
  (define CFBundleGetLocalInfoDictionary
    (foreign-procedure "CFBundleGetLocalInfoDictionary"
		       (CFBundleRef) CFDictionaryRef))
  (define CFBundleGetPackageInfo
    (foreign-procedure "CFBundleGetPackageInfo"
		       (CFBundleRef (* unsigned-32) (* unsigned-32)) void))
  (define CFBundleGetIdentifier
    (foreign-procedure "CFBundleGetIdentifier"
		       (CFBundleRef) CFStringRef))
  (define CFBundleGetVersionNumber
    (foreign-procedure "CFBundleGetVersionNumber"
		       (CFBundleRef) unsigned-32))
  (define CFBundleGetDevelopmentRegion
    (foreign-procedure "CFBundleGetDevelopmentRegion"
		       (CFBundleRef) CFStringRef))
  (define CFBundleCopySupportFilesDirectoryURL
    (foreign-procedure "CFBundleCopySupportFilesDirectoryURL"
		       (CFBundleRef) CFURLRef))
  (define CFBundleCopyResourcesDirectoryURL
    (foreign-procedure "CFBundleCopyResourcesDirectoryURL"
		       (CFBundleRef) CFURLRef))
  (define CFBundleCopyPrivateFrameworksURL
    (foreign-procedure "CFBundleCopyPrivateFrameworksURL"
		       (CFBundleRef) CFURLRef))
  (define CFBundleCopySharedFrameworksURL
    (foreign-procedure "CFBundleCopySharedFrameworksURL"
		       (CFBundleRef) CFURLRef))
  (define CFBundleCopySharedSupportURL
    (foreign-procedure "CFBundleCopySharedSupportURL"
		       (CFBundleRef) CFURLRef))
  (define CFBundleCopyBuiltInPlugInsURL
    (foreign-procedure "CFBundleCopyBuiltInPlugInsURL"
		       (CFBundleRef) CFURLRef))
  (define CFBundleCopyInfoDictionaryInDirectory
    (foreign-procedure "CFBundleCopyInfoDictionaryInDirectory"
		       (CFURLRef) CFDictionaryRef))
  (define CFBundleGetPakageInfoInDirectory
    (foreign-procedure "CFBundleGetPakageInfoInDirectory"
		       (CFURLRef (* unsigned-32) (* unsigned-32)) Boolean))
  (define CFBundleCopyResourceURL
    (foreign-procedure "CFBundleCopyResourceURL"
		       (CFBundleRef CFStringRef CFStringRef CFStringRef) CFURLRef))
  (define CFBundleCopyResourceURLsOfType
    (foreign-procedure "CFBundleCopyResourceURLsOfType"
		       (CFBundleRef CFStringRef CFStringRef) CFArrayRef))
  (define CFBundleCopyLocalizedString
    (foreign-procedure "CFBundleCopyLocalizedString"
		       (CFBundleRef CFStringRef CFStringRef CFStringRef) CFStringRef))
  (define CFCopyLocalizedString
    (lambda (key comment)
      (CFBundleCopyLocalizedString (CFBundleGetMainBundle) key key 0)))
  (define CFCopyLocalizedStringFromTable
    (lambda (key tbl comment)
      (CFBundleCopyLocalizedString (CFBundleGetMainBundle) key key tbl)))
  (define CFCopyLocalizedStringFromTableInBundle
    (lambda (key tbl bundle comment)
      (CFBundleCopyLocalizedString bundle key key tbl)))
  (define CFCopyLocalizedStringWithDefaultValue
    (lambda (key tbl bundle value comment)
      (CFBundleCopyLocalizedString bundle key value tbl)))
  (define CFBundleCopyResourceURLInDirectory
    (foreign-procedure "CFBundleCopyResourceURLInDirectory"
		       (CFURLRef CFStringRef CFStringRef CFStringRef) CFURLRef))
  (define CFBundleCopyResourceURLsOfTypeInDirectory
    (foreign-procedure "CFBundleCopyResourceURLsOfTypeInDirectory"
		       (CFURLRef CFStringRef CFStringRef) CFArrayRef))
  (define CFBundleCopyBundleLocalizations
    (foreign-procedure "CFBundleCopyBundleLocalizations"
		       (CFBundleRef) CFArrayRef))
  (define CFBundleCopyPreferredLocalizationsFromArray
    (foreign-procedure "CFBundleCopyPreferredLocalizationsFromArray"
		       (CFArrayRef) CFArrayRef))
  (define CFBundleCopyLocalizationsForPreferences
    (foreign-procedure "CFBundleCopyLocalizationsForPreferences"
		       (CFArrayRef CFArrayRef) CFArrayRef))
  (define CFBundleCopyResourceURLForLocalization
    (foreign-procedure "CFBundleCopyResourceURLForLocalization"
		       (CFBundleRef CFStringRef CFStringRef CFStringRef CFStringRef) CFURLRef))
  (define CFBundleCopyResourceURLsOfTypeForLocalization
    (foreign-procedure "CFBundleCopyResourceURLsOfTypeForLocalization"
		       (CFBundleRef CFStringRef CFStringRef CFStringRef) CFArrayRef))
  (define CFBundleCopyInfoDictionaryForURL
    (foreign-procedure "CFBundleCopyInfoDictionaryForURL"
		       (CFURLRef) CFDictionaryRef))
  (define CFBundleCopyLocalizationsForURL
    (foreign-procedure "CFBundleCopyLocalizationsForURL"
		       (CFURLRef) CFArrayRef))
  (define CFBundleCopyExecutableArchitecturesForURL
    (foreign-procedure "CFBundleCopyExecutableArchitecturesForURL"
		       (CFURLRef) CFArrayRef))
  (define CFBundleCopyExecutableURL
    (foreign-procedure "CFBundleCopyExecutableURL"
		       (CFBundleRef) CFURLRef))
  (define CFBundleCopyExecutableArchitectures
    (foreign-procedure "CFBundleCopyExecutableArchitectures"
		       (CFBundleRef) CFArrayRef))
  (define CFBundlePreflightExecutable
    (foreign-procedure "CFBundlePreflightExecutable"
		       (CFBundleRef (* CFErrorRef)) Boolean))
  (define CFBundleLoadExecutableAndReturnError
    (foreign-procedure "CFBundleLoadExecutableAndReturnError"
		       (CFBundleRef (* CFErrorRef)) Boolean))
  (define CFBundleLoadExecutable
    (foreign-procedure "CFBundleLoadExecutable"
		       (CFBundleRef) Boolean))
  (define CFBundleIsExecutableLoaded
    (foreign-procedure "CFBundleIsExecutableLoaded"
		       (CFBundleRef) Boolean))
  (define CFBundleUnloadExecutable
    (foreign-procedure "CFBundleUnloadExecutable"
		       (CFBundleRef) void))
  (define CFBundleGetFunctionPointerForName
    (foreign-procedure "CFBundleGetFunctionPointerForName"
		       (CFBundleRef CFStringRef) void*))
  (define CFBundleGetFunctionPointersForNames
    (foreign-procedure "CFBundleGetFunctionPointersForNames"
		       (CFBundleRef CFArrayRef (* void*)) void))
  (define CFBundleCopyAuxiliaryExecutableURL
    (foreign-procedure "CFBundleCopyAuxiliaryExecutableURL"
		       (CFBundleRef CFStringRef) CFURLRef))
  (define CFBundleIsExecutableLoadable
    (foreign-procedure "CFBundleIsExecutableLoadable"
		       (CFBundleRef) Boolean))
  (define CFBundleIsExecutableLoadableForURL
    (foreign-procedure "CFBundleIsExecutableLoadableForURL"
		       (CFURLRef) Boolean))
  (define CFBundleIsArchitectureLoadable
    (foreign-procedure "CFBundleIsArchitectureLoadable"
		       (cpu_type_t) Boolean))
  (define CFBundleGetPlugIn
    (foreign-procedure "CFBundleGetPlugIn"
		       (CFBundleRef) CFPlugInRef))
  )
