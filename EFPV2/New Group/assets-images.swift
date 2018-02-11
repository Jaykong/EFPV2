// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSImage
  typealias AssetColorTypeAlias = NSColor
  typealias Image = NSImage
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIImage
  typealias AssetColorTypeAlias = UIColor
  typealias Image = UIImage
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

@available(*, deprecated, renamed: "ImageAsset")
typealias AssetType = ImageAsset

struct ImageAsset {
  fileprivate var name: String

  var image: Image {
    let bundle = Bundle(for: BundleToken.self)
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    let image = bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else { fatalError("Unable to load image named \(name).") }
    return result
  }
}

struct ColorAsset {
  fileprivate var name: String

  #if swift(>=3.2)
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, OSX 10.13, *)
  var color: AssetColorTypeAlias {
    return AssetColorTypeAlias(asset: self)
  }
  #endif
}

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
enum Asset {
  static let _145852 = ImageAsset(name: "145852")
  enum Country {
    static let flagChina = ImageAsset(name: "flag_china")
    static let flagChinaNoname = ImageAsset(name: "flag_china_noname")
    static let flagIndonesia = ImageAsset(name: "flag_indonesia")
    static let flagIndonesiaNoname = ImageAsset(name: "flag_indonesia_noname")
    static let flagRussia = ImageAsset(name: "flag_russia")
    static let flagRussiaNoname = ImageAsset(name: "flag_russia_noname")
  }
  enum NavigationBar {
    static let naviBack = ImageAsset(name: "navi_back")
    static let naviSearch = ImageAsset(name: "navi_search")
    static let naviUser = ImageAsset(name: "navi_user")
    static let navigationbarArrowDown = ImageAsset(name: "navigationbar_arrow_down")
    static let navigationbarArrowUp = ImageAsset(name: "navigationbar_arrow_up")
    static let navigationbarBackWithtext = ImageAsset(name: "navigationbar_back_withtext")
    static let navigationbarBackWithtextHighlighted = ImageAsset(name: "navigationbar_back_withtext_highlighted")
    static let navigationbarFriendsearch = ImageAsset(name: "navigationbar_friendsearch")
    static let navigationbarFriendsearchHighlighted = ImageAsset(name: "navigationbar_friendsearch_highlighted")
    static let navigationbarIconRadar = ImageAsset(name: "navigationbar_icon_radar")
    static let navigationbarIconRadarAperture = ImageAsset(name: "navigationbar_icon_radar_aperture")
    static let navigationbarPop = ImageAsset(name: "navigationbar_pop")
    static let navigationbarPopHighlighted = ImageAsset(name: "navigationbar_pop_highlighted")
  }
  enum TabBar {
    static let composeSlogan = ImageAsset(name: "compose_slogan")
    static let mainBadge = ImageAsset(name: "main_badge")
    static let tabbarBackground = ImageAsset(name: "tabbar_background")
    static let tabbarComposeBackgroundIconClose = ImageAsset(name: "tabbar_compose_background_icon_close")
    static let tabbarComposeBackgroundIconReturn = ImageAsset(name: "tabbar_compose_background_icon_return")
    static let tabbarComposeButton = ImageAsset(name: "tabbar_compose_button")
    static let tabbarComposeButtonHighlighted = ImageAsset(name: "tabbar_compose_button_highlighted")
    static let tabbarComposeCamera = ImageAsset(name: "tabbar_compose_camera")
    static let tabbarComposeFriend = ImageAsset(name: "tabbar_compose_friend")
    static let tabbarComposeIconAdd = ImageAsset(name: "tabbar_compose_icon_add")
    static let tabbarComposeIconAddHighlighted = ImageAsset(name: "tabbar_compose_icon_add_highlighted")
    static let tabbarComposeIdea = ImageAsset(name: "tabbar_compose_idea")
    static let tabbarComposeLbs = ImageAsset(name: "tabbar_compose_lbs")
    static let tabbarComposeMore = ImageAsset(name: "tabbar_compose_more")
    static let tabbarComposeMusic = ImageAsset(name: "tabbar_compose_music")
    static let tabbarComposePhoto = ImageAsset(name: "tabbar_compose_photo")
    static let tabbarComposeReview = ImageAsset(name: "tabbar_compose_review")
    static let tabbarComposeShooting = ImageAsset(name: "tabbar_compose_shooting")
    static let tabbarComposeTransfer = ImageAsset(name: "tabbar_compose_transfer")
    static let tabbarComposeWbcamera = ImageAsset(name: "tabbar_compose_wbcamera")
    static let tabbarComposeWeibo = ImageAsset(name: "tabbar_compose_weibo")
    static let tabbarDiscover = ImageAsset(name: "tabbar_discover")
    static let tabbarDiscoverSelected = ImageAsset(name: "tabbar_discover_selected")
    static let tabbarHome = ImageAsset(name: "tabbar_home")
    static let tabbarHomeSelected = ImageAsset(name: "tabbar_home_selected")
    static let tabbarHomepageNormal = ImageAsset(name: "tabbar_homepage_normal")
    static let tabbarHomepageSelected = ImageAsset(name: "tabbar_homepage_selected")
    static let tabbarMessageCenter = ImageAsset(name: "tabbar_message_center")
    static let tabbarMessageCenterSelected = ImageAsset(name: "tabbar_message_center_selected")
    static let tabbarMessagesNormal = ImageAsset(name: "tabbar_messages_normal")
    static let tabbarMessagesSelected = ImageAsset(name: "tabbar_messages_selected")
    static let tabbarProfile = ImageAsset(name: "tabbar_profile")
    static let tabbarProfileSelected = ImageAsset(name: "tabbar_profile_selected")
    static let tabbarScheduleNormal = ImageAsset(name: "tabbar_schedule_normal")
    static let tabbarScheduleSelected = ImageAsset(name: "tabbar_schedule_selected")
    static let tabbarStudyNormal = ImageAsset(name: "tabbar_study_normal")
    static let tabbarStudySelected = ImageAsset(name: "tabbar_study_selected")
  }
  enum Chat {
    static let bkMediaPictureNormal = ImageAsset(name: "bk_media_picture_normal")
    static let bkMediaPicturePressed = ImageAsset(name: "bk_media_picture_pressed")
    static let bkMediaShootNormal = ImageAsset(name: "bk_media_shoot_normal")
    static let bkMediaShootPressed = ImageAsset(name: "bk_media_shoot_pressed")
    static let bkVoiceCall = ImageAsset(name: "bk_voice_call")
    static let bkVoiceCallPressed = ImageAsset(name: "bk_voice_call_pressed")
    static let groupIcon = ImageAsset(name: "group_icon")
    static let iconInputTextBg = ImageAsset(name: "icon_input_text_bg")
    static let iconReceiverNodeNormal = ImageAsset(name: "icon_receiver_node_normal")
    static let iconReceiverNodePressed = ImageAsset(name: "icon_receiver_node_pressed")
    static let iconSenderTextNodeNormal = ImageAsset(name: "icon_sender_text_node_normal")
    static let iconSenderTextNodePressed = ImageAsset(name: "icon_sender_text_node_pressed")
    static let iconToolviewAddNormal = ImageAsset(name: "icon_toolview_add_normal")
    static let iconToolviewAddPressed = ImageAsset(name: "icon_toolview_add_pressed")
    static let iconToolviewVoiceNormal = ImageAsset(name: "icon_toolview_voice_normal")
    static let iconToolviewVoicePressed = ImageAsset(name: "icon_toolview_voice_pressed")
  }
  static let group = ImageAsset(name: "group")
  static let iconSessionInfoNormal = ImageAsset(name: "icon_session_info_normal")
  static let iconSessionInfoPressed = ImageAsset(name: "icon_session_info_pressed")
  enum Tableview {
    static let tableviewArrow = ImageAsset(name: "tableview_arrow")
  }

  // swiftlint:disable trailing_comma
  static let allColors: [ColorAsset] = [
  ]
  static let allImages: [ImageAsset] = [
    _145852,
    Country.flagChina,
    Country.flagChinaNoname,
    Country.flagIndonesia,
    Country.flagIndonesiaNoname,
    Country.flagRussia,
    Country.flagRussiaNoname,
    NavigationBar.naviBack,
    NavigationBar.naviSearch,
    NavigationBar.naviUser,
    NavigationBar.navigationbarArrowDown,
    NavigationBar.navigationbarArrowUp,
    NavigationBar.navigationbarBackWithtext,
    NavigationBar.navigationbarBackWithtextHighlighted,
    NavigationBar.navigationbarFriendsearch,
    NavigationBar.navigationbarFriendsearchHighlighted,
    NavigationBar.navigationbarIconRadar,
    NavigationBar.navigationbarIconRadarAperture,
    NavigationBar.navigationbarPop,
    NavigationBar.navigationbarPopHighlighted,
    TabBar.composeSlogan,
    TabBar.mainBadge,
    TabBar.tabbarBackground,
    TabBar.tabbarComposeBackgroundIconClose,
    TabBar.tabbarComposeBackgroundIconReturn,
    TabBar.tabbarComposeButton,
    TabBar.tabbarComposeButtonHighlighted,
    TabBar.tabbarComposeCamera,
    TabBar.tabbarComposeFriend,
    TabBar.tabbarComposeIconAdd,
    TabBar.tabbarComposeIconAddHighlighted,
    TabBar.tabbarComposeIdea,
    TabBar.tabbarComposeLbs,
    TabBar.tabbarComposeMore,
    TabBar.tabbarComposeMusic,
    TabBar.tabbarComposePhoto,
    TabBar.tabbarComposeReview,
    TabBar.tabbarComposeShooting,
    TabBar.tabbarComposeTransfer,
    TabBar.tabbarComposeWbcamera,
    TabBar.tabbarComposeWeibo,
    TabBar.tabbarDiscover,
    TabBar.tabbarDiscoverSelected,
    TabBar.tabbarHome,
    TabBar.tabbarHomeSelected,
    TabBar.tabbarHomepageNormal,
    TabBar.tabbarHomepageSelected,
    TabBar.tabbarMessageCenter,
    TabBar.tabbarMessageCenterSelected,
    TabBar.tabbarMessagesNormal,
    TabBar.tabbarMessagesSelected,
    TabBar.tabbarProfile,
    TabBar.tabbarProfileSelected,
    TabBar.tabbarScheduleNormal,
    TabBar.tabbarScheduleSelected,
    TabBar.tabbarStudyNormal,
    TabBar.tabbarStudySelected,
    Chat.bkMediaPictureNormal,
    Chat.bkMediaPicturePressed,
    Chat.bkMediaShootNormal,
    Chat.bkMediaShootPressed,
    Chat.bkVoiceCall,
    Chat.bkVoiceCallPressed,
    Chat.groupIcon,
    Chat.iconInputTextBg,
    Chat.iconReceiverNodeNormal,
    Chat.iconReceiverNodePressed,
    Chat.iconSenderTextNodeNormal,
    Chat.iconSenderTextNodePressed,
    Chat.iconToolviewAddNormal,
    Chat.iconToolviewAddPressed,
    Chat.iconToolviewVoiceNormal,
    Chat.iconToolviewVoicePressed,
    group,
    iconSessionInfoNormal,
    iconSessionInfoPressed,
    Tableview.tableviewArrow,
  ]
  // swiftlint:enable trailing_comma
  @available(*, deprecated, renamed: "allImages")
  static let allValues: [AssetType] = allImages
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

extension Image {
  @available(iOS 1.0, tvOS 1.0, watchOS 1.0, *)
  @available(OSX, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init!(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = Bundle(for: BundleToken.self)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(OSX) || os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

extension AssetColorTypeAlias {
  #if swift(>=3.2)
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, OSX 10.13, *)
  convenience init!(asset: ColorAsset) {
    let bundle = Bundle(for: BundleToken.self)
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    self.init(named: asset.name, bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
  #endif
}

private final class BundleToken {}
