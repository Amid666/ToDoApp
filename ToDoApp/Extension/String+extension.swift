//
//  String+extension.swift
//  ToDoApp
//
//  Created by Кефир Кефирчик on 22.04.2023.
//

import Foundation

extension String {
    var percrntEncoded: String {
        let allowedCharacters = CharacterSet(charactersIn: "!@#$%^&*()-+=[]\\}{,./?><").inverted
        guard let encodedString = self.addingPercentEncoding(withAllowedCharacters: allowedCharacters) else {
            fatalError()
        }
        return encodedString
    }
}

/*
URLFragmentAllowedCharacterSet  "#%<>[\]^`{|}
URLHostAllowedCharacterSet      "#%/<>?@\^`{|}
URLPasswordAllowedCharacterSet  "#%/:<>?@[\]^`{|}
URLPathAllowedCharacterSet      "#%;<>?[\]^`{|}
URLQueryAllowedCharacterSet     "#%<>[\]^`{|}
URLUserAllowedCharacterSet      "#%/:<>?@[\]^`
let query = "name=\(name)&password=\(password)"
*/

