//
//  HomeViewModel.swift
//  boardshop
//
//  Created by Андрей Груненков on 02.07.2022.
//

import Foundation
import RxSwift
import RxCocoa

final class HomeViewModel {
    
    public enum HomeError {
        case internetError(String)
        case serverMessage(String)
    }
    
    public let categories : PublishSubject<[Category]> = PublishSubject()
    public let products : PublishSubject<[Product]> = PublishSubject()
    public let loading: PublishSubject<Bool> = PublishSubject()
    public let error : PublishSubject<HomeError> = PublishSubject()
    
    private let disposable = DisposeBag()
    
    
    public func requestData() {
        
        self.loading.onNext(true)
        APIManager.requestData(url: "6b09216da138fd2ccddea7a550a4298d/raw/356a60d4498611cb67f8202901a27ba94ba19acd/products.json", method: .get, parameters: nil, completion: { (result) in
            self.loading.onNext(false)
            switch result {
            case .success(let returnJson) :
                let categories = returnJson["Categories"].arrayValue.compactMap {
                    return Category(data: try! $0.rawData())
                }
                let products = returnJson["Products"].arrayValue.compactMap {return Product(data: try! $0.rawData())}
                self.categories.onNext(categories)
                self.products.onNext(products)
            case .failure(let failure) :
                switch failure {
                case .connectionError:
                    self.error.onNext(.internetError("Check your Internet connection."))
                case .authorizationError(let errorJson):
                    self.error.onNext(.serverMessage(errorJson["message"].stringValue))
                default:
                    self.error.onNext(.serverMessage("Unknown Error"))
                }
            }
        })
        
    }
}



