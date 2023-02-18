const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 300;     // ピースの初期位置の最下ラインY
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル
MODE2_PROBABILITY = 100;                        // 2:キャプチャモードの場合にピースがランダム位置の確率

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 48;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'lum10';            // ピースの画像名
let width  = [ 130, 126, 100, 106, 126, 155, 104, 131, 102, 104, 129, 126, 101, 131, 130, 127, 125, 102, 130, 154, 125, 156, 99, 132, 101, 132, 128, 104, 104, 158, 126, 130, 106, 130, 156, 156, 125, 129, 156, 154, 155, 106, 99, 101, 102, 101, 128, 126 ];        // 画像サイズX
let height = [ 131, 106, 100, 104, 154, 125, 105, 104, 154, 128, 129, 132, 155, 104, 127, 129, 155, 101, 158, 104, 105, 155, 101, 125, 130, 128, 157, 127, 128, 154, 104, 125, 104, 131, 99, 132, 99, 157, 99, 156, 104, 132, 156, 101, 130, 130, 103, 155 ];        // 画像サイズY
let x = [ 166.0, 73.0, 60.0, 442.0, 523.0, 441.5, 347.0, 236.5, 154.0, 153.0, 359.5, 523.0, 60.5, 429.5, 334.0, 522.5, 72.5, 250.0, 430.0, 346.0, 72.5, 249.0, 59.5, 333.0, 60.5, 359.0, 455.0, 251.0, 251.0, 250.0, 523.0, 429.0, 442.0, 140.0, 155.0, 249.0, 523.5, 140.5, 153.0, 346.0, 153.5, 346.0, 59.5, 535.5, 442.0, 535.5, 263.0, 523.0 ];              // フレーム画像の表示位置X
let y = [ 140.5, 250.0, 60.0, 443.0, 634.0, 72.5, 345.5, 249.0, 442.0, 237.0, 429.5, 237.0, 538.5, 635.0, 73.5, 140.5, 154.5, 727.5, 346.0, 155.0, 441.5, 634.5, 727.5, 715.5, 646.0, 525.0, 538.5, 73.5, 167.0, 442.0, 443.0, 715.5, 249.0, 332.5, 59.5, 333.0, 728.5, 634.5, 728.5, 250.0, 539.0, 621.0, 346.0, 60.5, 166.0, 526.0, 538.5, 345.5 ];              // フレーム画像の表示位置Y
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
