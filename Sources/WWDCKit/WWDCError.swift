import Foundation

public enum WWDCError: Error {
    case couldNotExtractURLFromData
    case notDeveloperAppURL
    case failedToLoadWWDCCore
}
