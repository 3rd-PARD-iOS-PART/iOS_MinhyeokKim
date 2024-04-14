//
//  _rd_hw_KimMinhyeokUITestsLaunchTests.swift
//  3rd_hw_KimMinhyeokUITests
//
//  Created by Minhyeok Kim on 2024/03/28.
//

import XCTest

final class _rd_hw_KimMinhyeokUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}