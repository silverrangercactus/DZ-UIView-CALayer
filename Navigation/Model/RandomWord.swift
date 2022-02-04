//
//  RandomWord.swift
//  Navigation
//
//  Created by Fedor Boriskin on 28.10.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

enum CheckWorld {
    case empty, correct, incorrect
}

class RandomWord {
    
    private var safeWord = "Пароль"
    
    func check(word: String, completion: (CheckWorld) -> Void) {
        if word == "" {
            completion(.empty)
        } else if word == safeWord {
            completion(.correct)
        } else {
            completion(.incorrect)
        }
    }
}
