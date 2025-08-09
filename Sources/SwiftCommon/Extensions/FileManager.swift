import Foundation

@available(
    macOS 13.0,
    iOS 16.0,
    tvOS 16.0,
    watchOS 9.0,
    *
)
public extension FileManager {
    /// Returns a boolean value that indicates whether a file or directory exists at the specified URL.
    ///
    /// - Parameter url: The URL of the file or directory. App Sandbox does not restrict which URL values may be passed
    ///                  to this parameter.
    /// - Returns: `true` if a file at the given URL exists, or `false` if the file does not exist or its existence
    ///            could not be determined.
    ///
    /// If the file at `url` is inaccessible to your app, perhaps because one or more parent directories are
    /// inaccessible, this method returns `false`. If the final element in `url` specifies a symbolic link, this method
    /// traverses the link and returns `true` or `false` based on the existence of the file at the link destination.
    func fileExists(at url: URL) -> Bool {
        fileExists(atPath: url.path(percentEncoded: false))
    }

    /// Returns a boolean value that indicates whether a file or directory exists at the specified URL.
    ///
    /// - Parameter url: The URL of the file or directory.
    /// - Parameter isDirectory: Upon return, contains `true` if `url` is a directory or if the final path element is a
    ///                          symbolic link that points to a directory; otherwise, contains `false`. If `url` doesn't
    ///                          exist, this value is undefined upon return. Pass `nil` if you do not need this
    ///                          information.
    /// - Returns: `true` if a file at the given URL exists, or `false` if the file does not exist or its existence
    ///            could not be determined.
    ///
    /// If the file at `url` is inaccessible to your app, perhaps because one or more parent directories are
    /// inaccessible, this method returns `false`. If the final element in `url` specifies a symbolic link, this method
    /// traverses the link and returns `true` or `false` based on the existence of the file at the link destination.
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
