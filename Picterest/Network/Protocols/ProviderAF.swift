//
//  ProviderAF.swift
//  Picterest
//
//  Created by 장주명 on 2022/08/13.
//

import Foundation
import Alamofire
import RxSwift

protocol ProviderAF {
    func request<R: Decodable>(with TargetType: TargetType) -> Observable<R>

    func request(_ url: URL) -> Observable<Data>
}
