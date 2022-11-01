//
//  RocketsPageViewController.swift
//  SpaceX
//
//  Created by Mikhail on 01.11.2022.
//

import UIKit

class RocketsPageViewController: UIPageViewController {
    
    // MARK: - Private properties
    private lazy var rocketsPages: [UIViewController] = {
        let firstRocket = RocketsViewController()
        let secondRocket = RocketsViewController()
        let thirdRocket = RocketsViewController()
        return [firstRocket, secondRocket, thirdRocket]
    }()
    
    // MARK: - Initialization
    override init(transitionStyle style: UIPageViewController.TransitionStyle,
                  navigationOrientation: UIPageViewController.NavigationOrientation,
                  options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation)
        setViewControllers([rocketsPages[0]], direction: .forward, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setDelegates()
    }
    
    // MARK: - Private methods
    private func setupView() {
        
    }
    
    private func setDelegates() {
        dataSource = self
        delegate = self
    }
}


// MARK: - UIPageViewControllerDataSource
extension RocketsPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = rocketsPages.firstIndex(of: viewController) {
            if index > 0 {
                return rocketsPages[index - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = rocketsPages.firstIndex(of: viewController) {
            if index < rocketsPages.count - 1 {
                return rocketsPages[index + 1]
            }
        }
        return nil
    }
}


// MARK: - UIPageViewControllerDelegate
extension RocketsPageViewController: UIPageViewControllerDelegate {
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return rocketsPages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        0
    }
}
