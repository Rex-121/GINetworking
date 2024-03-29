//
//  NetConfig.swift
//  GINetworking_Example
//
//  Created by Tyrant on 2019/9/10.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

import GINetworking

import Moya

struct SampleVersion: Codable {
    let id: Int?
    let versionCode: String?
    let leastVersion: String?
    let versionName: String
    let updateInformation: String?
    let phoneType: Int?
    let downloadAddress: URL
    let isUpdate: Int
}


struct SampleVersionWrong: Codable {
    let id: String
}


enum NetBusiness: TargetType {
    
    case version
    
    case net404
    
    case wrongAtBusiness
    
    var baseURL: URL {
        return URL(string: "http://192.168.1.189:8080/merchant_app")!
    }
    
    var path: String {
        switch self {
        case .version: return "/app/version/list"
        case .net404: return "/app/version/404"
        case .wrongAtBusiness: return "/merchant/personal/info"
            
        }
        
    }
    
    var method: Moya.Method {
        switch self {
        case .wrongAtBusiness: return .get
        default:
            return .post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .wrongAtBusiness: return .requestPlain
        default:
            let a = MultipartFormData(provider: MultipartFormData.FormDataProvider.data("4".data(using: .utf8)!), name: "type")
            return .uploadMultipart([a])
        }
        
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
