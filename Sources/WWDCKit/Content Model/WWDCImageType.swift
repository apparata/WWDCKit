import Foundation

/// Represents a type of image used in WWDC content, with different size variants.
public struct WWDCImageType: Codable, Sendable {
    /// The name of the image type (e.g., "thumbnail", "banner").
    public let name: String
    /// A list of size variants for this image type.
    public let variants: [Variant]
    
    /// A size variant of the image type.
    public struct Variant: Codable, Sendable {
        /// The width of the image variant in pixels.
        public let width: Int
        /// The height of the image variant in pixels.
        public let height: Int
    }
}
