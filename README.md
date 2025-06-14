
# WWDCKit

A library for downloading the WWDC catalog of sessions, etc.

## License

See the LICENSE file for licensing information.

## Usage

You can refresh the WWDC catalog by manually locating Developer.app on macOS and then feeding the URL to `WWDCService.fetchCatalogWithURLFromDeveloperApp(at:)`. You can save the catalog to disk using `WWDCCatalog.save(to:)` and then restore it using `WWDCCatalog.load(from:)` on the next launch.

On iOS and visionOS, you would have to figure out the URL yourself and pass it in to `WWDCService.fetchCatalog(from url: URL)`.

### Fetching and Storing the Catalog

```swift
func refreshCatalogFromCDN() {
    let panel = NSOpenPanel()
    panel.title = "Select Developer.app"
    panel.directoryURL = URL(fileURLWithPath: "/Applications")
    panel.allowedContentTypes = [.application]
    panel.canChooseFiles = true
    panel.canChooseDirectories = false
    panel.allowsMultipleSelection = false

    if panel.runModal() == .OK, let appURL = panel.url {
        Task {
            do {
                let catalog = try await WWDCService.fetchCatalogWithURLFromDeveloperApp(at: appURL)
                try catalog.save(to: URL.documentsDirectory.appending(component: "wwdccatalog.json"))
                print("Successfully fetched \(catalog.events.count) events.")
            } catch {
                dump(error)
            }
        }
    }
}
```

### Restoring the Catalog

```swift
.task {
    do {
        let catalog = try WWDCCatalog.load(from: URL.documentsDirectory.appending(component: "wwdccatalog.json"))
        print("Successfully restored \(catalog.events.count) events.")
    } catch {
        dump(error)
    }
}
```
