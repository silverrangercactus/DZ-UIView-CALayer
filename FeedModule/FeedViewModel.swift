//
//  FeedViewModel.swift
//  Navigation
//
//  Created by Fedor Boriskin on 01.12.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

protocol FeedViewOutput {
    func updateText(_ string: String, completion: (ResultCheckMy) -> Void)
}

enum ResultCheckMy {
    case good, bad, pox
}

class FeedViewModel: FeedViewOutput {

    var checkerr: RandomWord
        
    init(checkerr: RandomWord) {
        self.checkerr = checkerr
    }
    
    func updateText(_ string: String, completion: (ResultCheckMy) -> Void) {
        let wordNeedCheck = string
        checkerr.check(word: wordNeedCheck) { checking in
            switch checking {
            case .empty:
                completion(.pox)
            case .correct:
                completion(.good)
            case .incorrect:
                completion(.bad)
            }
        }
    }

}

