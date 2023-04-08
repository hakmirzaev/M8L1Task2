import SwiftUI
import Alamofire

struct HomeScreen: View {
    
    @ObservedObject var viewModel = UserViewModel()
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack(alignment: .leading){
                    HStack{
                        Text("login: ").fontWeight(.bold)
                        Text(viewModel.user.login!)
                    }
                    HStack{
                        Text("name: ").fontWeight(.bold)
                        Text(viewModel.user.name!)
                    }
                    HStack{
                        Text("url:: ").fontWeight(.bold)
                        Text(self.viewModel.user.url!)
                    }
                    HStack{
                        Text("type:: ").fontWeight(.bold)
                        Text(self.viewModel.user.type!)
                    }
                    HStack{
                        Text("repositories:: ").fontWeight(.bold)
                        Text(String(self.viewModel.user.public_repos!))
                    }
                    HStack{
                        Text("followers:: ").fontWeight(.bold)
                        Text(String(self.viewModel.user.followers!))
                    }
                    HStack{
                        Text("following:: ").fontWeight(.bold)
                        Text(String(self.viewModel.user.following!))
                    }
                    Spacer()
                }
                if self.viewModel.isLoading {
                    ProgressView()
                }
            }
            .navigationBarTitle("User")
        }.onAppear{
            self.viewModel.apiUserSingle(login: "hakmirzaev")
            print(viewModel.user)
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
