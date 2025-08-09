import Foundation

public extension URL {
    /// The last path component of the URL after removing any path extension, or an empty string if the path is an empty
    /// string.
    var filename: String {
        deletingPathExtension().lastPathComponent
    }
}
