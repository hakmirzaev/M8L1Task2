
import Foundation

class UserViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var user = User()
    
    func apiUserSingle(login: String){
        isLoading = true
        AFHTTp.get(url: AFHTTp.API_USER_SINGLE + String(login), params: AFHTTp.paramsEmpty(), handler: { response in
            self.isLoading = false
            switch response.result {
            case .success:
                let user = try? JSONDecoder().decode(User.self, from: response.data!)
                print(user!)
                self.user = user!
            case let .failure(error):
                print(error)
            }
        })
    }
    
}
