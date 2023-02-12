const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 300;     // ピースの初期位置の最下ラインY
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル
MODE2_PROBABILITY = 100;                        // 2:キャプチャモードの場合にピースがランダム位置の確率

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 48;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'gundam01';            // ピースの画像名
let width  = [ 107, 102, 156, 126, 102, 101, 102, 130, 129, 126, 129, 104, 159, 132, 100, 132, 132, 158, 106, 157, 157, 105, 100, 130, 107, 126, 132, 130, 156, 132, 156, 105, 156, 102, 157, 156, 102, 126, 133, 107, 104, 107, 159, 102, 126, 105, 131, 127 ];        // 画像サイズX
let height = [ 105, 102, 159, 103, 131, 155, 100, 156, 132, 131, 131, 129, 132, 134, 130, 156, 127, 132, 131, 129, 127, 106, 129, 130, 102, 159, 134, 132, 107, 106, 127, 103, 161, 132, 105, 130, 156, 131, 131, 157, 130, 101, 127, 100, 106, 106, 127, 132 ];        // 画像サイズY
let x = [ 252.5, 541.0, 156.0, 73.0, 541.0, 60.5, 61.0, 460.0, 527.5, 529.0, 168.5, 447.0, 154.5, 240.0, 60.0, 362.0, 143.0, 351.0, 447.0, 252.5, 446.5, 445.5, 60.0, 266.0, 252.5, 73.0, 240.0, 460.0, 349.0, 459.0, 447.0, 156.5, 349.0, 541.0, 349.5, 349.0, 541.0, 73.0, 169.5, 252.5, 253.0, 349.5, 154.5, 541.0, 73.0, 156.5, 336.5, 528.5 ];              // フレーム画像の表示位置X
let y = [ 350.5, 61.0, 348.5, 640.5, 652.5, 349.5, 60.0, 349.0, 143.0, 459.5, 167.5, 459.5, 459.0, 266.0, 460.0, 156.0, 73.5, 628.0, 240.5, 74.5, 73.5, 155.0, 721.5, 169.0, 735.0, 154.5, 557.0, 628.0, 252.5, 544.0, 722.5, 252.5, 446.5, 556.0, 544.5, 336.0, 349.0, 555.5, 628.5, 446.5, 654.0, 60.5, 722.5, 736.0, 252.0, 543.0, 722.5, 240.0 ];              // フレーム画像の表示位置Y
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