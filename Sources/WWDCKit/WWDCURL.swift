import Foundation

// The URL prefix we're searching for
private let cdnURLPrefix = "https://devimages-cdn.apple.com/wwdc-services/"

public class WWDCURL {

    /// Extract the WWDC contents URL by first extracting the base URL and then adding to it.
    public static func extractContentsURL(from data: Data) throws  -> URL {
        try extractBaseURL(from: data).appending(path: "contents.json")
    }

    /// Extract the CDN base URL for the current year from the WWDCCore binary in the developer app.
    public static func extractBaseURL(from data: Data) throws -> URL {

        // Convert prefix to Data for binary search
        // swiftlint:disable:next force_unwrapping
        let prefixData = cdnURLPrefix.data(using: .ascii)!

        // Search for the prefix in the binary data
        if let range = data.range(of: prefixData) {
            // Start from the end of the prefix
            var endIndex = range.upperBound

            // Continue until we find a null byte (0x00) or end of data
            while endIndex < data.endIndex && data[endIndex] != 0x00 {
                endIndex += 1
            }

            // Extract the full URL data slice
            let urlData = data.subdata(in: range.lowerBound..<endIndex)

            // Convert to string (assuming ASCII)
            if let urlString = String(data: urlData, encoding: .ascii),
               let url = URL(string: urlString) {
                return url
            }
        }

        throw WWDCError.couldNotExtractURLFromData
    }
}
