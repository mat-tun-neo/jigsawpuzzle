const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 300;     // ピースの初期位置の最下ラインY
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル
MODE2_PROBABILITY = 100;                        // 2:キャプチャモードの場合にピースがランダム位置の確率

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 48;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'gundam08';            // ピースの画像名
let width  = [ 128, 158, 157, 128, 128, 133, 127, 106, 127, 105, 157, 157, 103, 162, 107, 133, 162, 135, 105, 133, 105, 133, 106, 133, 128, 106, 101, 128, 130, 133, 135, 130, 108, 128, 132, 103, 132, 133, 158, 135, 130, 104, 127, 133, 106, 133, 101, 103 ];        // 画像サイズX
let height = [ 107, 103, 108, 106, 157, 158, 128, 160, 103, 101, 104, 157, 133, 106, 131, 105, 130, 133, 160, 133, 107, 162, 101, 108, 104, 131, 134, 133, 101, 104, 160, 128, 101, 133, 103, 133, 104, 160, 160, 135, 127, 130, 130, 160, 135, 132, 159, 159 ];        // 画像サイズY
let x = [ 534.0, 255.0, 352.5, 534.0, 74.0, 267.5, 534.5, 452.0, 73.5, 157.5, 451.5, 353.5, 546.5, 157.0, 352.5, 267.5, 353.0, 143.5, 451.5, 438.5, 255.5, 242.5, 158.0, 169.5, 74.0, 254.0, 60.5, 74.0, 75.0, 463.5, 339.5, 533.0, 353.0, 534.0, 438.0, 61.5, 365.0, 169.5, 157.0, 366.5, 242.0, 451.0, 534.5, 169.5, 452.0, 267.5, 60.5, 546.5 ];              // フレーム画像の表示位置X
let y = [ 156.5, 61.5, 549.0, 452.0, 647.5, 157.0, 74.0, 158.0, 742.5, 743.5, 647.0, 254.5, 634.5, 254.0, 633.5, 647.5, 729.0, 536.5, 352.0, 463.5, 254.5, 549.0, 60.5, 451.0, 353.0, 437.5, 535.0, 436.5, 60.5, 255.0, 450.0, 730.0, 60.5, 536.5, 61.5, 142.5, 353.0, 648.0, 156.0, 143.5, 730.5, 729.0, 366.0, 352.0, 562.5, 341.0, 253.5, 256.5 ];              // フレーム画像の表示位置Y
const OFFSET_X = 0;                         // フレーム画像の表示位置 オフセットX
const OFFSET_Y = 0;                         // フレーム画像の表示位置 オフセットY

let animations = { "000" : {"frames": [ 0],  "next": "000", "frequency": 1 } };
for (let i = 0; i < PIECE_TOTALNUM; i++) {
    let no = zeroPadding(i, 2);
    let piece_no = "piece" + no;
    let mode_no = document.getElementById("mode").innerText + no;
    let frame_no = "frame" + no;
    ASSETS.image[piece_no] = "./images/" + PIECE_IMAGE + "/" + piece_no + ".png" + datestr;
    ASSETS.image[frame_no] = "./images/" + PIECE_IMAGE + "/" + mode_no + ".png" + datestr;
    ASSETS.spritesheet[piece_no] = { "frame": {"width": width[i], "height": height[i], "cols": 1, "rows": 1}, "animations": animations };
    ASSETS.spritesheet[frame_no] = { "frame": {"width": width[i], "height": height[i], "cols": 1, "rows": 1}, "animations": animations };
    PIECE[no] = { sheetname: piece_no, width: width[i], height: height[i] };
    FRAME[no] = { sheetname: frame_no, width: width[i], height: height[i], x: x[i], y: y[i] };
}

const GOAL_Y = SCREEN_HEIGHT/2 + 390;           // ゴール画像の位置Y
GOAL_BUTTON_WIDTH      = 400;
GOAL_BUTTON_HEIGHT     = 150;
ASSETS.image["goal_button"] = "./images/complete.png" + datestr;
ASSETS.spritesheet["goal_button"] = { "frame": {"width": 500, "height": 187, "cols": 1, "rows": 1}, "animations": animations };
