//: [Previous](@previous)

import Foundation
import RxSwift

//example(of: "debounce") {
//    let timer = Observable<Int>.interval(.seconds(2), scheduler: MainScheduler.instance)
//
//    timer.take(10)
//        .debug("***interval***")
//        .debounce(.seconds(1), scheduler: MainScheduler.instance)
//        .debug("debounce")
//        .subscribe()
//
//    /*
//     interval : -0-1-2-3-4-5-6-7-8-9|
//     debounce : --0-1-2-3-4-5-6-7-89|
//     */
//}

//example(of: "throttle") {
//    let timer = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
//
//    timer.take(10)
//        .debug("***interval***")
//        .throttle(.seconds(2), scheduler: MainScheduler.instance)
//        .debug("throttle")
//        .subscribe()
//
//    /*
//     interval : 0123456789|
//     throttle : 0-2-4-6-89|
//     */
//}

//example(of: "distinct") {
//    let observable = Observable<Int>.from([1, 2, 2, 2, 3, 4, 5])
//
//    observable
//        .distinctUntilChanged()
//        .debug()
//        .subscribe()
//}

//example(of: "distinct_If not continuous") {
//    let observable = Observable<Int>.from([1, 2, 3, 2, 3, 4, 5])
//
//    observable
//        .distinctUntilChanged()
//        .debug()
//        .subscribe()
//}

//example(of: "exampleAt") {
//    let observable = Observable<Int>.from([1, 2, 3, 4, 5])
//
//    observable
//        .element(at: 2)
//        .debug()
//        .subscribe()
//}

//example(of: "filter") {
//    let observable = Observable<String>.from(["G1Tom", "G2Ben", "G1Jenny", "G3Cindy", "G4Peter"])
//
//    observable
//        .filter { $0.hasPrefix("G1") }
//        .debug()
//        .subscribe()
//}

//example(of: "single") {
//    let observable = Observable<String>.from(["First", "Second", "Third"])
//
//    observable
//        .single()
//        .debug()
//        .subscribe()
//}

//example(of: "take(1)") {
//    let observable = Observable<String>.from(["First", "Second", "Third"])
//
//    observable
//        .take(1)
//        .debug()
//        .subscribe()
//}

//example(of: "elementAt(0)") {
//    let observable = Observable<String>.from(["First", "Second", "Third"])
//
//    observable
//        .element(at: 0)
//        .debug()
//        .subscribe()
//}

//example(of: "ignoreElements") {
//    let observable = Observable<Int>.from([1, 2, 3])
//
//    observable
//        .ignoreElements()
//        .debug()
//        .subscribe()
//}

//example(of: "sample") {
//    let original = Observable<Int>.interval(.seconds(2), scheduler: MainScheduler.instance)
//
//    original.sample(
//        Observable<Int>.interval(.seconds(3), scheduler: MainScheduler.instance)
//    )
//    .take(3)
//    .debug()
//    .subscribe()
//
//    /*
//     original : -0-1-2-3-|
//     sample   : --0--2--3|
//     */
//}
//: [Next](@next)
