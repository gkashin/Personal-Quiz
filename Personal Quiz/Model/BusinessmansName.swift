//
//  BusinessmansName.swift
//  Personal Quiz
//
//  Created by Георгий Кашин on 01/05/2019.
//  Copyright © 2019 Georgii Kashin. All rights reserved.
//

enum BusinessmansName: String, CaseIterable {
    case Jobs = "Steve Jobs"
    case Mask = "Elon Mask"
    case Gates = "Bill Gates"
    case Bezos = "Jeff Bezos"
}

extension BusinessmansName {
    var description: String {
        switch self {
        case .Jobs:
            return "Вы очень вспыльчивый. Можете не контролировать свои эмоции. Вы не идете на компромиссы и редко следуете навязанным правилам"
        case .Mask:
            return "Вы верите в невозможное. Любая проблема для Вас - это всего лишь вопрос времени. Вы любите ставить амбициозные цели и достигать их"
        case .Gates:
            return "№1 для Вас - не просто пустые слова. Вы непонаслышке знаете, что значит быть на пике. Вы любите деньги и готовы конкурировать за право быть на высоте"
        case .Bezos:
            return "Вы очень творческий человек. Можете найти подход к любой ситуации и запросто решать возникающие проблемы. Ваша уравновешенность и сообразительность заставляет завидовать многих"
        }
    }
}
