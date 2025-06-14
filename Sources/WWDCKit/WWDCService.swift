import Foundation

/// A service class responsible for fetching WWDC catalog data from various sources.
public class WWDCService {

    #if os(macOS)
    /// Attempts to extract a catalog URL from a Developer.app instance and load the catalog.
    ///
    /// - Parameter appURL: The URL to the Developer.app bundle.
    /// - Returns: A decoded `WWDCCatalog` instance.
    /// - Throws: `WWDCError.notDeveloperAppURL` if the URL is invalid, or `WWDCError.failedToLoadWWDCCore` if reading fails.
    ///
    public static func fetchCatalogWithURLFromDeveloperApp(at appURL: URL) async throws -> WWDCCatalog {
        guard appURL.lastPathComponent == "Developer.app" else {
            throw WWDCError.notDeveloperAppURL
        }

        let path = "Contents/Frameworks/WWDCCore.framework/Versions/A/WWDCCore"
        let wwdcCoreURL = appURL.appendingPathComponent(path)

        do {
            let data = try Data(contentsOf: wwdcCoreURL)
            return try await fetchCatalogWithExtractedURLFromData(data)
        } catch {
            throw WWDCError.failedToLoadWWDCCore
        }
    }
    #endif

    /// Extracts a catalog URL from binary data and fetches the catalog from it.
    ///
    /// - Parameter data: Binary data containing the catalog URL.
    /// - Returns: A decoded `WWDCCatalog` instance.
    /// - Throws: An error if extraction or fetching fails.
    ///
    public static func fetchCatalogWithExtractedURLFromData(_ data: Data) async throws -> WWDCCatalog {
        let url = try WWDCURL.extractContentsURL(from: data)
        let catalog = try await fetchCatalog(from: url)
        return catalog
    }

    /// Downloads and decodes a WWDC catalog from a provided URL.
    ///
    /// - Parameter url: The remote URL pointing to the catalog JSON.
    /// - Returns: A decoded `WWDCCatalog` instance.
    /// - Throws: An error if the request or decoding fails.
    /// 
    public static func fetchCatalog(from url: URL) async throws -> WWDCCatalog {
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let catalog = try decoder.decode(WWDCCatalog.self, from: data)
        return catalog
    }
}
