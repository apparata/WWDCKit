import Foundation

/// Represents a resource associated with WWDC content, such as PDFs, links, or other downloads.
public struct WWDCResource: Codable, Sendable, Identifiable, Hashable {

    /// A unique identifier for the resource.
    public let id: Int

    /// The title of the resource.
    public let title: String

    /// The URL where the resource can be accessed.
    public let url: URL
    
    /// The type of resource (e.g., "pdf", "link").
    public let resourceType: String
    
    /// An optional description of the resource.
    public let description: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case id
        case url
        case resourceType = "resource_type"
        case description
    }
}
