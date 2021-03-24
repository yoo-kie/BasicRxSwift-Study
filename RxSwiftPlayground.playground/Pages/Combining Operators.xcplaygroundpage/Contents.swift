//: [Previous](@previous)

import Foundation
import RxSwift
import RxCocoa

//example(of: "combineLatest") {
//    let observable1 = Observable.from(["yjyoo", "rookie", "gaegul"])
//    let observable2 = Observable.from([926, 116, 2020])
//
//    let combined = Observable<String>.combineLatest(observable1, observable2) { (nickname, id) in
//        return nickname + String(id)
//    }
//
//    combined
//        .debug()
//        .subscribe()
//}

//example(of: "withLatestFrom") {
//    let observable1 = Observable.from(["yjyoo", "rookie", "gaegul"])
//    let observable2 = Observable.from([926, 116, 2020])
//
//    let combined = observable1.withLatestFrom(observable2) { nickname, id in
//        return nickname + String(id)
//    }
//
//    combined
//        .debug()
//        .subscribe()
//}

//example(of: "merge") {
//    let observable1 = Observable.from(["1", "3", "5"])
//    let observable2 = Observable.from(["2", "4", "6"])
//
//    Observable.merge(observable1, observable2).debug().subscribe()
//}

//example(of: "concat") {
//    let observable1 = Observable.from(["1", "3", "5"])
//    let observable2 = Observable.from(["2", "4", "6"])
//
//    Observable.concat(observable1, observable2).debug().subscribe()
//}

//example(of: "switchLatest") {
//    //Int 타입의 Observable을 방출할 수 있는 Subject
//    let switchLatest = PublishSubject<Observable<Int>>()
//     
//     
//    let first = PublishSubject<Int>()
//    let second = PublishSubject<Int>()
//     
//    //Observable을 변경할 수 있는 switchLatest로 subscribe
//    _ = switchLatest.switchLatest()
//        .subscribe(onNext: {
//             print("num => ", $0)
//        }, onCompleted: {
//            print("completed")
//        })
//     
//    //first Observable을 지정함
//    switchLatest.onNext(first)
//    
//    second.onNext(100)
//    first.onNext(1) //num => 1
//    second.onNext(200)
//    first.onNext(2) //num => 2
//    
//    //second Observable을 지정함
//    switchLatest.onNext(second)
//    
//    second.onNext(300) //num => 300
//    first.onNext(3)
//    second.onNext(400) //num => 400
//    first.onNext(4)
//    
//    second.onCompleted()
//    
//    //first Observable을 지정함
//    switchLatest.onNext(first)
//    first.onNext(5) //num => 5
//    first.onCompleted()
//    
//    switchLatest.onCompleted() //completed
//}

//example(of: "zip") {
//    let observable1 = Observable.from(["Cat", "Rabbit", "Work", "Bus"])
//    let observable2 = Observable.from(["Dog", "Turtle", "Life"])
//
//    Observable<String>
//        .zip(observable1, observable2) { a, b in
//            return "\(a) vs. \(b)"
//        }
//        .debug()
//        .subscribe()
//}

//example(of: "amb") {
//    let observable1 = Observable<Int>.interval(.seconds(5), scheduler: MainScheduler.instance)
//    let observable2 = Observable<Int>.interval(.seconds(3), scheduler: MainScheduler.instance)
//    let observable3 = Observable<Int>.interval(.seconds(7), scheduler: MainScheduler.instance)
//
//    observable1.amb(observable2).amb(observable3)
//        .take(5)
//        .debug()
//        .subscribe()
//}

//example(of: "startWith") {
//    let observable = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
//    observable
//        .take(3)
//        .startWith(-1)
//        .debug()
//        .subscribe()
//}
//: [Next](@next)
