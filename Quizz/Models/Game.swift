//
//  Game.swift
//  OpenQuizz
//
//  Created by Ambroise COLLON on 13/06/2017.
//  Copyright Â© 2017 OpenClassrooms. All rights reserved.
//

import Foundation
import AVFoundation
import AudioToolbox

class Game {
    var score = 0
    
    private var questions = [Question]()
    private var currentIndex = 0
    
    var state: State = .ongoing
    
    enum State {
        case ongoing, over
    }
    
    var currentQuestion: Question {
        return questions[currentIndex]
    }
    
    func refresh() {
        score = 0
        currentIndex = 0
        state = .over
        QuestionManager.shared.get { (questions) in
            self.questions = questions
            self.state = .ongoing
            let name = Notification.Name(rawValue: "QuestionsLoaded")
            let notification = Notification(name: name)
            NotificationCenter.default.post(notification)
        }
    }
    
    func answerCurrentQuestion(with answer: Bool) {
        if (currentQuestion.isCorrect && answer) || (!currentQuestion.isCorrect && !answer) {
            songNotificationAnswerTrue()
            score += 1
        }else{
            songNotificationAnswerWrong()
        }
        goToNextQuestion()
    }
    
    private func goToNextQuestion() {
        if currentIndex < questions.count - 1 {
            currentIndex += 1
        } else {
            songNotificationResult()
            finishGame()
        }
    }
    
    private func finishGame() {
        state = .over
    }
    
    private func receiveQuestions(_ questions: [Question]) {
        self.questions = questions
        state = .ongoing
        print(questions)
        
    }
    
    //Méthode personnelle gèrant le son du sucess et défaite à la question
    var player: AVAudioPlayer?
    private func songNotificationAnswerTrue(){
       
            let path = Bundle.main.path(forResource: "victory", ofType:"mp3")!
            let url = URL(fileURLWithPath: path)
            
            do {
                let sound = try AVAudioPlayer(contentsOf: url)
                self.player = sound
                sound.numberOfLoops = 0
                sound.prepareToPlay()
                sound.play()
            } catch {
                print("error loading file")
                // couldn't load file :(
            }
    }
   
    //méthode gérant le son du résultat final
    private func songNotificationAnswerWrong(){
        let path = Bundle.main.path(forResource: "begging-for-more", ofType:"mp3")!
        let url = URL(fileURLWithPath: path)
        
        do {
            let sound = try AVAudioPlayer(contentsOf: url)
            self.player = sound
            sound.numberOfLoops = 0
            sound.prepareToPlay()
            sound.play()
        } catch {
            print("error loading file")
            // couldn't load file :(
        }
    }
    
    //méthode gérant le son du résultat final
    private func songNotificationResult(){
        let path = Bundle.main.path(forResource: "results", ofType:"mp3")!
        let url = URL(fileURLWithPath: path)
        
        do {
            let sound = try AVAudioPlayer(contentsOf: url)
            self.player = sound
            sound.numberOfLoops = 0
            sound.prepareToPlay()
            sound.play()
        } catch {
            print("error loading file")
            // couldn't load file :(
        }
    }

    
}
