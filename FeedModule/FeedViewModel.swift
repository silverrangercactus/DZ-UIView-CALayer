//
//  FeedViewModel.swift
//  Navigation
//
//  Created by Fedor Boriskin on 01.12.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

protocol FeedViewOutput {
   
    func updateText(_ string: String)
    
    var onTapCheckWord: () -> Void { get set }

}


class FeedViewModel: FeedViewOutput {
    
    var checkerr: RandomWord
        
    init(checkerr: RandomWord) {
        self.checkerr = checkerr
    }
    
    func updateText(_ string: String) {
        let wordNeedCheck = string
        checkerr.check(word: wordNeedCheck) { checking in
            switch checking {
            case .empty:
                print("EMPTY")
            case .correct:
                print("YES")
            case .incorrect:
                print("NONONO")
            }
        }
    }
        
    
   var onTapCheckWord: () -> Void = {
       // тут должна быть проверка на условия
      print("Кнопка нажимается")
    }

}

