//
//  NetworkServiceProtocol.swift
//  Rick&Morty
//
//  Created by Александр Меренков on 22.08.2023.
//

import Foundation

protocol NetworkServiceProtocol: AnyObject {
    func loadData<T: Decodable>(request: URLRequest, completion: @escaping(Result<T, Error>) -> Void)
}
