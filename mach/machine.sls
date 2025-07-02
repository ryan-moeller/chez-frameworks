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
;; Based on Apple's mach/machine.h
(library
  (mach machine)
  (export
    cpu_type_t
    CPU_ARCH_MASK
    CPU_ARCH_ABI64
    CPU_ARCH_ABI64_32
    CPU_TYPE_ANY
    CPU_TYPE_VAX
    CPU_TYPE_MC680x0
    CPU_TYPE_X86
    CPU_TYPE_I386
    CPU_TYPE_X86_64
    CPU_TYPE_MC98000
    CPU_TYPE_HPPA
    CPU_TYPE_ARM
    CPU_TYPE_ARM64
    CPU_TYPE_ARM64_32
    CPU_TYPE_MC88000
    CPU_TYPE_SPARC
    CPU_TYPE_I860
    CPU_TYPE_POWERPC
    CPU_TYPE_POWERPC64)
  (import (chezscheme))

  (define-ftype cpu_type_t int)
  (define CPU_ARCH_MASK     #xff000000)
  (define CPU_ARCH_ABI64    #x01000000)
  (define CPU_ARCH_ABI64_32 #x02000000)
  ;; XXX: Most of these are just for the nostalgia.
  (define CPU_TYPE_ANY     -1)
  (define CPU_TYPE_VAX      1)
  (define CPU_TYPE_MC680x0  6)
  (define CPU_TYPE_X86      7)
  (define CPU_TYPE_I386 CPU_TYPE_X86)
  (define CPU_TYPE_X86_64 (bitwise-ior CPU_TYPE_X86 CPU_ARCH_ABI64))
  (define CPU_TYPE_MC98000 10)
  (define CPU_TYPE_HPPA    11)
  (define CPU_TYPE_ARM     12)
  (define CPU_TYPE_ARM64 (bitwise-ior CPU_TYPE_ARM CPU_ARCH_ABI64))
  (define CPU_TYPE_ARM64_32 (bitwise-ior CPU_TYPE_ARM CPU_ARCH_ABI64_32))
  (define CPU_TYPE_MC88000 13)
  (define CPU_TYPE_SPARC   14)
  (define CPU_TYPE_I860    15)
  (define CPU_TYPE_POWERPC 18)
  (define CPU_TYPE_POWERPC64 (bitwise-ior CPU_TYPE_POWERPC CPU_ARCH_ABI64))
  )
