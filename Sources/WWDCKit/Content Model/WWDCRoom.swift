import Foundation

/// Represents a room at WWDC where sessions or events may take place.
public struct WWDCRoom: Codable, Sendable, Identifiable, Hashable {

    /// The unique identifier for the room.
    public let id: Int

    /// The name of the room.
    public let name: String

    /// The display order for the room.
    public let ordinal: Int

    /// The identifier for the region this room belongs to.
    public let regionID: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case ordinal
        case regionID = "regionId"
    }
}
