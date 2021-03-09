//: [Previous](@previous)

import Foundation
import RxSwift

//: # just, of, from 오퍼레이터
example(of: "just, of, from") {
    // 1
    let one = 1
    let two = 2
    let three = 3
  
    // 2
    let observable = Observable<Int>.just(one)

    // 3
    let observable2 = Observable.of(one, two, three)

    // 4
    let observable3 = Observable.of([one, two, three])
    
    // 5
    let observable4 = Observable.from([one, two, three])
}
//: # Subscribing to observables
example(of: "subscribe") {
    let one = 1
    let two = 2
    let three = 3
  
    let observable = Observable.of(one, two, three)

    observable.subscribe { event in
      print(event)
    }
    
    observable.subscribe { event in
        if let element = event.element {
            print(element)
        }
    }
    
    observable.subscribe(onNext: { element in
        print(element)
    })
}
//: ## empty observable
example(of: "empty") {
    let observable = Observable<Void>.empty()
    
    observable.subscribe(
        // 1
        onNext: { element in
            print(element)
        },
      
        // 2
        onCompleted: {
            print("Completed")
        }
    )
}
//: ## never observable
example(of: "never") {
    let observable = Observable<Void>.never()
  
    observable.subscribe(
        onNext: { element in
            print(element)
        },
        onCompleted: {
            print("Completed")
        }
    )
}
//: ## range observable
example(of: "range") {
    // 1
    let observable = Observable<Int>.range(start: 1, count: 10)
  
    observable.subscribe(onNext: { i in
        // 2
        let n = Double(i)
      
        let fibonacci = Int(((pow(1.61803, n) - pow(0.61803, n)) / 2.23606).rounded()
      )
      
      print(fibonacci)
  })
}
//: # Disposing and terminating
example(of: "dispose") {
    // 1
    let observable = Observable.of("A", "B", "C")
  
    // 2
    let subscription = observable.subscribe { event in
        // 3
        print(event)
    }
    
    subscription.dispose()
}
//: ## DisposeBag
example(of: "DisposeBag") {
    // 1
    let disposeBag = DisposeBag()
  
    // 2
    Observable.of("A", "B", "C").subscribe { // 3
        print($0)
    }.disposed(by: disposeBag) // 4
}
//: ## create
example(of: "create") {
    let disposeBag = DisposeBag()
  
    Observable<String>.create { observer in
        // 1
        observer.onNext("1")
          
        // 2
        observer.onCompleted()
          
        // 3
        observer.onNext("?")
          
        // 4
        return Disposables.create()
    }.subscribe(
        onNext: { print($0) },
        onError: { print($0) },
        onCompleted: { print("Completed") },
        onDisposed: { print("Disposed") }
    ).disposed(by: disposeBag)
}
//: ## create with Error Handling
example(of: "create") {
    enum MyError: Error {
        case anError
    }
  
    let disposeBag = DisposeBag()
  
    Observable<String>.create { observer in
        // 1
        observer.onNext("1")
    
        observer.onError(MyError.anError)
    
        // 2
        observer.onCompleted()
    
        // 3
        observer.onNext("?")
    
        // 4
        return Disposables.create()
    }.subscribe(
        onNext: { print($0) },
        onError: { print($0) },
        onCompleted: { print("Completed") },
        onDisposed: { print("Disposed") }
    ).disposed(by: disposeBag)
}

//: [Next](@next)
