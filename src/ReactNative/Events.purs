module ReactNative.Events where

import Effect.Uncurried (EffectFn1, EffectFn2)
import Prelude (Unit)

type TouchEvent = {
  nativeEvent :: {
      identifier :: Int
    , locationX :: Number
    , locationY :: Number
    , pageX :: Number
    , pageY :: Number
    , timestamp :: Int
  }
}

type LayoutEvent = {
  nativeEvent :: {
    layout :: {
        x :: Int
      , y :: Int
      , width :: Int
      , height :: Int
    }
  }
}

type TextInputEvent = {
  nativeEvent :: {
    text :: String
  }
}

type ContentSizeEvent = {
  nativeEvent :: {
    contentSize :: { width :: Int, height :: Int }
  }
}

type ScrollEvent = {
  nativeEvent :: {
    contentOffset :: {x::Number, y::Number}
  }
}

type EventHandler a = EffectFn1 a Unit

type EventHandler2 a b = EffectFn2 a b Unit

type UnitEventHandler = EffectFn1 Unit Unit
