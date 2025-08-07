import Foundation

@available(
    macOS 13.0,
    iOS 16.0,
    tvOS 16.0,
    watchOS 9.0,
    *
)
public extension FileManager {
    func fileExists(at url: URL) -> Bool {
        fileExists(atPath: url.path(percentEncoded: false))
    }

    func fileExists(
        at url: URL,
        isDirectory: UnsafeMutablePointer<ObjCBool>?
    ) -> Bool {
        fileExists(
            atPath: url.path(percentEncoded: false),
            isDirectory: isDirectory
        )
    }
}
