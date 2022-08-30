//
//  MockURLSession.swift
//  Picterest
//
//  Created by 장주명 on 2022/08/25.
//

import Foundation

class MockURLSession: URLSessionable {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        <#code#>
    }
    

    var makeRequestFail = false
    init(makeRequestFail: Bool = false) {
        self.makeRequestFail = makeRequestFail
    }

    var sessionDataTask: MockURLSessionDataTask?

    func dataTask(with request: URLRequest,
                  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {

        let endpoint = APIEndpoints.getPhotosInfo(with: .init(page: 1))

        // 성공 callback
        let successResponse = HTTPURLResponse(url: try! endpoint.makeUrl(),
                                              statusCode: 200,
                                              httpVersion: "2",
                                              headerFields: nil)
        // 실패 callback
        let failureResponse = HTTPURLResponse(url: try! endpoint.makeUrl(),
                                              statusCode: 301,
                                              httpVersion: "2",
                                              headerFields: nil)

        let sessionDataTask = MockURLSessionDataTask()

        // resume() 이 호출되면 completionHandler()가 호출
        sessionDataTask.resumeDidCall = {
            if self.makeRequestFail {
                completionHandler(nil, failureResponse, nil)
            } else {
                completionHandler(endpoint.sampleData!, successResponse, nil)
            }
        }
        self.sessionDataTask = sessionDataTask
        return sessionDataTask
    }
}
