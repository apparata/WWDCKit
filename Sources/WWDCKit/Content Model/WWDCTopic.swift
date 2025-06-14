import Foundation

/// Represents a topic associated with WWDC content, such as a subject or technology focus.
public struct WWDCTopic: Codable, Sendable, Identifiable, Hashable {

    /// The unique identifier for the topic.
    public let id: Int

    /// The title of the topic.
    public let title: String

    /// The display order of the topic.
    public let ordinal: Int

    /// The permalink URL for the topic on the web.
    public let webPermalink: URL

    /// The primary image URL representing the topic.
    public let imageURL: URL

    /// An alternate image URL for the topic.
    public let alternateImageURL: URL

    /// The primary SVG URL for the topic.
    public let svgURL: URL

    /// An alternate SVG URL for the topic.
    public let alternateSVGURL: URL

    /// The name of the SF Symbol representing the topic.
    public let sfSymbolName: String

    /// The alternate SF Symbol name for the topic.
    public let alternateSFSymbolName: String
}
