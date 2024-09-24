//
//  HomeContract.swift
//  PodcastApp
//
//  Created by Şehriban Yıldırım on 20.09.2024.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewHomeProtocol {
    func showMessage(message: String)
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterHomeProtocol {
    func onLikePressed(index:Int)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorHomeProtocol {
    
    var presenter: InteractorToPresenterHomeProtocol? { get set }
    
    func saveLikeIndexToDatabase(index:Int)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterHomeProtocol {
    func showSuccess()
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterHomeProtocol {
    func navigateToDetail()
}
