import Foundation

/// A catalog representing WWDC content including events, sessions, resources, and metadata.
public struct WWDCCatalog: Codable, Sendable, Hashable {

    /// A list of WWDC events.
    public let events: [WWDCEvent]

    /// A list of content items related to the events.
    public let contents: [WWDCContentItem]

    /// A list of rooms where events or sessions take place.
    public let rooms: [WWDCRoom]

    /// A list of topic categories grouping related topics.
    public let topicCategories: [WWDCTopicCategory]

    /// A list of topics covered in WWDC content.
    public let topics: [WWDCTopic]

    /// A list of resources linked to the WWDC content.
    public let resources: [WWDCResource]

    /// A list of image types used in the catalog.
    public let imageTypes: [WWDCImageType]

    /// The last updated date of the catalog.
    public let updated: Date

    /// A unique identifier representing the catalog snapshot.
    public let snapshotID: Int

    enum CodingKeys: String, CodingKey {
        case events
        case contents
        case rooms
        case topicCategories
        case topics
        case resources
        case imageTypes
        case updated
        case snapshotID = "snapshotId"
    }
}

extension WWDCCatalog {

    /// Saves the catalog to the specified URL using JSON encoding.
    ///
    /// - Parameter url: The file URL to save the encoded catalog.
    /// - Throws: An error if encoding or writing fails.
    ///
    public func save(to url: URL) throws {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        let data = try encoder.encode(self)
        try data.write(to: url, options: .atomic)
    }

    /// Loads a catalog from a file at the specified URL using JSON decoding.
    ///
    /// - Parameter url: The file URL to read from.
    /// - Returns: A decoded instance of `WWDCCatalog`.
    /// - Throws: An error if reading or decoding fails.
    /// 
    public static func load(from url: URL) throws -> WWDCCatalog {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let catalog = try decoder.decode(WWDCCatalog.self, from: data)
        return catalog
    }
}
