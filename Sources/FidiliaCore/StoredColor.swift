import Foundation

/// Platform-independent RGB color storage for Fidilia preferences/exportable settings logic.
/// The app UI may bridge this value to SwiftUI Color.
public struct StoredColor: Codable, Hashable, Sendable {
    public let red: Double
    public let green: Double
    public let blue: Double

    public init?(red: Double, green: Double, blue: Double) {
        guard (0...1).contains(red),
              (0...1).contains(green),
              (0...1).contains(blue) else {
            return nil
        }

        self.red = red
        self.green = green
        self.blue = blue
    }

    public static func random(using generator: inout some RandomNumberGenerator) -> StoredColor {
        // Deliberately unrestricted. Do not add hue/saturation/brightness or
        // similarity filtering: repeated and visually awkward colors are valid.
        StoredColor(
            red: Double.random(in: 0...1, using: &generator),
            green: Double.random(in: 0...1, using: &generator),
            blue: Double.random(in: 0...1, using: &generator)
        )!
    }

    /// WCAG-style relative luminance, used only to choose readable foregrounds.
    /// It never changes the user's selected background color.
    public var relativeLuminance: Double {
        func linearize(_ component: Double) -> Double {
            component <= 0.04045
                ? component / 12.92
                : pow((component + 0.055) / 1.055, 2.4)
        }

        return (0.2126 * linearize(red))
            + (0.7152 * linearize(green))
            + (0.0722 * linearize(blue))
    }

    public var prefersLightForeground: Bool {
        relativeLuminance < 0.179
    }
}
