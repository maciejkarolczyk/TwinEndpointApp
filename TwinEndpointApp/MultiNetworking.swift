//
//  MultiNetworking.swift
//  MultiNetworking
//
//  Created by Karolczyk, Maciej on 19/11/2020.
//

import Foundation

class MultiNetworking {
    
    static func requestMultipleEndpoints<T:Decodable, A:Decodable>(queryItems:[QueryObject], completion: @escaping ((T,A) -> Void), errorBlock : @escaping (String) -> Void) {
        
        var resultOne: T?
        var resultTwo: A?
        
        let operationQueue = OperationQueue()
        
        let operation1 = BlockOperation {
            let group = DispatchGroup()
            
            for query in queryItems {
                group.enter()
                switch query.requestType {
                case .git:
                    self.getData(queryObject: query) { (response:T) in
                        resultOne = response
                        group.leave()
                    } failureHandler: { errorString in
                        errorBlock(errorString)
                        group.leave()
                    }
                case .dailyMotion:
                    self.getData(queryObject: query) { (response:A) in
                        resultTwo = response
                        group.leave()
                    } failureHandler: { errorString in
                        errorBlock(errorString)
                        group.leave()
                    }
                }
            }
            group.wait()
            
        }
        let operation2 = BlockOperation {
            completion(resultOne!, resultTwo!)
            
        }
        operation2.addDependency(operation1)
        operationQueue.addOperations([operation1, operation2], waitUntilFinished: true)
    }
    
    private static func getData<T:Decodable>(queryObject:QueryObject, successHandler: @escaping (T) -> Void, failureHandler: @escaping (String) -> Void) {
        NetworkLayer.getData(urlString: queryObject.requestType.endpoint, parameters: queryObject.parameters, headers: queryObject.headers) { (response:T) in
            successHandler(response)
        } errorHandler: { errorString in
            failureHandler(errorString)
        }
    }
}
