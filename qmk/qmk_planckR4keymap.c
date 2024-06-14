// Keymap by plasmik for planck keyboard

#include "planck.h"
#include "action_layer.h"
#include "muse.h"

extern keymap_config_t keymap_config;

enum planck_layers {
  _QWERTY,
  _COLEMAK,
  _DVORAK,
  _LOWER,
  _RAISE,
  _NUMER,
  // _PLOVER,
  _ADJUST
};

enum planck_keycodes {
  QWERTY = SAFE_RANGE,
  COLEMAK,
  DVORAK,
  // PLOVER,
  BACKLIT,
  EXT_PLV
};

#define LOWER MO(_LOWER)
#define RAISE MO(_RAISE)
#define NUMER MO(_NUMER)
#define LO_T(kc) LT(LOWER, kc)
#define RA_T(kc) LT(RAISE, kc)
#define NU_T(kc) LT(NUMER, kc)

enum custom_keycodes {
    MYKC_000
    // ,MY_OTHER_MACRO
};
// bool process_record_user(uint16_t keycode, keyrecord_t *record) {
// };

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

/* Qwerty
 * ,-----------------------------------------------------------------------------------.
 * | Esc  |   Q  |   W  |   E  |   R  |   T  |   Y  |   U  |   I  |   O  |   P  | Bksp |
 * |------+------+------+------+------+-------------+------+------+------+------+------|
 * | Tab  |   A  |   S  |   D  |   F  |   G  |   H  |   J  |   K  |   L  |   ;  |  Up  |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * |  \   |   Z  |   X  |   C  |   V  |   B  |   N  |   M  |   ,  |   .  |   /  | Down |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * | Ctrl | GUI  |  Alt |Numer |Lower |Space |  '   |Raise |   [  |   ]  |   \  |Shift |
 * `-----------------------------------------------------------------------------------'
 */
[_QWERTY] = LAYOUT_planck_grid(
    SFT_T(KC_ESC) , KC_Q    , KC_W    , KC_E  , KC_R  , KC_T   , KC_Y          , KC_U  , KC_I    , KC_O    , KC_P    , KC_BSPC       ,
    KC_TAB        , KC_A    , KC_S    , KC_D  , KC_F  , KC_G   , KC_H          , KC_J  , KC_K    , KC_L    , KC_SCLN , KC_UP         ,
    KC_DEL        , KC_Z    , KC_X    , KC_C  , KC_V  , KC_B   , KC_N          , KC_M  , KC_COMM , KC_DOT  , KC_SLSH , KC_DOWN       ,
    KC_LCTL       , KC_LGUI , KC_LALT , NUMER , LOWER , KC_SPC , KC_QUOT , RAISE , KC_LBRC , KC_RBRC , KC_BSLS , SFT_T(KC_ENT)
),

/* Lower
 * ,-----------------------------------------------------------------------------------.
 * |   `  |   1  |   2  |   3  |   4  |   5  |   6  |   7  |   8  |   9  |   0  |      |
 * |------+------+------+------+------+-------------+------+------+------+------+------|
 * |   ~  |   !  |   @  |   #  |   $  |   %  |   ^  |   &  |   *  |   (  |   )  |      |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * |      |   -  |   +  |   _  |   =  |   0  |      |   .  |      |   {  |   }  |      |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      |      |      |      |      |   .  |      |      | Left | Rigth|      |      |
 * `-----------------------------------------------------------------------------------'
 */
[_LOWER] = LAYOUT_planck_grid(
    KC_GRV  , KC_1    , KC_2    , KC_3    , KC_4    , KC_5    , KC_6    , KC_7    , KC_8    , KC_9    , KC_0    , _______ ,
    KC_TILD , KC_EXLM , KC_AT   , KC_HASH , KC_DLR  , KC_PERC , KC_CIRC , KC_AMPR , KC_ASTR , KC_LPRN , KC_RPRN , KC_PGUP ,
    _______ , KC_MINS , KC_PLUS , KC_UNDS , KC_EQL  , KC_0    , _______ , KC_DOT  , _______ , KC_LCBR , KC_RCBR , KC_PGDN ,
    _______ , _______ , _______ , _______ , _______ , KC_DOT  , _______ , _______ , KC_LEFT , KC_RGHT , _______ , _______
),

/* Raise
 * ,-----------------------------------------------------------------------------------.
 * |      |  F1  |  F2  |  F3  |  F4  |      |      |  [   | Ins  |  ]   | PGUP | Del  |
 * |------+------+------+------+------+-------------+------+------+------+------+------|
 * |      |  F5  |  F6  |  F7  |  F8  |      | Left | Down |  Up  | Right|      |  PU  |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * |      |  F9  | F10  | F11  | F12  |      | PGDN |  -   |  +   |  _   |  =   |  PD  |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      |      |      |      |      |      |      |      | Left | Right|      |      |
 * `-----------------------------------------------------------------------------------'
 */
[_RAISE] = LAYOUT_planck_grid(
    _______ , KC_F1   , KC_F2   , KC_F3   , KC_F4   , _______ , _______ , KC_LBRC , KC_INS  , KC_RBRC , KC_PGUP , KC_DEL  ,
    _______ , KC_F5   , KC_F6   , KC_F7   , KC_F8   , _______ , KC_LEFT , KC_DOWN , KC_UP   , KC_RGHT , _______ , KC_PGUP ,
    _______ , KC_F9   , KC_F10  , KC_F11  , KC_F12  , _______ , KC_PGDN , KC_MINS , KC_PLUS , KC_UNDS , KC_EQL  , KC_PGDN ,
    _______ , _______ , _______ , _______ , _______ , _______ , _______ , _______ , KC_LEFT , KC_RGHT , _______ , _______
),

/* Numer
 * ,-----------------------------------------------------------------------------------.
 * |      | NLCK | PGUP |  END |      |      |      |  7   |  8   |  9   |  -   |      |
 * |------+------+------+------+------+-------------+------+------+------+------+------|
 * |      | HOME |  M   |  MRB | PGDN |      |  ^   |  4   |  5   |  6   |  +   | mwU  |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * |      |  M   |  M   |  M   |      |      |  *   |  1   |  2   |  3   |  /   | mwD  |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |  MLB |      |      |      |      | MENU |      |  0   |  .   |  .   |      | NLCK |
 * `-----------------------------------------------------------------------------------'
 */
[_NUMER] = LAYOUT_planck_grid(
    _______ , KC_NLCK , KC_PGUP , KC_END  , _______ , _______ , _______ , KC_P7 , KC_P8   , KC_P9  , KC_PMNS , _______ ,
    _______ , KC_HOME , KC_MS_U , KC_BTN2 , KC_PGDN , _______ , KC_CIRC , KC_P4 , KC_P5   , KC_P6  , KC_PPLS , KC_WH_U ,
    _______ , KC_MS_L , KC_MS_D , KC_MS_R , _______ , _______ , KC_PAST , KC_P1 , KC_P2   , KC_P3  , KC_PSLS , KC_WH_D ,
    KC_BTN1 , _______ , _______ , _______ , _______ , KC_APP  , KC_APP  , KC_P0 , KC_PDOT , KC_PDOT, _______ , KC_NLCK
),

/* Colemak
 * ,-----------------------------------------------------------------------------------.
 * | Tab  |   Q  |   W  |   F  |   P  |   G  |   J  |   L  |   U  |   Y  |   ;  | Bksp |
 * |------+------+------+------+------+-------------+------+------+------+------+------|
 * | Esc  |   A  |   R  |   S  |   T  |   D  |   H  |   N  |   E  |   I  |   O  |  '   |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * | Shift|   Z  |   X  |   C  |   V  |   B  |   K  |   M  |   ,  |   .  |   /  |Enter |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * | Brite| Ctrl | Alt  | GUI  |Lower |    Space    |Raise | Left | Down |  Up  |Right |
 * `-----------------------------------------------------------------------------------'
 */
[_COLEMAK] = LAYOUT_planck_grid(
    KC_TAB,  KC_Q,    KC_W,    KC_F,    KC_P,    KC_G,    KC_J,    KC_L,    KC_U,    KC_Y,    KC_SCLN, KC_BSPC,
    KC_ESC,  KC_A,    KC_R,    KC_S,    KC_T,    KC_D,    KC_H,    KC_N,    KC_E,    KC_I,    KC_O,    KC_QUOT,
    KC_LSFT, KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,    KC_K,    KC_M,    KC_COMM, KC_DOT,  KC_SLSH, KC_ENT ,
    BACKLIT, KC_LCTL, KC_LALT, KC_LGUI, LOWER,   KC_SPC,  KC_SPC,  RAISE,   KC_LEFT, KC_DOWN, KC_UP,   KC_RGHT
),

/* Dvorak
 * ,-----------------------------------------------------------------------------------.
 * | Tab  |   '  |   ,  |   .  |   P  |   Y  |   F  |   G  |   C  |   R  |   L  | Bksp |
 * |------+------+------+------+------+-------------+------+------+------+------+------|
 * | Esc  |   A  |   O  |   E  |   U  |   I  |   D  |   H  |   T  |   N  |   S  |  /   |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * | Shift|   ;  |   Q  |   J  |   K  |   X  |   B  |   M  |   W  |   V  |   Z  |Enter |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * | Brite| Ctrl | Alt  | GUI  |Lower |    Space    |Raise | Left | Down |  Up  |Right |
 * `-----------------------------------------------------------------------------------'
 */
[_DVORAK] = LAYOUT_planck_grid(
    KC_TAB,  KC_QUOT, KC_COMM, KC_DOT,  KC_P,    KC_Y,    KC_F,    KC_G,    KC_C,    KC_R,    KC_L,    KC_BSPC,
    KC_ESC,  KC_A,    KC_O,    KC_E,    KC_U,    KC_I,    KC_D,    KC_H,    KC_T,    KC_N,    KC_S,    KC_SLSH,
    KC_LSFT, KC_SCLN, KC_Q,    KC_J,    KC_K,    KC_X,    KC_B,    KC_M,    KC_W,    KC_V,    KC_Z,    KC_ENT ,
    BACKLIT, KC_LCTL, KC_LALT, KC_LGUI, LOWER,   KC_SPC,  KC_SPC,  RAISE,   KC_LEFT, KC_DOWN, KC_UP,   KC_RGHT
),

/* Plover layer (http://opensteno.org)
 * ,-----------------------------------------------------------------------------------.
 * |   #  |   #  |   #  |   #  |   #  |   #  |   #  |   #  |   #  |   #  |   #  |   #  |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      |   S  |   T  |   P  |   H  |   *  |   *  |   F  |   P  |   L  |   T  |   D  |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      |   S  |   K  |   W  |   R  |   *  |   *  |   R  |   B  |   G  |   S  |   Z  |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * | Exit |      |      |   A  |   O  |             |   E  |   U  |      |      |      |
 * `-----------------------------------------------------------------------------------'
 */
/* [_PLOVER] = LAYOUT_planck_grid(
    KC_1,    KC_1,    KC_1,    KC_1,    KC_1,    KC_1,    KC_1,    KC_1,    KC_1,    KC_1,    KC_1,    KC_1   ,
    XXXXXXX, KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,    KC_Y,    KC_U,    KC_I,    KC_O,    KC_P,    KC_LBRC,
    XXXXXXX, KC_A,    KC_S,    KC_D,    KC_F,    KC_G,    KC_H,    KC_J,    KC_K,    KC_L,    KC_SCLN, KC_QUOT,
    EXT_PLV, XXXXXXX, XXXXXXX, KC_C,    KC_V,    XXXXXXX, XXXXXXX, KC_N,    KC_M,    XXXXXXX, XXXXXXX, XXXXXXX
), */

/* Adjust (Lower + Raise)
 * ,-----------------------------------------------------------------------------------.
 * |      | Reset| Debug|      |Qwerty|Colemk|Dvorak|      |      |      |      |      |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * | CAPS |      |MUSmod|Aud on|Audoff|AGnorm|AGswap|Qwerty|Colemk|Dvorak|Plover|      |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      |Voice-|Voice+|Mus on|Musoff|MIDIon|MIDIof|      |      |      |      |      |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      |      |      |      |      |             |      |      |      |      |      |
 * `-----------------------------------------------------------------------------------'
 */
/* [_ADJUST] = LAYOUT_planck_grid(
    _______, RESET,   DEBUG,    RGB_TOG, RGB_MOD, RGB_HUI, RGB_HUD, RGB_SAI, RGB_SAD, RGB_VAI, RGB_VAD, KC_DEL ,
    KC_CAPSLOCK, _______, MU_MOD,  AU_ON,   AU_OFF,  AG_NORM, AG_SWAP, QWERTY,  COLEMAK, DVORAK,  PLOVER,  _______,
    _______, MUV_DE,  MUV_IN,  MU_ON,   MU_OFF,  MI_ON,   MI_OFF,  TERM_ON, TERM_OFF, _______, _______, _______,
    _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______
) */
[_ADJUST] = LAYOUT_planck_grid(
    _______ , RESET   , DEBUG   , _______ , QWERTY  , COLEMAK , DVORAK  , _______ , _______ , _______ , _______ , _______ ,
    _______ , _______ , MU_MOD  , AU_ON   , AU_OFF  , AG_NORM , AG_SWAP , QWERTY  , COLEMAK , DVORAK  , _______ , _______ ,
    _______ , MUV_DE  , MUV_IN  , MU_ON   , MU_OFF  , MI_ON   , MI_OFF  , _______ , _______ , _______ , _______ , _______ ,
    _______ , _______ , _______ , _______ , _______ , KC_CAPS , KC_CAPS , _______ , _______ , _______ , _______ , _______
)

};

#ifdef AUDIO_ENABLE
  // float plover_song[][2]     = SONG(PLOVER_SOUND);
  // float plover_gb_song[][2]  = SONG(PLOVER_GOODBYE_SOUND);
#endif

layer_state_t layer_state_set_user(layer_state_t state) {
  return update_tri_layer_state(state, _LOWER, _RAISE, _ADJUST);
}

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
  switch (keycode) {
    case MYKC_000:
      if (record->event.pressed) {
        SEND_STRING("000");
        // return false;
        // case MY_OTHER_MACRO:
        //     SEND_STRING(SS_LCTRL("ac")); // selects all and copies
        //     return false;
      }
      return false;
      break;
    case QWERTY:
      if (record->event.pressed) {
        print("mode just switched to qwerty and this is a huge string\n");
        set_single_persistent_default_layer(_QWERTY);
      }
      return false;
      break;
    case COLEMAK:
      if (record->event.pressed) {
        set_single_persistent_default_layer(_COLEMAK);
      }
      return false;
      break;
    case DVORAK:
      if (record->event.pressed) {
        set_single_persistent_default_layer(_DVORAK);
      }
      return false;
      break;
    case BACKLIT:
      if (record->event.pressed) {
        register_code(KC_RSFT);
        #ifdef BACKLIGHT_ENABLE
          backlight_step();
        #endif
        #ifdef KEYBOARD_planck_rev5
          PORTE &= ~(1<<6);
        #endif
      } else {
        unregister_code(KC_RSFT);
        #ifdef KEYBOARD_planck_rev5
          PORTE |= (1<<6);
        #endif
      }
      return false;
      break;
    /* case PLOVER:
      if (record->event.pressed) {
        #ifdef AUDIO_ENABLE
          stop_all_notes();
          PLAY_SONG(plover_song);
        #endif
        layer_off(_RAISE);
        layer_off(_LOWER);
        layer_off(_NUMER);
        layer_off(_ADJUST);
        layer_on(_PLOVER);
        if (!eeconfig_is_enabled()) {
            eeconfig_init();
        }
        keymap_config.raw = eeconfig_read_keymap();
        keymap_config.nkro = 1;
        eeconfig_update_keymap(keymap_config.raw);
      }
      return false;
      break; */
    /* case EXT_PLV:
      if (record->event.pressed) {
        #ifdef AUDIO_ENABLE
          PLAY_SONG(plover_gb_song);
        #endif
        layer_off(_PLOVER);
      }
      return false;
      break; */
  }
  return true;
}

bool muse_mode = false;
uint8_t last_muse_note = 0;
uint16_t muse_counter = 0;
uint8_t muse_offset = 70;
uint16_t muse_tempo = 50;

void encoder_update(bool clockwise) {
  if (muse_mode) {
    if (IS_LAYER_ON(_RAISE)) {
      if (clockwise) {
        muse_offset++;
      } else {
        muse_offset--;
      }
    } else {
      if (clockwise) {
        muse_tempo+=1;
      } else {
        muse_tempo-=1;
      }
    }
  } else {
    if (clockwise) {
      register_code(KC_PGDN);
      unregister_code(KC_PGDN);
    } else {
      register_code(KC_PGUP);
      unregister_code(KC_PGUP);
    }
  }
}

/* void dip_update(uint8_t index, bool active) {
  switch (index) {
    case 0:
      if (active) {
        #ifdef AUDIO_ENABLE
          PLAY_SONG(plover_song);
        #endif
        layer_on(_ADJUST);
      } else {
        #ifdef AUDIO_ENABLE
          PLAY_SONG(plover_gb_song);
        #endif
        layer_off(_ADJUST);
      }
      break;
    case 1:
      if (active) {
        muse_mode = true;
      } else {
        muse_mode = false;
        #ifdef AUDIO_ENABLE
          stop_all_notes();
        #endif
      }
   }
} */

void matrix_scan_user(void) {
  #ifdef AUDIO_ENABLE
    if (muse_mode) {
      if (muse_counter == 0) {
        uint8_t muse_note = muse_offset + SCALE[muse_clock_pulse()];
        if (muse_note != last_muse_note) {
          stop_note(compute_freq_for_midi_note(last_muse_note));
          play_note(compute_freq_for_midi_note(muse_note), 0xF);
          last_muse_note = muse_note;
        }
      }
      muse_counter = (muse_counter + 1) % muse_tempo;
    }
  #endif
}

bool music_mask_user(uint16_t keycode) {
  switch (keycode) {
    case RAISE:
    case LOWER:
    case NUMER:
      return false;
    default:
      return true;
  }
}

