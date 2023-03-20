const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 300;     // ピースの初期位置の最下ラインY
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル
MODE2_PROBABILITY = 100;                        // 2:キャプチャモードの場合にピースがランダム位置の確率

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 48;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'eva04';            // ピースの画像名
let width  = [ 126, 133, 106, 107, 105, 126, 157, 105, 101, 103, 127, 156, 129, 130, 129, 132, 132, 130, 127, 132, 105, 133, 158, 131, 129, 158, 156, 156, 159, 105, 105, 127, 130, 102, 134, 156, 101, 127, 105, 101, 131, 102, 102, 100, 100, 157, 105, 158 ];        // 画像サイズX
let height = [ 132, 134, 158, 103, 100, 107, 127, 156, 134, 130, 161, 104, 157, 132, 126, 158, 101, 100, 133, 155, 157, 100, 102, 101, 132, 155, 133, 129, 104, 129, 133, 156, 105, 157, 134, 131, 103, 105, 129, 102, 127, 159, 105, 100, 100, 106, 159, 133 ];        // 画像サイズY
let x = [ 73.0, 169.5, 252.0, 446.5, 350.5, 73.0, 349.5, 156.5, 541.5, 252.5, 73.5, 155.0, 74.5, 240.0, 527.5, 434.0, 240.0, 433.0, 528.5, 459.0, 350.5, 266.5, 154.0, 458.5, 362.5, 251.0, 350.0, 446.0, 253.5, 253.5, 447.5, 528.5, 336.0, 61.0, 336.0, 350.0, 541.5, 528.5, 155.5, 60.5, 143.5, 541.0, 61.0, 60.0, 542.0, 155.5, 154.5, 445.0 ];              // フレーム画像の表示位置X
let y = [ 265.0, 336.0, 157.0, 252.5, 736.0, 349.5, 73.5, 446.0, 336.0, 531.0, 640.5, 543.0, 446.5, 267.0, 723.0, 448.0, 60.5, 736.0, 626.5, 155.5, 446.5, 736.0, 735.0, 60.5, 655.0, 640.5, 266.5, 556.5, 447.0, 362.5, 654.5, 446.0, 350.5, 155.5, 557.0, 167.5, 543.5, 251.5, 239.5, 61.0, 73.5, 154.5, 542.5, 736.0, 60.0, 155.0, 639.5, 335.5 ];              // フレーム画像の表示位置Y
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