#include auto_oculus_touch.ahk
; vJoy Example
; Set up Touch controllers as a gamepad using vJoy.

; Start the Oculus sdk.
InitOculus()
InitvJoy(1)

; Main polling loop.
Loop {
        ; Grab the latest Oculus input state (Touch, Remote and Xbox One).
        Poll()

        ; Update the axes for the sticks
        SetvJoyAxis(HID_USAGE_X, GetAxis(AxisXLeft))
        SetvJoyAxis(HID_USAGE_Y, -GetAxis(AxisYLeft))
        SetvJoyAxis(HID_USAGE_RX, GetAxis(AxisXRight))
        SetvJoyAxis(HID_USAGE_RY, -GetAxis(AxisYRight))

        ; Update the axes for the grip buttons
        SetvJoyAxisU(HID_USAGE_Z, GetAxis(AxisHandTriggerLeft))
        SetvJoyAxisU(HID_USAGE_RZ, GetAxis(AxisHandTriggerRight))

        ; Update the axes for the triggers
        SetvJoyAxisU(HID_USAGE_SL0, GetAxis(AxisIndexTriggerLeft))
        SetvJoyAxisU(HID_USAGE_SL1, GetAxis(AxisIndexTriggerRight))

        ; Update the gamepad buttons
        if IsPressed(ovrA)
                SetvJoyButton(1,1)
        if IsReleased(ovrA)
                SetvJoyButton(1,0)

        if IsPressed(ovrB)
                SetvJoyButton(2,1)
        if IsReleased(ovrB)
                SetvJoyButton(2,0)

        if IsPressed(ovrX)
                SetvJoyButton(3,1)
        if IsReleased(ovrX)
                SetvJoyButton(3,0)

        if IsPressed(ovrY)
                SetvJoyButton(4,1)
        if IsReleased(ovrY)
                SetvJoyButton(4,0)

        ; Update the menu button
        if IsPressed(ovrEnter)
                SetvJoyButton(5,1)
        if IsReleased(ovrEnter)
                SetvJoyButton(5,0)

        ; Update the thumbstick buttons
        if IsPressed(ovrLThumb)
                SetvJoyButton(6,1)
        if IsReleased(ovrLThumb)
                SetvJoyButton(6,0)

        if IsPressed(ovrRThumb)
                SetvJoyButton(7,1)
        if IsReleased(ovrRThumb)
                SetvJoyButton(7,0)

        Sleep, 10
}

; Axes
; Left stick -> HID_USAGE_X, HID_USAGE_Y
; Right stick -> HID_USAGE_RX, HID_USAGE_RY
; Left trigger -> HID_USAGE_SL0
; Right trigger -> HID_USAGE_SL1
; Left grip -> HID_USAGE_Z
; Right grip -> HID_USAGE_RZ
;
; Buttons
; 1 -> ovrA, ovr X (on opposite controller)
; 2 -> ovrB, ovr Y
; 3 -> ovrEnter (menu button, left only)
; 4 -> ovrLThumb , ovrRThumb
;
;               .^!!7!~^^^^^^~!!!!~:
;           .~7!^      TRIGGER     :~7!:
;         ~?!           BELOW        ...~J7.
;      .7J:                              .??:
;     !G:                                  .Y?
;    5J                                      ^G.
;   G7                                        .B.
;  P?           ....         ?J??J7            :#
; ~#         ~7^...:!?!     B?    ^G  <--- 2    JY
; #! 4 ---> ?!       .5!    B?    !5             &
; @.        J         J!     !?!!?7              #:
; @         .7.     .J~                          #:
; &:          JJ7!7!7^   ~Y777Y~                 &.
; ?5           ...      ~B     P: <-- 1         ~P
;  #^                   :B.   .G.               B
;  :#  3 ---->  .^:.:.   .!77!!.              57
;   :G         ^?    .!                       Y?
;    .P.      :J....:!                     .5^
;      G~                              ..?J
;      :P:^.                         .::.:
;       G. .:..                .......:!
;       ~J    ..........    ...:    G5
;        G               :::..!      #  <---- GRIP BUTTON
;        Y~                   ^# .:^!G
;        :P                    !#!
;         P:                    Y^
;         :P                    ~
;          5~                   .G
;           B                    G
;           ~P                   5
;            Y?                  5
;             P7                 P
;              5?                G
;               ?Y.             5~
;                .5!          .5~
;                  :77^....:~7!.
;  PicoPlanetDev      .:^^::.
