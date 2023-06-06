//
//  VKR_SwiftUITests.swift
//  VKR_SwiftUITests
//
//  Created by Vagan Albertyan on 19.05.2023.
//

import XCTest

final class VKR_Swift: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false

    }

    override func tearDownWithError() throws {
    }
    func testContentView_WhenLoaded_ShouldDisplaySignInView() throws {
        let app = XCUIApplication()
        app.launch()
    }
    func testContentView_WhenLoaded_ShouldDisplaySignUpView() throws {
        let app = XCUIApplication()
        app.launch()
    }
    func testHomePage_StudIn() throws {
        let app = XCUIApplication()
        app.launch()
    }
    func testHomePage_WorkerIn() throws {
        let app = XCUIApplication()
        app.launch()
    }
    func testHomeView() throws {
        let app = XCUIApplication()
        app.launch()
    }
    func testListView() throws {
        let app = XCUIApplication()
        app.launch()
    }
    func testListViewST() throws {
        let app = XCUIApplication()
        app.launch()
    }
    func testCreateProfileSt() throws {
        let app = XCUIApplication()
        app.launch()
    }
    func testCreateProfileCo() throws {
        let app = XCUIApplication()
        app.launch()
    }
    func testEditProfileST() throws {
        let app = XCUIApplication()
        app.launch()
    }
    func testEditProfileCo() throws {
        let app = XCUIApplication()
        app.launch()
    }

    

    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}




//mport XCTest
//@testable import XCTest
//
//class ContentViewTests: XCTestCase {
//
//    var sut: ContentView!
//
//    override func setUp() {
//        super.setUp()
//        sut = ContentView()
//    }
//
//    override func tearDown() {
//        sut = nil
//        super.tearDown()
//    }
//
//    func testContentView_WhenLoaded_ShouldDisplaySignInView() {
//        XCTAssertTrue(sut.body is SingIn)
//    }
//
//    func testContentView_WhenStatusIsTrue_ShouldDisplayHomeView() {
//        UserDefaults.standard.set(true, forKey: "status")
//        sut = ContentView()
//        XCTAssertTrue(sut.body is HomeView)
//    }
//
//    func testContentView_WhenLogoutButtonTapped_ShouldChangeStatusToFalse() {
//        UserDefaults.standard.set(true, forKey: "status")
//        sut = ContentView()
//        let homeView = try? sut.inspect().vStack().view(HomeView.self, 0)
//        XCTAssertNotNil(homeView)
//
//        let logoutButton = try? homeView?.button(0)
//        XCTAssertNotNil(logoutButton)
//
//        try? logoutButton?.tap()
//
//        let status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
//        XCTAssertFalse(status)
//    }
//}
