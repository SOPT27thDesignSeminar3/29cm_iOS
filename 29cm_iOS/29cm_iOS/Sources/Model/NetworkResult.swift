//
//  NetworkResult.swift
//  29cm_iOS
//
//  Created by Yunjae Kim on 2020/12/06.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
