const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 300;     // ピースの初期位置の最下ラインY
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル
MODE2_PROBABILITY = 100;                        // 2:キャプチャモードの場合にピースがランダム位置の確率

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 48;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'lum04';            // ピースの画像名
let width  = [ 157, 155, 101, 158, 157, 102, 159, 131, 101, 132, 131, 126, 105, 106, 102, 105, 101, 129, 126, 101, 126, 132, 157, 159, 130, 104, 129, 106, 104, 132, 134, 103, 102, 126, 159, 130, 129, 156, 131, 129, 129, 126, 132, 106, 132, 129, 106, 100 ];        // 画像サイズX
let height = [ 127, 133, 132, 130, 132, 129, 129, 104, 130, 103, 155, 134, 101, 159, 127, 156, 132, 102, 104, 157, 102, 131, 127, 131, 105, 130, 106, 126, 105, 107, 105, 130, 131, 157, 156, 156, 106, 105, 131, 127, 107, 129, 129, 129, 132, 131, 156, 131 ];        // 画像サイズY
let x = [ 155.5, 155.5, 60.5, 348.0, 349.5, 541.0, 348.5, 336.5, 541.5, 240.0, 458.5, 73.0, 251.5, 349.0, 61.0, 156.5, 60.5, 74.5, 73.0, 60.5, 529.0, 238.0, 349.5, 350.5, 460.0, 447.0, 527.5, 446.0, 156.0, 362.0, 460.0, 155.5, 541.0, 529.0, 251.5, 434.0, 142.5, 253.0, 143.5, 168.5, 433.5, 529.0, 459.0, 253.0, 240.0, 74.5, 253.0, 542.0 ];              // フレーム画像の表示位置X
let y = [ 73.5, 529.5, 168.0, 169.0, 337.0, 721.5, 74.5, 544.0, 240.0, 640.5, 252.5, 266.0, 60.5, 447.5, 73.5, 350.0, 531.0, 735.0, 350.0, 640.5, 61.0, 143.5, 722.5, 628.5, 155.5, 627.0, 543.0, 73.0, 445.5, 252.5, 349.5, 240.0, 142.5, 446.5, 252.0, 447.0, 155.0, 447.5, 628.5, 722.5, 543.5, 627.5, 721.5, 721.5, 364.0, 434.5, 543.0, 337.5 ];              // フレーム画像の表示位置Y
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