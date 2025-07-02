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
;; Based on Apple's CoreFoundation/CFStringEncodingExt.h
(library
  (CoreFoundation CFStringEncodingExt)
  (export
    CFStringEncodings
    kCFStringEncodingMacJapanese
    kCFStringEncodingMacChineseTrad
    kCFStringEncodingMacKorean
    kCFStringEncodingMacArabic
    kCFStringEncodingMacHebrew
    kCFStringEncodingMacGreek
    kCFStringEncodingMacCyrillic
    kCFStringEncodingMacDevanagari
    kCFStringEncodingMacGurmukhi
    kCFStringEncodingMacGujarati
    kCFStringEncodingMacOriya
    kCFStringEncodingMacBengali
    kCFStringEncodingMacTamil
    kCFStringEncodingMacTelugu
    kCFStringEncodingMacKannada
    kCFStringEncodingMacMalayalam
    kCFStringEncodingMacSinhalese
    kCFStringEncodingMacBurmese
    kCFStringEncodingMacKhmer
    kCFStringEncodingMacThai
    kCFStringEncodingMacLaotian
    kCFStringEncodingMacGeorgian
    kCFStringEncodingMacArmenian
    kCFStringEncodingMacChineseSimp
    kCFStringEncodingMacTibetian
    kCFStringEncodingMacMongolian
    kCFStringEncodingMacEthiopic
    kCFStringEncodingMacCentralEurRoman
    kCFStringEncodingMacVietnamese
    kCFStringEncodingMacExtArabic
    kCFStringEncodingMacSymbol
    kCFStringEncodingMacDingbats
    kCFStringEncodingMacTurkish
    kCFStringEncodingMacCroatian
    kCFStringEncodingMacIcelandic
    kCFStringEncodingMacRomanian
    kCFStringEncodingMacCeltic
    kCFStringEncodingMacGaelic
    kCFStringEncodingMacFarsi
    kCFStringEncodingMacUkranian
    kCFStringEncodingMacInuit
    kCFStringEncodingMacVT100
    kCFStringEncodingMacHFS
    kCFStringEncodingISOLatin2
    kCFStringEncodingISOLatin3
    kCFStringEncodingISOLatin4
    kCFStringEncodingISOLatinCyrillic
    kCFStringEncodingISOLatinArabic
    kCFStringEncodingISOLatinGreek
    kCFStringEncodingISOLatinHebrew
    kCFStringEncodingISOLatin5
    kCFStringEncodingISOLatin6
    kCFStringEncodingISOLatinThai
    kCFStringEncodingISOLatin7
    kCFStringEncodingISOLatin8
    kCFStringEncodingISOLatin9
    kCFStringEncodingISOLatin10
    kCFStringEncodingDOSLatinUS
    kCFStringEncodingDOSGreek
    kCFStringEncodingDOSBalticRim
    kCFStringEncodingDOSLatin1
    kCFStringEncodingDOSGreek1
    kCFStringEncodingDOSLatin2
    kCFStringEncodingDOSCyrillic
    kCFStringEncodingDOSTurkish
    kCFStringEncodingDOSPortuguese
    kCFStringEncodingDOSIcelandic
    kCFStringEncodingDOSHebrew
    kCFStringEncodingDOSCanadianFrench
    kCFStringEncodingDOSArabic
    kCFStringEncodingDOSNordic
    kCFStringEncodingDOSRussian
    kCFStringEncodingDOSGreek2
    kCFStringEncodingDOSThai
    kCFStringEncodingDOSJapanese
    kCFStringEncodingDOSChineseSimplif
    kCFStringEncodingDOSKorean
    kCFStringEncodingDOSChineseTrad
    kCFStringEncodingWindowsLatin2
    kCFStringEncodingWindowsCyrillic
    kCFStringEncodingWindowsGreek
    kCFStringEncodingWindowsLatin5
    kCFStringEncodingWindowsHebrew
    kCFStringEncodingWindowsArabic
    kCFStringEncodingWindowsBalticRim
    kCFStringEncodingWindowsVietnamese
    kCFStringEncodingWindowsKoreanJohab
    kCFStringEncodingANSEL
    kCFStringEncodingJIS_X0201_76
    kCFStringEncodingJIS_X0208_83
    kCFStringEncodingJIS_X0208_90
    kCFStringEncodingJIS_X0212_90
    kCFStringEncodingJIS_C6226_78
    kCFStringEncodingShiftJIS_X0213
    kCFStringEncodingShiftJIS_X0213_00
    kCFStringEncodingGB_2312_80
    kCFStringEncodingGBK_95
    kCFStringEncodingGB_18030_2000
    kCFStringEncodingKSC_5601_87
    kCFStringEncodingKSC_5601_92_Johab
    kCFStringEncodingCNS_11643_92_P1
    kCFStringEncodingCNS_11643_92_P2
    kCFStringEncodingCNS_11643_92_P3
    kCFStringEncodingISO_2022_JP
    kCFStringEncodingISO_2022_JP_2
    kCFStringEncodingISO_2022_JP_1
    kCFStringEncodingISO_2022_JP_3
    kCFStringEncodingISO_2022_CN
    kCFStringEncodingISO_2022_CN_EXT
    kCFStringEncodingISO_2022_KR
    kCFStringEncodingEUC_JP
    kCFStringEncodingEUC_CN
    kCFStringEncodingEUC_TW
    kCFStringEncodingEUC_KR
    kCFStringEncodingShiftJIS
    kCFStringEncodingKOI8_R
    kCFStringEncodingBig5
    kCFStringEncodingMacRomanLatin1
    kCFStringEncodingHZ_GB_2312
    kCFStringEncodingBig5_HKSCS_1999
    kCFStringEncodingVISCII
    kCFStringEncodingKOI8_U
    kCFStringEncodingBig5_E
    kCFStringEncodingUTF7_IMAP
    kCFStringEncodingNextStepJapanese
    kCFStringEncodingEBCDIC_US
    kCFStringEncodingEBCDIC_CP037
    kCFStringEncodingUTF7)
  (import
    (chezscheme)
    (CoreFoundation CFBase))

  ;;---------------------;;
  ;; CFStringEncodingExt ;;
  ;;=====================;;

  (define init
    (load-shared-object "CoreFoundation.framework/CoreFoundation"))

  ;;
  ;; Types
  ;;

  (define-ftype
    [CFStringEncodings CFIndex])

  ;;
  ;; Constants
  ;;

  (define kCFStringEncodingMacJapanese             #x00000001)
  (define kCFStringEncodingMacChineseTrad          #x00000002)
  (define kCFStringEncodingMacKorean               #x00000003)
  (define kCFStringEncodingMacArabic               #x00000004)
  (define kCFStringEncodingMacHebrew               #x00000005)
  (define kCFStringEncodingMacGreek                #x00000006)
  (define kCFStringEncodingMacCyrillic             #x00000007)
  (define kCFStringEncodingMacDevanagari           #x00000009)
  (define kCFStringEncodingMacGurmukhi             #x0000000a)
  (define kCFStringEncodingMacGujarati             #x0000000b)
  (define kCFStringEncodingMacOriya                #x0000000c)
  (define kCFStringEncodingMacBengali              #x0000000d)
  (define kCFStringEncodingMacTamil                #x0000000e)
  (define kCFStringEncodingMacTelugu               #x0000000f)
  (define kCFStringEncodingMacKannada              #x00000010)
  (define kCFStringEncodingMacMalayalam            #x00000011)
  (define kCFStringEncodingMacSinhalese            #x00000012)
  (define kCFStringEncodingMacBurmese              #x00000013)
  (define kCFStringEncodingMacKhmer                #x00000014)
  (define kCFStringEncodingMacThai                 #x00000015)
  (define kCFStringEncodingMacLaotian              #x00000016)
  (define kCFStringEncodingMacGeorgian             #x00000017)
  (define kCFStringEncodingMacArmenian             #x00000018)
  (define kCFStringEncodingMacChineseSimp          #x00000019)
  (define kCFStringEncodingMacTibetian             #x0000001a)
  (define kCFStringEncodingMacMongolian            #x0000001b)
  (define kCFStringEncodingMacEthiopic             #x0000001c)
  (define kCFStringEncodingMacCentralEurRoman      #x0000001d)
  (define kCFStringEncodingMacVietnamese           #x0000001e)
  (define kCFStringEncodingMacExtArabic            #x0000001f)
  (define kCFStringEncodingMacSymbol               #x00000021)
  (define kCFStringEncodingMacDingbats             #x00000022)
  (define kCFStringEncodingMacTurkish              #x00000023)
  (define kCFStringEncodingMacCroatian             #x00000024)
  (define kCFStringEncodingMacIcelandic            #x00000025)
  (define kCFStringEncodingMacRomanian             #x00000026)
  (define kCFStringEncodingMacCeltic               #x00000027)
  (define kCFStringEncodingMacGaelic               #x00000028)
  (define kCFStringEncodingMacFarsi                #x0000008c)
  (define kCFStringEncodingMacUkranian             #x00000098)
  (define kCFStringEncodingMacInuit                #x000000ec)
  (define kCFStringEncodingMacVT100                #x000000fc)
  (define kCFStringEncodingMacHFS                  #x000000ff)
  (define kCFStringEncodingISOLatin2               #x00000202)
  (define kCFStringEncodingISOLatin3               #x00000203)
  (define kCFStringEncodingISOLatin4               #x00000204)
  (define kCFStringEncodingISOLatinCyrillic        #x00000205)
  (define kCFStringEncodingISOLatinArabic          #x00000206)
  (define kCFStringEncodingISOLatinGreek           #x00000207)
  (define kCFStringEncodingISOLatinHebrew          #x00000208)
  (define kCFStringEncodingISOLatin5               #x00000209)
  (define kCFStringEncodingISOLatin6               #x0000020a)
  (define kCFStringEncodingISOLatinThai            #x0000020b)
  (define kCFStringEncodingISOLatin7               #x0000020d)
  (define kCFStringEncodingISOLatin8               #x0000020e)
  (define kCFStringEncodingISOLatin9               #x0000020f)
  (define kCFStringEncodingISOLatin10              #x00000210)
  (define kCFStringEncodingDOSLatinUS              #x00000400)
  (define kCFStringEncodingDOSGreek                #x00000405)
  (define kCFStringEncodingDOSBalticRim            #x00000406)
  (define kCFStringEncodingDOSLatin1               #x00000410)
  (define kCFStringEncodingDOSGreek1               #x00000411)
  (define kCFStringEncodingDOSLatin2               #x00000412)
  (define kCFStringEncodingDOSCyrillic             #x00000413)
  (define kCFStringEncodingDOSTurkish              #x00000414)
  (define kCFStringEncodingDOSPortuguese           #x00000415)
  (define kCFStringEncodingDOSIcelandic            #x00000416)
  (define kCFStringEncodingDOSHebrew               #x00000417)
  (define kCFStringEncodingDOSCanadianFrench       #x00000418)
  (define kCFStringEncodingDOSArabic               #x00000419)
  (define kCFStringEncodingDOSNordic               #x0000041a)
  (define kCFStringEncodingDOSRussian              #x0000041b)
  (define kCFStringEncodingDOSGreek2               #x0000041c)
  (define kCFStringEncodingDOSThai                 #x0000041d)
  (define kCFStringEncodingDOSJapanese             #x00000420)
  (define kCFStringEncodingDOSChineseSimplif       #x00000421)
  (define kCFStringEncodingDOSKorean               #x00000422)
  (define kCFStringEncodingDOSChineseTrad          #x00000423)
  (define kCFStringEncodingWindowsLatin2           #x00000501)
  (define kCFStringEncodingWindowsCyrillic         #x00000502)
  (define kCFStringEncodingWindowsGreek            #x00000503)
  (define kCFStringEncodingWindowsLatin5           #x00000504)
  (define kCFStringEncodingWindowsHebrew           #x00000505)
  (define kCFStringEncodingWindowsArabic           #x00000506)
  (define kCFStringEncodingWindowsBalticRim        #x00000507)
  (define kCFStringEncodingWindowsVietnamese       #x00000508)
  (define kCFStringEncodingWindowsKoreanJohab      #x00000510)
  (define kCFStringEncodingANSEL                   #x00000601)
  (define kCFStringEncodingJIS_X0201_76            #x00000620)
  (define kCFStringEncodingJIS_X0208_83            #x00000621)
  (define kCFStringEncodingJIS_X0208_90            #x00000622)
  (define kCFStringEncodingJIS_X0212_90            #x00000623)
  (define kCFStringEncodingJIS_C6226_78            #x00000624)
  (define kCFStringEncodingShiftJIS_X0213          #x00000628)
  (define kCFStringEncodingShiftJIS_X0213_00 kCFStringEncodingShiftJIS_X0213)
  (define kCFStringEncodingShiftJIS_X0213_MenKuTen #x00000629)
  (define kCFStringEncodingGB_2312_80              #x00000630)
  (define kCFStringEncodingGBK_95                  #x00000631)
  (define kCFStringEncodingGB_18030_2000           #x00000632)
  (define kCFStringEncodingKSC_5601_87             #x00000640)
  (define kCFStringEncodingKSC_5601_92_Johab       #x00000641)
  (define kCFStringEncodingCNS_11643_92_P1         #x00000651)
  (define kCFStringEncodingCNS_11643_92_P2         #x00000652)
  (define kCFStringEncodingCNS_11643_92_P3         #x00000653)
  (define kCFStringEncodingISO_2022_JP             #x00000820)
  (define kCFStringEncodingISO_2022_JP_2           #x00000821)
  (define kCFStringEncodingISO_2022_JP_1           #x00000822)
  (define kCFStringEncodingISO_2022_JP_3           #x00000823)
  (define kCFStringEncodingISO_2022_CN             #x00000830)
  (define kCFStringEncodingISO_2022_CN_EXT         #x00000831)
  (define kCFStringEncodingISO_2022_KR             #x00000840)
  (define kCFStringEncodingEUC_JP                  #x00000920)
  (define kCFStringEncodingEUC_CN                  #x00000930)
  (define kCFStringEncodingEUC_TW                  #x00000931)
  (define kCFStringEncodingEUC_KR                  #x00000940)
  (define kCFStringEncodingShiftJIS                #x00000a01)
  (define kCFStringEncodingKOI8_R                  #x00000a02)
  (define kCFStringEncodingBig5                    #x00000a03)
  (define kCFStringEncodingMacRomanLatin1          #x00000a04)
  (define kCFStringEncodingHZ_GB_2312              #x00000a05)
  (define kCFStringEncodingBig5_HKSCS_1999         #x00000a06)
  (define kCFStringEncodingVISCII                  #x00000a07)
  (define kCFStringEncodingKOI8_U                  #x00000a08)
  (define kCFStringEncodingBig5_E                  #x00000a09)
  (define kCFStringEncodingUTF7_IMAP               #x00000a10)
  (define kCFStringEncodingNextStepJapanese        #x00000b02)
  (define kCFStringEncodingEBCDIC_US               #x00000c01)
  (define kCFStringEncodingEBCDIC_CP037            #x00000c02)
  (define kCFStringEncodingUTF7                    #x04000100)

  ;;
  ;; Functions
  ;;

  ;; (none defined)
  )
