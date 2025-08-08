import Foundation

public extension URL {
    var filename: String {
        deletingPathExtension().lastPathComponent
    }
}
