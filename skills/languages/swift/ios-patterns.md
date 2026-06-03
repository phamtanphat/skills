# iOS Development — Swift Patterns

## SwiftUI Best Practices
```swift
// ✅ Tách View và ViewModel
struct UserProfileView: View {
    @StateObject private var viewModel = UserProfileViewModel()
    
    var body: some View {
        // UI chỉ hiển thị data, không có logic
        UserInfoCard(user: viewModel.user)
            .onAppear { viewModel.loadUser() }
    }
}

// ViewModel xử lý logic
@MainActor
class UserProfileViewModel: ObservableObject {
    @Published var user: User?
    
    func loadUser() async {
        user = try? await userService.fetchCurrentUser()
    }
}
```

## Naming Convention
- File: `PascalCase.swift`
- Type/Protocol: `PascalCase`
- Variable/function: `camelCase`

## TODO: Thêm patterns khi cần
- [ ] Combine patterns
- [ ] CoreData best practices
- [ ] Network layer (URLSession/Alamofire)
