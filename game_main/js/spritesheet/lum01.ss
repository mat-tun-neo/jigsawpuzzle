const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 300;     // ピースの初期位置の最下ラインY
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル
MODE2_PROBABILITY = 100;                        // 2:キャプチャモードの場合にピースがランダム位置の確率

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 48;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'lum01';            // ピースの画像名
let width  = [ 131, 102, 126, 129, 134, 100, 132, 158, 100, 131, 126, 100, 132, 106, 107, 157, 130, 159, 131, 127, 127, 157, 107, 131, 132, 127, 102, 130, 131, 105, 134, 159, 107, 156, 106, 126, 159, 132, 102, 133, 156, 132, 132, 102, 102, 100, 127, 105 ];        // 画像サイズX
let height = [ 156, 105, 130, 156, 132, 101, 102, 102, 130, 105, 132, 107, 133, 134, 105, 131, 105, 134, 132, 127, 132, 132, 106, 157, 158, 130, 156, 100, 130, 100, 155, 127, 130, 131, 104, 156, 132, 129, 156, 127, 106, 129, 132, 102, 102, 133, 134, 157 ];        // 画像サイズY
let x = [ 265.5, 541.0, 73.0, 459.5, 142.0, 60.0, 434.0, 154.0, 542.0, 240.5, 529.0, 60.0, 240.0, 349.0, 446.5, 252.5, 168.0, 350.5, 433.5, 528.5, 528.5, 252.5, 155.5, 142.5, 143.0, 73.5, 61.0, 142.0, 362.5, 350.5, 142.0, 251.5, 349.5, 447.0, 446.0, 529.0, 350.5, 362.0, 61.0, 267.5, 252.0, 459.0, 362.0, 61.0, 541.0, 60.0, 528.5, 447.5 ];              // フレーム画像の表示位置X
let y = [ 253.0, 253.5, 265.0, 446.0, 531.0, 735.5, 735.0, 735.0, 433.0, 641.5, 337.0, 543.5, 460.5, 266.0, 544.5, 361.5, 252.5, 654.0, 337.0, 722.5, 628.0, 558.0, 447.0, 640.5, 154.0, 460.0, 155.0, 60.0, 169.0, 736.0, 349.5, 73.5, 363.0, 240.5, 156.0, 155.0, 459.0, 74.5, 640.0, 722.5, 155.0, 74.5, 556.0, 61.0, 61.0, 363.5, 530.0, 640.5 ];              // フレーム画像の表示位置Y
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