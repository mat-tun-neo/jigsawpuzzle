const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 300;     // ピースの初期位置の最下ラインY
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル
MODE2_PROBABILITY = 100;                        // 2:キャプチャモードの場合にピースがランダム位置の確率

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 48;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'eva02';            // ピースの画像名
let width  = [ 126, 131, 156, 127, 129, 129, 101, 129, 130, 155, 129, 104, 156, 105, 131, 132, 107, 126, 130, 105, 130, 126, 129, 102, 105, 157, 126, 106, 134, 129, 130, 127, 159, 101, 106, 130, 126, 104, 105, 132, 129, 130, 130, 126, 104, 102, 159, 126 ];        // 画像サイズX
let height = [ 102, 105, 104, 132, 100, 100, 127, 132, 161, 100, 159, 100, 132, 127, 132, 132, 129, 130, 100, 159, 134, 129, 102, 107, 132, 132, 130, 134, 132, 156, 132, 132, 131, 134, 134, 105, 107, 155, 107, 131, 127, 159, 127, 104, 130, 134, 158, 157 ];        // 画像サイズY
let x = [ 74.0, 168.5, 448.0, 74.5, 363.5, 528.5, 61.5, 169.5, 435.0, 156.5, 528.5, 448.0, 253.0, 350.5, 144.5, 169.0, 253.5, 74.0, 266.0, 157.5, 338.0, 530.0, 434.5, 542.0, 351.5, 447.5, 530.0, 157.0, 337.0, 528.5, 434.0, 74.5, 254.5, 61.5, 254.0, 337.0, 74.0, 448.0, 253.5, 433.0, 266.5, 240.0, 169.0, 530.0, 351.0, 542.0, 351.5, 74.0 ];              // フレーム画像の表示位置X
let y = [ 62.0, 155.5, 254.0, 363.0, 61.0, 737.0, 723.5, 435.0, 156.5, 737.0, 642.5, 61.0, 532.0, 723.5, 656.0, 338.0, 337.5, 531.0, 737.0, 545.5, 143.0, 75.5, 736.0, 544.5, 532.0, 557.0, 170.0, 240.0, 629.0, 448.0, 654.0, 144.0, 240.5, 628.0, 434.0, 448.5, 447.5, 350.5, 156.5, 460.5, 74.5, 642.5, 74.5, 351.0, 240.0, 267.0, 349.0, 253.5 ];              // フレーム画像の表示位置Y
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