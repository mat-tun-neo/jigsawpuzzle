const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 300;     // ピースの初期位置の最下ラインY
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル
MODE2_PROBABILITY = 100;                        // 2:キャプチャモードの場合にピースがランダム位置の確率

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 48;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'gundam07';            // ピースの画像名
let width  = [ 126, 129, 157, 158, 127, 106, 130, 127, 126, 107, 100, 100, 132, 132, 131, 102, 104, 126, 129, 130, 156, 134, 131, 134, 107, 159, 132, 132, 105, 130, 106, 107, 127, 100, 157, 101, 127, 132, 131, 127, 127, 130, 158, 103, 127, 102, 131, 134 ];        // 画像サイズX
let height = [ 132, 130, 132, 102, 132, 129, 100, 132, 106, 127, 132, 159, 132, 105, 159, 159, 101, 132, 132, 131, 102, 132, 161, 158, 157, 132, 130, 127, 158, 159, 130, 101, 127, 105, 105, 126, 132, 105, 105, 102, 157, 105, 131, 131, 102, 105, 159, 100 ];        // 画像サイズY
let x = [ 73.0, 168.5, 446.5, 445.0, 528.5, 155.0, 239.0, 73.5, 529.0, 155.5, 542.0, 542.0, 168.0, 265.0, 433.5, 61.0, 349.0, 73.0, 239.5, 169.0, 252.0, 433.0, 264.5, 142.0, 349.5, 253.5, 265.0, 434.0, 349.5, 265.0, 350.0, 155.5, 73.5, 60.0, 155.5, 541.5, 73.5, 362.0, 434.5, 73.5, 528.5, 459.0, 348.0, 349.5, 528.5, 541.0, 458.5, 336.0 ];              // フレーム画像の表示位置X
let y = [ 653.0, 143.0, 337.0, 61.0, 653.0, 239.5, 736.0, 265.0, 156.0, 722.5, 556.0, 253.5, 335.0, 542.5, 156.5, 542.5, 60.5, 168.0, 267.0, 628.5, 61.0, 434.0, 640.5, 445.0, 349.5, 459.0, 363.0, 722.5, 642.0, 156.5, 143.0, 60.5, 73.5, 445.5, 543.5, 73.0, 362.0, 543.5, 641.5, 735.0, 446.5, 253.5, 240.5, 458.5, 735.0, 350.5, 544.5, 736.0 ];              // フレーム画像の表示位置Y
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