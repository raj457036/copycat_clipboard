//
//  EventCallback.swift
//  tracker_libs
//
//  Created by Raj Singh on 27/08/2024.
//

import Foundation

public class WindowChanged: NSObject {
    private var oldWindow: AXUIElement?

    @objc public func focusedWindowChanged(_ observer: AXObserver, window: AXUIElement) {
        if oldWindow != nil {
          AXObserverRemoveNotification(
            observer, oldWindow!, kAXFocusedWindowChangedNotification as CFString)
        }

        let selfPtr = UnsafeMutableRawPointer(Unmanaged.passUnretained(self).toOpaque())
        AXObserverAddNotification(observer, window, kAXTitleChangedNotification as CFString, selfPtr)
        
        let event: Dictionary<String, String> = [
            "type" : "WindowChanged"
        ]
        try? TrackerLibPlugin.eventChannel?.success(event: event)

        oldWindow = window
    }
}