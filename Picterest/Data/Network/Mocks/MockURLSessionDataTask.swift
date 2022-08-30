//
//  MockURLSessionDataTask.swift
//  Picterest
//
//  Created by 장주명 on 2022/08/25.
//

import Foundation

class MockURLSessionDataTask: URLSessionDataTask {
    
    private let url: URL
    private let data: Data
    private let statusCode: Int
    
    init(configuration: URLSessionConfiguration = .default, data: Data, statusCode: Int, url: URL = URL(string: "https:flicker.com")!) {
        self.data = data
        self.url = url
        self.statusCode = statusCode
        super.init()
    }
    
    var resumeDidCall: (() -> Void)?
    
    override func resume() {
        resumeDidCall?()
    }
}
