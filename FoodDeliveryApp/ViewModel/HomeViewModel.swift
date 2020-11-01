import UIKit

class HomeViewModel: NSObject {
    
    var categoryList = [MenuCategoryModel]()
    
    private let manager = RepositoryManager(with: CategoryMenuRepositoryMock())

}

//MARK:- WebServies

extension HomeViewModel: HomeViewModelProtocol {

    func categoryMenuList(completion: @escaping(Bool, String, [MenuCategoryModel]?) -> Void) {

        if let result = manager.getAll() {

            self.categoryList = result

            completion(true, "", self.categoryList)

        } else {

            completion(true, "", nil)

        }

    }
    
}

