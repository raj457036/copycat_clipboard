// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';

final _user32 = DynamicLibrary.open('user32.dll');

typedef KeybdEventNative = IntPtr Function(Int32, Int32, Uint32, IntPtr);
typedef KeybdEventDart = int Function(int, int, int, int);
final _keybd_event =
    _user32.lookupFunction<KeybdEventNative, KeybdEventDart>('keybd_event');

void simulateWindowsPasteShortcut() {
  const vkControl = 0x11;
  const vkV = 0x56;
  const keyeventfKeyup = 0x0002;

  void pressKey(int vk) => _keybd_event(vk, 0, 0, 0);
  void releaseKey(int vk) => _keybd_event(vk, 0, keyeventfKeyup, 0);

  pressKey(vkControl);
  pressKey(vkV);
  releaseKey(vkV);
  releaseKey(vkControl);
}
