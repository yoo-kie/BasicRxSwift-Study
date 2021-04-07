//
//  ViewController.swift
//  RxSwiftBasic
//
//  Created by 유연주 on 2021/03/04.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    private let disposeBag = DisposeBag()
    lazy var rxSwitch: UISwitch = {
        let mySwitch: UISwitch = UISwitch()
        self.view.addSubview(mySwitch)
        mySwitch.translatesAutoresizingMaskIntoConstraints = false
        mySwitch.topAnchor.constraint(
            equalTo: self.view.safeAreaLayoutGuide.topAnchor,
            constant: 10
        ).isActive = true
        mySwitch.leftAnchor.constraint(
            equalTo: self.view.safeAreaLayoutGuide.leftAnchor,
            constant: 10
        ).isActive = true
        
        return mySwitch
    }()
    lazy var titleLabel: UILabel = {
        let myLabel = UILabel()
        self.view.addSubview(myLabel)
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.topAnchor.constraint(
            equalTo: self.rxSwitch.safeAreaLayoutGuide.bottomAnchor,
            constant: 10
        ).isActive = true
        myLabel.leftAnchor.constraint(
            equalTo: self.view.safeAreaLayoutGuide.leftAnchor,
            constant: 10
        ).isActive = true
        
        return myLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // sequence가 있을 때-!
        rxSwitch.rx.isOn.map { $0 ? "ON" : "OFF" }
            .subscribe(
                onNext: { self.titleLabel.text = $0 }
            )
            .disposed(by: disposeBag)

        rxSwitch.rx.isOn.map { $0 ? "ON" : "OFF" }
            .subscribe(titleLabel.rx.text)
            .disposed(by: disposeBag)

        // 적합-!
        rxSwitch.rx.isOn.map { $0 ? "ON" : "OFF" }
            .bind(to: titleLabel.rx.text)
            .disposed(by: disposeBag)

        // 좀 더 UI작업이 명확할 때?
        let observable = Observable<Int>
            .create { observer -> Disposable in
                observer.onNext(1)
                observer.onNext(2)
                observer.onNext(3)
                observer.onError(NSError(domain: "", code: 100, userInfo: nil))
                return Disposables.create { }
        }

        let driver = observable.asDriver(onErrorJustReturn: 404)
        driver
            .map { "\($0)" }
            .drive(titleLabel.rx.text)
            .disposed(by: disposeBag)
    }

}

