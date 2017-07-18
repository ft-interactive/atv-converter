var fonts = require("./settings/").fonts,
    _ = require("underscore"),
    Canvas = require("canvas-prebuilt");

// Register custom fonts one time
if (Array.isArray(fonts)) {
  fonts.forEach(function(font){
    Canvas.registerFont(font.file, _.pick(font, "family", "weight", "style"));
  });
}
