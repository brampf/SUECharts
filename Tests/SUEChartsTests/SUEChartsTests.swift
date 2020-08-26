import XCTest
@testable import SUECharts

final class SUEChartsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SUECharts().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
