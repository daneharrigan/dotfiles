'use strict';

exports.decorateConfig = (config) => {
  const DARK_GREY = '#222';
  const LIGHT_GREY = '#EEE';
  const WHITE = '#FFF';


  return Object.assign({}, config, {
    // normal text
    cursorColor: LIGHT_GREY,
    foregroundColor: LIGHT_GREY,
    cursorAccentColor: LIGHT_GREY,
    selectionColor: 'rgba(255, 255, 255, 0.3)',

    // terminal window
    backgroundColor: DARK_GREY,
    borderColor: DARK_GREY,
    padding: '12px 14px',

    colors: {
      black: LIGHT_GREY,
      red: LIGHT_GREY,
      green: LIGHT_GREY,
      yellow: LIGHT_GREY,
      blue: LIGHT_GREY,
      magenta: LIGHT_GREY,
      cyan: LIGHT_GREY,
      white: WHITE,
      lightBlack: LIGHT_GREY,
      lightRed: LIGHT_GREY,
      lightGreen: LIGHT_GREY,
      lightYellow: LIGHT_GREY,
      lightBlue: LIGHT_GREY,
      lightMagenta: LIGHT_GREY,
      lightCyan: LIGHT_GREY,
      lightWhite: WHITE,
    },

    css: `
      .tab_active {
        border-bottom: 1px solid #444 !important;
        color: #AAA;
      }
    `,
  });
};
