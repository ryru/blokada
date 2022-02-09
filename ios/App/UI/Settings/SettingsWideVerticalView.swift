//
//  This file is part of Blokada.
//
//  This Source Code Form is subject to the terms of the Mozilla Public
//  License, v. 2.0. If a copy of the MPL was not distributed with this
//  file, You can obtain one at https://mozilla.org/MPL/2.0/.
//
//  Copyright © 2020 Blocka AB. All rights reserved.
//
//  @author Karol Gusak
//

import SwiftUI

// The root of Settings tab for big screen landscape mode.
struct SettingsWideVerticalView: View {

    @Environment(\.safeAreaInsets) var safeAreaInsets
    @ObservedObject var tabVM = ViewModels.tab

    var body: some View {
        ZStack {
            HStack(spacing: 0) {
                SettingsFormNoNavView()
                .frame(width: 340)
                .padding(.bottom, self.safeAreaInsets.bottom)

                ZStack {
                    if self.tabVM.isSection("manage") {
                        AccountView()
                    } else if self.tabVM.isSection("leases") {
                        LeaseListView()
                    } else if self.tabVM.isSection("logRetention") {
                        NoLogRetentionView()
                    } else if self.tabVM.isSection("changeaccount") {
                        ChangeAccountView()
                    } else {
                        PlaceholderPaneView(title: L10n.mainTabSettings)
                    }
                }
                .padding(.top, self.safeAreaInsets.top)
                .background(Color.cBackground)
            }
            // Blur bg below top bar
            VStack {
                HStack {
                    EmptyView()
                    Spacer()
                }
                .frame(height: self.safeAreaInsets.top)
                .background(.ultraThinMaterial)
                Spacer()
            }
        }
    }
}

struct SettingsWideVerticalView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsWideVerticalView()
    }
}
