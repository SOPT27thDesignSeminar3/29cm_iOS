//
//  BagCategoryService.swift
//  29cm_iOS
//
//  Created by Yunjae Kim on 2020/12/07.
//

import Foundation
import Alamofire


struct BagCategoryService{
    
    static let shared = BagCategoryService()
    
    func getInfo(completion : @escaping (NetworkResult<Any>) -> Void){
        
        let url = APIConstants.bagCatagoryURL
        let header : HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        let dataRequest = AF.request(url, method: .get, encoding: JSONEncoding.default, headers: header)
        dataRequest.responseData{ (response) in
            
            switch response.result {
            case .success:
                print("here")
                guard let statusCode = response.response?.statusCode else{
                    return
                }
                guard let data = response.value  else{
                    
                    return
                }
                
                completion(judgeResult(status: statusCode, data: data))
               
                
                
            case .failure(let err) :

                print(err)
                completion(.networkFail)
                
            
            
            }
            
            
        }
        
    }
    
    func judgeResult(status : Int, data : Data) -> NetworkResult<Any> {
        
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<[BagCategoryData]>.self, from: data) else{
            return .pathErr
            
        }
        
        switch status{
        case 200 :
            
            return .success(decodedData.data)
        case 400..<500:
            return .requestErr(decodedData.message)
        case 500 :
            return .serverErr
        default :
         
            return .networkFail
        
        
        
        }
        
        
        
        
        
    }
        
        
        
        
    
    
    
    

}
