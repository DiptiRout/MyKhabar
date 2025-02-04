//
//  NetworkServiceTests.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 03/02/25.
//

import Testing
import UIKit
@testable import MyKhabar

// Define a mock data model
struct MockData: Codable {
    let id: Int
    let name: String
}

struct MockError: Decodable, Error {
    let message: String
}

final class MockURLSession: URLSessionProtocol {
    // Immutable properties
    private let mockData: Data?
    private let mockResponse: URLResponse?
    private let mockError: Error?

    // Initialization with immutable data
    init(mockData: Data? = nil, mockResponse: URLResponse? = nil, mockError: Error? = nil) {
        self.mockData = mockData
        self.mockResponse = mockResponse
        self.mockError = mockError
    }

    // Simulating a network request
    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        if let error = mockError {
            throw error
        }
        return (mockData ?? Data(), mockResponse ?? HTTPURLResponse())
    }
}

@Test
func testFetchDataSuccess() async throws {
    let mockPost = MockData(id: 1, name: "Mock Title")

    let mockData = try JSONEncoder().encode(mockPost)
    let mockResponse = HTTPURLResponse(url: URL(string: "https://api.example.com/posts")!,
                                       statusCode: 200,
                                       httpVersion: nil,
                                       headerFields: nil)

    // Initialize MockURLSession with mock data and a 200 status code
    let mockSession = MockURLSession(
        mockData: mockData,
        mockResponse: mockResponse,
        mockError: nil
    )
    let networkService = NetworkService(session: mockSession)

    // Perform the network call and decode into Post
    let jsonData: MockData = try await networkService.fetchData(
        from: "https://api.example.com",
        path: "/posts",
        params: [:],
        headers: [:],
        errorType: MockError.self
    )

    // Assert the expected values using #expect
    #expect(jsonData.id == 1)
    #expect(jsonData.name == "Mock Title")
}
