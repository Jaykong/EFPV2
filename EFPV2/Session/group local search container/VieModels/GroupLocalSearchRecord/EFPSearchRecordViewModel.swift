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

struct EFPSearchRecordViewModel {
   // var sectionOfRecent: Observable<[SectionOfRecentSearchRecord]>
    
    
    


    func onSelectCell(at indexPath: IndexPath, model: String) {
        let viewModel = EFPSearchResultViewModel()

        let scene = EFPRecentSessionScene.searchResult(viewModel)

         EFPSceneRouter.shared.transit(to: scene, transitionType: .modal)
    }
    /*
    func onSelectCell(at indexPath:IndexPath,model: String) {
        var searchResultViewModel = SearchResultViewModel()
        let selected = Variable<String>(model)
        searchResultViewModel.selectedModel = selected
        
        
        
        //let scene = EFPRecentSessionScene.searchResult(searchResultViewModel)
        
        
       // EFPSceneRouter.shared.transit(to: scene, transitionType: .modal)
    }
    */
    func onTextDidBeginEditing(_ searchBar: UISearchBar) {
        var searchResultViewModel = EFPSearchResultViewModel()
        let selected = Variable<String>(searchBar.text!)
        searchResultViewModel.selectedModel = selected
        let scene = EFPRecentSessionScene.searchResult(searchResultViewModel)
        EFPSceneRouter.shared.transit(to: scene, transitionType: .modal)

    }

    func pop() {
        EFPSceneRouter.shared.pop()
    }
}
