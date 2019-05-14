//
//  Question.swift
//  Personal Quiz
//
//  Created by Георгий Кашин on 01/05/2019.
//  Copyright © 2019 Georgii Kashin. All rights reserved.
//

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

extension Question {
    static func loadData() -> [Question] {
        return [
            Question(
                text: "Как вы проявляете свою злость?",
                type: .single,
                answers: [
                    Answer(text: "Кричу на людей", name: .Jobs),
                    Answer(text: "Выпускаю гнев в Твиттере", name: .Mask),
                    Answer(text: "Никогда не злюсь", name: .Gates),
                    Answer(text: "Пытаюсь стать лучше всех", name: .Bezos)
                ]
            ),
            Question(
                text: "Что из перечисленного вам нравится больше всего?",
                type: .multiple,
                answers: [
                    Answer(text: "Яблоки", name: .Jobs),
                    Answer(text: "Марс", name: .Mask),
                    Answer(text: "Windows", name: .Gates),
                    Answer(text: "Книги", name: .Bezos),
                ]
            ),
            Question(text: "Вы любите деньги?",
                     type: .ranged,
                     answers: [
                        Answer(text: "Это не главное", name: .Jobs),
                        Answer(text: "Скорее нет", name: .Mask),
                        Answer(text: "Скорее да", name: .Gates),
                        Answer(text: "Очень люблю", name: .Bezos)
                ]
            )
        ]
    }
}
