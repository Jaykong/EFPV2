//
//  SearchResultViewModel.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/2.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
struct SearchRecordViewModel {
    
    
    let sectionOfRecent = Observable<[SectionOfRecentSearchRecord]>.create { (observer) -> Disposable in
        let sharedRecord = RecentSearchRecordStore.shared
        let completedSection = SectionOfRecentSearchRecord(title: "Others", items: ["#Completed Classes"])
        guard sharedRecord.count > 0 else {

            observer.onNext([completedSection])
            return Disposables.create()
        }

        let recentSection = SectionOfRecentSearchRecord(title: "Recent", items: sharedRecord.recentRecord)

        observer.onNext([recentSection, completedSection])

        return Disposables.create()
    }
    
    func onSelectCell(at indexPath:IndexPath,model: String) {
        var searchResultViewModel = SearchResultViewModel()
        let selected = Variable<String>(model)
        searchResultViewModel.selectedModel = selected
        
        
        
        //let scene = EFPRecentSessionScene.searchResult(searchResultViewModel)
        
        
       // EFPSceneRouter.shared.transit(to: scene, transitionType: .modal)
    }
    
    func onTextDidBeginEditing(_ searchBar:UISearchBar) {
        var searchResultViewModel = SearchResultViewModel()
        let selected = Variable<String>(searchBar.text!)
        searchResultViewModel.selectedModel = selected
        let scene = EFPRecentSessionScene.searchResult(searchResultViewModel)
        EFPSceneRouter.shared.transit(to: scene, transitionType: .modal)

    }
    
    func pop() {
        EFPSceneRouter.shared.pop()
    }
}
