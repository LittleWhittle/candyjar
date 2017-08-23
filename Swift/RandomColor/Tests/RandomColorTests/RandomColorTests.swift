import XCTest
@testable import RandomColor

class RandomColorTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(RandomColor().text, "Hello, RandomColor")
    }

    func testPickupRandomColor() {
        // Functional test case example
        XCTAssertTrue(!RandomColor().pickupRandomColor().isEmpty, "Got some randomColor")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
    
}
