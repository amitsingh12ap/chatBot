//
//  BaseRepository.swift
//  AliveCor Coding Assignment
//
//  Created by 13216146 on 07/06/21.
//

protocol BaseRepository {
    associatedtype Record
    var parameters: Parameters {get set}
    func getRcordsFromAPI(completion : @escaping (Record?, ApiError?)-> Void)
}

