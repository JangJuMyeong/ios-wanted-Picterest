//
//  PicterestNetworkTests.swift
//  PicterestNetworkTests
//
//  Created by 장주명 on 2022/08/24.
//

import XCTest
@testable import Picterest

class PicterestNetworkTests: XCTestCase {
    
    let provider = MediaInfoRepository()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        
        provider.getPhotoList { <#Result<[PhotoInfo], Error>#> in
            <#code#>
        }
    }


    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
