//
//  NewsAPIError.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 30/01/25.
//


import Foundation

struct NewsAPIErrorResponse: Decodable, Error {
    let error: NewsAPIErrorDetail
}

struct NewsAPIErrorDetail: Decodable {
    let code: String
    let message: String
}
