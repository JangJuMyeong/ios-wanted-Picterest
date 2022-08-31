//
//  PicterestNetworkTests.swift
//  PicterestNetworkTests
//
//  Created by 장주명 on 2022/08/24.
//

import XCTest
@testable import Picterest

class PicterestNetworkTests: XCTestCase {
    
    var provider: Provider!
    
    override func setUpWithError() throws {
        provider = ProviderImpl(session: MockURLSession())
    }


    func test_fetchPhotoList_whenSuccess_thenProcessRight() {
        // async테스트를 위해서 XCTestExpectation 사용
        let expectation = XCTestExpectation()

        let endpoint = APIEndpoints.getPhotosInfo(with: .init(page: 1))
        let endpointJson = endpoint.sampleData!
        print(endpointJson)
        let responseMock = try? JSONDecoder().decode([PhotoInfoResponseDTO].self, from: endpointJson)

        provider.request(with: endpoint) { result in
            switch result {
            case .success(let response):
                XCTAssertEqual(response.first?.id, responseMock?.first?.id)
            case .failure:
                XCTFail()
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 2.0)
    }

    func test_fetchPhotoList_whenFailed_thenProcessRight() {
        provider = ProviderImpl(session: MockURLSession(makeRequestFail: true))
        let expectation = XCTestExpectation()

        let endpoint = APIEndpoints.getPhotosInfo(with: .init(page: 1))

        provider.request(with: endpoint) { result in
            switch result {
            case .success:
                XCTFail()
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, "status코드가 200~299가 아닙니다.")
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 2.0)
    }

}
