const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 300;     // ピースの初期位置の最下ラインY
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル
MODE2_PROBABILITY = 100;                        // 2:キャプチャモードの場合にピースがランダム位置の確率

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 48;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'lum05';            // ピースの画像名
let width  = [ 132, 107, 102, 131, 156, 127, 102, 159, 104, 132, 101, 129, 102, 156, 102, 104, 129, 102, 101, 130, 157, 131, 130, 158, 132, 158, 102, 127, 129, 158, 102, 101, 105, 131, 157, 127, 105, 105, 159, 102, 155, 157, 134, 129, 104, 129, 105, 132 ];        // 画像サイズX
let height = [ 126, 132, 132, 102, 105, 101, 127, 106, 156, 130, 158, 158, 134, 129, 132, 132, 130, 100, 104, 107, 126, 155, 131, 132, 158, 130, 130, 107, 157, 130, 132, 130, 134, 132, 130, 132, 107, 126, 106, 129, 104, 126, 127, 130, 102, 129, 104, 159 ];        // 画像サイズY
let x = [ 143.0, 446.5, 541.0, 337.5, 350.0, 528.5, 541.0, 445.5, 253.0, 168.0, 60.5, 527.5, 61.0, 155.0, 541.0, 253.0, 168.5, 61.0, 60.5, 362.0, 446.5, 142.5, 363.0, 157.0, 335.0, 254.0, 61.0, 528.5, 336.5, 445.0, 541.0, 541.5, 251.5, 459.5, 349.5, 73.5, 445.5, 348.5, 156.5, 61.0, 155.5, 252.5, 433.0, 265.5, 253.0, 74.5, 253.5, 459.0 ];              // フレーム画像の表示位置X
let y = [ 73.0, 459.0, 267.0, 735.0, 156.5, 60.5, 722.5, 640.0, 641.0, 362.0, 154.0, 157.0, 460.0, 721.5, 531.0, 170.0, 627.0, 60.0, 544.0, 543.5, 723.0, 252.5, 239.5, 531.0, 351.0, 266.0, 266.0, 446.5, 640.5, 363.0, 628.0, 363.0, 363.0, 556.0, 460.0, 362.0, 155.5, 73.0, 447.0, 721.5, 156.0, 73.0, 73.5, 531.0, 735.0, 627.5, 447.0, 253.5 ];              // フレーム画像の表示位置Y
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