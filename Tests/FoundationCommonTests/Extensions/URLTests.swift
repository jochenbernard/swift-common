import Testing

import Foundation
import FoundationCommon

// swiftlint:disable force_unwrapping

@Suite
struct URLTests {
    @Test(arguments: [
        (URL(string: "/file")!, "file"),
        (URL(string: "/some/file.a")!, "file"),
        (URL(string: "/some/path/file.a.b")!, "file.a"),
        (URL(string: "/some/path/to/file.a.b.c")!, "file.a.b")
    ])
    func testFilename(
        url: URL,
        expectedFilename: String
    ) {
        #expect(url.filename == expectedFilename)
    }
}
