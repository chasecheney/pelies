import SwiftUI

#if os(macOS)
import AppKit
#else
import UIKit
#endif

/// Cross-platform semantic colors. macOS keeps the dynamic AppKit system
/// colors; the TV build commits to a fixed dark palette (TV apps are
/// dark-first, and most dynamic UIKit system colors don't exist there).
enum Palette {
    static var separator: Color {
        #if os(macOS)
        Color(nsColor: .separatorColor)
        #else
        Color.white.opacity(0.18)
        #endif
    }

    static var windowBackground: Color {
        #if os(macOS)
        Color(nsColor: .windowBackgroundColor)
        #else
        Color(red: 0.07, green: 0.07, blue: 0.08)
        #endif
    }

    static var tertiaryLabel: Color {
        #if os(macOS)
        Color(nsColor: .tertiaryLabelColor)
        #else
        Color.white.opacity(0.4)
        #endif
    }

    static var selectedControl: Color {
        #if os(macOS)
        Color(nsColor: .selectedControlColor)
        #else
        Color.accentColor.opacity(0.22)
        #endif
    }
}

/// Opens a URL in the default browser on macOS. The TV has no browser; the
/// sign-in flow shows the plex.tv/link code to enter on another device.
enum SystemBrowser {
    static func open(_ url: URL) {
        #if os(macOS)
        NSWorkspace.shared.open(url)
        #endif
    }
}

extension View {
    /// Toolbar-style backdrop: the bar material on macOS, a solid dark tone
    /// on tvOS (materials are unavailable there).
    func barBackground() -> some View {
        #if os(macOS)
        return background(.bar)
        #else
        return background(Color(red: 0.11, green: 0.11, blue: 0.12))
        #endif
    }
}
