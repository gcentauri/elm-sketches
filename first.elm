import OpenSolid.Geometry.Types exposing (..)
import OpenSolid.Point2d as Point2d
import OpenSolid.Circle2d as Circle2d
import OpenSolid.Svg as Svg
import Svg exposing (Svg)
import Svg.Attributes as Attributes
import Html exposing (Html)

leftSail : Svg Never
leftSail =
    Svg.triangle2d
        [ Attributes.stroke "orange"
        , Attributes.strokeWidth "2"
        , Attributes.fill "teal"
        ]
        (Triangle2d
             ( Point2d (200, 100)
             , Point2d (200, 300)
             , Point2d (100, 300)
             )
        )

rightSail : Svg Never
rightSail =
    Svg.triangle2d
        [ Attributes.stroke "orange"
        , Attributes.strokeWidth "2"
        , Attributes.fill "teal"
        ]
        (Triangle2d
             ( Point2d (210, 110)
             , Point2d (220, 280)
             , Point2d (320, 260)
             )
        )

hull : Svg Never
hull =
    Svg.polygon2d
        [ Attributes.stroke "black"
        , Attributes.strokeWidth "2"
        , Attributes.fill "brown"
        ]
        (Polygon2d
             [ Point2d ( 120, 310 )
             , Point2d ( 140, 330 )
             , Point2d ( 380, 330 )
             , Point2d ( 400, 310 )
             ]
        )

sky : Svg Never
sky =
    Svg.polygon2d
        [ Attributes.fill "gray" ]
        (Polygon2d
             [ Point2d ( 0, 0 )
             , Point2d ( 500, 0 )
             , Point2d ( 500, 315 )
             , Point2d ( 0, 315 )
             ]
        )

water : Svg Never
water =
    Svg.polygon2d
        [ Attributes.fill "blue" ]
        (Polygon2d
             [ Point2d ( 0, 315 )
             , Point2d ( 500, 315 )
             , Point2d ( 500, 400 )
             , Point2d ( 0, 400 )
             ]
        )
    
        
sailBoat =
    Svg.g [] [ leftSail, rightSail, hull ]

main = Svg.svg [] [ sky, water, sailBoat ]


