//: Playground - noun: a place where people can play

import UIKit

protocol Number {
    var floatValue: Float { get }
}

extension Float: Number {
    var floatValue: Float {
        return self
    }
}

extension Double: Number {
    var floatValue: Float {
        return Float(self)
    }
}

extension Int: Number {
    var floatValue: Float {
        return Float(self)
    }
}

var three: Int = 3
var four: Float = 4

three.floatValue + four

func +(valueA: Number, valueB: Number) -> Float {
    return valueA.floatValue + valueB.floatValue
}

func -(valueA: Number, valueB: Number) -> Float {
    return valueA.floatValue - valueB.floatValue
}

func *(valueA: Number, valueB: Number) -> Float {
    return valueA.floatValue * valueB.floatValue
}

func /(valueA: Number, valueB: Number) -> Float {
    return valueA.floatValue / valueB.floatValue
}

let x: Double = 1.234
let y: Int = 5
let q = x / y

class Question {
    var type: QuestionType
    var query: String
    var answer: String
    
    init(type: QuestionType, query: String, answer: String) {
        self.type = type
        self.query = query
        self.answer = answer
    }
}

enum QuestionType: String {
    case trueFalse = "The sky is blue"
    case multipleChoice = "Who is uglies Beatle"
    case shortAnswer = "What is the capital"
    case essay = "In 50 words, explain"
    
    static let types = [trueFalse, multipleChoice, shortAnswer, essay]
}

enum AnswerType: String {
    case trueFalse = "True"
    case multipleChoice = "me"
    case shortAnswer = "capital"
    case essay = "50 words 50 words 50 words 50 words 50 words 50 words 50 words 50 words 50 words 50 words 50 words"
    
    static let types = [trueFalse, multipleChoice, shortAnswer, essay]
}

protocol QuestionGenerator {
    func generateRandomQuestion() -> Question
}

class Answer {}

protocol AnswerGenerator: QuestionGenerator {
    func generateRandomAnswer() -> Answer
}

class Jeopardy: AnswerGenerator {
    func generateRandomAnswer() -> Answer {
        //
    }
    
    func generateRandomQuestion() -> Question {
        //
    }
}

class Quiz: QuestionGenerator {
    func generateRandomQuestion() -> Question {
        let randomNumeral = Int(arc4random_uniform(4))
        let randomType = QuestionType.types[randomNumeral]
        let randomQuery = randomType.rawValue
        let randomAnswer = AnswerType.types[randomNumeral].rawValue
        let randomQuestion = Question(type: randomType, query: randomQuery, answer: randomAnswer)
        return randomQuestion
    }
}

let quiz = Quiz()

let question = quiz.generateRandomQuestion()

print("QUESTION TYPE: \(question.type) \n QUERY: \(question.query) \n ANSWER: \(question.answer)")





























