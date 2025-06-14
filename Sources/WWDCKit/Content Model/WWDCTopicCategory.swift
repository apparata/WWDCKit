import Foundation

/// Represents a category that groups related WWDC topics together.
public struct WWDCTopicCategory: Codable, Sendable, Identifiable {

    /// The unique identifier for the topic category.
    public let id: Int

    /// The title of the topic category.
    public let title: String

    /// The display order of the topic category.
    public let ordinal: Int

    /// The IDs of the topics included in this category.
    public let topicIDs: [Int]

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case ordinal
        case topicIDs = "topicIds"
    }
}
