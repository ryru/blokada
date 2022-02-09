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

var TAB_VIEW_HEIGHT = 80.0

struct TabVerticalView: View {

    @Environment(\.safeAreaInsets) var safeAreaInsets
    @ObservedObject var vm = ViewModels.tab

    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .leading, spacing: 24) {
                TabItemView(id: .Home, icon: "blokada", text: L10n.mainTabHome, badge: nil)
                TabItemView(id: .Activity, icon: "chart.bar", text: L10n.mainTabActivity, badge: nil)
                TabItemView(id: .Advanced, icon: "cube", text: L10n.mainTabAdvanced, badge: nil)
                Spacer()
                TabItemView(id: .Settings, icon: "gear", text: L10n.mainTabSettings, badge: nil)
            }
            .padding([.top, .bottom], 16)
            Spacer()

            Rectangle()
                .fill(Color(UIColor.systemGray4))
                .frame(width: 1)
        }
        .padding(.top, self.safeAreaInsets.top)
        //.padding(.bottom, self.safeAreaInsets.bottom)
        .frame(width: TAB_VIEW_HEIGHT)
        .background(.ultraThinMaterial)
    }
}

struct TabVerticalView_Previews: PreviewProvider {
    static var previews: some View {
        let inbox = TabViewModel()
        inbox.activeTab = .Activity

        let packs = TabViewModel()
        packs.activeTab = .Advanced
        //packs.packsBadge = 1

        let account = TabViewModel()
        account.activeTab = .Settings


        return Group {
            TabVerticalView()
                .previewLayout(.sizeThatFits)
            TabVerticalView(vm: packs)
                .previewLayout(.sizeThatFits)
            TabVerticalView(vm: account)
                .previewLayout(.sizeThatFits)
                .environment(\.colorScheme, .dark)
            TabVerticalView(vm: inbox)
                .previewLayout(.sizeThatFits)
                .environment(\.colorScheme, .dark)
                .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
                .environment(\.locale, .init(identifier: "pl"))
        }
    }
}
