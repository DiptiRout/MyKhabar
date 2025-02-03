//
//  MapToNewsEntityDTO.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 30/01/25.
//

extension NewsEntity {
    func toEntityDTO() -> NewsEntityDTO {
        
        return NewsEntityDTO(author: author ?? "",
                             title: title ?? "",
                             description: description ?? "",
                             url: url ?? "",
                             source: source ?? "",
                             image: image ?? "",
                             category: category ?? "",
                             publishedAt: publishedAt ?? ""
        )
    }
}
