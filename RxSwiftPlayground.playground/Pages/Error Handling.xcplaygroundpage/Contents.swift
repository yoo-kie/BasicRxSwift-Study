//: [Previous](@previous)
import Foundation
import RxSwift

//example(of: "catch") {
//    let observable = Observable<Int>
//        .create { observer -> Disposable in
//            observer.onNext(1)
//            observer.onNext(2)
//            observer.onNext(3)
//            observer.onError(NSError(domain: "", code: 100, userInfo: nil))
//            observer.onError(NSError(domain: "", code: 200, userInfo: nil))
//            return Disposables.create { }
//    }
//
//    observable
//        .catch { .just(($0 as NSError).code) }
//        .subscribe { print($0) }
//        .dispose()
//}
//
//example(of: "catchAndReturn") {
//    let observable = Observable<Int>
//        .create { observer -> Disposable in
//            observer.onNext(1)
//            observer.onNext(2)
//            observer.onNext(3)
//            observer.onError(NSError(domain: "", code: 100, userInfo: nil))
//            observer.onError(NSError(domain: "", code: 200, userInfo: nil))
//            return Disposables.create { }
//    }
//
//    observable
//        .catchAndReturn(999)
//        .subscribe { print($0) }
//        .dispose()
//}

//example(of: "retry") {
//    let observable = Observable<Int>
//        .create { observer -> Disposable in
//            observer.onNext(1)
//            observer.onNext(2)
//            observer.onNext(3)
//            observer.onError(NSError(domain: "", code: 100, userInfo: nil))
//            observer.onError(NSError(domain: "", code: 200, userInfo: nil))
//            return Disposables.create { }
//    }
//
//    observable
//        .retry()
//        .subscribe { print($0) }
//        .dispose()
//}

example(of: "retry_maxAttemptCount") {
    let observable = Observable<Int>
        .create { observer -> Disposable in
            observer.onNext(1)
            observer.onNext(2)
            observer.onNext(3)
            observer.onError(NSError(domain: "", code: 100, userInfo: nil))
            observer.onError(NSError(domain: "", code: 200, userInfo: nil))
            return Disposables.create { }
    }

    observable
        .retry(2)
        .subscribe { print($0) }
        .dispose()
}
//: [Next](@next)
