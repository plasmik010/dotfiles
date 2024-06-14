#include "kb.h"

// #include QMK_KEYBOARD_H
// #include "action_layer.h"
#define F_T(kc) LT(MO(2), kc)
#define KC_PIPE LSFT(KC_BSLS)

enum custom_keycodes {
    GO_8_DN = SAFE_RANGE,
    GO_8_UP,
}

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

// 0: Base Layer
KEYMAP(
SFT_T(KC_ESC) , KC_1     , KC_2     , KC_3    , KC_4    , KC_5    , KC_6    , KC_7    , KC_8    , KC_9   , KC_0    , KC_BSPC   ,
SFT_T(KC_TAB) , KC_Q     , KC_W     , KC_E    , KC_R    , KC_T    , KC_Y    , KC_U    , KC_I    , KC_O   , KC_P    , KC_UP     ,
KC_LALT       , KC_A     , KC_S     , KC_D    , KC_F    , KC_G    , KC_H    , KC_J    , KC_K    , KC_L   , KC_SCLN , KC_DOWN   ,
KC_LCTL       , KC_Z     , KC_X     , KC_C    , KC_V    , KC_B    , KC_N    , KC_M    , KC_COMM , KC_DOT , KC_SLSH , SFT_T(KC_ENT) ,
          MO(1) , KC_SPC , KC_LGUI ,  KC_DEL ,                      KC_QUOT , KC_LSFT , RCTL_T(KC_LBRC) , F_T(KC_RBRC) ),

// 1: Function Layer
KEYMAP(
KC_GRV        , KC_F1    , KC_F2   ,  KC_F3   , KC_F4   , KC_F5   , KC_F6   , KC_F7    , KC_F8   , KC_F9    , KC_F10  , KC_DEL  ,
KC_TILD       , _______  , KC_PGUP ,  KC_END  , _______ , _______ , _______ , _______  , KC_INS  , KC_F11   , KC_F12  , KC_PGUP ,
KC_LALT       , KC_HOME  , _______ ,  _______ , KC_PGDN , _______ , KC_LEFT , KC_DOWN  , KC_UP   , KC_RIGHT , KC_QUOT , KC_PGDN ,
KC_LCTL       , KC_MINS  , KC_PLUS ,  KC_UNDS , KC_EQL  , KC_APP  , KC_PIPE , KC_MINS  , KC_PLUS , KC_UNDS  , KC_EQL  , _______ ,
     MO(1) , LSFT(KC_SPC) , KC_LGUI , KC_CAPS ,                     KC_BSLS , KC_RSFT , KC_LEFT , KC_RIGHT ),

// 2: Mouse Layer
KEYMAP(
KC_GRV        , KC_F1    , KC_F2   ,  KC_F3   , KC_F4   , KC_F5   , KC_F6   , KC_F7    , KC_F8   , KC_F9    , KC_F10  , KC_DEL  ,
KC_TILD       , KC_BTN1  , KC_MS_U ,  KC_BTN2 , KC_WH_U , _______ , _______ , _______  , KC_INS  , KC_F11   , KC_F12  , KC_PGUP ,
KC_LALT       , KC_MS_L  , KC_MS_D ,  KC_MS_R , KC_WH_D , _______ , KC_LEFT , KC_DOWN  , KC_UP   , KC_RIGHT , KC_QUOT , KC_PGDN ,
KC_LCTL       , KC_MINS  , KC_PLUS ,  KC_UNDS , KC_EQL  , KC_APP  , KC_PIPE , KC_MINS  , KC_PLUS , KC_UNDS  , KC_EQL  , _______ ,
     MO(1) , LSFT(KC_SPC) , KC_LGUI , KC_CAPS ,                     KC_BSLS , KC_RSFT , KC_LEFT , KC_RIGHT )
};

// Custom Actions
const uint16_t PROGMEM fn_actions[] = {
    [0] = ACTION_LAYER_MOMENTARY(1),  // to Fn overlay
};

// const macro_t *action_get_macro(keyrecord_t *record, uint8_t id, uint8_t opt) {
//     // keyevent_t event = record->event;
//     switch (id) {
//     }
//     return MACRO_NONE;
// }

void matrix_init_user(void) {
}

void matrix_scan_user(void) {
}

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
    switch (keycode) {
        case GO_8_DN:
            if (record->event.pressed) {
                SEND_STRNG( SS_TAP(X_DOWN) SS_TAP(X_DOWN) SS_TAP(X_DOWN) SS_TAP(X_DOWN) SS_TAP(X_DOWN)  );
            }
            return false;
    return true;
}

// void led_set_user(uint8_t usb_led) {
//     if (usb_led & (1 << USB_LED_NUM_LOCK)) {
//     } else {
//     }
//     if (usb_led & (1 << USB_LED_CAPS_LOCK)) {
//     } else {
//     }
//     if (usb_led & (1 << USB_LED_SCROLL_LOCK)) {
//     } else {
//     }
//     if (usb_led & (1 << USB_LED_COMPOSE)) {
//     } else {
//     }
//     if (usb_led & (1 << USB_LED_KANA)) {
//     } else {
//     }
// }


