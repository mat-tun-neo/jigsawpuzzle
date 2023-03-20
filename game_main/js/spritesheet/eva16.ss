const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 300;     // ピースの初期位置の最下ラインY
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル
MODE2_PROBABILITY = 100;                        // 2:キャプチャモードの場合にピースがランダム位置の確率

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 48;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'eva16';            // ピースの画像名
let width  = [ 126, 127, 131, 131, 133, 126, 100, 129, 131, 132, 106, 127, 100, 126, 132, 126, 133, 106, 102, 132, 134, 157, 104, 130, 131, 134, 126, 102, 101, 101, 157, 100, 104, 132, 132, 130, 156, 133, 102, 106, 156, 126, 132, 158, 131, 131, 132, 132 ];        // 画像サイズX
let height = [ 100, 102, 156, 131, 105, 100, 157, 130, 132, 102, 129, 106, 129, 158, 102, 132, 131, 126, 132, 127, 105, 129, 157, 157, 132, 132, 134, 132, 105, 159, 107, 156, 130, 105, 102, 157, 158, 134, 101, 159, 132, 132, 100, 131, 107, 105, 129, 132 ];        // 画像サイズY
let x = [ 73.0, 528.5, 264.5, 264.5, 460.5, 529.0, 542.0, 459.5, 361.5, 240.0, 156.0, 73.5, 60.0, 73.0, 434.0, 73.0, 169.5, 446.0, 61.0, 362.0, 363.0, 252.5, 447.0, 169.0, 239.5, 142.0, 529.0, 541.0, 541.5, 60.5, 252.5, 542.0, 349.0, 240.0, 143.0, 266.0, 350.0, 363.5, 61.0, 446.0, 349.0, 529.0, 337.0, 445.0, 143.5, 459.5, 143.0, 168.0 ];              // フレーム画像の表示位置X
let y = [ 60.0, 61.0, 544.0, 433.5, 253.5, 736.0, 252.5, 556.0, 267.0, 61.0, 74.5, 446.0, 653.5, 545.0, 61.0, 238.0, 265.5, 723.0, 141.0, 722.5, 350.5, 721.5, 349.5, 543.5, 143.0, 653.0, 363.0, 655.0, 447.5, 348.5, 349.5, 543.0, 433.0, 639.5, 735.0, 252.5, 154.0, 530.0, 735.5, 156.5, 628.0, 143.0, 60.0, 458.5, 349.5, 640.5, 168.5, 434.0 ];              // フレーム画像の表示位置Y
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