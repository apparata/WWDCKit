import Foundation

/// A content item representing a session, lab, article, or other WWDC resource.
public struct WWDCContentItem: Codable, Sendable, Identifiable {
    /// The unique identifier for the content item.
    public let id: String
    /// The ID linking to the static content.
    public let staticContentID: Int
    /// The ID for the event-specific version of the content.
    public let eventContentID: Int
    /// The identifier for the event this content belongs to.
    public let eventID: String
    /// The timestamp indicating when this content was last updated.
    public let contentUpdatedAt: Date
    /// The permalink for viewing the content on the web.
    public let webPermalink: URL
    /// The language code of the content (e.g., "en").
    public let languageCode: String
    /// A description of the content.
    public let description: String
    /// The title of the content.
    public let title: String
    /// The IDs of the topics associated with this content.
    public let topicIDs: [Int]
    /// The content type (e.g., "session", "article").
    public let type: String
    /// The language in which the content is delivered.
    public let deliveryLanguage: String
    /// A UUID used to fetch associated images.
    public let imagesUUID: String
    /// The platforms this content is relevant to (e.g., iOS, macOS).
    public let platforms: [String]?
    /// Image resource identifiers associated with the content.
    public let images: [String]?
    /// Path extensions available for this content (e.g., "pdf", "usdz").
    public let availablePathExtensions: [String]?
    /// The start time for scheduled content like labs or events.
    public let startTime: Date?
    /// The end time for scheduled content like labs or events.
    public let endTime: Date?
    /// Optional signup information for labs or events.
    public let signupInformation: SignupInformation?
    /// The expiry date for when the content will no longer be published.
    public let publishingExpiryDate: Date?
    /// The ID of the room where the session or event occurs.
    public let roomID: Int?
    /// Identifier for an associated article, if applicable.
    public let articleID: String?
    /// Identifier for an associated page, if applicable.
    public let pageID: String?
    /// The permalink key for the article.
    public let articlePermalinkKey: String?
    /// The permalink key for the page.
    public let pagePermalinkKey: String?
    /// A list of keywords relevant to the content.
    public let keywords: [String]?
    /// Code snippets referenced in the content.
    public let codeSnippets: [CodeSnippet]?
    /// Media resources such as video or slides.
    public let media: Media?
    /// Related resources or activities.
    public let related: Related?
    /// The ID of the primary topic.
    public let primaryTopicID: Int?
    /// Whether the content has a live stream component.
    public let hasLiveStream: Bool?
    /// The original date the content was published.
    public let originalPublishingDate: Date?
    
    enum CodingKeys: String, CodingKey {
        case id
        case staticContentID = "staticContentId"
        case eventContentID = "eventContentId"
        case eventID = "eventId"
        case contentUpdatedAt
        case webPermalink
        case languageCode
        case description
        case title
        case topicIDs = "topicIds"
        case type
        case deliveryLanguage
        case imagesUUID
        case platforms
        case images
        case availablePathExtensions
        case startTime
        case endTime
        case signupInformation
        case publishingExpiryDate
        case roomID = "roomId"
        case articleID
        case pageID
        case articlePermalinkKey
        case pagePermalinkKey
        case keywords
        case codeSnippets
        case media
        case related
        case primaryTopicID
        case hasLiveStream
        case originalPublishingDate
    }
    
    /// Signup information for labs or events.
    public struct SignupInformation: Codable, Sendable {
        /// The start date of the signup period.
        public let startDate: Date
        /// The end date of the signup period.
        public let endDate: Date
        /// The end date for screening signups.
        public let screeningEndDate: Date
        /// The URL for signup.
        public let url: URL
        /// Text describing the signup.
        public let text: String
        /// Lab topics associated with the signup.
        public let labTopics: [String]
        /// The registration service identifier.
        public let registrationServiceID: String
        /// The rule set governing the signup.
        public let ruleSet: RuleSet
        /// Duration of appointments in minutes.
        public let appointmentDurationMinutes: Int?
        /// Question IDs used by the registration service.
        public let registrationServiceQuestionIDs: RegistrationServiceQuestionIDs?
        
        /// A rule set used in signup.
        public struct RuleSet: Codable, Sendable {
            /// The identifier of the rule set.
            public let id: String
        }
        
        /// Question IDs for the registration service.
        public struct RegistrationServiceQuestionIDs: Codable, Sendable {
            /// URL for app-related questions.
            public let appURL: String
            /// URL for design-related questions.
            public let designURL: String
            /// Details about the questions.
            public let questionDetails: String
            /// Feedback Assistant identifier.
            public let feedbackAssistantID: String
            /// Instructions for accessing the design URL.
            public let designURLAccessInstructions: String
            /// Optional topic related to the questions.
            public let topic: String?
        }
    }
    
    /// A code snippet referenced in the content.
    public struct CodeSnippet: Codable, Sendable {
        /// The title of the code snippet.
        public let title: String
        /// The start time of the snippet in seconds.
        public let startTimeSeconds: Int
        /// The end time of the snippet in seconds.
        public let endTimeSeconds: Int
        /// The programming language of the snippet.
        public let language: String
        /// The code as a string.
        public let code: String
        /// The unstyled code as a string.
        public let unstyledCode: String
    }
    
    /// Media resources such as video or slides.
    public struct Media: Codable, Sendable {
        /// The URL to the HLS stream.
        public let hls: URL
        /// Duration of the media in seconds.
        public let duration: Int
        /// URL to download the HLS stream.
        public let downloadHLS: URL?
        /// The URL to the TV OS HLS stream.
        public let tvOShls: URL?
        /// URL to download HD quality video.
        public let downloadHD: URL?
        /// URL to download SD quality video.
        public let downloadSD: URL?
        /// Chapters in the media.
        public let chapters: [Chapter]?
        /// Available subtitle language codes.
        public let availableSubtitleLanguageCodes: [String]?
        /// Available audio language codes.
        public let availableAudioLanguageCodes: [String]?
        /// URL to the slides.
        public let slides: URL?
        
        /// A chapter within the media.
        public struct Chapter: Codable, Sendable {
            /// The start time of the chapter in seconds.
            public let start: Int
            /// The title of the chapter.
            public let title: String
            /// The end time of the chapter in seconds.
            public let end: Int
            /// Optional summary of the chapter.
            public let summary: String?
        }
    }
    
    /// Related resources or activities.
    public struct Related: Codable, Sendable {
        /// Related resource IDs.
        public let resources: [Int]?
        /// Related activity identifiers.
        public let activities: [String]?
    }
}
