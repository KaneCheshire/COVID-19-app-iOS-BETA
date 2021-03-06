//
//  ScreenTestCase.swift
//  SonarUITests
//
//  Created by NHSX on 03/04/2020.
//  Copyright © 2020 NHSX. All rights reserved.
//

import XCTest

class ScreenTestCase: XCTestCase {
    
    var app: XCUIApplication!
    
    var screen: Screen {
        fatalError("Subclasses must override \(#function)")
    }
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        let payload = UITestPayload(screen: screen)
        
        app = XCUIApplication()
        app.launchEnvironment[UITestPayload.environmentVariableName] = try! JSONEncoder().encode(payload).base64EncodedString()
        app.launch()
    }

}
