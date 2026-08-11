#!/usr/bin/env bash
set -eo pipefail
git clone --branch 7.0.12 --depth 1 https://github.com/juce-framework/JUCE.git
# Patch: Clang 20+ rejects the const short[N][2] -> initializer_list<const short[2]> conversion
# used in a delegating ctor. Drop that ctor; it's unused by juicysfplugin.
sed -i '/template <size_t numLayouts>/{N;/AudioPluginInstance (const short channelLayoutList/d;}' \
  JUCE/modules/juce_audio_processors/processors/juce_AudioPluginInstance.h