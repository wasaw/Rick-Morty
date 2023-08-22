//
//  NetworkService.swift
//  Rick&Morty
//
//  Created by Александр Меренков on 22.08.2023.
//

import Foundation

final class NetworkService {
    
//    MARK: - Properties
    
    private let session = URLSession(configuration: .default)
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

// MARK: - NetworkProtocol

extension NetworkService: NetworkServiceProtocol {
    func loadData<T: Decodable>(request: URLRequest, completion: @escaping (Result<T, Error>) -> Void)  {
        let dataTask = session.dataTask(with: request) { [weak self] data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            
            if let data = data {
                do {
                    guard let decodedData = try self?.decoder.decode(T.self, from: data) else { return }
                    completion(.success(decodedData))
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        dataTask.resume()
    }
}
