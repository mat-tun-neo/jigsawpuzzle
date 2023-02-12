const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 300;     // ピースの初期位置の最下ラインY
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル
MODE2_PROBABILITY = 100;                        // 2:キャプチャモードの場合にピースがランダム位置の確率

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 48;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'gundam11';            // ピースの画像名
let width  = [ 100, 131, 130, 126, 159, 131, 159, 159, 105, 131, 131, 130, 101, 107, 101, 131, 105, 129, 132, 134, 131, 157, 100, 127, 132, 159, 102, 131, 129, 102, 127, 126, 130, 157, 100, 127, 157, 105, 127, 107, 105, 134, 130, 105, 134, 131, 130, 100 ];        // 画像サイズX
let height = [ 107, 101, 100, 107, 127, 104, 158, 101, 102, 126, 156, 131, 132, 132, 130, 103, 100, 127, 134, 133, 131, 106, 130, 129, 129, 105, 102, 132, 161, 107, 126, 103, 129, 134, 132, 129, 130, 132, 157, 156, 155, 134, 131, 127, 156, 107, 159, 157 ];        // 画像サイズY
let x = [ 60.0, 434.5, 337.0, 73.0, 445.5, 143.5, 154.5, 251.5, 348.5, 239.5, 361.5, 433.0, 60.5, 252.5, 60.5, 337.5, 156.5, 74.5, 337.0, 142.0, 239.5, 252.5, 542.0, 73.5, 459.0, 447.5, 541.0, 240.5, 527.5, 541.0, 73.5, 529.0, 169.0, 349.5, 542.0, 528.5, 349.5, 447.5, 528.5, 252.5, 446.5, 460.0, 266.0, 154.5, 363.0, 167.5, 143.0, 60.0 ];              // フレーム画像の表示位置X
let y = [ 640.5, 735.5, 736.0, 349.5, 73.5, 446.0, 542.0, 60.5, 61.0, 723.0, 640.0, 530.5, 434.0, 556.0, 266.0, 446.5, 736.0, 722.5, 530.0, 654.5, 459.5, 640.0, 433.0, 168.5, 362.5, 447.5, 61.0, 240.0, 543.5, 349.5, 72.0, 640.5, 362.5, 363.0, 265.0, 721.5, 266.0, 168.0, 155.5, 349.0, 640.5, 266.0, 143.5, 73.5, 155.0, 155.5, 253.5, 543.5 ];              // フレーム画像の表示位置Y
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
