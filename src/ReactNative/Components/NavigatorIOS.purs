-- | See [NavigatorIOS](https://facebook.github.io/react-native/docs/navigatorios.html)
module ReactNative.Components.NavigatorIOS (
    NavigatorIOS, navigatorIOS', NavigatorIOSProps
  , push, pop, Route, RouteM, RouteO, RouteDefaults, mkRoute
) where

import Prelude
import Effect (Effect)
import ReactNative.Optional (class Optional)
import React (ReactElement, ReactThis)
import ReactNative.Events (UnitEventHandler)
import ReactNative.PropTypes (ImageSource, RefType)
import ReactNative.PropTypes.Color (Color)
import ReactNative.Styles (Styles)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import ReactNative.Unsafe.Components (navigatorIOSU)
import Unsafe.Coerce (unsafeCoerce)

newtype NavigatorIOS = NavigatorIOS (forall props state. ReactThis props state)

type RouteDefaults r = (
    barTintColor :: Color
  , navigationBarHidden :: Boolean
  , shadowHidden :: Boolean
  , tintColor :: Color
  , titleTextColor :: Color
  , translucent :: Boolean
  | r
)

foreign import data Route :: Type

type RouteM props o = {
    title :: String
  , component :: { navigator :: NavigatorIOS | props } -> ReactElement
  , passProps :: {|props}
  | o
}

type RouteO = RouteDefaults (
    titleImage :: ImageSource
  , backButtonIcon :: ImageSource
  , backButtonTitle :: String
  , leftButtonIcon :: ImageSource
  , leftButtonTitle :: String
  , leftButtonSystemIcon :: String -- Object.keys(SystemIcons)
  , onLeftButtonPress :: UnitEventHandler
  , rightButtonIcon :: ImageSource
  , rightButtonTitle :: String
  , rightButtonSystemIcon :: String -- Object.keys(SystemIcons)
  , onRightButtonPress :: UnitEventHandler
  , wrapperStyle :: Styles
)

type NavigatorIOSProps o = {
  initialRoute :: Route
  | o
}

type NavigatorIOSPropsO = RouteDefaults (
    ref :: RefType NavigatorIOS
  , interactivePopGestureEnabled :: Boolean
  , itemWrapperStyle :: Styles
  , style :: Styles
)

mkRoute :: forall props o
  .  Optional o RouteO
  => RouteM props o -> Route
mkRoute = unsafeCoerce

-- | Create a NavigatorIOS with the given props and initialRoute
navigatorIOS' :: forall o
  .  Optional o NavigatorIOSPropsO
  => NavigatorIOSProps o -> ReactElement
navigatorIOS' = navigatorIOSU <<< unsafeApplyProps

foreign import push :: NavigatorIOS -> Route -> Effect Unit

foreign import pop :: NavigatorIOS -> Effect Unit
