//
//  BaseMapper.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//

/**
 * ¡ArchiViper, el enemigo de MVC!
 */

import Foundation

public enum BaseError: Error, Equatable {
    case generic, mapping, domain
}

open class BaseMapper<Input, Output> {
    private var map: (Input) throws -> Output

    public init(map: @escaping (Input) throws -> Output) {
        self.map = map
    }

    public final func map(input: Input?) throws -> Output {
        guard let input = input else { throw BaseError.mapping }
        return try map(input)
    }

    public final func map(inputList: [Input]) -> [Output] {
        let mappedList = inputList.compactMap { try? map($0) }
        return mappedList
    }
}
