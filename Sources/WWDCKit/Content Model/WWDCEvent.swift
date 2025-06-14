import Foundation

/// Represents a WWDC event including metadata, schedule, and registration information.
public struct WWDCEvent: Codable, Sendable, Identifiable {
    /// The name of the event.
    public let name: String
    
    /// The event's start time.
    public let startTime: Date
    
    /// The event's end time.
    public let endTime: Date
    
    /// The base path to the event's image assets.
    public let imagesPath: URL
    
    /// The official hashtag for the event.
    public let hashtag: String
    
    /// A URL pointing to a preview image for the event.
    public let imageURL: URL
    
    /// A string representing the sort order of the event.
    public let sortOrder: String
    
    /// Whether the event is searchable.
    public let isSearchable: Bool
    
    /// Whether the event is browsable.
    public let isBrowsable: Bool
    
    /// The URL permalink to the event’s web page.
    public let webPermalink: URL
    
    /// A unique identifier for the event.
    public let id: String
    
    /// A key used for identifying the event in web URLs.
    public let webUrlKey: String
    
    /// Indicates if the event is featured.
    public let isFeatured: Bool?
    
    /// Optional URL to an SVG glyph representing the event.
    public let svgGlyphURL: URL?
    
    /// Optional SF Symbol name representing the event.
    public let sfSymbolName: String?
    
    /// The ID used by the registration service.
    public let registrationServiceID: String?
    
    /// Optional signup information related to the event.
    public let signupInformation: SignupInformation?
    
    /// Signup-related information for a WWDC event.
    public struct SignupInformation: Codable, Sendable {
        /// The registration service identifier.
        public let registrationServiceID: String
        
        /// The registration service key.
        public let registrationServiceKey: String
        
        /// Localized strings used for displaying signup-related text.
        public let localizedStrings: LocalizedStrings
        
        /// A collection of localized string values used for event registration and digital lounges.
        public struct LocalizedStrings: Codable, Sendable {
            /// Title for the attendance policy section.
            public let attendancePolicyTitle: String
            
            /// Heading for the digital lounge schedule.
            public let digitalLoungeScheduleHeading: String
            
            /// Heading for related digital lounge content.
            public let digitalLoungeRelatedHeading: String
            
            /// Heading for bulk actions in the digital lounge.
            public let digitalLoungeBulkActionHeading: String
            
            /// Detail text for bulk actions in the digital lounge.
            public let digitalLoungeBulkActionDetail: String
            
            /// Prompt text for bulk actions in the digital lounge.
            public let digitalLoungeBulkActionPrompt: String
            
            /// Heading for bulk forms in the digital lounges.
            public let digitalLoungesBulkFormHeading: String
            
            /// Instructions for bulk forms in the digital lounge.
            public let digitalLoungeBulkFormInstructions: String
            
            /// Confirmation format string for bulk form submission in the digital lounge.
            public let digitalLoungeBulkFormConfirmationFormat: String
            
            /// Title shown when a user is ineligible for registration.
            public let ineligibleForRegistrationTitle: String
            
            /// Message shown when a user is ineligible for registration.
            public let ineligibleForRegistrationMessage: String
            
            /// Message shown when an internal user is ineligible for registration.
            public let internalUserIneligibleForRegistrationMessage: String
        }
    }
}
