const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 300;     // ピースの初期位置の最下ラインY
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル
MODE2_PROBABILITY = 100;                        // 2:キャプチャモードの場合にピースがランダム位置の確率

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 48;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'gundam04';            // ピースの画像名
let width  = [ 107, 131, 107, 131, 104, 132, 102, 132, 126, 130, 157, 126, 101, 127, 132, 129, 159, 100, 100, 130, 102, 129, 131, 104, 155, 132, 102, 130, 102, 156, 131, 130, 132, 102, 158, 132, 102, 127, 156, 131, 100, 134, 132, 129, 132, 133, 131, 134 ];        // 画像サイズX
let height = [ 107, 100, 131, 134, 129, 130, 127, 134, 132, 101, 130, 102, 105, 105, 157, 159, 127, 107, 107, 158, 106, 100, 132, 107, 130, 104, 157, 132, 126, 131, 156, 131, 131, 156, 132, 130, 132, 130, 102, 159, 129, 127, 134, 157, 100, 130, 130, 130 ];        // 画像サイズY
let x = [ 349.5, 459.5, 155.5, 142.5, 252.0, 240.0, 541.0, 265.0, 529.0, 168.0, 155.5, 73.0, 541.5, 73.5, 337.0, 527.5, 348.5, 60.0, 542.0, 169.0, 61.0, 362.5, 433.5, 350.0, 446.5, 143.0, 61.0, 433.0, 541.0, 446.0, 337.5, 239.0, 362.0, 61.0, 254.0, 265.0, 541.0, 528.5, 252.0, 434.5, 60.0, 142.0, 459.0, 74.5, 459.0, 335.5, 239.5, 142.0 ];              // フレーム画像の表示位置X
let y = [ 543.5, 736.0, 628.5, 363.0, 74.5, 460.0, 722.5, 557.0, 628.0, 60.5, 531.0, 61.0, 348.5, 639.5, 446.5, 445.5, 73.5, 252.5, 543.5, 157.0, 447.0, 736.0, 655.0, 349.5, 363.0, 447.0, 543.5, 459.0, 73.0, 555.5, 640.0, 264.5, 167.5, 349.0, 364.0, 169.0, 170.0, 266.0, 735.0, 253.5, 721.5, 722.5, 142.0, 155.5, 60.0, 266.0, 654.0, 266.0 ];              // フレーム画像の表示位置Y
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