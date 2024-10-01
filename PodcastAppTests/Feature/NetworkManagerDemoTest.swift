//
//  NetworkManagerDemoTest.swift
//  PodcastAppTests
//
//  Created by Şehriban Yıldırım on 2.10.2024.
//

import XCTest

@testable import PodcastApp
final class NetworkManagerDemoTest: XCTestCase {

    var networkManager: NetworkManager!

    override func setUp() {
        networkManager = NetworkManager(config: NetworkConfig(baseURL: "https://openwhyd.org/"))
    }
    
    func testWithMusicRespone() async {
        let result = await networkManager.send(path: MockPath.music, method: .GET, type: [MusicResponse].self)
        
        switch result {
        case .success(let response):
            XCTAssertNotNil(response)
        case .failure(let error):
            XCTFail(error.localizedDescription)
        }
    }
}

struct MusicResponse: Decodable {
    let uNm: String
    let name: String
    let ctx: String
}

enum MockPath: String, NetworkPathProtocol {
    case music = "adrien?format=json"
    var value: String {
        return rawValue
    }
}
