const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 300;     // ピースの初期位置の最下ラインY
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル
MODE2_PROBABILITY = 100;                        // 2:キャプチャモードの場合にピースがランダム位置の確率

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 48;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'lum01';            // ピースの画像名
let width  = [ 130, 106, 162, 103, 106, 127, 132, 105, 103, 135, 101, 158, 103, 132, 133, 132, 160, 133, 158, 159, 106, 157, 128, 158, 131, 101, 130, 133, 157, 103, 133, 106, 128, 133, 131, 128, 106, 130, 157, 105, 131, 135, 108, 103, 128, 102, 133, 103 ];        // 画像サイズX
let height = [ 103, 101, 103, 157, 108, 132, 162, 131, 103, 160, 130, 158, 158, 135, 130, 133, 103, 127, 106, 158, 133, 131, 108, 133, 135, 158, 128, 133, 133, 135, 128, 103, 133, 133, 157, 133, 130, 108, 133, 133, 101, 133, 108, 131, 102, 158, 105, 104 ];        // 画像サイズY
let x = [ 75.0, 353.0, 450.0, 61.5, 156.0, 534.5, 341.0, 255.5, 61.5, 241.5, 547.5, 451.0, 546.5, 463.0, 340.5, 438.0, 254.0, 269.5, 451.0, 158.5, 452.0, 353.5, 534.0, 451.0, 242.5, 547.5, 170.0, 340.5, 156.5, 546.5, 438.5, 354.0, 74.0, 340.5, 143.5, 74.0, 256.0, 75.0, 352.5, 157.5, 144.5, 241.5, 157.0, 61.5, 534.0, 61.0, 242.5, 546.5 ];              // フレーム画像の表示位置X
let y = [ 61.5, 743.5, 742.5, 548.5, 353.0, 145.0, 549.0, 562.5, 742.5, 352.0, 729.0, 549.0, 255.0, 437.5, 660.0, 169.5, 742.5, 73.5, 254.0, 255.0, 338.5, 437.5, 353.0, 659.5, 464.5, 451.0, 74.0, 144.5, 536.5, 562.5, 74.0, 61.5, 364.5, 242.5, 646.5, 144.5, 242.0, 451.0, 340.5, 438.5, 743.5, 659.5, 157.0, 660.5, 61.0, 255.0, 157.5, 647.0 ];              // フレーム画像の表示位置Y
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