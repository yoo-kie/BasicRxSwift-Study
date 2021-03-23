//: [Previous](@previous)

import Foundation
import RxSwift
//: # Operator Examples
//: ### Infinite한 duration을 가진 예제들이 있어서 일단 모두 주석처리 해 놓았습니다.
//: # Create
//example(of: "create") {
//    Observable<String>.create { observer in
//        observer.onNext("첫번째 이벤트")
//        observer.onNext("두번째 이벤트")
//        observer.onNext("세번째 이벤트")
//        observer.onCompleted()
//        return Disposables.create()
//    }.subscribe(
//        onNext: { print($0) },
//        onError: { print($0) },
//        onCompleted: { print("Completed") },
//        onDisposed: { print("Disposed") }
//    ).dispose()
//}

//: # Deferred
//example(of: "deferred") {
//    var isSelected: Bool = false
//
//    let observable = Observable<String>.deferred {
//        isSelected.toggle()
//
//        if isSelected {
//            return Observable.just("on")
//        } else {
//            return Observable.just("off")
//        }
//
//    }
//
//    observable.subscribe(
//        onNext: { print($0) }
//    )
//
//    observable.subscribe(
//        onNext: { print($0) }
//    )
//}

//: # Empty
//example(of: "empty") {
//    let observable = Observable<Void>.empty()
//
//    observable.subscribe(
//        onNext: { print($0) },
//        onCompleted: { print("Completed") },
//        onDisposed: { print("Disposed") }
//    ).dispose()
//}

//: # Never
//example(of: "never") {
//    let observable = Observable<Void>.never()
//
//    observable.subscribe(
//        onNext: { print($0) },
//        onCompleted: { print("Completed") },
//        onDisposed: { print("Disposed") }
//    ).dispose()
//}

//: # Error
//example(of: "error") {
//    enum MyError: Error {
//        case anError
//    }
//
//    let error: MyError = .anError
//    let observable = Observable<Void>.error(error)
//
//    observable.subscribe(
//        onNext: { print($0) },
//        onError: { print($0) },
//        onCompleted: { print("Completed") },
//        onDisposed: { print("Disposed") }
//    ).dispose()
//}

//: # Range
//example(of: "range") {
//    let observable = Observable<Int>.range(start: 1, count: 10)
//
//    observable.subscribe(
//        onNext: { print($0) },
//        onCompleted: { print("Completed") },
//        onDisposed: { print("Disposed") }
//    ).dispose()
//}

//: # Repeat
//example(of: "repeat") {
//    let observable = Observable<String>.repeatElement("개굴")
//
//    observable
//        .take(5)
//        .subscribe(
//            onNext: { print($0) },
//            onCompleted: { print("Completed") },
//            onDisposed: { print("Disposed") }
//        ).dispose()
//}

//: # Interval
//example(of: "interval") {
//    let observable = Observable<Int>.interval(
//        .seconds(5),
//        scheduler: MainScheduler.instance
//    )
//
//    observable.subscribe(
//        onNext: { print($0) }
//    )
//}

//: # Timer
//example(of: "timer") {
//    let observable = Observable<Int>.timer(
//        .seconds(5),
//        scheduler: MainScheduler.instance
//    )
//
//    observable.subscribe(
//        onNext: { print($0) },
//        onCompleted: { print("Completed") }
//    )
//}

//: # Map
//example(of: "map") {
//    let observable = Observable<Int>.range(start: 1, count: 5)
//
//    observable.map { $0 * 2 }
//        .subscribe(
//            onNext: { print($0) },
//            onCompleted: { print("Completed") },
//            onDisposed: { print("Disposed") }
//    ).dispose()
//}

//: # FlatMap
//example(of: "flatmap1") {
//    let observable5sec = Observable<Int>
//        .interval(.seconds(5), scheduler: MainScheduler.instance)
//        .take(4)
//
//    observable5sec.flatMap { (n: Int) -> Observable<Int> in
//        let observable2sec = Observable<Int>
//            .interval(.seconds(2), scheduler: MainScheduler.instance)
//            .take(4)
//            .map { _ in n }
//        return observable2sec
//    }.subscribe {
//        print("Result : \($0)")
//    }
//
//    /*
//     5secInterval  : ----0----1----2----3|
//     2secInterval0 :       0-0-0-0|
//     2secInterval1 :            1-1-1-1|
//     2secInterval2 :                 2-2-2-2|
//     2secInterval3 :                      3-3-3-3|
//     sub           : ------0-0-0101-1212-2323-3-3|
//     */
//}

//example(of: "flatMap2") {
//    struct Student {
//        var score: BehaviorSubject<Int>
//    }
//
//    let disposeBag = DisposeBag()
//
//    let ryan = Student(score: BehaviorSubject(value: 80))
//    let charlotte = Student(score: BehaviorSubject(value: 90))
//
//    let student = PublishSubject<Student>()
//
//    student.flatMap { $0.score }
//        .subscribe(onNext: {
//            print($0)
//        })
//        .disposed(by: disposeBag)
//
//    student.onNext(ryan)
//
//    ryan.score.onNext(85)
//
//    student.onNext(charlotte)
//
//    ryan.score.onNext(95)
//
//    charlotte.score.onNext(100)
//
//    /*
//     student :         --(ryan)----------(char)-----------------X
//     ryan.score:         ( 80 )--( 85 )----------( 95 )---------X
//     charlotte.score:                    ( 90 )----------( 100 )X
//     sub:              --( 80 )--( 85 )--( 90 )--( 95 )--( 100 )X
//     */
//}

//example(of: "flatMapToMap") {
//    struct Student {
//        var score: BehaviorSubject<Int>
//    }
//
//    let disposeBag = DisposeBag()
//
//    let ryan = Student(score: BehaviorSubject(value: 80))
//    let charlotte = Student(score: BehaviorSubject(value: 90))
//
//    let student = PublishSubject<Student>()
//
//    student.map { $0.score }
//        .subscribe(onNext: {
//            $0.subscribe(
//                onNext: { print($0) }
//            )
//        })
//        .disposed(by: disposeBag)
//
//    student.onNext(ryan)
//
//    ryan.score.onNext(85)
//
//    student.onNext(charlotte)
//
//    ryan.score.onNext(95)
//
//    charlotte.score.onNext(100)
//}

//: # FlatMapFirst
//example(of: "flatMapFirst") {
//    let observable5sec = Observable<Int>
//        .interval(.seconds(5), scheduler: MainScheduler.instance)
//        .take(4)
//
//    observable5sec.flatMapFirst { (n: Int) -> Observable<Int> in
//        let observable2sec = Observable<Int>
//            .interval(.seconds(2), scheduler: MainScheduler.instance)
//            .take(4)
//            .map { _ in n }
//        return observable2sec
//    }.subscribe {
//        print("Result : \($0)")
//    }
//
//    /*
//     5secInterval  : ----0----1----2----3|
//     2secInterval0 :       0-0-0-0|
//     2secInterval1 :            x-X-X-X|
//     2secInterval2 :                 2-2-2-2|
//     2secInterval3 :                      X-X-X-X|
//     sub           : ------0-0-0X0X-X2X2-2X2X-X-X|
//     */
//}

//: # FlatMapLatest
//example(of: "flatMapLatest") {
//    let observable5sec = Observable<Int>
//        .interval(.seconds(5), scheduler: MainScheduler.instance)
//        .take(4)
//
//    observable5sec.flatMapLatest { (n: Int) -> Observable<Int> in
//        let observable2sec = Observable<Int>
//            .interval(.seconds(2), scheduler: MainScheduler.instance)
//            .take(4)
//            .map { _ in n }
//        return observable2sec
//    }.subscribe {
//        print("Result : \($0)")
//    }
//}

//: # GroupBy
//example(of: "groupBy") {
//    // Int타입의 Observable들을 받아서 그룹화 후 Observable<String>으로 변환
//    let observable: Observable<String> = Observable.from([1, 2, 3, 4, 5])
//        .groupBy { i -> String in
//            if i % 2 == 0 { return "even" }
//            else { return "odd" }
//        }
//        .flatMap { i -> Observable<String> in
//            if i.key == "even" {
//                return i.map { "even \($0)" }
//            } else {
//                return i.map { "odd \($0)" }
//            }
//        }
//
//    observable.subscribe(
//        onNext: { print($0) }
//    ).dispose()
//}

//: # Buffer
//example(of: "buffer") {
//    let observable = Observable<Int>
//        .interval(.seconds(1), scheduler: MainScheduler.instance)
//        .buffer(timeSpan: .seconds(10), count: 3, scheduler: MainScheduler.instance)
//        .take(5)
//
//    observable.subscribe(
//        onNext: { print($0) },
//        onCompleted: { print("Completed") }
//    )
//}

//: [Next](@next)
