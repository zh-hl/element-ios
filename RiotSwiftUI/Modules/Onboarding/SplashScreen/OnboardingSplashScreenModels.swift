// 
// Copyright 2021 New Vector Ltd
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import SwiftUI

// MARK: - Coordinator

/// The content displayed in a single splash screen page.
struct OnboardingSplashScreenPageContent {
    let title: String
    let message: String
    let image: ImageAsset
    let darkImage: ImageAsset
    let gradient: Gradient
}

// MARK: View model

enum OnboardingSplashScreenViewModelResult {
    case register
    case login
}

// MARK: View

struct OnboardingSplashScreenViewState: BindableState, CustomDebugStringConvertible {
    
    // MARK: - Constants
    
    private enum Constants {
        static let gradientColors = [
            Color(red: 0.95, green: 0.98, blue: 0.96),
            Color(red: 0.89, green: 0.96, blue: 0.97),
            Color(red: 0.95, green: 0.89, blue: 0.97),
            Color(red: 0.81, green: 0.95, blue: 0.91),
            Color(red: 0.95, green: 0.98, blue: 0.96)
        ]
    }
    
    // MARK: - Properties
    
    /// An array containing all content of the carousel pages
    let content: [OnboardingSplashScreenPageContent]
    var bindings: OnboardingSplashScreenBindings
    
    /// Custom debug description to reduce noise in the logs.
    var debugDescription: String {
        "OnboardingSplashScreenViewState at page \(bindings.pageIndex)."
    }
    
    init() {
        // The pun doesn't translate, so we only use it for English.
        let locale = Locale.current
        let page4Title = locale.identifier.hasPrefix("en") ? "Cut the slack from teams." : VectorL10n.onboardingSplashPage4TitleNoPun
        
        self.content = [
            OnboardingSplashScreenPageContent(title: VectorL10n.onboardingSplashPage1Title,
                                              message: VectorL10n.onboardingSplashPage1Message,
                                              image: Asset.Images.onboardingSplashScreenPage1,
                                              darkImage: Asset.Images.onboardingSplashScreenPage1Dark,
                                              gradient: Gradient(colors: [Constants.gradientColors[0], Constants.gradientColors[1]])),
            OnboardingSplashScreenPageContent(title: VectorL10n.onboardingSplashPage2Title,
                                              message: VectorL10n.onboardingSplashPage2Message,
                                              image: Asset.Images.onboardingSplashScreenPage2,
                                              darkImage: Asset.Images.onboardingSplashScreenPage2Dark,
                                              gradient: Gradient(colors: [Constants.gradientColors[1], Constants.gradientColors[2]])),
            OnboardingSplashScreenPageContent(title: VectorL10n.onboardingSplashPage3Title,
                                              message: VectorL10n.onboardingSplashPage3Message,
                                              image: Asset.Images.onboardingSplashScreenPage3,
                                              darkImage: Asset.Images.onboardingSplashScreenPage3Dark,
                                              gradient: Gradient(colors: [Constants.gradientColors[2], Constants.gradientColors[3]])),
            OnboardingSplashScreenPageContent(title: page4Title,
                                              message: VectorL10n.onboardingSplashPage4Message,
                                              image: Asset.Images.onboardingSplashScreenPage4,
                                              darkImage: Asset.Images.onboardingSplashScreenPage4Dark,
                                              gradient: Gradient(colors: [Constants.gradientColors[3], Constants.gradientColors[4]])),
        ]
        self.bindings = OnboardingSplashScreenBindings()
    }
}

struct OnboardingSplashScreenBindings {
    var pageIndex = 0
}

enum OnboardingSplashScreenViewAction {
    case register
    case login
    case nextPage
    case previousPage
    case hiddenPage
}
