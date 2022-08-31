//
//  MockURLSessionDataTask.swift
//  Picterest
//
//  Created by 장주명 on 2022/08/25.
//

import Foundation

class MockURLSessionDataTask: URLSessionDataTask {

    
    var resumeDidCall: (() -> Void)?
    
    override func resume() {
        resumeDidCall?()
    }
}
