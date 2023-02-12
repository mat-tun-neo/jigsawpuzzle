const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 300;     // ピースの初期位置の最下ラインY
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル
MODE2_PROBABILITY = 100;                        // 2:キャプチャモードの場合にピースがランダム位置の確率

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 48;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'gundam09';            // ピースの画像名
let width  = [ 107, 107, 127, 131, 132, 132, 132, 102, 106, 104, 130, 133, 156, 127, 157, 157, 102, 105, 161, 132, 103, 132, 157, 127, 132, 100, 102, 129, 132, 107, 131, 102, 126, 130, 132, 105, 132, 105, 134, 126, 130, 127, 158, 126, 134, 129, 127, 126 ];        // 画像サイズX
let height = [ 130, 127, 126, 102, 156, 157, 156, 131, 100, 130, 134, 101, 100, 132, 132, 158, 158, 157, 107, 104, 132, 129, 133, 105, 105, 126, 105, 107, 126, 105, 107, 131, 102, 102, 132, 132, 107, 132, 155, 132, 156, 157, 156, 130, 100, 155, 131, 100 ];        // 画像サイズY
let x = [ 252.5, 446.5, 528.5, 362.5, 337.0, 459.0, 265.0, 61.0, 446.0, 350.0, 142.0, 169.5, 252.0, 73.5, 252.5, 155.5, 61.0, 156.5, 252.5, 432.0, 349.5, 362.0, 349.5, 73.5, 168.0, 60.0, 541.0, 74.5, 267.0, 252.5, 433.5, 541.0, 529.0, 363.0, 168.0, 348.5, 459.0, 154.5, 433.0, 529.0, 434.0, 73.5, 251.0, 529.0, 142.0, 527.5, 528.5, 73.0 ];              // フレーム画像の表示位置X
let y = [ 240.0, 73.5, 73.0, 735.0, 155.0, 252.5, 350.0, 627.5, 736.0, 460.0, 654.0, 60.5, 736.0, 337.0, 531.0, 157.0, 154.0, 543.5, 446.5, 544.0, 653.0, 362.5, 266.5, 253.5, 350.5, 723.0, 253.5, 543.5, 73.0, 155.5, 155.5, 336.5, 735.0, 61.0, 267.0, 556.0, 349.5, 434.0, 640.5, 170.0, 446.0, 446.5, 640.0, 434.0, 736.0, 543.5, 653.5, 60.0 ];              // フレーム画像の表示位置Y
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
