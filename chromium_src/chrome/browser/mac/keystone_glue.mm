/* Copyright (c) 2019 The Brave Authors. All rights reserved.
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this file,
 * You can obtain one at https://mozilla.org/MPL/2.0/. */

#include "brave/browser/sparkle_buildflags.h"

#if BUILDFLAG(ENABLE_SPARKLE)
#include "brave/browser/mac/sparkle_glue.h"
#endif

#define KeystoneEnabled KeystoneEnabled_ChromiumImpl
#define CurrentlyInstalledVersion CurrentlyInstalledVersion_ChromiumImpl
#include "src/chrome/browser/mac/keystone_glue.mm"
#undef KeystoneEnabled
#undef CurrentlyInstalledVersion

namespace keystone_glue {

bool KeystoneEnabled() {
#if BUILDFLAG(ENABLE_SPARKLE)
  return sparkle_glue::SparkleEnabled();
#else
  return false;
#endif
}

std::u16string CurrentlyInstalledVersion() {
#if BUILDFLAG(ENABLE_SPARKLE)
  return sparkle_glue::CurrentlyInstalledVersion();
#else
  return std::u16string();
#endif
}

}  // namespace keystone_glue
