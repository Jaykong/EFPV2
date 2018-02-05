//: Playground - noun: a place where people can play

import RxSwift

let dispoaseBag = DisposeBag()
let observable = Observable<Int>.create { (observer) -> Disposable in

    observer.onNext(10)

    observer.onNext(11)
    // observer.onCompleted()

    return Disposables.create()
}

let subscription1 = observable.subscribe({
    print($0)
})
subscription1.disposed(by: dispoaseBag)

let subscription2 = observable.subscribe(onNext: {
    print($0)
})





   

    
    



