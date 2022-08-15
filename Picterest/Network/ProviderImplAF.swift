//
//  ProviderImplAF.swift
//  Picterest
//
//  Created by 장주명 on 2022/08/13.
//

import Foundation
import Alamofire
import RxSwift

struct ProviderImplAF: ProviderAF {
    func request<R>(with TargetType: TargetType) -> Observable<R> where R : Decodable {
        return Observable<R>.create { observer in
            let request = AF.request(TargetType).responseDecodable(of: R.self) { response in
                switch response.result {
                case .success(let data):
                    observer.onNext(data)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(error)
                }
            }
            
            return Disposables.create {
                request.cancel()
            }
        }
    }
    
    func request(_ url: URL) -> Observable<Data> {
        return Observable<Data>.create { observer in
            let request = AF.request(url, method: .get).responseData { response in
                switch response.result {
                case .success(let data):
                    observer.onNext(data)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(error)
                }
            }
            
            return Disposables.create {
                request.cancel()
            }
        }
    }
    
    
}
