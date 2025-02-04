//
//  NetworkService.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 26/01/25.
//

import Foundation

protocol URLSessionProtocol: Sendable {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol { }

actor NetworkService {
    private let session: URLSessionProtocol

    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }

    func fetchData<T: Decodable, E: Decodable & Error>(
        from baseURL: String,
        path: String,
        params: [String: String] = [:],
        headers: [String: String] = [:],
        errorType: E.Type
    ) async throws -> T {
        
        guard let url = buildURL(baseURL: baseURL, path: path, params: params) else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }

        do {
            let (data, response) = try await self.session.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse else {
                throw URLError(.unknown)
            }

            if (200...299).contains(httpResponse.statusCode) {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                return try decoder.decode(T.self, from: data)
            } else {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                if let apiError = try? decoder.decode(E.self, from: data) {
                    throw apiError
                } else {
                    throw NSError(domain: "HTTPError", code: httpResponse.statusCode, userInfo: nil)
                }
            }
        } catch let decodingError as DecodingError {
            throw decodingError
        } catch {
            throw error
        }
    }
    
    func buildURL(baseURL: String, path: String, params: [String: String]) -> URL? {
        var components = URLComponents(string: baseURL + path)
        components?.queryItems = params.map { URLQueryItem(name: $0.key, value: $0.value) }
        return components?.url
    }
}
