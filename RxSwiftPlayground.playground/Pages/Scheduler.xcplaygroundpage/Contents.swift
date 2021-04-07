//: [Previous](@previous)

import Foundation
import RxSwift

extension Thread {

    var threadName: String {
        if let currentOperationQueue = OperationQueue.current?.name {
            return "OperationQueue: \(currentOperationQueue)"
        } else if let underlyingDispatchQueue = OperationQueue.current?.underlyingQueue?.label {
            return "DispatchQueue: \(underlyingDispatchQueue)"
        } else {
            let name = __dispatch_queue_get_label(nil)
            return String(cString: name, encoding: .utf8) ?? Thread.current.description
        }
    }
}

//example(of: "observeOn") {
//    let observable = Observable<Int>.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
//    observable
//        .observe(on: MainScheduler.instance)
//        .map { return $0 * 2 }
//        .debug("main") // MainScheduler
//        .observe(on: ConcurrentDispatchQueueScheduler(qos: .background))
//        .debug("background") // ConcurrentDispatchQueueScheduler
//        .subscribe(
//            onNext: { _ in
//                print(Thread.isMainThread) // false : ConcurrentDispatchQueueScheduler
//            }
//        )
//}

//example(of: "subscribeOn") {
//    let observable = Observable<Int>.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
//
//    observable
//        .map { _ in print("✏️ map ", Thread.current.threadName) }
//        .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .background))
//        .do(
//            onNext: { _ in print("👀 subscribeOn", Thread.current.threadName) }
//        )
//        .observe(on: MainScheduler.instance)
//        .do(
//            onNext: { _ in print("🤢 observeOn", Thread.current.threadName) }
//        )
//        .observe(on: ConcurrentDispatchQueueScheduler(qos: .default))
//        .subscribe(
//            onNext: { _ in print(Thread.current.threadName) } // 최종단
//        )
//}

//example(of: "석준님 예제") {
//    Observable.of("Hello", "World")
//        .do(onNext: { i in
//            print("onNext: \(i)")
//        })
//        .do(afterNext: { i in
//            print("afterNext: \(i)")
//        })
//        .do(onError: { i in
//            print("onError: \(i)")
//        })
//        .do(afterError: { i in
//            print("afterError: \(i)")
//        })
//        .do(onCompleted: {
//            print("onCompleted")
//        })
//        .do(afterCompleted: {
//            print("afterCompleted")
//        })
//        .do(onSubscribe: {
//            print("onSubscribe")
//        })
//        .do(onSubscribed: {
//            print("onSubscribed")
//        })
//        .do(onDispose: {
//            print("onDispose")
//        })
//        .subscribe(onNext: {
//            print("subscribe: \($0)")
//        })
//}

//example(of: "CurrentThreadScheduler") {
//    let observable1 = Observable<String>.repeatElement("🤔").take(10)
//
//    observable1
//        .observe(on: CurrentThreadScheduler.instance)
//        .observe(on: ConcurrentDispatchQueueScheduler.init(qos: .background))
//        .observe(on: CurrentThreadScheduler.instance)
//        .subscribe(
//            onNext: { print("\($0) in \(Thread.current.threadName)") }
//        )
//}

//example(of: "MainScheduler") {
//    let observable1 = Observable<String>.repeatElement("🤔").take(10)
//    let observable2 = Observable<String>.repeatElement("👿").take(10)
//    let observable3 = Observable<String>.repeatElement("💄").take(10)
//
//    observable1
//        .observe(on: MainScheduler.instance)
//        .subscribe(
//            onNext: { print("\($0) in \(Thread.current.threadName)") }
//        )
//    observable2
//        .observe(on: MainScheduler.instance)
//        .subscribe(
//            onNext: { print("\($0) in \(Thread.current.threadName)") }
//        )
//    observable3
//        .observe(on: MainScheduler.instance)
//        .subscribe(
//            onNext: { print("\($0) in \(Thread.current.threadName)") }
//        )
//}

//example(of: "SerialDispatchQueueScheduler") {
//    let scheduler = SerialDispatchQueueScheduler.init(qos: .default)
//    let observable1 = Observable<String>.repeatElement("🤔").take(10)
//    let observable2 = Observable<String>.repeatElement("👿").take(10)
//    let observable3 = Observable<String>.repeatElement("💄").take(10)
//
//    observable1.observe(on: scheduler)
//        .subscribe(
//            onNext: { print("\($0) in \(Thread.current.threadName)") }
//        )
//    observable2.observe(on: scheduler)
//        .subscribe(
//            onNext: { print("\($0) in \(Thread.current.threadName)") }
//        )
//    observable3.observe(on: scheduler)
//        .subscribe(
//            onNext: { print("\($0) in \(Thread.current.threadName)") }
//        )
//}

//example(of: "ConcurrentDispatchQueueScheduler") {
//    let scheduler = ConcurrentDispatchQueueScheduler.init(qos: .default)
//    let observable1 = Observable<String>.repeatElement("🤔").take(10)
//    let observable2 = Observable<String>.repeatElement("👿").take(10)
//    let observable3 = Observable<String>.repeatElement("💄").take(10)
//
//    observable1.observe(on: scheduler)
//        .subscribe(
//            onNext: { print("\($0) in \(Thread.current.threadName)") }
//        )
//    observable2.observe(on: scheduler)
//        .subscribe(
//            onNext: { print("\($0) in \(Thread.current.threadName)") }
//        )
//    observable3.observe(on: scheduler)
//        .subscribe(
//            onNext: { print("\($0) in \(Thread.current.threadName)") }
//        )
//}

//: [Next](@next)
