//
//  TimeCounter.swift
//  StateAndDataFlow
//
//  Created by 18992227 on 02.08.2021.
//

import Combine
import Foundation

class TimerCounter: ObservableObject {
    //    объект за которым могут все наблюдать, невер  - как только начнет меняться сразу будет передаваться другим объектам
    let objectWillChange = PassthroughSubject<TimerCounter, Never>()
    
    var counter = 5
    var timer: Timer?
    var buttonTitle = "Start"
    
    func startTimer() {
        if counter > 0 {
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(updateCounter),
                userInfo: nil,
                repeats: true
            )
        }
        
        buttonDidTapped()
    }
    
    private func buttonDidTapped() {
        if buttonTitle == "Reset" {
            counter = 5
            buttonTitle = "Start"
        } else {
            buttonTitle = "Wait..."
        }
        
        objectWillChange.send(self)
    }
    
    @objc private func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            killTimer()
            buttonTitle = "Reset"
        }
        
        objectWillChange.send(self)
    }
    
    private func killTimer() {
        timer?.invalidate()
        timer = nil
    }
}
