const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 300;     // ピースの初期位置の最下ラインY
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル
MODE2_PROBABILITY = 100;                        // 2:キャプチャモードの場合にピースがランダム位置の確率

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 48;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'gundam06';            // ピースの画像名
let width  = [ 102, 107, 132, 127, 104, 126, 156, 103, 157, 105, 101, 129, 132, 129, 132, 131, 159, 107, 102, 132, 130, 133, 132, 132, 127, 157, 101, 105, 105, 129, 127, 156, 131, 103, 156, 134, 156, 102, 126, 129, 105, 105, 130, 126, 129, 129, 130, 129 ];        // 画像サイズX
let height = [ 159, 101, 100, 127, 133, 100, 105, 102, 127, 100, 106, 131, 126, 129, 105, 156, 130, 159, 106, 131, 159, 156, 100, 156, 156, 132, 107, 132, 132, 157, 100, 105, 107, 103, 132, 100, 161, 105, 105, 159, 159, 132, 132, 129, 127, 107, 159, 158 ];        // 画像サイズY
let x = [ 541.0, 446.5, 267.0, 73.5, 350.0, 73.0, 252.0, 349.5, 349.5, 156.5, 60.5, 527.5, 432.0, 433.5, 459.0, 336.5, 445.5, 252.5, 541.0, 335.0, 168.0, 432.5, 240.0, 168.0, 73.5, 349.5, 60.5, 156.5, 253.5, 74.5, 528.5, 252.0, 143.5, 349.5, 156.0, 169.0, 252.0, 541.0, 73.0, 527.5, 251.5, 156.5, 362.0, 529.0, 527.5, 433.5, 460.0, 74.5 ];              // フレーム画像の表示位置X
let y = [ 251.5, 735.5, 60.0, 73.5, 529.5, 736.0, 251.5, 61.0, 722.5, 736.0, 544.0, 361.5, 73.0, 362.5, 156.5, 349.0, 460.0, 154.5, 447.0, 628.5, 348.5, 640.0, 736.0, 640.0, 640.0, 143.0, 155.5, 459.0, 335.0, 252.5, 736.0, 544.5, 543.5, 446.5, 141.0, 60.0, 446.5, 154.5, 348.5, 544.5, 641.5, 238.0, 240.0, 653.5, 73.5, 543.5, 253.5, 445.0 ];              // フレーム画像の表示位置Y
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