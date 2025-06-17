
import {
    installWhisperCpp,
} from "@remotion/install-whisper-cpp";
import {
    WHISPER_PATH,
    WHISPER_VERSION,
  } from "./whisper-config.mjs";
  
await installWhisperCpp({ to: WHISPER_PATH, version: WHISPER_VERSION });