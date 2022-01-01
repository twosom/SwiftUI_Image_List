//
// Created by Desire L on 2022/01/01.
//

import Foundation
import SwiftUI


enum HTTPException: Error {
    case URL_NOT_FOUND
}

class WebService {

    private var defaultAPI = "https://61cfc2fe65c32600170c7fbc.mockapi.io/user"

    func loadUsers(completion: @escaping ([UserModel]) -> Void) throws {
        let request: URLRequest = try getRequest(urlString: self.defaultAPI)
        fetchUserFromRequest(request: request, completion: completion)
            .resume()
    }


    private func fetchUserFromRequest(request: URLRequest, completion: @escaping ([UserModel]) -> Void) -> URLSessionDataTask {
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse else {
                return
            }
            print("### HTTP STATUS CODE = \(response.statusCode)")
            guard let data = data else {
                return
            }
            do {
                let userList: [UserModel] = try JSONDecoder().decode([UserModel].self, from: data)
                completion(userList)
            } catch {
                print(error)
            }
        }
    }

    func getRequest(urlString: String) throws -> URLRequest {
        guard let url: URL = URL(string: urlString) else {
            throw HTTPException.URL_NOT_FOUND
        }

        return URLRequest(url: url)
    }
}