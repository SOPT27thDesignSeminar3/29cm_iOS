//
//  PostService.swift
//  29cm_iOS
//
//  Created by inae Lee on 2020/12/18.
//

import Foundation
import Alamofire

struct PostService {
    static let shared = PostService()
    
    func getPostData(completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = APIConstants.bagCatagoryURL // fix
        let header: HTTPHeaders = ["Content-Type":"application/json"]
        
        let dataRequest = AF.request(url, method: .get, encoding: JSONEncoding.default, headers: header)
        dataRequest.responseData { (response) in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let data = response.value else {return}
                
                completion(judgeResult(status: statusCode, data: data))
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
    }
    
    func judgeResult(status: Int, data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
//        guard let decodedData = try? decoder.decode(GenericResponse<[PopularPostData]>.self, from: data) else {
//            return .pathErr
//        }
        
        switch status {
        case 200:
            return .success("성공")
        case 400:
            return .requestErr("요청값 오류")
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
}
