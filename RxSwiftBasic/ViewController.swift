//
//  ViewController.swift
//  RxSwiftBasic
//
//  Created by 유연주 on 2021/03/04.
//

import UIKit

// BehaviorSubject
class BehaviorSubject<T> {
    private var observers: [(T) -> Void] = []
    private var latestEvent: T

    init(initialEvent: T) {
        self.latestEvent = initialEvent
    }

    func onNext(event: T) {
        latestEvent = event
        observers.forEach {
            $0(event)
        }
    }

    func subscribe(observer: @escaping (T) -> Void) {
        observer(latestEvent)
        observers.append(observer)
    }
}

// ReplaySubject
class ReplaySubject<T> {
    private var observers: [(T) -> Void] = []
    private var events: [T] = []
    private var bufferSize: Int

    init(bufferSize: Int = 0) {
        self.bufferSize = bufferSize
    }
    
    static func createUnbound() {
        
    }
    
    func onNext(event: T) {
        insertToBuffer(event: event)
        
        observers.forEach {
            $0(event)
        }
    }

    func subscribe(observer: @escaping (T) -> Void) {
        emitFromBuffer(observer: observer)
        
        observers.append(observer)
    }
    
    private func insertToBuffer(event: T) {
        if bufferSize != 0 && events.count > bufferSize {
            events.removeFirst()
        }
        
        events.append(event)
    }
    
    private func emitFromBuffer(observer: @escaping (T) -> Void) {
        events.forEach {
            observer($0)
        }
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

