//
//  NetworkManager.swift
//  PodcastApp
//
//  Created by Şehriban Yıldırım on 1.10.2024.
//

import Foundation
import Alamofire

final class NetworkManager: NetworkManagerProtocol{
    
    private let config: NetworkConfig
    private let decoder: JSONDecoder
    
    init(config: NetworkConfig, decoder: JSONDecoder = JSONDecoder()) {
        self.config = config
        self.decoder = decoder
        self.decoder.dateDecodingStrategy = .iso8601
    }
    
    /// Send your request
    /// - Parameters:
    ///   - path: Network Path
    ///   - method: HttpMethod
    ///   - type: Generic Decodable Type
    ///   - body: Nullable or Encodable
    ///   - parameter: Query parms. etc.
    /// - Returns: Result with success response or error
    func send<T : Decodable>(path: NetworkPathProtocol,
                             method: NetworkMethod,
                             type: T.Type,
                             body:Encodable? = nil,
                             parameter: Parameters? = nil) async -> Result<T, Error>
    {
        let url = config.baseURL + path.value
        let request: DataRequest
        
        if let body = body{
            request = AF.request(url,
                                 method: method.alamofireMethod,
                                 parameters: body,
                                 encoder: JSONParameterEncoder.default)
        }else{
            request = AF.request(url,
                                 method: method.alamofireMethod,
                                 parameters: parameter)
        }
        
        let response = await request.validate()
            .serializingDecodable(T.self, decoder: decoder)
            .response
        
        guard let responseValue = response.value else{
            return .failure(response.error ?? NetworkError.unkown)
        }
        return .success(responseValue)
    }
}
