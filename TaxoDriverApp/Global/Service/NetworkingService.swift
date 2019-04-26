//
//  NetworkingService.swift
//  TaxoDriverApp
//
//  Created by Sonam on 07/04/19.
//  Copyright © 2019 Sonam. All rights reserved.
//

import Foundation
import  Alamofire

typealias JSON = [String: Any]

class NetworkingService{
    private init(){}
    static let shared = NetworkingService()
    
    func requestData(fromURL url: URL, params: [String :Any] ,completion: @escaping (Any)->Void) {
       AF.request(url, method: .post, parameters:params,encoding: JSONEncoding.default, headers: nil).responseJSON {
            response in
            switch response.result {
            case .success:
                print(response)
                 guard let json = response.value as? JSON else { return }
                 completion(json)
                 break
            case .failure(let error):
                print(error)
        }
       
    
    }
    
 }
    
}
