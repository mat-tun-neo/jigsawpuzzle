const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 300;     // ピースの初期位置の最下ラインY
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル
MODE2_PROBABILITY = 100;                        // 2:キャプチャモードの場合にピースがランダム位置の確率

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 48;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'gundam02';            // ピースの画像名
let width  = [ 132, 126, 106, 127, 127, 131, 107, 129, 158, 158, 105, 126, 130, 133, 132, 127, 102, 130, 103, 129, 159, 127, 132, 104, 156, 157, 126, 129, 129, 131, 102, 105, 132, 132, 127, 127, 107, 102, 126, 132, 132, 105, 107, 131, 104, 156, 107, 131 ];        // 画像サイズX
let height = [ 134, 132, 132, 131, 102, 134, 127, 129, 131, 159, 132, 130, 132, 130, 132, 107, 129, 157, 129, 130, 132, 129, 132, 107, 157, 102, 134, 129, 129, 100, 105, 156, 157, 132, 131, 127, 106, 132, 158, 105, 102, 132, 103, 102, 132, 132, 127, 102 ];        // 画像サイズY
let x = [ 168.0, 529.0, 252.0, 73.5, 73.5, 433.5, 446.5, 527.5, 348.0, 348.0, 251.5, 529.0, 460.0, 432.5, 265.0, 528.5, 61.0, 169.0, 446.5, 527.5, 350.5, 73.5, 168.0, 252.0, 350.0, 349.5, 529.0, 74.5, 433.5, 336.5, 61.0, 156.5, 240.0, 240.0, 72.5, 528.5, 446.5, 541.0, 73.0, 337.0, 168.0, 348.5, 155.5, 142.5, 447.0, 155.0, 252.5, 240.5 ];              // フレーム画像の表示位置X
let y = [ 433.0, 265.0, 531.0, 653.5, 735.0, 363.0, 73.5, 721.5, 652.5, 253.5, 628.0, 460.0, 168.0, 460.0, 434.0, 543.5, 74.5, 543.5, 627.5, 627.0, 143.0, 433.5, 653.0, 252.5, 543.5, 61.0, 363.0, 168.5, 721.5, 736.0, 253.5, 155.0, 155.5, 337.0, 337.5, 73.5, 543.0, 168.0, 542.0, 350.5, 735.0, 434.0, 349.5, 61.0, 265.0, 267.0, 722.5, 61.0 ];              // フレーム画像の表示位置Y
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
