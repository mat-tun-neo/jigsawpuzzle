const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 300;     // ピースの初期位置の最下ラインY
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル
MODE2_PROBABILITY = 100;                        // 2:キャプチャモードの場合にピースがランダム位置の確率

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 48;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'eva01';            // ピースの画像名
let width  = [ 155, 101, 159, 132, 134, 104, 133, 132, 158, 103, 130, 105, 127, 102, 131, 131, 126, 155, 127, 105, 129, 132, 130, 100, 126, 100, 131, 105, 101, 127, 132, 105, 134, 129, 103, 129, 107, 131, 132, 159, 155, 107, 127, 127, 132, 129, 132, 127 ];        // 画像サイズX
let height = [ 102, 127, 105, 130, 159, 102, 157, 102, 130, 126, 131, 132, 134, 132, 107, 158, 104, 100, 126, 132, 127, 132, 130, 159, 104, 129, 130, 107, 156, 130, 159, 102, 134, 107, 106, 156, 130, 106, 132, 127, 159, 127, 107, 133, 106, 132, 159, 126 ];        // 画像サイズY
let x = [ 155.5, 60.5, 445.5, 267.0, 363.0, 253.0, 141.5, 240.0, 254.0, 446.5, 363.0, 447.5, 73.5, 541.0, 239.5, 361.5, 529.0, 349.5, 528.5, 156.5, 527.5, 265.0, 169.0, 60.0, 73.0, 542.0, 337.5, 155.5, 541.5, 73.5, 265.0, 447.5, 169.0, 74.5, 349.5, 459.5, 446.5, 433.5, 168.0, 350.5, 252.5, 155.5, 528.5, 528.5, 364.0, 74.5, 461.0, 73.5 ];              // フレーム画像の表示位置X
let y = [ 61.0, 73.5, 253.5, 266.0, 350.5, 61.0, 543.5, 735.0, 530.0, 73.0, 628.5, 170.0, 336.0, 240.0, 446.5, 154.0, 447.0, 60.0, 723.0, 434.0, 73.5, 362.0, 142.0, 544.5, 641.0, 530.5, 460.0, 640.5, 349.0, 239.0, 156.5, 735.0, 239.0, 155.5, 253.0, 349.0, 654.0, 447.0, 337.0, 722.5, 639.5, 722.5, 155.5, 626.5, 543.0, 434.0, 544.5, 723.0 ];              // フレーム画像の表示位置Y
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